import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/utils/binder/binder_pocket.dart';

void main() {
  TcgCard card(String id) => TcgCard(id: id, name: 'Card $id');

  group('computeBinderPocketView', () {
    test('AC5: nothing owned and nothing selected shows the empty "+" state',
        () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: null,
        pokemonCaught: false,
      );

      expect(view, isA<EmptyPocket>());
    });

    test(
        'AC4: owned but nothing selected shows the owned-indicator state, '
        'never bare card art and never the + state', () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {'swsh1-1'},
        allOwnedCardIds: const {'swsh1-1'},
        cachedCardsById: {'swsh1-1': card('swsh1-1')},
        selectedCardId: null,
        pokemonCaught: false,
      );

      expect(view, isA<OwnedPocket>());
    });

    test('AC3: a selected, cached card shows that card, sleeve-styled', () {
      final selected = card('swsh1-1');
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {'swsh1-1'},
        allOwnedCardIds: const {'swsh1-1'},
        cachedCardsById: {'swsh1-1': selected},
        selectedCardId: 'swsh1-1',
        pokemonCaught: false,
      );

      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card, same(selected));
    });

    test(
        'a selected card that is still owned but has no cached TcgCard data '
        'shows as named-but-imageless, not a silent fallback to owned', () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {'swsh1-1'},
        cachedCardsById: const {},
        selectedCardId: 'swsh1-1',
        pokemonCaught: false,
      );

      expect(view, isA<SelectedPocketMissingData>());
      expect((view as SelectedPocketMissingData).cardId, 'swsh1-1');
    });

    test(
        'AC6: un-catching the selected card falls back to owned when another '
        'card for this Pokemon is still owned', () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {'swsh1-2'},
        allOwnedCardIds: const {'swsh1-2'},
        cachedCardsById: {'swsh1-2': card('swsh1-2')},
        selectedCardId: 'swsh1-1', // no longer owned
        pokemonCaught: false,
      );

      expect(view, isA<OwnedPocket>());
    });

    test(
        'AC6: un-catching the selected card falls back to empty when no '
        "card for this Pokemon is owned anymore and the Pokemon itself "
        'is not caught either', () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: 'swsh1-1', // no longer owned
        pokemonCaught: false,
      );

      expect(view, isA<EmptyPocket>());
    });

    test(
        'AC39 (Ninth round): a caught Pokemon with no TCG card owned at all '
        'shows the owned-indicator sprite, not the + state - "+ " means '
        "you don't have the Pokemon, not narrowly \"no card for it\"", () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: null,
        pokemonCaught: true,
      );

      expect(view, isA<OwnedPocket>());
    });

    test(
        'AC39: an uncaught Pokemon with no TCG card owned shows the + state '
        '- pokemonCaught: false is what actually makes "+" mean "nothing at '
        'all"', () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: null,
        pokemonCaught: false,
      );

      expect(view, isA<EmptyPocket>());
    });
  });

  group('highestPricedOwnedCard', () {
    TcgCard priced(String id, {double? price}) => TcgCard(
          id: id,
          name: 'Card $id',
          tcgplayer: price == null
              ? null
              : Tcgplayer(
                  prices: TcgplayerPrices(holofoil: PriceData(market: price))),
        );

    test('picks the single owned card when there is only one', () {
      final only = priced('swsh1-1');
      final best = highestPricedOwnedCard({'swsh1-1'}, {'swsh1-1': only});

      expect(best, same(only));
    });

    test('picks the highest-priced of several owned cards', () {
      final cheap = priced('swsh1-1', price: 3);
      final expensive = priced('swsh1-2', price: 250);
      final mid = priced('swsh1-3', price: 40);
      final best = highestPricedOwnedCard(
        {'swsh1-1', 'swsh1-2', 'swsh1-3'},
        {'swsh1-1': cheap, 'swsh1-2': expensive, 'swsh1-3': mid},
      );

      expect(best, same(expensive));
    });

    test('is deterministic (lowest card id) when nothing has price data', () {
      final a = priced('swsh1-a');
      final b = priced('swsh1-b');
      final best = highestPricedOwnedCard(
          {'swsh1-b', 'swsh1-a'}, {'swsh1-a': a, 'swsh1-b': b});

      expect(best, same(a));
    });

    test('is deterministic (lowest card id) on a true price tie', () {
      final a = priced('swsh1-a', price: 50);
      final b = priced('swsh1-b', price: 50);
      final best = highestPricedOwnedCard(
          {'swsh1-b', 'swsh1-a'}, {'swsh1-a': a, 'swsh1-b': b});

      expect(best, same(a));
    });

    test('returns null when none of the owned ids are cached yet', () {
      final best = highestPricedOwnedCard({'swsh1-1'}, {});

      expect(best, isNull);
    });

    test('skips uncached ids and picks among the ones that are', () {
      final cached = priced('swsh1-2', price: 10);
      final best =
          highestPricedOwnedCard({'swsh1-1', 'swsh1-2'}, {'swsh1-2': cached});

      expect(best, same(cached));
    });
  });
}
