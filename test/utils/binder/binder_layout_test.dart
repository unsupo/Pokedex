import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/binder/binder_layout.dart';

void main() {
  group('binderPageIndexForPokemonId', () {
    test('AC2: dex #1-9 are on page 0, #10-18 are on page 1', () {
      expect(binderPageIndexForPokemonId(1), 0);
      expect(binderPageIndexForPokemonId(9), 0);
      expect(binderPageIndexForPokemonId(10), 1);
      expect(binderPageIndexForPokemonId(18), 1);
      expect(binderPageIndexForPokemonId(19), 2);
    });
  });

  group('binderPokemonIdsForPage', () {
    final ids = List.generate(20, (i) => i + 1); // 1..20

    test('AC2: page 0 holds dex ids 1-9, in order', () {
      expect(binderPokemonIdsForPage(ids, 0), [1, 2, 3, 4, 5, 6, 7, 8, 9]);
    });

    test('page 1 holds dex ids 10-18', () {
      expect(binderPokemonIdsForPage(ids, 1),
          [10, 11, 12, 13, 14, 15, 16, 17, 18]);
    });

    test('a trailing partial page only returns the ids that exist', () {
      expect(binderPokemonIdsForPage(ids, 2), [19, 20]);
    });

    test('a page past the end is empty', () {
      expect(binderPokemonIdsForPage(ids, 5), isEmpty);
    });

    test('is robust to a non-contiguous id list (not assumed to start at 1)',
        () {
      final gappy = [5, 7, 8, 100];
      expect(binderPokemonIdsForPage(gappy, 0), [5, 7, 8, 100]);
    });
  });

  group('binderPageCount', () {
    test('rounds up a partial final page', () {
      expect(binderPageCount(List.generate(20, (i) => i + 1)), 3);
    });

    test('is zero for an empty list', () {
      expect(binderPageCount([]), 0);
    });

    test('is exact for a multiple of 9', () {
      expect(binderPageCount(List.generate(18, (i) => i + 1)), 2);
    });
  });

  group('binderPageLabel', () {
    test('the first spread (page 0 alone) shows just "Page 1"', () {
      expect(
          binderPageLabel(rightPageIndex: 0, pageCount: 114), 'Page 1 of 114');
    });

    test('a middle spread shows both 1-indexed page numbers as a range', () {
      // rightPageIndex 2 -> left page 1 (p2), right page 2 (p3).
      expect(binderPageLabel(rightPageIndex: 2, pageCount: 114),
          'Pages 2-3 of 114');
    });

    test(
        'a spread landing on the last page alone (no right partner) shows '
        'just that page', () {
      // pageCount 4 (pages 0-3): rightPageIndex 4 is past the end, leaving
      // only page 3 (p4) on the left.
      expect(binderPageLabel(rightPageIndex: 4, pageCount: 4), 'Page 4 of 4');
    });
  });
}
