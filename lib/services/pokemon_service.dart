import '../models/pokeapi/berries.dart';
import '../models/pokeapi/contests.dart';
import '../models/pokeapi/egg_groups.dart';
import '../models/pokeapi/encounters.dart';
import '../models/pokeapi/evolution.dart';
import '../models/pokeapi/evolution_chain.dart';
import '../models/pokeapi/games.dart';
import '../models/pokeapi/genders.dart';
import '../models/pokeapi/growth_rates.dart';
import '../models/pokeapi/items.dart';
import '../models/pokeapi/locations.dart';
import '../models/pokeapi/machines.dart';
import '../models/pokeapi/moves.dart';
import '../models/pokeapi/pokeathlonstat.dart';
import '../models/pokeapi/pokemon.dart';
import '../models/pokeapi/abilities.dart';
import '../models/pokeapi/characteristics.dart';
import '../models/pokeapi/natures.dart';
import '../models/pokeapi/pokemon_details.dart';
import '../models/pokeapi/pokemon_species.dart';
import '../models/pokeapi/stat.dart';
import '../models/pokeapi/utility.dart';

/// Everything PokemonApiProvider needs to fetch PokeAPI data, independent of
/// where it actually comes from. [PokeApiPokemonService] (in
/// poke_api_pokemon_service.dart) is the only production implementation —
/// it hits pokeapi.co with local-cache-first fetching — but keeping this as
/// an interface means tests/fakes don't need to extend a class that makes
/// real HTTP calls just to get a constructible stand-in.
abstract class PokemonService {
  Future<List<Pokemon>> getPokemonList();
  // `priority` routes the request through a separate, smaller concurrency
  // lane instead of the bulk background-sync queue - see
  // PokeApiPokemonService for why. Use it when a user is actively waiting on
  // this specific fetch (e.g. viewing that Pokemon's details screen right
  // now), not for routine background population.
  Future<PokemonDetails> getPokemonDetails(int id, {bool priority = false});
  Future<PokemonSpecies> getPokemonSpecies(int id,
      {bool force = false, bool priority = false});
  Future<EvolutionChain?> getEvolutionChain(int id,
      {bool? batch, bool priority = false});
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls();
  Future<List<EvolutionChain?>> getAllEvolutionChains();

  // region Berries
  Future<Berry> getBerry(int id);
  Future<BerryFlavor> getBerryFlavor(int id);
  // endregion

  // region Contests
  Future<ContestType> getContestType(int id);
  // endregion

  // region Encounters
  Future<EncounterMethod> getEncounterMethod(int id);
  Future<EncounterCondition> getEncounterCondition(int id);
  Future<EncounterConditionValue> getEncounterConditionValue(int id);
  // endregion

  // region Evolution
  Future<EvolutionTrigger> getEvolutionTrigger(int id);
  // endregion

  // region Games
  Future<Generation> getGeneration(int id);
  Future<Pokedex> getPokedex(int id);
  Future<Version> getVersion(int id);
  Future<VersionGroup> getVersionGroup(int id);
  /// Ids of every version group, used to build the game list.
  Future<List<int>> getVersionGroupIds();
  // endregion

  // region Items
  Future<Item> getItem(int id);
  Future<ItemAttribute> getItemAttribute(int id);
  Future<ItemCategory> getItemCategory(int id);
  Future<ItemFlingEffect> getItemFlingEffect(int id);
  Future<ItemPocket> getItemPocket(int id);
  // endregion

  // region Locations
  Future<Location> getLocation(int id);
  Future<LocationArea> getLocationArea(int id);
  Future<PalParkArea> getPalParkArea(int id);
  Future<Region> getRegion(int id);
  // endregion

  // region Machines
  Future<Machine> getMachine(int id);
  // endregion

  // region Moves
  Future<Move> getMove(int id, {bool priority = false});
  Future<MoveAilment> getMoveAilment(int id);
  Future<MoveBattleStyle> getMoveBattleStyle(int id);
  Future<MoveCategory> getMoveCategory(int id);
  Future<MoveDamageClass> getMoveDamageClass(int id);
  Future<MoveLearnMethod> getMoveLearnMethod(int id);
  Future<MoveTarget> getMoveTarget(int id);
  Future<List<MoveUrl?>> getAllMoveUrls();
  // endregion

  // region Abilities
  Future<Ability> getAbility(int id);
  Future<List<NamedApiResource?>> getAllAbilityUrls();
  // endregion

  // region Characteristics
  Future<Characteristic> getCharacteristic(int id);
  // endregion

  // region Egg Groups
  Future<EggGroup> getEggGroup(int id);
  // endregion

  // region Genders
  Future<Gender> getGender(int id);
  // endregion

  // region Growth Rates
  Future<GrowthRate> getGrowthRate(int id);
  // endregion

  // region Natures
  Future<Nature> getNature(int id);
  // endregion

  // region Pokeathlon Stats
  Future<PokeathlonStat> getPokeathlonStat(int id);
  // endregion

  // region Stats
  Future<Stat> getStat(int id);
  // endregion

  // region Languages
  Future<Language> getLanguage(int id);
  // endregion

  Future<List<NamedApiResource?>> getAllItemUrls();
}
