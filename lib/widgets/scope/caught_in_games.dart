import 'package:flutter/material.dart';

/// Lists the games a Pokemon is caught in. The details screen supplies the
/// heading, so this widget only lists names.
class CaughtInGames extends StatelessWidget {
  const CaughtInGames({
    super.key,
    required this.gameNames,
    required this.gamesLoaded,
  });

  final List<String> gameNames;

  /// Until the game list has loaded, the names are unknown, so "not caught"
  /// would be a guess.
  final bool gamesLoaded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!gamesLoaded)
          const Text('Loading games…')
        else if (gameNames.isEmpty)
          const Text('Not caught in any game yet')
        else
          for (final name in gameNames) Text(name),
      ],
    );
  }
}
