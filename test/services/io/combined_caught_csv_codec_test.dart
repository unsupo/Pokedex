import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/io/combined_caught_csv_codec.dart';

void main() {
  group('CombinedCaughtCsvCodec round trip', () {
    test('a mix of Pokemon and card rows survives encode/decode', () {
      final original = [
        (kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true),
        (kind: 'pokemon', scopeKey: 'vg:17', pokemonId: 1, cardId: null, isCaught: false),
        (kind: 'card', scopeKey: null, pokemonId: null, cardId: 'swsh1-1', isCaught: true),
      ];

      final decoded = CombinedCaughtCsvCodec.decode(CombinedCaughtCsvCodec.encode(original));

      expect(decoded, original);
    });

    test('empty list encodes to header-only CSV and decodes back to empty list', () {
      expect(CombinedCaughtCsvCodec.decode(CombinedCaughtCsvCodec.encode([])), isEmpty);
    });

    test('encode writes the combined column headers, including pokemonName', () {
      final csv = CombinedCaughtCsvCodec.encode([
        (kind: 'card', scopeKey: null, pokemonId: null, cardId: 'swsh1-1', isCaught: true),
      ]);

      expect(csv.split('\n').first, 'kind,scopeKey,pokemonId,cardId,isCaught,pokemonName');
    });
  });

  group('CombinedCaughtCsvCodec pokemonName column', () {
    test('a pokemon row gets its name from the lookup, purely for readability', () {
      final csv = CombinedCaughtCsvCodec.encode(
        [(kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true)],
        pokemonNames: {25: 'Pikachu'},
      );

      expect(csv, contains('pokemon,national,25,,true,Pikachu'));
    });

    test('a card row has no pokemon name, regardless of the lookup', () {
      final csv = CombinedCaughtCsvCodec.encode(
        [(kind: 'card', scopeKey: null, pokemonId: null, cardId: 'swsh1-1', isCaught: true)],
        pokemonNames: {25: 'Pikachu'},
      );

      expect(csv, contains('card,,,swsh1-1,true,'));
    });

    test('a pokemon id missing from the lookup encodes an empty name, not a crash', () {
      final csv = CombinedCaughtCsvCodec.encode(
        [(kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true)],
      );

      expect(csv, contains('pokemon,national,25,,true,'));
    });

    test('decode ignores the pokemonName column - it is not needed to restore state', () {
      const csv = 'kind,scopeKey,pokemonId,cardId,isCaught,pokemonName\n'
          'pokemon,national,25,,true,Pikachu\n';

      final decoded = CombinedCaughtCsvCodec.decode(csv);

      expect(decoded,
          [(kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true)]);
    });
  });

  group('CombinedCaughtCsvCodec smart detection of older formats', () {
    test('a Pokemon-only file (scopeKey,pokemonId,isCaught) decodes as pokemon rows', () {
      const csv = 'scopeKey,pokemonId,isCaught\nnational,25,true\nvg:17,1,false\n';

      final decoded = CombinedCaughtCsvCodec.decode(csv);

      expect(decoded, [
        (kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true),
        (kind: 'pokemon', scopeKey: 'vg:17', pokemonId: 1, cardId: null, isCaught: false),
      ]);
    });

    test('the oldest pre-profile Pokemon file (id,isCaught) decodes as national-scope pokemon rows',
        () {
      const csv = 'id,isCaught\n25,true\n';

      final decoded = CombinedCaughtCsvCodec.decode(csv);

      expect(decoded.single,
          (kind: 'pokemon', scopeKey: 'national', pokemonId: 25, cardId: null, isCaught: true));
    });

    test('a cards-only file (cardId,isCaught) decodes as card rows', () {
      const csv = 'cardId,isCaught\nswsh1-1,true\nbase1-4,false\n';

      final decoded = CombinedCaughtCsvCodec.decode(csv);

      expect(decoded, [
        (kind: 'card', scopeKey: null, pokemonId: null, cardId: 'swsh1-1', isCaught: true),
        (kind: 'card', scopeKey: null, pokemonId: null, cardId: 'base1-4', isCaught: false),
      ]);
    });

    test('rejects content matching none of the known formats', () {
      const csv = 'name,type\nPikachu,Lightning\n';

      expect(() => CombinedCaughtCsvCodec.decode(csv), throwsFormatException);
    });

    test('rejects a completely empty file', () {
      expect(() => CombinedCaughtCsvCodec.decode(''), throwsFormatException);
    });
  });
}
