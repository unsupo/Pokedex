import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/card_binder_provider.dart';
import '../services/pokemon_api_provider.dart';
import '../utils/binder/binder_layout.dart';
import '../utils/binder/binder_pocket.dart';
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

  void _initRightPageIndex(List<int> sortedIds) {
    if (_initialized) return;
    _initialized = true;
    final target = widget.scrollToPokemonId;
    if (target == null) {
      _rightPageIndex = 0;
      return;
    }
    // The target Pokemon's page should be visible - as the right page unless
    // it's page 0, which only ever appears on the right (there's no page -1
    // to its left).
    final page = binderPageIndexForPokemonId(target);
    _rightPageIndex = page == 0 ? 0 : page;
  }

  Future<void> _onPocketTapped(int pokemonId) async {
    final binder = context.read<CardBinderProvider>();
    final view = binder.pocketFor(pokemonId);
    final startInBrowse = view is EmptyPocket;
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
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 820),
                        // The POC's `.binder-stage` is `aspect-ratio: 16/10`
                        // - a bounded object, not a panel that stretches to
                        // fill whatever height it's given. Filling the full
                        // height (the previous version's bug) is exactly
                        // what made the binder look "super long" with all
                        // its content pushed to the top and a huge empty
                        // void below.
                        child: AspectRatio(
                          aspectRatio: 16 / 10,
                          // Pinch-to-zoom (requested), without a 1-finger
                          // pan recognizer competing with the page-turn
                          // drag gesture inside BinderPageTurner.
                          child: InteractiveViewer(
                            panEnabled: false,
                            scaleEnabled: true,
                            minScale: 1.0,
                            maxScale: 3.0,
                            child: _BinderLeatherBase(
                              child: BinderPageTurner(
                                key: _turnerKey,
                                rightPageIndex: _rightPageIndex,
                                pageCount: pageCount,
                                onPageChanged: (newIndex) =>
                                    setState(() => _rightPageIndex = newIndex),
                                spine: const BinderSpine(),
                                pageBuilder: (context, pageIndex) {
                                  final pageIds = binderPokemonIdsForPage(
                                      sortedIds, pageIndex);
                                  return BinderPageGrid(
                                    pokemonIds: pageIds,
                                    pocketBuilder: (context, pokemonId) {
                                      final pokemon = allPokemon[pokemonId]!;
                                      return BinderPocketWidget(
                                        pokemon: pokemon,
                                        view: binder.pocketFor(pokemonId),
                                        onTap: () =>
                                            _onPocketTapped(pokemonId),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _NavigationControls(
                    turnerKey: _turnerKey,
                    canGoBack: _rightPageIndex > 0,
                    canGoForward: _rightPageIndex < pageCount - 1,
                  ),
                ],
              ),
            ),
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
          onPressed: canGoForward ? () => turnerKey.currentState?.turn(1) : null,
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
