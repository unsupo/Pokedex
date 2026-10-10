import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/pokeapi_url.dart';
import 'package:pokedex_app/utils/string_utils.dart';

/// One PokeAPI version group, with the Pokemon in its regional Pokedex.
class Game {
  const Game({
    required this.versionGroupId,
    required this.name,
    required this.memberIds,
  });

  final int versionGroupId;
  final String name;

  /// National dex (species) ids in this game's regional Pokedex.
  final Set<int> memberIds;
}

/// Builds the list of games from PokeAPI. Loads once and keeps the result,
/// since the lookup touches a Pokedex per game.
class GameCatalog {
  final PokemonService _service;
  Future<List<Game>>? _games;

  GameCatalog(this._service);

  /// A failed load is not kept, so the next call retries it. Otherwise one
  /// offline launch would leave the game list empty until the app restarts.
  Future<List<Game>> loadGames() {
    return _games ??= _load().catchError((Object error) {
      _games = null;
      throw error;
    });
  }

  Future<List<Game>> _load() async {
    final games = <Game>[];
    for (final id in await _service.getVersionGroupIds()) {
      final group = await _service.getVersionGroup(id);
      final members = <int>{};
      for (final dexRef in group.pokedexes ?? const []) {
        final dex = await _service.getPokedex(idFromPokeApiUrl(dexRef.url!));
        for (final entry in dex.pokemonEntries ?? const []) {
          final species = entry.pokemonSpecies?.url;
          if (species != null) members.add(idFromPokeApiUrl(species));
        }
      }
      if (members.isEmpty) continue;
      games.add(Game(
        versionGroupId: id,
        name: _displayName(group.name ?? '$id'),
        memberIds: members,
      ));
    }
    return games;
  }

  /// `red-blue` -> `Red / Blue`.
  static String _displayName(String slug) =>
      slug.split('-').map(capitalizeFirstLetter).join(' / ');
}
