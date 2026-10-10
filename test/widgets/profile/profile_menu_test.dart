import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/widgets/profile/profile_menu.dart';
import 'package:provider/provider.dart';

import '../../support/fakes.dart';

void main() {
  late InMemoryProfileRepository repository;
  late ProfileProvider profiles;

  setUp(() async {
    repository = InMemoryProfileRepository(['Ash', 'Misty']);
    profiles = ProfileProvider(repository, InMemoryActiveProfileStore());
    await profiles.load();
  });

  Future<void> pumpMenu(WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: profiles,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(actions: const [ProfileButton()]),
          ),
        ),
      ),
    );
  }

  Future<void> openSheet(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('profile-button')));
    await tester.pumpAndSettle();
  }

  testWidgets('the app bar shows the active profile name', (tester) async {
    await pumpMenu(tester);

    expect(find.text('Ash'), findsOneWidget);
  });

  testWidgets('the sheet lists every profile', (tester) async {
    await pumpMenu(tester);

    await openSheet(tester);

    expect(find.text('Ash'), findsWidgets);
    expect(find.text('Misty'), findsOneWidget);
  });

  testWidgets('choosing a profile makes it active and updates the app bar',
      (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);

    await tester.tap(find.text('Misty'));
    await tester.pumpAndSettle();

    expect(profiles.activeProfile.name, 'Misty');
    expect(find.text('Misty'), findsOneWidget);
    expect(find.text('Ash'), findsNothing);
  });

  testWidgets('creating a profile adds it and switches to it', (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);

    await tester.tap(find.text('New profile'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Brock');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    expect(profiles.profiles.map((p) => p.name), contains('Brock'));
    expect(profiles.activeProfile.name, 'Brock');
  });

  testWidgets('creating a profile with a blank name is refused and nothing is added',
      (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);

    await tester.tap(find.text('New profile'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    expect(profiles.profiles, hasLength(2));
    expect(find.text('Name cannot be empty'), findsOneWidget);
  });

  testWidgets('resetting a profile asks first, then clears only that profile',
      (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);
    final mistyId = profiles.profiles.firstWhere((p) => p.name == 'Misty').id;

    await tester.tap(find.byKey(Key('profile-menu-$mistyId')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset progress'));
    await tester.pumpAndSettle();

    expect(find.text('Reset Misty?'), findsOneWidget);
    expect(repository.resetProfileIds, isEmpty,
        reason: 'nothing is reset until the user confirms');

    await tester.tap(find.text('Reset'));
    await tester.pumpAndSettle();

    expect(repository.resetProfileIds, [mistyId]);
  });

  testWidgets('renaming a profile changes its name in the sheet', (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);
    final mistyId = profiles.profiles.firstWhere((p) => p.name == 'Misty').id;

    await tester.tap(find.byKey(Key('profile-menu-$mistyId')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rename'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Misty R');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(profiles.profiles.map((p) => p.name), ['Ash', 'Misty R']);
    expect(find.text('Misty R'), findsOneWidget);
  });

  testWidgets('cancelling a reset changes nothing', (tester) async {
    await pumpMenu(tester);
    await openSheet(tester);
    final mistyId = profiles.profiles.firstWhere((p) => p.name == 'Misty').id;

    await tester.tap(find.byKey(Key('profile-menu-$mistyId')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Reset progress'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(repository.resetProfileIds, isEmpty);
  });
}
