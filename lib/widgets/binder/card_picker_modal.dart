import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tcg_card.dart';
import '../../services/card_binder_provider.dart';
import '../../services/pokemon_api_provider.dart';
import '../../services/tcg_api_provider.dart';
import '../../utils/tcg_price_util.dart';
import '../scope/card_caught_toggle.dart';
import 'card_price_badge.dart';

/// Opens the "tap a pocket" modal (see docs/features/card-binder.md). When
/// [startInBrowse] is true (pocket state 3: nothing owned), it skips
/// straight to the full browse grid (AC8); otherwise it opens the focused
/// cycle picker over owned cards only (AC7).
Future<void> showCardPickerModal(
  BuildContext context, {
  required int pokemonId,
  required bool startInBrowse,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (context) => _CardPickerModal(
      pokemonId: pokemonId,
      startInBrowse: startInBrowse,
    ),
  );
}

class _CardPickerModal extends StatefulWidget {
  final int pokemonId;
  final bool startInBrowse;

  const _CardPickerModal({
    required this.pokemonId,
    required this.startInBrowse,
  });

  @override
  State<_CardPickerModal> createState() => _CardPickerModalState();
}

class _CardPickerModalState extends State<_CardPickerModal> {
  late bool _browsing = widget.startInBrowse;
  late Future<List<TcgCard>?> _cardsFuture;
  int _cycleIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  // Deferred a microtask, not called directly: showModalBottomSheet
  // inflates this widget within the *same* build pass as the tap that
  // opened it, and TcgApiProvider.getPokemonCards calls notifyListeners()
  // before its first await (to flip on its loading flag) - calling that
  // synchronously from initState trips Flutter's "setState during build"
  // guard. A microtask runs it right after this build finishes instead.
  //
  // Also the retry entry point (see build()'s error state, "Eleventh
  // round" in docs/features/card-binder.md): getPokemonCards only ever
  // caches a *successful* fetch (its own catch block returns null without
  // writing to its cache - see tcg_api_provider.dart), so calling it again
  // after a failure genuinely retries the network request rather than
  // replaying a stale failure - matching what "close the modal and reopen
  // it" was already doing by accident, just without needing to leave the
  // modal.
  void _fetchCards() {
    final tcgProvider = context.read<TcgApiProvider>();
    _cardsFuture =
        Future.microtask(() => tcgProvider.getPokemonCards(widget.pokemonId));
  }

  void _retry() => setState(_fetchCards);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: FutureBuilder<List<TcgCard>?>(
          future: _cardsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            // null specifically means the fetch itself failed (see
            // TcgApiProvider.getPokemonCards's catch block) - distinct
            // from a successful fetch that's genuinely empty. Collapsing
            // both into the same "no cards found" message (as this used
            // to) was indistinguishable from a real empty result, so a
            // transient upstream failure (this API's well-documented
            // 500/502 flakiness - see docs/features/card-binder.md) read
            // as "this Pokemon has no cards," with no way to tell the two
            // apart short of leaving the modal and reopening it to
            // silently retry.
            if (snapshot.data == null) {
              return _FetchFailed(
                error: context.read<TcgApiProvider>().error,
                onRetry: _retry,
              );
            }
            final allCards = snapshot.data!;
            // Watches TcgApiProvider so catching a card in the browse view
            // (AC9) is reflected here immediately, without re-fetching.
            context.watch<TcgApiProvider>();
            final ownedCards = allCards.where((c) => c.isCaught).toList();

            return _browsing
                ? _BrowseView(
                    pokemonId: widget.pokemonId,
                    cards: allCards,
                    onBack: ownedCards.isEmpty
                        ? null
                        : () => setState(() => _browsing = false),
                  )
                : _CycleView(
                    pokemonId: widget.pokemonId,
                    ownedCards: ownedCards,
                    index: _cycleIndex,
                    onIndexChanged: (i) => setState(() => _cycleIndex = i),
                    onBrowse: () => setState(() => _browsing = true),
                  );
          },
        ),
      ),
    );
  }
}

/// Shown when [TcgApiProvider.getPokemonCards] itself failed (not "this
/// Pokemon genuinely has no cards") - see the comment on [_CardPickerModalState.build].
class _FetchFailed extends StatelessWidget {
  final String? error;
  final VoidCallback onRetry;

