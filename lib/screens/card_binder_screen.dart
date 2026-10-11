import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pokeapi/pokemon.dart';
import '../services/card_binder_provider.dart';
import '../services/pokemon_api_provider.dart';
import '../utils/binder/binder_layout.dart';
import '../widgets/binder/binder_page_grid.dart';
import '../widgets/binder/binder_page_turner.dart';
import '../widgets/binder/binder_pocket_widget.dart';
import '../widgets/binder/binder_spine.dart';
import '../widgets/binder/card_picker_modal.dart';

/// The card-binder collection view (see docs/features/card-binder.md): one
/// pocket per Pokemon, 9 per page, laid out as an open two-page spread with
/// a fixed ring-binder spine between them.
///
/// [scrollToPokemonId] opens the binder already turned to the page holding
/// that Pokemon's pocket (AC1) - e.g. from the entry-point button on
/// [PokemonDetailsScreen]'s Cards tab.
class CardBinderScreen extends StatefulWidget {
  final int? scrollToPokemonId;

  const CardBinderScreen({super.key, this.scrollToPokemonId});

  @override
  State<CardBinderScreen> createState() => _CardBinderScreenState();
}

class _CardBinderScreenState extends State<CardBinderScreen> {
  late int _rightPageIndex;
  bool _initialized = false;
  final GlobalKey<BinderPageTurnerState> _turnerKey = GlobalKey();

  // Zoom (AC21/AC37) and page-turn-by-drag (AC31) share the same
  // single-finger-vs-multi-finger gesture stream, both driven by one plain
  // `GestureDetector` - see "Tenth round" in docs/features/card-binder.md
  // for why this isn't `InteractiveViewer` (its own content-only zoom was
  // never going to satisfy "grow the binder itself," and layering a second,
  // independent scale transform on top of it would have double-scaled the
  // content). `_scale` directly drives the binder's actual *size*
  // (SizedBox width/height in build(), proportional to the resting size),
  // not a paint-time transform - so growth is real layout, not a blurry
  // stretch, and nothing else needs to coordinate with a transform matrix.
  double _scale = 1.0;
  double _gestureStartScale = 1.0;
  Offset _panOffset = Offset.zero;
  bool get _zoomed => _scale > 1.01;

  /// True for the lifetime of a single-finger interaction that started
  /// while not zoomed in - i.e. one we're driving as a page-turn attempt.
  /// Cleared the moment a second pointer joins (handing off to pinch-zoom)
  /// or the interaction ends.
  bool _turningByDrag = false;

  // Search (AC23): a toggled AppBar search field that jumps the binder to
  // a matching Pokemon's page and briefly highlights its pocket, rather
  // than filtering pockets out of the fixed 3x3/page dex-order grid - see
  // "New feature: search on the binder screen" in docs/features/card-binder.md.
  bool _searching = false;
  final TextEditingController _searchController = TextEditingController();
  int? _highlightedPokemonId;
  Timer? _highlightTimer;

  @override
  void initState() {
    super.initState();
    // CardBinderProvider is a long-lived singleton (created once at app
    // startup - see app_providers.dart) - without reloading here, opening
    // the binder would keep showing whatever was cached back then, missing
    // every card caught since (from the Cards tab, an import, ...). Read
    // the provider now (context is safe synchronously) and defer only the
    // call itself, for the same "setState during build" reason as
    // CardPickerModal's initState.
    final binder = context.read<CardBinderProvider>();
    Future.microtask(() => binder.load());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _highlightTimer?.cancel();
    super.dispose();
  }

  // One finger, not already zoomed: a page-turn attempt. Two (or more)
  // fingers, any time: pinch-zoom/pan, growing the binder's actual size
  // (see build()) and panning it via `_panOffset`. A page-turn already in
  // progress is cancelled cleanly the moment a second finger joins -
  // `details.pointerCount` is checked on every update, not just at start,
  // so a one-finger-then-add-a-second-finger gesture hands off correctly
  // mid-stream.

