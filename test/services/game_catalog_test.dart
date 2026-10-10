import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/pokeapi/games.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/pokeapi_url.dart';

/// Serves a tiny fake PokeAPI: one version group, "red-blue", whose regional
/// Pokedex (id 2) contains Bulbasaur (1) and Pikachu (25). Every other call
/// throws, so a test that reaches for something unexpected fails loudly.
class _FakeGamesService implements PokemonService {
  @override
  Future<List<int>> getVersionGroupIds() async => [1];

  @override
  Future<VersionGroup> getVersionGroup(int id) async => VersionGroup(
        id: id,
        name: 'red-blue',
        pokedexes: [
          NamedApiResource(name: 'kanto', url: 'https://pokeapi.co/api/v2/pokedex/2/'),
        ],
      );

  @override
  Future<Pokedex> getPokedex(int id) async => Pokedex(
        id: id,
        pokemonEntries: [
          PokemonEntry(
            entryNumber: 1,
            pokemonSpecies: NamedApiResource(
                name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon-species/1/'),
          ),
          PokemonEntry(
            entryNumber: 25,
            pokemonSpecies: NamedApiResource(
                name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon-species/25/'),
          ),
        ],
      );

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not expected here');
}

void main() {
  group('GameCatalog', () {
    test('a game lists the species in its regional Pokedex', () async {
      final games = await GameCatalog(_FakeGamesService()).loadGames();

      expect(games, hasLength(1));
      expect(games.single.versionGroupId, 1);
      expect(games.single.memberIds, {1, 25});
    });

    test('the game name is readable, not the raw slug', () async {
      final games = await GameCatalog(_FakeGamesService()).loadGames();

      expect(games.single.name, 'Red / Blue');
    });

    test('a version group with no Pokedex entries is left out', () async {
      final games = await GameCatalog(_EmptyDexService()).loadGames();

      expect(games, isEmpty);
    });
  });

  group('a failed load', () {
    test('is not cached, so the next attempt can succeed', () async {
      final service = _FlakyGamesService();
      final catalog = GameCatalog(service);

      await expectLater(catalog.loadGames(), throwsException);
      final games = await catalog.loadGames();

      expect(games.single.versionGroupId, 1);
    });
  });

  group('idFromPokeApiUrl', () {
    test('reads the id from a resource url with a trailing slash', () {
      expect(idFromPokeApiUrl('https://pokeapi.co/api/v2/pokemon-species/25/'), 25);
    });

    test('reads the id from a resource url without a trailing slash', () {
      expect(idFromPokeApiUrl('https://pokeapi.co/api/v2/pokedex/2'), 2);
    });
  });
}

/// Fails the first version-group list call, as an offline first launch would.
class _FlakyGamesService extends _FakeGamesService {
  int calls = 0;

  @override
  Future<List<int>> getVersionGroupIds() async {
    if (calls++ == 0) throw Exception('offline');
    return [1];
  }
}

class _EmptyDexService extends _FakeGamesService {
  @override
  Future<VersionGroup> getVersionGroup(int id) async => VersionGroup(id: id, name: 'x-y');
}
