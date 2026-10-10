import '../../models/pokeapi/abilities.dart';
import '../../models/pokeapi/berries.dart';
import '../../models/pokeapi/characteristics.dart';
import '../../models/pokeapi/contests.dart';
import '../../models/pokeapi/egg_groups.dart';
import '../../models/pokeapi/encounters.dart';
import '../../models/pokeapi/evolution.dart';
import '../../models/pokeapi/evolution_chain.dart';
import '../../models/pokeapi/games.dart';
import '../../models/pokeapi/genders.dart';
import '../../models/pokeapi/growth_rates.dart';
import '../../models/pokeapi/items.dart';
import '../../models/pokeapi/locations.dart';
import '../../models/pokeapi/machines.dart';
import '../../models/pokeapi/moves.dart';
import '../../models/pokeapi/natures.dart';
import '../../models/pokeapi/pokeathlonstat.dart';
import '../../models/pokeapi/pokemon.dart';
import '../../models/pokeapi/pokemon_details.dart';
import '../../models/pokeapi/pokemon_species.dart';
import '../../models/pokeapi/stat.dart';
import '../../models/pokeapi/utility.dart';
import '../../models/binder_card_selection.dart';
import '../../models/caught_pokemon.dart';
import '../../models/profile.dart';
import '../../models/tcg_card.dart';

abstract class LocalService {
  Future<void> init(); // Initialize the database

  Future<List<Pokemon>> getPokemonList();
  Future<PokemonDetails?> getPokemonDetails(int id);
  Future<void> savePokemonList(List<Pokemon> pokemonList);
  Future<void> savePokemonDetails(PokemonDetails pokemon);
  Future<void> saveAllPokemonDetails(List<PokemonDetails?> allPokemonDetails);
  Future<void> saveEvolutionChain(EvolutionChain evolutionChain);
  Future<EvolutionChain?> getEvolutionChain(int id);
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls();

  Future<void> clearCache();

  // region Profiles
  Future<List<Profile>> getAllProfiles();
  /// Inserts or renames a profile. Returns its id.
  Future<int> saveProfile(Profile profile);
  /// Deletes this profile's caught Pokemon and caught TCG cards. Leaves the
  /// profile itself and every other profile untouched.
  Future<void> resetCaughtDataForProfile(int profileId);
  //endregion

  // region Caught Pokemon
  Future<List<CaughtPokemon>> getCaughtPokemonForProfile(int profileId);
  /// Upserts by (profileId, scopeKey, pokemonId).
  Future<void> saveAllCaughtPokemon(List<CaughtPokemon> caughtPokemon);
  //endregion
  Future<void> savePokemonSpecies(PokemonSpecies pokemonSpecies);
  Future<void> saveAllPokemonSpecies(List<PokemonSpecies?> allPokemonSpecies);
  Future<PokemonSpecies?> getPokemonSpecies(int id);

  Future<List<EvolutionChain?>> getAllEvolutionChains();
  Future<void> saveAllEvolutionChains(List<EvolutionChain?> evolutionChains);

  // region Berries
  Future<Berry?> getBerry(int id);
  Future<void> saveBerry(Berry berry);
  Future<BerryFlavor?> getBerryFlavor(int id);
  Future<void> saveBerryFlavor(BerryFlavor berryFlavor);
  //endregion

  // region Contests
  Future<ContestType?> getContestType(int id);
  Future<void> saveContestType(ContestType contestType);
  //endregion

  // region Encounters
  Future<EncounterMethod?> getEncounterMethod(int id);
  Future<void> saveEncounterMethod(EncounterMethod encounterMethod);
  Future<EncounterCondition?> getEncounterCondition(int id);
  Future<void> saveEncounterCondition(EncounterCondition encounterCondition);
  Future<EncounterConditionValue?> getEncounterConditionValue(int id);
  Future<void> saveEncounterConditionValue(EncounterConditionValue encounterConditionValue);
  //endregion

  // region Evolution
  Future<EvolutionTrigger?> getEvolutionTrigger(int id);
  Future<void> saveEvolutionTrigger(EvolutionTrigger evolutionTrigger);
  //endregion

  // region Games
  Future<Generation?> getGeneration(int id);
  Future<void> saveGeneration(Generation generation);
  Future<Pokedex?> getPokedex(int id);
  Future<void> savePokedex(Pokedex pokedex);
  Future<Version?> getVersion(int id);
  Future<void> saveVersion(Version version);
  Future<VersionGroup?> getVersionGroup(int id);
  Future<void> saveVersionGroup(VersionGroup versionGroup);
  //endregion

  // region Items
  Future<Item?> getItem(int id);
  Future<void> saveItem(Item item);
  Future<ItemAttribute?> getItemAttribute(int id);
  Future<void> saveItemAttribute(ItemAttribute itemAttribute);
  Future<ItemCategory?> getItemCategory(int id);
  Future<void> saveItemCategory(ItemCategory itemCategory);
  Future<ItemFlingEffect?> getItemFlingEffect(int id);
  Future<void> saveItemFlingEffect(ItemFlingEffect itemFlingEffect);
  Future<ItemPocket?> getItemPocket(int id);
  Future<void> saveItemPocket(ItemPocket itemPocket);
  //endregion