  void _onScaleStart(ScaleStartDetails details) {
    _gestureStartScale = _scale;
    if (details.pointerCount == 1 && !_zoomed) {
      _turningByDrag = true;
      _turnerKey.currentState?.startExternalDrag(details.focalPoint.dx);
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (details.pointerCount >= 2) {
      if (_turningByDrag) {
        _turningByDrag = false;
        _turnerKey.currentState?.cancelExternalDrag();
      }
      setState(() {
        _scale = (_gestureStartScale * details.scale).clamp(1.0, 4.0);
        // Re-centers automatically the moment pinching back out passes
        // 1.0x, rather than leaving a stale pan offset the next time the
        // user zooms back in.
        _panOffset =
            _scale <= 1.01 ? Offset.zero : _panOffset + details.focalPointDelta;
      });
      return;
    }
    if (_turningByDrag) {
      _turnerKey.currentState?.updateExternalDrag(details.focalPoint.dx);
    }
  }

  Future<void> _onScaleEnd(ScaleEndDetails details) async {
    if (_turningByDrag) {
      _turningByDrag = false;
      await _turnerKey.currentState?.endExternalDrag();
    }
  }

  void _toggleSearch() {
    setState(() {
      _searching = !_searching;
      if (!_searching) _searchController.clear();
    });
  }

  void _onSearchSubmitted(
      String query, List<int> sortedIds, Map<int, Pokemon> allPokemon) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    // Exact dex number first, then a case-insensitive name substring match
    // - mirrors the main list's name/number search without pulling in its
    // full fuzzy/stage-modifier grammar, which this screen has no use for
    // (no types/moves/abilities to search by here).
    final asNumber = int.tryParse(trimmed);
    int? matchId;
    if (asNumber != null && sortedIds.contains(asNumber)) {
      matchId = asNumber;
    } else {
      final lower = trimmed.toLowerCase();
      for (final id in sortedIds) {
        if (allPokemon[id]!.name.toLowerCase().contains(lower)) {
          matchId = id;
          break;
        }
      }
    }

    if (matchId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No Pokemon found for "$trimmed"')),
      );
      return;
    }

