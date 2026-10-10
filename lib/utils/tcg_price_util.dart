import '../models/tcg_card.dart';

/// A rough resale-value estimate for a card, from whatever pricing data the
/// TCG API included with it. Prefers TCGPlayer's price (USD, the more
/// commonly recognized figure for this audience) over Cardmarket's (EUR),
/// and within each falls back through its weaker fields when the strongest
/// one is missing. Returns null when the card has no pricing data at all.
String? estimatedCardPrice(TcgCard card) {
  final usd = _bestTcgplayerPrice(card);
  if (usd != null) return '\$${usd.toStringAsFixed(2)}';

  final eur = _bestCardmarketPrice(card);
  if (eur != null) return '€${eur.toStringAsFixed(2)}';

  return null;
}

double? _bestTcgplayerPrice(TcgCard card) {
  final prices = card.tcgplayer?.prices;
  if (prices == null) return null;
  return prices.market ?? prices.mid ?? prices.low ?? prices.high;
}

double? _bestCardmarketPrice(TcgCard card) {
  final prices = card.cardmarket?.prices;
  if (prices == null) return null;
  return prices.trendPrice ?? prices.averageSellPrice;
}
