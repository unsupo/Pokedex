import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/utils/tcg_price_util.dart';

void main() {
  TcgCard cardWith({Tcgplayer? tcgplayer, CardMarket? cardmarket}) =>
      TcgCard(id: 'x', tcgplayer: tcgplayer, cardmarket: cardmarket);

  // TCGPlayer's real `prices` object is keyed by print variant
  // ("holofoil", "normal", ...), not a single flat price object - see the
  // doc comment on TcgplayerPrices (models/tcg_card.dart) and "Fifteenth
  // round" in docs/features/card-binder.md. `holofoil` is just this
  // suite's default test variant; `_bestTcgplayerPrice`'s own
  // variant-preference order is covered separately below.
  Tcgplayer holofoil(PriceData prices) =>
      Tcgplayer(prices: TcgplayerPrices(holofoil: prices));

  group('estimatedCardPrice', () {
    test('returns null when the card has no pricing data at all', () {
      expect(estimatedCardPrice(cardWith()), isNull);
    });

    test('prefers TCGPlayer market price, formatted in USD', () {
      final card = cardWith(
        tcgplayer: holofoil(PriceData(market: 12.5, mid: 20, low: 5)),
      );
      expect(estimatedCardPrice(card), r'$12.50');
    });

    test('falls back to TCGPlayer mid price when market is missing', () {
      final card = cardWith(tcgplayer: holofoil(PriceData(mid: 8)));
      expect(estimatedCardPrice(card), r'$8.00');
    });

    test('falls back to TCGPlayer low, then high, in that order', () {
      final lowOnly = cardWith(tcgplayer: holofoil(PriceData(low: 3)));
      expect(estimatedCardPrice(lowOnly), r'$3.00');

      final highOnly = cardWith(tcgplayer: holofoil(PriceData(high: 40)));
      expect(estimatedCardPrice(highOnly), r'$40.00');
    });

    test('falls back to Cardmarket trend price (EUR) when TCGPlayer has none',
        () {
      final card = cardWith(
        cardmarket: CardMarket(prices: PriceData(trendPrice: 7.25)),
      );
      expect(estimatedCardPrice(card), '€7.25');
    });

    test('falls back to Cardmarket average sell price when trend is missing',
        () {
      final card = cardWith(
        cardmarket: CardMarket(prices: PriceData(averageSellPrice: 4)),
      );
      expect(estimatedCardPrice(card), '€4.00');
    });

    test('TCGPlayer takes priority over Cardmarket when both are present', () {
      final card = cardWith(
        tcgplayer: holofoil(PriceData(market: 9)),
        cardmarket: CardMarket(prices: PriceData(trendPrice: 500)),
      );
      expect(estimatedCardPrice(card), r'$9.00');
    });

    test('a present but entirely-null prices object counts as no data', () {
      final card = cardWith(tcgplayer: holofoil(PriceData()));
      expect(estimatedCardPrice(card), isNull);
    });

    test(
        'reads a real pokemontcg.io TCGPlayer response shape - variant-keyed, '
        'not flat (confirmed against GET /v2/cards/base1-4 - see '
        '"Fifteenth round" in docs/features/card-binder.md)', () {
      final card = cardWith(
        tcgplayer: Tcgplayer(
          prices:
              TcgplayerPrices(holofoil: PriceData(low: 499.99, market: 928.06)),
        ),
      );
      expect(estimatedCardPrice(card), r'$928.06');
    });

    test(
        'tries each TCGPlayer variant in turn when the preferred ones are '
        'missing, rather than only ever checking one fixed variant', () {
      final normalOnly = cardWith(
        tcgplayer:
            Tcgplayer(prices: TcgplayerPrices(normal: PriceData(market: 2))),
      );
      expect(estimatedCardPrice(normalOnly), r'$2.00');

      final reverseHoloOnly = cardWith(
        tcgplayer: Tcgplayer(
            prices: TcgplayerPrices(reverseHolofoil: PriceData(market: 6))),
      );
      expect(estimatedCardPrice(reverseHoloOnly), r'$6.00');
    });
  });

  group('estimatedCardPriceValue', () {
    test('returns null when the card has no pricing data at all', () {
      expect(estimatedCardPriceValue(cardWith()), isNull);
    });

    test('returns the raw TCGPlayer market number, not a formatted string', () {
      final card = cardWith(tcgplayer: holofoil(PriceData(market: 12.5)));
      expect(estimatedCardPriceValue(card), 12.5);
    });

    test('falls back to the raw Cardmarket number when TCGPlayer has none', () {
      final card = cardWith(
        cardmarket: CardMarket(prices: PriceData(trendPrice: 7.25)),
      );
      expect(estimatedCardPriceValue(card), 7.25);
    });

    test('same TCGPlayer-over-Cardmarket preference as estimatedCardPrice', () {
      final card = cardWith(
        tcgplayer: holofoil(PriceData(market: 9)),
        cardmarket: CardMarket(prices: PriceData(trendPrice: 500)),
      );
      expect(estimatedCardPriceValue(card), 9);
    });
  });
}