  // region Locations
  Future<Location?> getLocation(int id);
  Future<void> saveLocation(Location location);
  Future<LocationArea?> getLocationArea(int id);
  Future<void> saveLocationArea(LocationArea locationArea);
  Future<PalParkArea?> getPalParkArea(int id);
  Future<void> savePalParkArea(PalParkArea palParkArea);
  Future<Region?> getRegion(int id);
  Future<void> saveRegion(Region region);
  //endregion

  // region Machines
  Future<Machine?> getMachine(int id);
  Future<void> saveMachine(Machine machine);
  //endregion

  // region Moves
  Future<Move?> getMove(int id);
  Future<void> saveMove(Move move);
  Future<MoveAilment?> getMoveAilment(int id);
  Future<void> saveMoveAilment(MoveAilment moveAilment);
  Future<MoveBattleStyle?> getMoveBattleStyle(int id);
  Future<void> saveMoveBattleStyle(MoveBattleStyle moveBattleStyle);
  Future<MoveCategory?> getMoveCategory(int id);
  Future<void> saveMoveCategory(MoveCategory moveCategory);
  Future<MoveDamageClass?> getMoveDamageClass(int id);
  Future<void> saveMoveDamageClass(MoveDamageClass moveDamageClass);
  Future<MoveLearnMethod?> getMoveLearnMethod(int id);
  Future<void> saveMoveLearnMethod(MoveLearnMethod moveLearnMethod);
  Future<MoveTarget?> getMoveTarget(int id);
  Future<void> saveMoveTarget(MoveTarget moveTarget);
  //endregion

  // region Abilities
  Future<Ability?> getAbility(int id);
  Future<void> saveAbility(Ability ability);
  //endregion

  // region Characteristics
  Future<Characteristic?> getCharacteristic(int id);
  Future<void> saveCharacteristic(Characteristic characteristic);
  //endregion

  // region Egg Groups
  Future<EggGroup?> getEggGroup(int id);
  Future<void> saveEggGroup(EggGroup eggGroup);
  //endregion

  // region Genders
  Future<Gender?> getGender(int id);
  Future<void> saveGender(Gender gender);
  //endregion

  // region Growth Rates
  Future<GrowthRate?> getGrowthRate(int id);
  Future<void> saveGrowthRate(GrowthRate growthRate);
  //endregion

  // region Natures
  Future<Nature?> getNature(int id);
  Future<void> saveNature(Nature nature);
  //endregion

  // region Pokeathlon Stats
  Future<PokeathlonStat?> getPokeathlonStat(int id);
  Future<void> savePokeathlonStat(PokeathlonStat pokeathlonStat);
  //endregion

  // region Stats
  Future<Stat?> getStat(int id);
  Future<void> saveStat(Stat stat);
  //endregion

  // region Types
  //endregion

  // region Languages
  Future<Language?> getLanguage(int id);
  Future<void> saveLanguage(Language language);

  Future<List<PokemonDetails?>> getAllPokemonDetails();
  Future<List<PokemonSpecies?>> getAllPokemonSpecies();

  Future<void> saveAllMoves(List<Move?> newMoves);

  Future<List<Move?>> getAllMoves();

  Future<List<Ability?>> getAllAbilities();
  Future<void> saveAllAbilities(List<Ability?> abilities);

  Future<List<Item?>> getAllItems();
  Future<void> saveAllItems(List<Item?> items);
  //endregion

  // region TCG Cards
  Future<CaughtTcgCard?> getCaughtTcgCard(int profileId, String cardId);
  Future<void> saveCaughtTcgCard(CaughtTcgCard caughtTcgCard);
  /// Upserts by (profileId, cardId), for a batched import.
  Future<void> saveAllCaughtTcgCards(List<CaughtTcgCard> caughtTcgCards);
  Future<List<CaughtTcgCard>> getCaughtTcgCardsForProfile(int profileId);
  //endregion

  // region TCG Card cache (display data - see docs/features/card-binder.md)
  /// Write-through cache of full card data (image, name, ...), keyed by
  /// [TcgCard.id]. Upserts by id.
  Future<void> saveAllTcgCards(List<TcgCard> cards);
  Future<List<TcgCard>> getCachedTcgCardsByIds(List<String> ids);
  //endregion

  // region Card binder selections (see docs/features/card-binder.md)
  Future<BinderCardSelection?> getBinderSelection(int profileId, int pokemonId);
  /// Upserts by (profileId, pokemonId).
  Future<void> saveBinderSelection(BinderCardSelection selection);
  /// The binder screen needs every selection for a profile at once, not one
  /// Pokemon at a time.
  Future<List<BinderCardSelection>> getBinderSelectionsForProfile(int profileId);
  //endregion
}