  const _FetchFailed({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 8),
            const Text('Failed to load cards.',
                style: TextStyle(fontWeight: FontWeight.bold)),
            if (error != null) ...[
              const SizedBox(height: 4),
              Text(
                error!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              key: const Key('binder-card-fetch-retry'),
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CycleView extends StatelessWidget {
  final int pokemonId;
  final List<TcgCard> ownedCards;
  final int index;
  final ValueChanged<int> onIndexChanged;
  final VoidCallback onBrowse;

  const _CycleView({
    required this.pokemonId,
    required this.ownedCards,
    required this.index,
    required this.onIndexChanged,
    required this.onBrowse,
  });

  @override
  Widget build(BuildContext context) {
    final clampedIndex =
        ownedCards.isEmpty ? 0 : index.clamp(0, ownedCards.length - 1);
    final card = ownedCards.isEmpty ? null : ownedCards[clampedIndex];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Choose which card to display',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Row(
            children: [
              IconButton(
                key: const Key('binder-cycle-prev'),
                icon: const Icon(Icons.chevron_left),
                tooltip: 'Previous card',
                onPressed: clampedIndex > 0
                    ? () => onIndexChanged(clampedIndex - 1)
                    : null,
              ),
              Expanded(
                child: card == null
                    ? const Center(child: Text('No owned cards yet'))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            card.images?.small == null
                                ? const Icon(Icons.catching_pokemon, size: 96)
                                : CachedNetworkImage(
                                    imageUrl: card.images!.small!,
                                    fit: BoxFit.contain,
                                  ),
                            CardPriceBadge(price: estimatedCardPrice(card)),
                          ],
                        ),
                      ),
              ),
              IconButton(
                key: const Key('binder-cycle-next'),
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Next card',
                onPressed: clampedIndex < ownedCards.length - 1
                    ? () => onIndexChanged(clampedIndex + 1)
                    : null,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // "Add or remove cards," not just "Add a card" - this already
              // opens the full browse grid (_BrowseView below), where
              // tapping any card toggles its caught status either way
              // (toggleCardCaught) - un-catching an already-owned card was
              // always reachable from here, just not labeled as such.
              // Reported live: "clicking on a card you have in the binder
              // should have the option to pull up the full list to add or
              // remove a card" - see "Eleventh round" in
              // docs/features/card-binder.md.
              OutlinedButton.icon(
                key: const Key('binder-browse-button'),
                onPressed: onBrowse,
                icon: const Icon(Icons.library_books_outlined),
                label: const Text('Add / remove cards'),
              ),
              ElevatedButton(
                key: const Key('binder-confirm-selection'),
                onPressed: card == null
                    ? null
                    : () async {
                        final binder = context.read<CardBinderProvider>();
                        final navigator = Navigator.of(context);
                        await binder.selectCard(pokemonId, card);
                        navigator.pop();
                      },
                child: const Text('Show this one'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BrowseView extends StatelessWidget {
  final int pokemonId;
  final List<TcgCard> cards;
  final VoidCallback? onBack;

  const _BrowseView({
    required this.pokemonId,
    required this.cards,
    required this.onBack,
  });

  // Catching/un-catching itself (including auto-selecting a Pokemon's very
  // first owned card as its binder display - see card_caught_toggle.dart,
  // where this is centralized since this screen's browse grid isn't the
  // only place a card gets caught from) is all handled by
  // [toggleCardCaught] already.
  Future<void> _onCardTapped(BuildContext context, TcgCard card) {
    return toggleCardCaught(
      context,
      card,
      pokemonId,
      pokemonAlreadyCaught:
          context.read<PokemonApiProvider>().allPokemon[pokemonId]?.isCaught ??
              false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              if (onBack != null)
                IconButton(
                  key: const Key('binder-browse-back'),
                  icon: const Icon(Icons.arrow_back),
                  onPressed: onBack,
                ),
              const Expanded(
                child: Text('All cards - tap to catch or remove',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Expanded(
          child: cards.isEmpty
              ? const Center(child: Text('No cards found for this Pokemon'))
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return GestureDetector(
                      key: Key('binder-browse-card-${card.id}'),
                      onTap: () => _onCardTapped(context, card),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: card.isCaught ? Colors.blue : Colors.black12,
                            width: card.isCaught ? 2 : 1,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            card.images?.small == null
                                ? const Icon(Icons.catching_pokemon)
                                : CachedNetworkImage(
                                    imageUrl: card.images!.small!,
                                    fit: BoxFit.contain,
                                  ),
                            CardPriceBadge(price: estimatedCardPrice(card)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
