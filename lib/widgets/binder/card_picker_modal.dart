import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/tcg_card.dart';
import '../../services/card_binder_provider.dart';
import '../../services/pokemon_api_provider.dart';
import '../../services/tcg_api_provider.dart';
import '../scope/card_caught_toggle.dart';

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
    // Deferred a microtask, not called directly: showModalBottomSheet
    // inflates this widget within the *same* build pass as the tap that
    // opened it, and TcgApiProvider.getPokemonCards calls notifyListeners()
    // before its first await (to flip on its loading flag) - calling that
    // synchronously from initState trips Flutter's "setState during build"
    // guard. A microtask runs it right after this build finishes instead.
    final tcgProvider = context.read<TcgApiProvider>();
    _cardsFuture =
        Future.microtask(() => tcgProvider.getPokemonCards(widget.pokemonId));
  }

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
            final allCards = snapshot.data ?? const [];
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
    final clampedIndex = ownedCards.isEmpty
        ? 0
        : index.clamp(0, ownedCards.length - 1);
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
                        child: card.images?.small == null
                            ? const Icon(Icons.catching_pokemon, size: 96)
                            : CachedNetworkImage(
                                imageUrl: card.images!.small!,
                                fit: BoxFit.contain,
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
              OutlinedButton.icon(
                key: const Key('binder-browse-button'),
                onPressed: onBrowse,
                icon: const Icon(Icons.add),
                label: const Text('Add a card'),
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
                child: Text('All cards - tap to catch',
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
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
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
                      onTap: () => toggleCardCaught(
                        context,
                        card,
                        pokemonId,
                        pokemonAlreadyCaught: context
                                .read<PokemonApiProvider>()
                                .allPokemon[pokemonId]
                                ?.isCaught ??
                            false,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: card.isCaught ? Colors.blue : Colors.black12,
                            width: card.isCaught ? 2 : 1,
                          ),
                        ),
                        child: card.images?.small == null
                            ? const Icon(Icons.catching_pokemon)
                            : CachedNetworkImage(
                                imageUrl: card.images!.small!,
                                fit: BoxFit.contain,
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
