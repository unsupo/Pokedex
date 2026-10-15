import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/scope.dart';

void main() {
  group('scope keys', () {
    test('each kind has a stable storage key', () {
      expect(const DerivedNationalScope().key, 'derived');
      expect(const ManualNationalScope().key, 'national');
      expect(const GameScope(17).key, 'vg:17');
    });

    test('parse turns every key back into the same scope', () {
      for (final scope in const <Scope>[
        DerivedNationalScope(),
        ManualNationalScope(),
        GameScope(17),
      ]) {
        expect(Scope.parse(scope.key), scope);
      }
    });

    test('an unknown key is rejected rather than guessed', () {
      expect(() => Scope.parse('pokemon-go'), throwsFormatException);
      expect(() => Scope.parse('vg:notanumber'), throwsFormatException);
    });
  });

  group('equality', () {
    test('two games with the same version group are the same scope', () {
      expect(const GameScope(17), const GameScope(17));
      expect(const GameScope(17), isNot(const GameScope(18)));
    });

    test('the three kinds are never equal to each other', () {
      expect(const ManualNationalScope(), isNot(const DerivedNationalScope()));
      expect(const ManualNationalScope(), isNot(const GameScope(17)));
    });
  });

  test('only manual National and game scopes store their own caught rows', () {
    expect(const DerivedNationalScope().isStored, isFalse);
    expect(const ManualNationalScope().isStored, isTrue);
    expect(const GameScope(17).isStored, isTrue);
  });
}
