import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_csv_codec.dart';

void main() {
  group('CaughtTcgCardCsvCodec round trip', () {
    test('empty list encodes to header-only CSV and decodes back to empty list', () {
      final csv = CaughtTcgCardCsvCodec.encode([]);

      expect(CaughtTcgCardCsvCodec.decode(csv), isEmpty);
    });

    test('a single row survives a full encode/decode round trip', () {
      final original = [(cardId: 'swsh1-1', isCaught: true)];

      final decoded = CaughtTcgCardCsvCodec.decode(
        CaughtTcgCardCsvCodec.encode(original),
      );

      expect(decoded, original);
    });

    test('many rows keep their id, isCaught and order', () {
      final original = [
        (cardId: 'base1-4', isCaught: true),
        (cardId: 'swsh1-1', isCaught: false),
        (cardId: 'xy7-54', isCaught: true),
      ];

      final decoded = CaughtTcgCardCsvCodec.decode(
        CaughtTcgCardCsvCodec.encode(original),
      );

      expect(decoded, original);
    });

    test('encode writes the cardId and isCaught column headers', () {
      final csv = CaughtTcgCardCsvCodec.encode([(cardId: 'swsh1-1', isCaught: true)]);

      expect(csv.split('\n').first, 'cardId,isCaught');
    });
  });

  group('CaughtTcgCardCsvCodec decode', () {
    test('tolerates a trailing blank line from external editors', () {
      const csv = 'cardId,isCaught\nswsh1-1,true\nbase1-4,true\n\n';

      final decoded = CaughtTcgCardCsvCodec.decode(csv);

      expect(decoded.map((r) => r.cardId).toList(), ['swsh1-1', 'base1-4']);
    });

    test('accepts header columns case-insensitively', () {
      const csv = 'CARDID,ISCAUGHT\nswsh1-1,true\n';

      expect(CaughtTcgCardCsvCodec.decode(csv).single.cardId, 'swsh1-1');
    });

    test('rejects content with the wrong columns', () {
      const wrongShapeCsv = 'name,type\nPikachu,Lightning\n';

      expect(
        () => CaughtTcgCardCsvCodec.decode(wrongShapeCsv),
        throwsFormatException,
      );
    });

    test('rejects a row with fewer cells than the header', () {
      const csv = 'cardId,isCaught\nswsh1-1\n';

      expect(() => CaughtTcgCardCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a row with an empty cardId', () {
      const csv = 'cardId,isCaught\n,true\n';

      expect(() => CaughtTcgCardCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a completely empty file', () {
      expect(() => CaughtTcgCardCsvCodec.decode(''), throwsFormatException);
    });
  });
}
