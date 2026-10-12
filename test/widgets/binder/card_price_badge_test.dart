import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/widgets/binder/card_price_badge.dart';

void main() {
  Widget pumpable(Widget child) => MaterialApp(
        home: Scaffold(
          body: Stack(children: [child]),
        ),
      );

  testWidgets('shows the given price text', (tester) async {
    await tester.pumpWidget(pumpable(const CardPriceBadge(price: r'$12.50')));

    expect(find.text(r'$12.50'), findsOneWidget);
  });

  testWidgets('renders nothing when price is null', (tester) async {
    await tester.pumpWidget(pumpable(const CardPriceBadge(price: null)));

    expect(find.byType(Text), findsNothing);
  });
}
