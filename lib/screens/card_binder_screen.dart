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

  /// True for the lifetime of a single-finger interaction - i.e. one we're
  /// driving as a page-turn attempt, whether zoomed in or not (see
  /// "Fifteenth round" in docs/features/card-binder.md for why this is no
  /// longer zoomed-state-dependent). Cleared the moment a second pointer
  /// joins (handing off to pinch-zoom) or the interaction ends.
  bool _turningByDrag = false;

  // Search (AC23, revised - see "Thirteenth round" in
  // docs/features/card-binder.md): an always-visible field under the
  // AppBar, mirroring the main Pokedex list's own search bar, that jumps
  // the binder to a matching Pokemon's page and briefly highlights its
  // pocket - rather than filtering pockets out of the fixed 3x3/page
  // dex-order grid - see "New feature: search on the binder screen"
  // further down this doc for why it's a jump, not a filter.
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

  // One finger, any time (zoomed or not): a page-turn attempt. Two (or
  // more) fingers, any time: pinch-zoom/pan, growing the binder's actual
  // size (see build()) and panning it via `_panOffset`. A page-turn
  // already in progress is cancelled cleanly the moment a second finger
  // joins - `details.pointerCount` is checked on every update, not just
  // at start, so a one-finger-then-add-a-second-finger gesture hands off
  // correctly mid-stream.
  //
  // One-finger drag used to be disabled while zoomed (`!_zoomed` here),
  // on the assumption that it might be needed for panning - but panning
  // has only ever been driven by the *two-finger* branch below
  // (`details.pointerCount >= 2`), so a single finger was never actually
  // doing anything useful while zoomed: not turning the page, not
  // panning, nothing. Reported live: "i still can't turn the page if i
  // zoom in" - confirmed via a follow-up question that this meant
  // swiping, not the nav buttons (already fixed to stay reachable while
  // zoomed - see "Fifteenth round" in docs/features/card-binder.md).
  // Panning two-finger and turning one-finger is the same split already
  // used at rest, so this isn't a new ambiguity, just extending it to
  // the zoomed case too.

  void _onScaleStart(ScaleStartDetails details) {
    _gestureStartScale = _scale;
    if (details.pointerCount == 1) {
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
    });
    // The field already did its job (turning the page) - clearing it and
    // dropping focus avoids leaving a stale query sitting in an
    // always-visible field, the way a one-shot "jump" naturally reads as
    // done rather than a persistent filter that's still "active".
    _searchController.clear();
    FocusScope.of(context).unfocus();
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

  /// The search field + nav row - "chrome" sitting on top of the binder
  /// itself (see [_buildBinderLayer]'s doc comment for why paint order
  /// matters here - "Fifteenth round" in docs/features/card-binder.md).
  Widget _buildChrome(
      List<int> sortedIds, Map<int, Pokemon> allPokemon, int pageCount) {
    return Column(
      children: [
        // Always-visible, not a toggle (see "Thirteenth round") - mirrors
        // the main Pokedex list's own search bar
        // (widgets/pokemon_search_bar.dart) rather than being hidden
        // behind an icon the user has to discover first.
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            key: const Key('binder-search-field'),
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search Pokemon',
              hintText: 'Name or #...',
              filled: true,
              fillColor: const Color(0xFFF7F3E9),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: _searchController.clear,
              ),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (q) => _onSearchSubmitted(q, sortedIds, allPokemon),
          ),
        ),
        const Spacer(),
        const SizedBox(height: 12),
        _NavigationControls(
          turnerKey: _turnerKey,
          rightPageIndex: _rightPageIndex,
          pageCount: pageCount,
          canGoBack: _rightPageIndex > 0,
          canGoForward: _rightPageIndex + 1 < pageCount,
        ),
      ],
    );
  }

  /// The binder itself: real pinch-zoom growth (AC21/AC37/AC60 - see
  /// "Tenth"/"Fourteenth" rounds), clipped against the *whole* available
  /// body rather than just the narrow strip between the search field and
  /// nav row, so growth has somewhere real to go instead of being capped
  /// right back down to its resting footprint.
  ///
  /// Painted (and so hit-tested) *before* [_buildChrome] in build()'s
  /// `Stack` - see "Fifteenth round" in docs/features/card-binder.md: once
  /// pinch-zoom could genuinely grow the binder past its resting footprint
  /// (the Fourteenth round), painting it *over* the search field/nav row
  /// also made those controls permanently untappable. Reported live: "i
  /// can't seem to turn the page when zoomed in." The chrome now always
  /// paints last/on top instead, so it stays reachable at any zoom level -
  /// the trade-off is a sufficiently zoomed-in binder now renders *behind*
  /// that chrome rather than over
  /// it, which reads fine since both have an opaque fill.
  Widget _buildBinderLayer(List<int> sortedIds, Map<int, Pokemon> allPokemon,
      int pageCount, CardBinderProvider binder) {
    return Positioned.fill(
      child: ClipRect(
        child: Center(
          child: OverflowBox(
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            child: Transform.translate(
              offset: _panOffset,
              child: Builder(builder: (context) {
                // The POC's `.binder-stage` is `aspect-ratio: 16/10` at a
                // bounded resting size (not a panel stretching to fill
                // whatever height it's given - see "Visual redesign") -
                // `_scale` grows both dimensions from that same resting
                // size, proportionally, so it only ever grows as a
                // correctly-proportioned object. Also capped by 60% of
                // the screen's *height* (converted through the 16:10
                // ratio to a width bound), not just its width - on a
                // normal tall phone the width bound always wins so this
                // changes nothing, but on an unusually wide/short
                // viewport (a tablet, a foldable's near-square inner
                // screen, this screen's own widget-test harness) an
                // un-height-bounded resting size could already be tall
                // enough to cover the search field/nav row *before* any
                // zoom - found by a widget test failing to hit-test the
                // nav button at rest, after "Fourteenth round" let growth
                // paint outside this screen's narrow middle strip instead
                // of clipping it back down.
                final size = MediaQuery.sizeOf(context);
                final restingWidth = math.min(
                  math.min(size.width - 32, 820.0),
                  size.height * 0.6 * 16 / 10,
                );
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
                        onPageChanged: (newIndex) =>
                            setState(() => _rightPageIndex = newIndex),
                        spine: const BinderSpine(),
                        pageBuilder: (context, pageIndex) {
                          final pageIds =
                              binderPokemonIdsForPage(sortedIds, pageIndex);
                          return BinderPageGrid(
                            pokemonIds: pageIds,
                            pocketBuilder: (context, pokemonId) {
                              final pokemon = allPokemon[pokemonId]!;
                              return _HighlightedPocket(
                                highlighted: pokemonId == _highlightedPokemonId,
                                child: BinderPocketWidget(
                                  pokemon: pokemon,
                                  view: binder.pocketFor(pokemonId,
                                      pokemonCaught: pokemon.isCaught),
                                  onTap: () => _onPocketTapped(pokemonId),
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
      appBar: AppBar(title: const Text('Card Binder')),
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
              // A Stack, not a plain Column - see "Fourteenth"/"Fifteenth"
              // rounds in docs/features/card-binder.md. The binder layer
              // paints first (so pinch-zoom growth has the whole body to
              // expand into, not just the narrow strip between the
              // search field and nav row); the chrome paints last/on top
              // (so the search field and nav row - the only way to turn
              // a page while zoomed - always stay reachable, even once
              // the binder has grown large enough to otherwise cover
              // them).
              child: Stack(
                key: const Key('binder-screen-stack'),
                children: [
                  _buildBinderLayer(sortedIds, allPokemon, pageCount, binder),
                  _buildChrome(sortedIds, allPokemon, pageCount),
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
  final int rightPageIndex;
  final int pageCount;
  final bool canGoBack;
  final bool canGoForward;

  const _NavigationControls({
    required this.turnerKey,
    required this.rightPageIndex,
    required this.pageCount,
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
        // The current spread's page number(s) - see "Fourteenth round" in
        // docs/features/card-binder.md (reported live: "can you show the
        // page number of the binder"). Pure presentation; the actual
        // "which page(s) is this" math is `binderPageLabel`
        // (utils/binder/binder_layout.dart), so it's covered by a plain
        // unit test rather than needing a widget test per spread shape.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            binderPageLabel(
                rightPageIndex: rightPageIndex, pageCount: pageCount),
            key: const Key('binder-page-label'),
            style: const TextStyle(
              color: Color(0xFF2B2420),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
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
