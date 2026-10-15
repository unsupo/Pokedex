import 'package:flutter/material.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:provider/provider.dart';

/// Shared by the list and the details screen. Derived National has no single
/// place to write, so a toggle there explains what to do instead of silently
/// doing nothing.
///
/// Returns the write's Future so a caller that needs to know when it lands
/// (e.g. [toggleCardCaught] in card_caught_toggle.dart) can await it; existing
/// callers that just fire it from an `onTap` are unaffected either way.
Future<void> toggleCaught(BuildContext context, int pokemonId, bool isCaught) async {
  final provider = Provider.of<PokemonApiProvider>(context, listen: false);
  if (!provider.canToggleCaught) {
    showCaughtToggleHint(context);
    return;
  }
  await provider.setCaught(pokemonId, isCaught);
}

/// Shows the "can't toggle here" hint. Split out from [toggleCaught] so it's
/// testable without the full provider graph.
///
/// [clearSnackBars] empties the queue first: [ScaffoldMessenger] otherwise
/// queues every call to `showSnackBar`, so mashing a Pokemon that can't be
/// toggled would replay the hint once per tap, long after the taps stopped.
void showCaughtToggleHint(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(const SnackBar(
      content: Text('Choose a game or National (manual) to mark this Pokemon.'),
    ));
}
