import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/utils/tcg_price_util.dart';

void main() {
  TcgCard cardWith({Tcgplayer? tcgplayer, CardMarket? cardmarket}) =>
      TcgCard(id: 'x', tcgplayer: tcgplayer, cardmarket: cardmarket);

  group('estimatedCardPrice', () {
    test('returns null when the card has no pricing data at all', () {
      expect(estimatedCardPrice(cardWith()), isNull);
    });

    test('prefers TCGPlayer market price, formatted in USD', () {
      final card = cardWith(
        tcgplayer: Tcgplayer(prices: PriceData(market: 12.5, mid: 20, low: 5)),
      );
      expect(estimatedCardPrice(card), r'$12.50');
    });

    test('falls back to TCGPlayer mid price when market is missing', () {
      final card = cardWith(
        tcgplayer: Tcgplayer(prices: PriceData(mid: 8)),
      );
      expect(estimatedCardPrice(card), r'$8.00');
    });

    test('falls back to TCGPlayer low, then high, in that order', () {
      final lowOnly = cardWith(tcgplayer: Tcgplayer(prices: PriceData(low: 3)));
      expect(estimatedCardPrice(lowOnly), r'$3.00');

      final highOnly = cardWith(tcgplayer: Tcgplayer(prices: PriceData(high: 40)));
      expect(estimatedCardPrice(highOnly), r'$40.00');
    });

    test('falls back to Cardmarket trend price (EUR) when TCGPlayer has none', () {
      final card = cardWith(
        cardmarket: CardMarket(prices: PriceData(trendPrice: 7.25)),
      );
      expect(estimatedCardPrice(card), '€7.25');
    });

    test('falls back to Cardmarket average sell price when trend is missing', () {
      final card = cardWith(
        cardmarket: CardMarket(prices: PriceData(averageSellPrice: 4)),
      );
      expect(estimatedCardPrice(card), '€4.00');
    });

    test('TCGPlayer takes priority over Cardmarket when both are present', () {
      final card = cardWith(
        tcgplayer: Tcgplayer(prices: PriceData(market: 9)),
        cardmarket: CardMarket(prices: PriceData(trendPrice: 500)),
      );
      expect(estimatedCardPrice(card), r'$9.00');
    });

    test('a present but entirely-null prices object counts as no data', () {
      final card = cardWith(tcgplayer: Tcgplayer(prices: PriceData()));
      expect(estimatedCardPrice(card), isNull);
    });
  });
}
