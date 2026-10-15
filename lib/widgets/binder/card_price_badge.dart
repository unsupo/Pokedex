import 'package:flutter/material.dart';

/// A small "$X.XX" badge overlaid in a card image's bottom-right corner -
/// wherever a TCG card's artwork is shown (binder pockets, the card
/// picker's cycle/browse views - see "Fourteenth round" in
/// docs/features/card-binder.md). Must be used inside a `Stack`; renders
/// nothing when [price] is null, which callers pass whenever
/// `estimatedCardPrice` (`utils/tcg_price_util.dart`) found no pricing
/// data for the card, rather than showing a misleading placeholder.
///
/// Takes the already-formatted string rather than a `TcgCard` so this stays
/// pure presentation - callers (which already have the card in hand to
/// decide what image to show) compute the price themselves.
class CardPriceBadge extends StatelessWidget {
  final String? price;

  const CardPriceBadge({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final price = this.price;
    if (price == null) return const SizedBox.shrink();
    return Positioned(
      right: 3,
      bottom: 3,
      child: IgnorePointer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
