import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/services/local/local_service.dart';

/// The minimal read/write capability [CaughtPokemonTransferService] needs.
abstract class CaughtPokemonRepository {
  /// Every row for one profile.
  Future<List<CaughtPokemon>> loadAll(int profileId);

  /// Upserts rows by (profileId, scopeKey, pokemonId).
  Future<void> saveAll(List<CaughtPokemon> rows);
}

class LocalServiceCaughtPokemonRepository implements CaughtPokemonRepository {
  final LocalService _localService;

  LocalServiceCaughtPokemonRepository(this._localService);

  @override
  Future<List<CaughtPokemon>> loadAll(int profileId) =>
      _localService.getCaughtPokemonForProfile(profileId);

  @override
  Future<void> saveAll(List<CaughtPokemon> rows) =>
      _localService.saveAllCaughtPokemon(rows);
}
