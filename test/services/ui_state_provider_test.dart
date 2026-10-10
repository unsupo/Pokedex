import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';

/// UiStateProvider never calls any LocalService method (see the
/// `// ignore: unused_field` on its constructor parameter), so a fake that
/// implements nothing beyond the interface itself is enough to construct one.
class _UnusedLocalService implements LocalService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('not used by UiStateProvider');
}

void main() {
  group('UiStateProvider.lastViewedPokemonId', () {
    test('starts out null, since nothing has been viewed yet this session', () {
      final provider = UiStateProvider(_UnusedLocalService());

      expect(provider.lastViewedPokemonId, isNull);
    });

    test('setLastViewedPokemonId records the id and notifies listeners', () {
      final provider = UiStateProvider(_UnusedLocalService());
      var notified = false;
      provider.addListener(() => notified = true);

      provider.setLastViewedPokemonId(25);

      expect(provider.lastViewedPokemonId, 25);
      expect(notified, isTrue);
    });

    test('viewing a second Pokemon overwrites the first', () {
      final provider = UiStateProvider(_UnusedLocalService());

      provider.setLastViewedPokemonId(1);
      provider.setLastViewedPokemonId(2);

      expect(provider.lastViewedPokemonId, 2,
          reason: 'only the single most recent visit is tracked');
    });
  });
}
