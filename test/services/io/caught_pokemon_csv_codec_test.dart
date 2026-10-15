import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/io/caught_pokemon_csv_codec.dart';

void main() {
  group('CaughtPokemonCsvCodec round trip', () {
    test('empty list encodes to header-only CSV and decodes back to empty list', () {
      final csv = CaughtPokemonCsvCodec.encode([]);

      expect(CaughtPokemonCsvCodec.decode(csv), isEmpty);
    });

    test('a single row survives a full encode/decode round trip', () {
      final original = [(scopeKey: 'national', pokemonId: 25, isCaught: true)];

      final decoded = CaughtPokemonCsvCodec.decode(
        CaughtPokemonCsvCodec.encode(original),
      );

      expect(decoded, original);
    });

    test('many rows keep their scope, id, isCaught and order', () {
      final original = [
        (scopeKey: 'national', pokemonId: 1, isCaught: true),
        (scopeKey: 'national', pokemonId: 4, isCaught: false),
        (scopeKey: 'vg:17', pokemonId: 150, isCaught: true),
        (scopeKey: 'vg:17', pokemonId: 10091, isCaught: false),
      ];

      final decoded = CaughtPokemonCsvCodec.decode(
        CaughtPokemonCsvCodec.encode(original),
      );

      expect(decoded, original);
    });

    test('encode writes the scopeKey and pokemonId column headers', () {
      final csv = CaughtPokemonCsvCodec.encode([
        (scopeKey: 'national', pokemonId: 25, isCaught: true),
      ]);

      expect(csv.split('\n').first, 'scopeKey,pokemonId,isCaught');
    });
  });

  group('CaughtPokemonCsvCodec decode', () {
    test('tolerates a trailing blank line from external editors', () {
      const csv = 'scopeKey,pokemonId,isCaught\nnational,25,true\nnational,6,true\n\n';

      final decoded = CaughtPokemonCsvCodec.decode(csv);

      expect(decoded.map((r) => r.pokemonId).toList(), [25, 6]);
    });

    test('accepts header columns case-insensitively', () {
      const csv = 'SCOPEKEY,POKEMONID,ISCAUGHT\nnational,1,true\n';

      expect(CaughtPokemonCsvCodec.decode(csv).single.pokemonId, 1);
    });

    test('reads the legacy id,isCaught format as the national scope', () {
      // Files exported before profiles existed. They must keep importing.
      const legacy = 'id,isCaught\n25,true\n6,false\n';

      final decoded = CaughtPokemonCsvCodec.decode(legacy);

      expect(decoded, [
        (scopeKey: 'national', pokemonId: 25, isCaught: true),
        (scopeKey: 'national', pokemonId: 6, isCaught: false),
      ]);
    });

    test('rejects content with the wrong columns', () {
      const wrongShapeCsv = 'name,type\nBulbasaur,grass\n';

      expect(
        () => CaughtPokemonCsvCodec.decode(wrongShapeCsv),
        throwsFormatException,
      );
    });

    test('rejects a row with an empty scopeKey', () {
      const csv = 'scopeKey,pokemonId,isCaught\n,25,true\n';

      expect(() => CaughtPokemonCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a row with fewer cells than the header, with a FormatException',
        () {
      const csv = 'scopeKey,pokemonId,isCaught\nnational,25\n';

      expect(() => CaughtPokemonCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a non-numeric pokemonId', () {
      const csv = 'scopeKey,pokemonId,isCaught\nnational,pikachu,true\n';

      expect(() => CaughtPokemonCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a completely empty file', () {
      expect(() => CaughtPokemonCsvCodec.decode(''), throwsFormatException);
    });
  });
}
