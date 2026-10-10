import '../../models/tcg_card.dart';

/// What one binder pocket (one Pokemon's slot) should render. See the
/// "Pocket model" section of docs/features/card-binder.md.
sealed class BinderPocketView {
  const BinderPocketView();
}

/// The profile picked this card to display for this Pokemon, and its data is
/// cached locally - render it sleeve-styled.
class SelectedPocket extends BinderPocketView {
  final TcgCard card;

  const SelectedPocket(this.card);

  @override
  bool operator ==(Object other) =>
      other is SelectedPocket && other.card.id == card.id;

  @override
  int get hashCode => card.id.hashCode;
}

/// The profile's selected card is still owned, but its [TcgCard] data has not
/// been cached locally yet (shouldn't normally happen - see the Data model
/// section of the design doc). Rendered as a named-but-imageless pocket
/// rather than silently reverting to [OwnedPocket].
class SelectedPocketMissingData extends BinderPocketView {
  final String cardId;

  const SelectedPocketMissingData(this.cardId);

  @override
  bool operator ==(Object other) =>
      other is SelectedPocketMissingData && other.cardId == cardId;

  @override
  int get hashCode => cardId.hashCode;
}

/// At least one card is owned for this Pokemon, but none has been chosen to
/// display yet. Rendered as the dimmed Pokemon sprite, never bare card art.
class OwnedPocket extends BinderPocketView {
  const OwnedPocket();

  @override
  bool operator ==(Object other) => other is OwnedPocket;

  @override
  int get hashCode => 0;
}

/// No card is owned for this Pokemon at all. Rendered as the "+" affordance.
class EmptyPocket extends BinderPocketView {
  const EmptyPocket();

  @override
  bool operator ==(Object other) => other is EmptyPocket;

  @override
  int get hashCode => 1;
}

/// Pure derivation of a pocket's display state (see the "Pocket model"
/// section of docs/features/card-binder.md) from already-loaded data - no
/// I/O, so this is fully unit-testable without Isar.
///
/// [ownedCardIdsForPokemon] is this Pokemon's owned card ids drawn from
/// cached [TcgCard] data (used to decide [OwnedPocket] vs [EmptyPocket]).
/// [allOwnedCardIds] is every card id the profile owns, cached or not (used
/// only to tell "no longer owned" apart from "owned but not cached yet" when
/// resolving [selectedCardId]). [cachedCardsById] supplies the selected
/// card's display data, keyed by card id.
BinderPocketView computeBinderPocketView({
  required Set<String> ownedCardIdsForPokemon,
  required Set<String> allOwnedCardIds,
  required Map<String, TcgCard> cachedCardsById,
  required String? selectedCardId,
}) {
  if (selectedCardId != null && allOwnedCardIds.contains(selectedCardId)) {
    final cached = cachedCardsById[selectedCardId];
    return cached != null
        ? SelectedPocket(cached)
        : SelectedPocketMissingData(selectedCardId);
  }
  if (ownedCardIdsForPokemon.isNotEmpty) {
    return const OwnedPocket();
  }
  return const EmptyPocket();
}
