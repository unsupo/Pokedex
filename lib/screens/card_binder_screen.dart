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
      backgroundColor: const Color(0xFF3A3530),
      body: !binder.isLoaded || sortedIds.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
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
                            return BinderPocketWidget(
                              pokemon: pokemon,
                              view: binder.pocketFor(pokemonId),
                              onTap: () => _onPocketTapped(pokemonId),
                            );
                          },
                        );
                      },
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
        IconButton(
          key: const Key('binder-prev-page'),
          tooltip: 'Previous page',
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: canGoBack ? () => turnerKey.currentState?.turn(-1) : null,
        ),
        const SizedBox(width: 24),
        IconButton(
          key: const Key('binder-next-page'),
          tooltip: 'Next page',
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onPressed: canGoForward ? () => turnerKey.currentState?.turn(1) : null,
        ),
      ],
    );
  }
}
