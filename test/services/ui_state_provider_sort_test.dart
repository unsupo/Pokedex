import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/ui_state_provider.dart';
import 'package:pokedex_app/utils/pokemon_sort.dart';

/// A LocalService is required by the constructor but unused by `sort` --
/// stand in with a bare noSuchMethod fake rather than the real Isar service.
class _UnusedLocalService implements LocalService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('not exercised by sort state');
}

void main() {
  late UiStateProvider uiState;

  setUp(() {
    uiState = UiStateProvider(_UnusedLocalService());
  });

  group('AC 6: a fresh UiStateProvider', () {
    test('starts on dex-ascending', () {
      expect(uiState.sort, PokemonSort.dexAscending);
    });
  });

  group('setSort', () {
    test('changes the stored sort choice', () {
      uiState.setSort(PokemonSort.nameAscending);

      expect(uiState.sort, PokemonSort.nameAscending);
    });

    test('notifies listeners', () {
      var notified = false;
      uiState.addListener(() => notified = true);

      uiState.setSort(PokemonSort.nameDescending);

      expect(notified, isTrue);
    });
  });
}
