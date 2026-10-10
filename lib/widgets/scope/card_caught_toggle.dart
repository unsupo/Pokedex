import 'package:flutter/material.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/tcg_api_provider.dart';
import 'package:provider/provider.dart';

import 'caught_toggle.dart';

/// Toggles a TCG card's caught status, and - only when the card is newly
/// caught, not when it's un-caught - mirrors that onto the Pokemon itself:
/// owning a card of a Pokemon means you have that Pokemon. Reuses
/// [toggleCaught] so this respects the same "no scope chosen" rule and shows
/// the same hint as the pokeball does.
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
  await Provider.of<TcgApiProvider>(context, listen: false).setCaught(card);
  if (!context.mounted) return;

  if (cardWillBeCaught && !pokemonAlreadyCaught) {
    await toggleCaught(context, pokemonId, true);
  }
}