    final page = binderPageIndexForPokemonId(matchId);
    _highlightTimer?.cancel();
    setState(() {
      _rightPageIndex = _spreadRightIndexFor(page);
      _highlightedPokemonId = matchId;
      _searching = false;
    });
    _highlightTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _highlightedPokemonId = null);
    });
  }

  void _initRightPageIndex(List<int> sortedIds) {
    if (_initialized) return;
    _initialized = true;
    final target = widget.scrollToPokemonId;
    if (target == null) {
      _rightPageIndex = 0;
      return;
    }
    _rightPageIndex = _spreadRightIndexFor(binderPageIndexForPokemonId(target));
  }

  // A spread's right slot is always an even page-group index (0, 2, 4, ...
  // - see "Twelfth round" in docs/features/card-binder.md), with the odd
  // page before it, if any, on the left. So a target page-group lands on
  // the right directly if it's already even; an odd one needs its spread's
  // right index, one higher, to bring it into view on the left instead.
  int _spreadRightIndexFor(int pageGroup) =>
      pageGroup.isEven ? pageGroup : pageGroup + 1;

  Future<void> _onPocketTapped(int pokemonId) async {
    final binder = context.read<CardBinderProvider>();
    // Whether to open straight into the browse grid (AC8) now has to be
    // asked directly - "is there anything to cycle through" - rather than
    // inferred from the pocket's own display state: since "Ninth round"
    // (see docs/features/card-binder.md), a Pokémon caught with no TCG
    // card at all also shows the OwnedPocket sprite, but still has nothing
    // to cycle through, same as EmptyPocket always did.
    final startInBrowse = binder.ownedCardsFor(pokemonId).isEmpty;
    await showCardPickerModal(
      context,
      pokemonId: pokemonId,
      startInBrowse: startInBrowse,
    );
  }

  @override
  Widget build(BuildContext context) {
    final allPokemon = context.watch<PokemonApiProvider>().allPokemon;
    final sortedIds = allPokemon.keys.toList()..sort();
    _initRightPageIndex(sortedIds);
    final pageCount = binderPageCount(sortedIds);
    final binder = context.watch<CardBinderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: _searching
            ? TextField(
                key: const Key('binder-search-field'),
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Name or #...',
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (q) =>
                    _onSearchSubmitted(q, sortedIds, allPokemon),
              )
            : const Text('Card Binder'),
        actions: [
          IconButton(
            key: const Key('binder-search-toggle'),
            icon: Icon(_searching ? Icons.close : Icons.search),
            tooltip: _searching ? 'Close search' : 'Search',
            onPressed: _toggleSearch,
          ),
        ],
      ),
      // Warm paper, not dark leather - the binder itself is a bounded
      // object (the "leather base" below) that sits ON this surface, the
      // same relationship as the approved POC (`--bg` behind a distinct,
      // shadowed `.binder-stage`). The previous version made the whole
      // screen the binder's own dark fill, with no surface/object
      // distinction and no bound on its proportions - see "Visual
      // redesign" in docs/features/card-binder.md.
      backgroundColor: const Color(0xFFECE6DA),
      body: !binder.isLoaded || sortedIds.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    // AC21/AC37 ("Sixth"/"Eighth"/"Tenth" rounds in
                    // docs/features/card-binder.md): the binder's actual
                    // *size* (not a paint-time transform on fixed-size
                    // content) grows with `_scale`, so growth is real
                    // layout - crisp at any size, not a blurry stretch.
                    // ClipRect keeps a grown-and-panned binder from
                    // painting over the AppBar/nav controls; OverflowBox
                    // lets it actually be bigger than this Expanded's own
                    // normal bounds in the first place (a plain Center+
                    // SizedBox-bigger-than-its-parent would just get
                    // clamped back down).
                    child: ClipRect(
                      child: Center(
                        child: OverflowBox(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                          child: Transform.translate(
                            offset: _panOffset,
                            child: Builder(builder: (context) {
                              // The POC's `.binder-stage` is
                              // `aspect-ratio: 16/10` at a bounded resting
                              // size (not a panel stretching to fill
                              // whatever height it's given - see "Visual
                              // redesign") - `_scale` grows both dimensions
                              // from that same resting size, proportionally,
                              // so it only ever grows as a correctly-
                              // proportioned object.
                              final restingWidth = math.min(
                                  MediaQuery.sizeOf(context).width - 32, 820.0);
                              final width = restingWidth * _scale;
                              final height = width * 10 / 16;
                              return GestureDetector(
                                onScaleStart: _onScaleStart,
                                onScaleUpdate: _onScaleUpdate,
                                onScaleEnd: _onScaleEnd,
                                child: SizedBox(
                                  width: width,
                                  height: height,
                                  child: _BinderLeatherBase(
                                    child: BinderPageTurner(
                                      key: _turnerKey,
                                      rightPageIndex: _rightPageIndex,
                                      pageCount: pageCount,
                                      onPageChanged: (newIndex) => setState(
                                          () => _rightPageIndex = newIndex),
                                      spine: const BinderSpine(),
                                      pageBuilder: (context, pageIndex) {
                                        final pageIds = binderPokemonIdsForPage(
                                            sortedIds, pageIndex);
                                        return BinderPageGrid(
                                          pokemonIds: pageIds,
                                          pocketBuilder: (context, pokemonId) {
                                            final pokemon =
                                                allPokemon[pokemonId]!;
                                            return _HighlightedPocket(
                                              highlighted: pokemonId ==
                                                  _highlightedPokemonId,
                                              child: BinderPocketWidget(
                                                pokemon: pokemon,
                                                view: binder.pocketFor(
                                                    pokemonId,
                                                    pokemonCaught:
                                                        pokemon.isCaught),
                                                onTap: () =>
                                                    _onPocketTapped(pokemonId),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _NavigationControls(
                    turnerKey: _turnerKey,
                    canGoBack: _rightPageIndex > 0,
                    canGoForward: _rightPageIndex + 1 < pageCount,
                  ),
                ],
              ),
            ),
    );
  }
}

/// A brief highlight ring around the pocket a search jumped to (AC23) - an
/// `AnimatedContainer` border rather than modifying `BinderPocketWidget`
/// itself, since highlighting is this screen's own transient state, not a
/// property of the pocket's data.
class _HighlightedPocket extends StatelessWidget {
  final bool highlighted;
  final Widget child;

  const _HighlightedPocket({required this.highlighted, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: highlighted ? const Color(0xFFE8A33D) : Colors.transparent,
          width: 3,
        ),
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: const Color(0xFFE8A33D).withValues(alpha: 0.6),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : const [],
      ),
      child: child,
    );
  }
}

/// The dark leather panel the pages and spine sit inside - rounded corners,
/// a drop shadow lifting it off the paper background, and a thin leather
/// margin around the pages (matching the POC's `.leather-base` +
/// `.book{inset:10px}`). This is what makes the binder read as a bounded,
/// tangible object instead of the screen's own background.
class _BinderLeatherBase extends StatelessWidget {
  final Widget child;

  const _BinderLeatherBase({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF473D34), Color(0xFF241F1A)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.55),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}

class _NavigationControls extends StatelessWidget {
  final GlobalKey<BinderPageTurnerState> turnerKey;
  final bool canGoBack;
  final bool canGoForward;

  const _NavigationControls({
    required this.turnerKey,
    required this.canGoBack,
    required this.canGoForward,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _NavButton(
          buttonKey: const Key('binder-prev-page'),
          tooltip: 'Previous page',
          icon: Icons.chevron_left,
          onPressed: canGoBack ? () => turnerKey.currentState?.turn(-1) : null,
        ),
        const SizedBox(width: 24),
        _NavButton(
          buttonKey: const Key('binder-next-page'),
          tooltip: 'Next page',
          icon: Icons.chevron_right,
          onPressed:
              canGoForward ? () => turnerKey.currentState?.turn(1) : null,
        ),
      ],
    );
  }
}

/// A round, bordered page-turn button, matching the POC's `.nav-btn` -
/// styled for the warm paper background the binder now sits on, rather
/// than the previous plain white `IconButton` that assumed a dark screen.
class _NavButton extends StatelessWidget {
  final Key buttonKey;
  final String tooltip;
  final IconData icon;
  final VoidCallback? onPressed;

  const _NavButton({
    required this.buttonKey,
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return Tooltip(
      message: tooltip,
      child: Material(
        color: const Color(0xFFF7F3E9),
        shape: const CircleBorder(side: BorderSide(color: Color(0xFFC9BDA5))),
        child: InkWell(
          key: buttonKey,
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icon,
              color: enabled
                  ? const Color(0xFF2B2420)
                  : const Color(0xFF2B2420).withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    );
  }
}
