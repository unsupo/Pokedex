import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';
import 'package:pokedex_app/widgets/pokemon_details/moves_table.dart';

void main() {
  group('MovesTable null-safety', () {
    testWidgets(
        'does not crash when a move entry has no move reference (nullable id)',
        (WidgetTester tester) async {
      // moveName.move is null, so moveName.move?.id evaluates to a
      // dynamically-typed null. This must not crash when it reaches the
      // level-learned lookup/sort helpers, which take a nullable int id.
      final moves = [
        MoveName(
          move: null,
          versionGroupDetails: [
            VersionGroupDetail(
              levelLearnedAt: 12,
              moveLearnMethod: Species(name: 'level-up'),
              versionGroup: Species(name: 'sword-shield'),
            ),
          ],
        ),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovesTable(moves: moves, allMoves: const {}),
        ),
      ));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets(
        'does not crash when a game version name is null (null-safe sort)',
        (WidgetTester tester) async {
      // One version group detail has a null versionGroup, so its name is
      // null. _extractGameVersions must filter that out before sorting,
      // otherwise comparing against null throws.
      final moves = [
        MoveName(
          move: Species(name: 'tackle', url: 'https://pokeapi.co/api/v2/move/33/'),
          versionGroupDetails: [
            VersionGroupDetail(
              levelLearnedAt: 1,
              moveLearnMethod: Species(name: 'level-up'),
              versionGroup: null,
            ),
            VersionGroupDetail(
              levelLearnedAt: 5,
              moveLearnMethod: Species(name: 'level-up'),
              versionGroup: Species(name: 'red-blue'),
            ),
          ],
        ),
      ];

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MovesTable(moves: moves, allMoves: const {}),
        ),
      ));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.text('Select Game Version'), findsOneWidget);
    });
  });
}
