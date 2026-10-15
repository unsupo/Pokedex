import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/widgets/scope/caught_in_games.dart';

void main() {
  testWidgets('lists every game the Pokemon is caught in', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: CaughtInGames(
            gameNames: ['Red / Blue', 'Gold / Silver'], gamesLoaded: true)),
    ));

    expect(find.text('Red / Blue'), findsOneWidget);
    expect(find.text('Gold / Silver'), findsOneWidget);
  });

  testWidgets('says so when it is caught in no game', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: CaughtInGames(gameNames: [], gamesLoaded: true)),
    ));

    expect(find.text('Not caught in any game yet'), findsOneWidget);
  });

  testWidgets('does not claim "no game" while the game list is still loading',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: CaughtInGames(gameNames: [], gamesLoaded: false)),
    ));

    expect(find.text('Loading games…'), findsOneWidget);
    expect(find.text('Not caught in any game yet'), findsNothing);
  });
}
