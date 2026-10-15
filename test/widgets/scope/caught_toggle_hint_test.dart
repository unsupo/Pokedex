import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/widgets/scope/caught_toggle.dart';

void main() {
  Future<void> pumpButton(WidgetTester tester) {
    return tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => showCaughtToggleHint(context),
            child: const Text('tap'),
          ),
        ),
      ),
    ));
  }

  testWidgets('shows the hint explaining why the toggle did nothing', (tester) async {
    await pumpButton(tester);

    await tester.tap(find.text('tap'));
    await tester.pump();

    expect(find.text('Choose a game or National (manual) to mark this Pokemon.'),
        findsOneWidget);
  });

  testWidgets(
      'a burst of taps shows the hint once, not a queued repeat after it has dismissed',
      (tester) async {
    await pumpButton(tester);

    // Four taps in a row, with no settle in between - the state a user
    // mashing the pokeball while it's refused would produce. Without
    // clearing the queue, Flutter would show the SnackBar four times in a
    // row, each only starting once the last one's full duration elapses.
    await tester.tap(find.text('tap'));
    await tester.pump();
    await tester.tap(find.text('tap'));
    await tester.tap(find.text('tap'));
    await tester.tap(find.text('tap'));

    // Let the one SnackBar that is showing run its full default duration and
    // animate out. Stepped, smaller pumps (rather than one big jump) so the
    // dismiss timer fires within a pump the scheduler can then settle from.
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 300));
    }
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsNothing,
        reason: 'no queued duplicate should reappear once the hint has dismissed');
  });
}
