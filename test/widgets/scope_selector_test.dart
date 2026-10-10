import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/widgets/scope/scope_selector.dart';


void main() {
  const derived = DerivedNationalScope();
  const manual = ManualNationalScope();
  const red = GameScope(1);

  final options = [
    const ScopeOption(scope: derived, label: 'National (all games)', caught: 3, total: 151),
    const ScopeOption(scope: manual, label: 'National (manual)', caught: 1, total: 151),
    const ScopeOption(scope: red, label: 'Red / Blue', caught: 2, total: 151),
  ];

  Future<void> pump(WidgetTester tester, Scope current,
      {ValueChanged<Scope>? onSelected}) {
    return tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ScopeSelector(
          current: current,
          options: options,
          onSelected: onSelected ?? (_) {},
        ),
      ),
    ));
  }

  testWidgets('shows every option with its own progress', (tester) async {
    await pump(tester, derived);

    expect(find.text('National (all games)'), findsOneWidget);
    expect(find.text('National (manual)'), findsOneWidget);
    expect(find.text('Red / Blue'), findsOneWidget);
    expect(find.text('3/151'), findsOneWidget);
    expect(find.text('2/151'), findsOneWidget);
  });

  testWidgets('tapping an option reports that scope', (tester) async {
    Scope? chosen;
    await pump(tester, derived, onSelected: (s) => chosen = s);

    final redChip = find.widgetWithText(ChoiceChip, 'Red / Blue');
    // The third choice starts off-screen in a narrow test view; scroll to it first.
    await tester.ensureVisible(redChip);
    await tester.tap(redChip);
    await tester.pump();

    expect(chosen, red);
  });

  testWidgets('the current scope is marked selected', (tester) async {
    await pump(tester, manual);

    final chip = tester.widget<ChoiceChip>(
        find.widgetWithText(ChoiceChip, 'National (manual)'));
    expect(chip.selected, isTrue);
    final other = tester.widget<ChoiceChip>(
        find.widgetWithText(ChoiceChip, 'Red / Blue'));
    expect(other.selected, isFalse);
  });
}
