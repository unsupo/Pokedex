import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/user_data.dart';
import 'package:pokedex_app/services/io/caught_pokemon_csv_codec.dart';

void main() {
  group('CaughtPokemonCsvCodec round trip', () {
    test('empty list encodes to header-only CSV and decodes back to empty list', () {
      final csv = CaughtPokemonCsvCodec.encode([]);
      final decoded = CaughtPokemonCsvCodec.decode(csv);

      expect(decoded, isEmpty);
    });

    test('single entry survives a full encode/decode round trip', () {
      final original = [UserData(id: 25, isCaught: true)];

      final decoded = CaughtPokemonCsvCodec.decode(
        CaughtPokemonCsvCodec.encode(original),
      );

      expect(decoded, hasLength(1));
      expect(decoded.single.id, 25);
      expect(decoded.single.isCaught, isTrue);
    });

    test('many entries preserve id, isCaught and order through the round trip', () {
      final original = [
        UserData(id: 1, isCaught: true),
        UserData(id: 4, isCaught: false),
        UserData(id: 150, isCaught: true),
        UserData(id: 10091, isCaught: false),
      ];

      final decoded = CaughtPokemonCsvCodec.decode(
        CaughtPokemonCsvCodec.encode(original),
      );

      expect(decoded.map((u) => u.id).toList(), original.map((u) => u.id).toList());
      expect(
        decoded.map((u) => u.isCaught).toList(),
        original.map((u) => u.isCaught).toList(),
      );
    });

    test('decode is tolerant of a trailing blank line from external editors', () {
      const csvWithTrailingNewline = 'id,isCaught\n25,true\n6,true\n\n';

      final decoded = CaughtPokemonCsvCodec.decode(csvWithTrailingNewline);

      expect(decoded.map((u) => u.id).toList(), [25, 6]);
    });

    test('decode accepts header columns case-insensitively', () {
      const csv = 'ID,ISCAUGHT\n1,true\n';

      final decoded = CaughtPokemonCsvCodec.decode(csv);

      expect(decoded.single.id, 1);
    });

    test('decode rejects content with the wrong columns', () {
      const wrongShapeCsv = 'name,type\nBulbasaur,grass\n';

      expect(
        () => CaughtPokemonCsvCodec.decode(wrongShapeCsv),
        throwsFormatException,
      );
    });

    test('decode rejects a completely empty file', () {
      expect(() => CaughtPokemonCsvCodec.decode(''), throwsFormatException);
    });
  });
}
