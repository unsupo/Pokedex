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

/// The raw number behind [estimatedCardPrice], for *comparing* cards
/// against each other - e.g. picking a Pokemon's priciest owned card as its
/// binder pocket's default display (see `highestPricedOwnedCard` in
/// `utils/binder/binder_pocket.dart` and "Seventh round" in
/// docs/features/card-binder.md). Same source preference as
/// [estimatedCardPrice] (TCGPlayer USD over Cardmarket EUR), but
/// deliberately currency-naive: a USD value and a EUR value are compared as
/// plain numbers, not converted. Acceptable here because the comparison
/// only ever runs within one Pokemon's own owned cards, where "which of
/// these has *some* real price signal" is what matters, not currency-exact
/// ranking. Returns null when the card has no pricing data at all, same as
/// [estimatedCardPrice].
double? estimatedCardPriceValue(TcgCard card) =>
    _bestTcgplayerPrice(card) ?? _bestCardmarketPrice(card);

double? _bestTcgplayerPrice(TcgCard card) {
  final prices = card.tcgplayer?.prices;
  if (prices == null) return null;
  // TCGPlayer prices are keyed by print variant, not a single flat object
  // (see the doc comment on TcgplayerPrices) - a card only ever has data
  // for the variant(s) it's actually printed as, so this tries each in
  // roughly most-to-least-common order and uses whichever variant
  // actually has data, rather than assuming one specific variant always
  // exists.
  for (final variant in [
    prices.holofoil,
    prices.normal,
    prices.reverseHolofoil,
    prices.firstEditionHolofoil,
    prices.firstEditionNormal,
    prices.unlimitedHolofoil,
    prices.unlimited,
  ]) {
    final best =
        variant?.market ?? variant?.mid ?? variant?.low ?? variant?.high;
    if (best != null) return best;
  }
  return null;
}

double? _bestCardmarketPrice(TcgCard card) {
  final prices = card.cardmarket?.prices;
  if (prices == null) return null;
  return prices.trendPrice ?? prices.averageSellPrice;
}
