import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/string_utils.dart';

void main() {
  group('sanitizeName', () {
    test('preserves legitimately hyphenated Pokemon names', () {
      expect(sanitizeName('ho-oh'), 'ho-oh');
      expect(sanitizeName('porygon-z'), 'porygon-z');
      expect(sanitizeName('jangmo-o'), 'jangmo-o');
      expect(sanitizeName('type-null'), 'type-null');
    });

    test('converts known gender suffixes to symbols instead of dropping them',
        () {
      expect(sanitizeName('nidoran-f'), 'nidoran♀');
      expect(sanitizeName('nidoran-m'), 'nidoran♂');
    });

    test('returns empty string unchanged', () {
      expect(sanitizeName(''), '');
    });

    test('leaves plain names untouched', () {
      expect(sanitizeName('charizard'), 'charizard');
    });
  });

  group('capitalizeFirstLetter', () {
    test('capitalizes only the first letter', () {
      expect(capitalizeFirstLetter('charizard'), 'Charizard');
    });

    test('handles empty string', () {
      expect(capitalizeFirstLetter(''), '');
    });
  });
}
