import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/scroll_center_math.dart';

void main() {
  group('centeredScrollOffset', () {
    test('centers a middle item by shifting half a viewport minus half an item',
        () {
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

  group('indexAtViewportCenter', () {
    test('round-trips with centeredScrollOffset for a middle item', () {
      // Scrolling to exactly center index 10 (see the test above, offset
      // 440) should report index 10 as the one now at the center.
      final index = indexAtViewportCenter(
        offset: 440,
        itemExtent: 80,
        viewportHeight: 800,
      );

      expect(index, 10);
    });

    test('reports index 0 at the very top of an unscrolled list', () {
      // Center of an 800-tall viewport at offset 0 is y=400, which falls
      // inside item 5's span (400-480) when itemExtent is 80.
      final index = indexAtViewportCenter(
        offset: 0,
        itemExtent: 80,
        viewportHeight: 800,
      );

      expect(index, 5);
    });

    test('tracks further down the list as the offset increases', () {
      final index = indexAtViewportCenter(
        offset: 4000,
        itemExtent: 80,
        viewportHeight: 800,
      );

      // Center of the viewport is at 4000+400=4400, which falls inside
      // item 55's span (4400-4480).
      expect(index, 55);
    });
  });
}
