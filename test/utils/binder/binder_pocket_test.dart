import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/utils/binder/binder_pocket.dart';

void main() {
  TcgCard card(String id) => TcgCard(id: id, name: 'Card $id');

  group('computeBinderPocketView', () {
    test(
        'AC5: nothing owned and nothing selected shows the empty "+" state',
        () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: null,
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
      );

      expect(view, isA<OwnedPocket>());
    });

    test(
        'AC6: un-catching the selected card falls back to empty when no '
        "card for this Pokemon is owned anymore", () {
      final view = computeBinderPocketView(
        ownedCardIdsForPokemon: const {},
        allOwnedCardIds: const {},
        cachedCardsById: const {},
        selectedCardId: 'swsh1-1', // no longer owned
      );

      expect(view, isA<EmptyPocket>());
    });
  });
}
