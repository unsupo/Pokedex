import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/scroll_center_math.dart';

void main() {
  group('centeredScrollOffset', () {
    test('centers a middle item by shifting half a viewport minus half an item', () {
      // index 10, itemExtent 80 -> the item's top is at 800.
      // Centering shifts up by half the viewport (800/2=400) minus half the
      // item (80/2=40): 800 - (400 - 40) = 440.
      final offset = centeredScrollOffset(
        index: 10,
        itemExtent: 80,
        viewportHeight: 800,
        maxScrollExtent: 10000,
      );

      expect(offset, 440.0);
    });

    test('clamps to 0 for an item near the start of the list', () {
      // Centering index 0 would need a negative offset; the list can't
      // scroll past its start.
      final offset = centeredScrollOffset(
        index: 0,
        itemExtent: 80,
        viewportHeight: 800,
        maxScrollExtent: 10000,
      );

      expect(offset, 0.0);
    });

    test('clamps to maxScrollExtent for an item near the end of the list', () {
      final offset = centeredScrollOffset(
        index: 100,
        itemExtent: 80,
        viewportHeight: 800,
        maxScrollExtent: 500,
      );

      expect(offset, 500.0);
    });

    test('stays at 0 when the whole list is shorter than the viewport', () {
      final offset = centeredScrollOffset(
        index: 2,
        itemExtent: 80,
        viewportHeight: 800,
        maxScrollExtent: 0,
      );

      expect(offset, 0.0);
    });
  });
}
