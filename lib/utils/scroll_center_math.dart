/// The scroll offset that centers the item at [index] of a fixed-extent list
/// in a viewport of height [viewportHeight], clamped to the scrollable's
/// valid range (`0` to [maxScrollExtent]).
///
/// Used by `PokedexScreen`'s re-center-on-Home behavior (see
/// docs/features/home-recenter.md): with a fixed item extent, the target
/// offset for a row that may be far outside what the lazily-built
/// `ListView` currently has on screen is computable directly
/// (`index * itemExtent`, shifted to center it), with no `BuildContext` for
/// that row to call `Scrollable.ensureVisible` on.
double centeredScrollOffset({
  required int index,
  required double itemExtent,
  required double viewportHeight,
  required double maxScrollExtent,
}) {
  final target = (index * itemExtent) - (viewportHeight - itemExtent) / 2;
  final upperBound = maxScrollExtent < 0 ? 0.0 : maxScrollExtent;
  return target.clamp(0.0, upperBound);
}
