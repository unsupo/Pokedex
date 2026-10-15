import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/widgets/export/export_scope_dialog.dart';

void main() {
  testWidgets('offers the current scope and all scopes', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () => showExportScopeDialog(context),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Current scope'), findsOneWidget);
    expect(find.text('All scopes'), findsOneWidget);
  });

  testWidgets('choosing current scope returns true', (tester) async {
    bool? result;
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await showExportScopeDialog(context),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Current scope'));
    await tester.pumpAndSettle();

    expect(result, isTrue);
  });

  testWidgets('choosing all scopes returns false', (tester) async {
    bool? result = true;
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await showExportScopeDialog(context),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('All scopes'));
    await tester.pumpAndSettle();

    expect(result, isFalse);
  });

  testWidgets('cancelling returns null, so nothing is exported', (tester) async {
    bool? result = true;
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () async => result = await showExportScopeDialog(context),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(result, isNull);
  });

  testWidgets('on derived National, says that the current scope is everything',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          onPressed: () => showExportScopeDialog(context,
              currentScopeIsDerived: true),
          child: const Text('open'),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.textContaining('National (all games) has no rows of its own'),
        findsOneWidget);
  });
}
