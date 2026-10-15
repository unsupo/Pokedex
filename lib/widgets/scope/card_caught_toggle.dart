import 'package:flutter/material.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/card_binder_provider.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:provider/provider.dart';

import 'caught_toggle.dart';

/// Toggles a TCG card's caught status, and - only when the card is newly
/// caught, not when it's un-caught - mirrors that onto two other places a
/// freshly-caught card should be reflected:
///
///  - **The Pokemon itself**: owning a card of a Pokemon means you have that
///    Pokemon.
///  - **The card binder's pocket for this Pokemon**
///    (`services/card_binder_provider.dart`): if this Pokemon had no owned
///    card at all before this catch, the newly-caught one also becomes its
///    displayed card immediately. Found live (see "Fourth round" in
///    docs/features/card-binder.md): catching a card - from here (the
///    details screen's TCG Details tab) or from the binder's own browse
///    view, both call this same function - naturally reads as "I picked
///    this one to show," but catching and *selecting a binder display card*
///    were two entirely separate, unconnected steps before this fix: the
///    binder kept showing the generic owned-indicator sprite until the
///    profile separately opened the binder's cycle picker and confirmed a
///    selection there, something neither catch flow ever hinted was
///    needed. Centralized here rather than duplicated at each catch
///    call-site, and deliberately scoped to "nothing owned yet for this
///    Pokemon": catching a *second* or later card must not silently swap
///    an already-displayed card - that stays an explicit, deliberate
///    choice through the binder's cycle picker, same as before.
///
/// Reuses [toggleCaught] so the Pokemon-mirroring respects the same "no
/// scope chosen" rule and shows the same hint as the pokeball does.
///
/// [pokemonAlreadyCaught] skips that mirroring when the Pokemon is already
/// caught, so catching a second or third card for it doesn't re-trigger the
/// "choose a game or National" hint in a scope where catching isn't allowed.
Future<void> toggleCardCaught(
  BuildContext context,
  TcgCard card,
  int pokemonId, {
  required bool pokemonAlreadyCaught,
}) async {
  final cardWillBeCaught = !card.isCaught;
  final binder = context.read<CardBinderProvider>();
  final hadNoneOwnedYetForBinder = binder.ownedCardsFor(pokemonId).isEmpty;

  await Provider.of<TcgApiProvider>(context, listen: false).setCaught(card);
  if (!context.mounted) return;

  if (cardWillBeCaught && !pokemonAlreadyCaught) {
    await toggleCaught(context, pokemonId, true);
  }
  if (!context.mounted) return;

  if (cardWillBeCaught && hadNoneOwnedYetForBinder) {
    await binder.selectCard(pokemonId, card);
  }
}
