import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/backup_notice.dart';
import 'package:pokedex_app/widgets/backup_notice.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          drawer: const Drawer(child: Text('menu')),
          body: Builder(
            builder: (context) {
              // Stands in for PokedexScreen's first frame.
              WidgetsBinding.instance.addPostFrameCallback(
                  (_) => showBackupNoticeIfPending(context,
                      onOpenMenu: () => Scaffold.of(context).openDrawer()));
              return const SizedBox();
            },
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the backup notice once after an upgrade', (tester) async {
    await BackupNotice.markPending();

    await pumpScreen(tester);

    expect(find.text('Your caught Pokemon were moved into a profile.'),
        findsOneWidget);
    expect(find.text('Open menu'), findsOneWidget);
  });

  testWidgets('the action opens the menu, where the export lives', (tester) async {
    await BackupNotice.markPending();
    await pumpScreen(tester);

    await tester.tap(find.text('Open menu'));
    await tester.pumpAndSettle();

    expect(find.text('menu'), findsOneWidget);
  });

  testWidgets('shows nothing on a fresh install', (tester) async {
    await pumpScreen(tester);

    expect(find.text('Open menu'), findsNothing);
  });
}
