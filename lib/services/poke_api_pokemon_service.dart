import 'dart:convert';
import 'package:async_locks/async_locks.dart';
import 'package:http/http.dart' as http;

import '../utils/pokeapi_url.dart';
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
import 'package:flutter/foundation.dart';

import '../models/pokeapi/abilities.dart';
import '../models/pokeapi/characteristics.dart';
import '../models/pokeapi/natures.dart';
import '../models/pokeapi/pokemon_details.dart';
import '../models/pokeapi/pokemon_species.dart';
import '../models/pokeapi/stat.dart';
import '../models/pokeapi/utility.dart';
import 'local/local_service.dart';
import 'pokemon_service.dart';

/// The only production [PokemonService]: fetches from pokeapi.co, checking
/// [LocalService]'s Isar cache first on every call.
class PokeApiPokemonService implements PokemonService {
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  final LocalService _localService;

  PokeApiPokemonService(this._localService);

  // fetchData() fans out hundreds to thousands of per-item requests
  // concurrently (details/species for ~1300 pokemon, ~900 moves, ~350
  // abilities, ~1500 items, all at once via unbounded Future.wait). Without
  // a cap, that many simultaneous sockets routinely gets connections reset
  // ("Broken pipe") by the OS or the API's edge. Route every request through
  // this semaphore so at most a handful are ever in flight together.
  final Semaphore _httpSemaphore = Semaphore(8);

  // A cold start enqueues ~5000+ requests through _httpSemaphore above in one
  // shot (bulk background sync). Since that semaphore is a plain FIFO queue,
  // anything the user is *actively looking at right now* - the Pokemon whose
  // details screen is open - would otherwise sit behind thousands of unrelated
  // background requests before its turn comes up, even though it's a single
  // small fetch. Route on-demand "the user is waiting on this" requests
  // through this separate, smaller lane instead so they aren't stuck behind
  // the bulk sync's queue.
  final Semaphore _priorityHttpSemaphore = Semaphore(4);

  // The top-level http.get() helper opens (and closes) a brand-new
  // connection - and a fresh TLS handshake - for every single call. Reusing
  // one Client lets Dart's HttpClient keep persistent connections alive to
  // pokeapi.co and reuse them across the thousands of requests a cold start
  // makes, instead of paying full TCP+TLS setup every time.
  final http.Client _httpClient = http.Client();

  Future<http.Response> _get(Uri uri, {bool priority = false}) {
    final semaphore = priority ? _priorityHttpSemaphore : _httpSemaphore;
    return semaphore.run(() => _httpClient.get(uri));
  }

  /// Every single-resource getX(id) method below (getBerry, getMove,
  /// getAbility, ...) follows the same shape: check the local cache, and on
  /// a miss, GET '$_baseUrl/$path', decode it with [fromJson], optionally
  /// persist it via [save], or throw a labeled exception on a non-200
  /// response. This collapses that repeated shape into one place instead of
  /// ~30 hand-copied methods.
  Future<T> _fetchCached<T>({
    required Future<T?> Function() getCached,
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    required String label,
    Future<void> Function(T value)? save,
    bool priority = false,
  }) async {
    final cached = await getCached();
    if (cached != null) {
      return cached;
    }

    if (kDebugMode) {
      print('Fetching $label from API');
    }
    final response = await _get(Uri.parse('$_baseUrl/$path'), priority: priority);
    if (response.statusCode != 200) {
      throw Exception('Failed to load $label');
    }

    final value = fromJson(jsonDecode(response.body));
    if (save != null) {
      await save(value);
    }
    return value;
  }

  @override
  Future<List<Pokemon>> getPokemonList() async {
    try {
      if (kDebugMode) {
        print('Loading from cache');
      }
      final cachedData = await _localService.getPokemonList();
      if (cachedData.isNotEmpty) {
        return cachedData;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading from cache: $e');
        print('Fetching from API to update bad data');
      }
    }

    if (kDebugMode) {
      print('Fetching pokemon from API');
    }
    // /pokemon lists every *variety* separately (e.g. minior-red-meteor,
    // minior-blue-meteor, ... all ~14 Minior forms as distinct entries with
    // ids >=10000) - that flooded the main list with non-default form
    // entries never meant to be shown as their own rows, and for species
    // whose default variety has a compound name (Minior, Mimikyu, ...) even
    // the "normal" entry showed the full variant name instead of the clean
    // species name. /pokemon-species lists exactly one entry per species
    // (1025 total) with the clean name and the real national dex id.
    final response = await _get(
        Uri.parse('$_baseUrl/pokemon-species?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'];
      List<Pokemon> pokemonData = [];
      for (var d in data) {
        var s = d['url'].split('/');
        pokemonData.add(Pokemon(
            id: int.parse(s[s.length - 2]), name: d['name'], url: d['url']));
      }
      await _localService.savePokemonList(pokemonData);
      return pokemonData;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  @override
  Future<PokemonDetails> getPokemonDetails(int id, {bool priority = false}) =>
      _fetchCached(
        getCached: () => _localService.getPokemonDetails(id),
        path: 'pokemon/$id',
        fromJson: PokemonDetails.fromJson,
        label: 'details for Pokemon $id',
        // Not saved here - the caller batches these saves together.
        save: null,
        priority: priority,
      );

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id,
          {bool force = false, bool priority = false}) =>
      _fetchCached(
        getCached: () async =>
            force ? null : await _localService.getPokemonSpecies(id),
        path: 'pokemon-species/$id',
        fromJson: PokemonSpecies.fromJson,
        label: 'species for Pokemon $id',
        // Not saved here - the caller batches these saves together.
        save: null,
        priority: priority,
      );

  @override
  Future<EvolutionChain?> getEvolutionChain(int id,
          {bool? batch, bool priority = false}) =>
      _fetchCached<EvolutionChain>(
        getCached: () => _localService.getEvolutionChain(id),
        path: 'evolution-chain/$id',
        fromJson: EvolutionChain.fromJson,
        label: 'evolution chain for chain $id',
        save: (batch ?? false) ? _localService.saveEvolutionChain : null,
        priority: priority,
      );

  @override
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls() async {
    var evolutionChain = await _localService.getAllEvolutionChainUrls();
    List<EvolutionChainUrl?> allChains = [];
    if (evolutionChain.isEmpty || evolutionChain.length < 500) {
      if (kDebugMode) {
        print('Fetching all evolution chain urls from API');
      }
      // get list of all chain urls
      final response = await _get(
          Uri.parse('$_baseUrl/evolution-chain?limit=100000&offset=0'));

      if (response.statusCode == 200) {
        for (var r in jsonDecode(response.body)['results']) {
          allChains.add(EvolutionChainUrl.fromJson(r));
        }
      } else {
        throw Exception('Failed to load evolution chain');
      }
    }
    return allChains;
  }

  @override
  Future<List<EvolutionChain?>> getAllEvolutionChains() async {
    var allEvolutionChains = await _localService.getAllEvolutionChains();
    if (allEvolutionChains.isEmpty || allEvolutionChains.length < 500) {
      var futures = <Future<EvolutionChain?>>[];
      final evolutionChainUrls = await getAllEvolutionChainUrls();
      for (final url in evolutionChainUrls) {
        // Fetch Pokemon Details
        futures.add(getEvolutionChain(url?.pokemonId, batch: true));
      }
      allEvolutionChains = await Future.wait(futures);
      await _localService.saveAllEvolutionChains(allEvolutionChains);
    }
    return allEvolutionChains;
  }

  // region Berries
  @override
  Future<Berry> getBerry(int id) => _fetchCached(
        getCached: () => _localService.getBerry(id),
        path: 'berry/$id',
        fromJson: Berry.fromJson,
        label: 'berry $id',
        save: _localService.saveBerry,
      );

  @override
  Future<BerryFlavor> getBerryFlavor(int id) => _fetchCached(
        getCached: () => _localService.getBerryFlavor(id),
        path: 'berry-flavor/$id',
        fromJson: BerryFlavor.fromJson,
        label: 'berry-flavor $id',
        save: _localService.saveBerryFlavor,
      );
  // endregion

  // region Contests
  @override
  Future<ContestType> getContestType(int id) => _fetchCached(
        getCached: () => _localService.getContestType(id),
        path: 'contest-type/$id',
        fromJson: ContestType.fromJson,
        label: 'contest-type $id',
        save: _localService.saveContestType,
      );
  // endregion

  // region Encounters
  @override
  Future<EncounterMethod> getEncounterMethod(int id) => _fetchCached(
        getCached: () => _localService.getEncounterMethod(id),
        path: 'encounter-method/$id',
        fromJson: EncounterMethod.fromJson,
        label: 'encounter-method $id',
        save: _localService.saveEncounterMethod,
      );

  @override
  Future<EncounterCondition> getEncounterCondition(int id) => _fetchCached(
        getCached: () => _localService.getEncounterCondition(id),
        path: 'encounter-condition/$id',
        fromJson: EncounterCondition.fromJson,
        label: 'encounter-condition $id',
        save: _localService.saveEncounterCondition,
      );

  @override
  Future<EncounterConditionValue> getEncounterConditionValue(int id) =>
      _fetchCached(
        getCached: () => _localService.getEncounterConditionValue(id),
        path: 'encounter-condition-value/$id',
        fromJson: EncounterConditionValue.fromJson,
        label: 'encounter-condition-value $id',
        save: _localService.saveEncounterConditionValue,
      );
  // endregion

  // region Evolution
  @override
  Future<EvolutionTrigger> getEvolutionTrigger(int id) => _fetchCached(
        getCached: () => _localService.getEvolutionTrigger(id),
        path: 'evolution-trigger/$id',
        fromJson: EvolutionTrigger.fromJson,
        label: 'evolution-trigger $id',
        save: _localService.saveEvolutionTrigger,
      );
  // endregion

  // region Games
  @override
  Future<Generation> getGeneration(int id) => _fetchCached(
        getCached: () => _localService.getGeneration(id),
        path: 'generation/$id',
        fromJson: Generation.fromJson,
        label: 'generation $id',
        save: _localService.saveGeneration,
      );

  @override
  Future<Pokedex> getPokedex(int id) => _fetchCached(
        getCached: () => _localService.getPokedex(id),
        path: 'pokedex/$id',
        fromJson: Pokedex.fromJson,
        label: 'pokedex $id',
        save: _localService.savePokedex,
      );

  @override
  Future<Version> getVersion(int id) => _fetchCached(
        getCached: () => _localService.getVersion(id),
        path: 'version/$id',
        fromJson: Version.fromJson,
        label: 'version $id',
        save: _localService.saveVersion,
      );

  @override
  Future<VersionGroup> getVersionGroup(int id) => _fetchCached(
        getCached: () => _localService.getVersionGroup(id),
        path: 'version-group/$id',
        fromJson: VersionGroup.fromJson,
        label: 'version-group $id',
        save: _localService.saveVersionGroup,
      );

  @override
  Future<List<int>> getVersionGroupIds() async {
    final response =
        await _get(Uri.parse('$_baseUrl/version-group?limit=100000&offset=0'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load version groups');
    }
    final results = jsonDecode(response.body)['results'] as List;
    return [for (final r in results) idFromPokeApiUrl(r['url'] as String)];
  }
  // endregion

  // region Items
  @override
  Future<Item> getItem(int id) => _fetchCached(
        getCached: () => _localService.getItem(id),
        path: 'item/$id',
        fromJson: Item.fromJson,
        label: 'item $id',
        // Not saved here - the caller batches these saves together.
        save: null,
      );

  @override
  Future<ItemAttribute> getItemAttribute(int id) => _fetchCached(
        getCached: () => _localService.getItemAttribute(id),
        path: 'item-attribute/$id',
        fromJson: ItemAttribute.fromJson,
        label: 'item-attribute $id',
        save: _localService.saveItemAttribute,
      );

  @override
  Future<ItemCategory> getItemCategory(int id) => _fetchCached(
        getCached: () => _localService.getItemCategory(id),
        path: 'item-category/$id',
        fromJson: ItemCategory.fromJson,
        label: 'item-category $id',
        save: _localService.saveItemCategory,
      );

  @override
  Future<ItemFlingEffect> getItemFlingEffect(int id) => _fetchCached(
        getCached: () => _localService.getItemFlingEffect(id),
        path: 'item-fling-effect/$id',
        fromJson: ItemFlingEffect.fromJson,
        label: 'item-fling-effect $id',
        save: _localService.saveItemFlingEffect,
      );

  @override
  Future<ItemPocket> getItemPocket(int id) => _fetchCached(
        getCached: () => _localService.getItemPocket(id),
        path: 'item-pocket/$id',
        fromJson: ItemPocket.fromJson,
        label: 'item-pocket $id',
        save: _localService.saveItemPocket,
      );
  // endregion

  // region Locations
  @override
  Future<Location> getLocation(int id) => _fetchCached(
        getCached: () => _localService.getLocation(id),
        path: 'location/$id',
        fromJson: Location.fromJson,
        label: 'location $id',
        save: _localService.saveLocation,
      );

  @override
  Future<LocationArea> getLocationArea(int id) => _fetchCached(
        getCached: () => _localService.getLocationArea(id),
        path: 'location-area/$id',
        fromJson: LocationArea.fromJson,
        label: 'location-area $id',
        save: _localService.saveLocationArea,
      );

  @override
  Future<PalParkArea> getPalParkArea(int id) => _fetchCached(
        getCached: () => _localService.getPalParkArea(id),
        path: 'pal-park-area/$id',
        fromJson: PalParkArea.fromJson,
        label: 'pal-park-area $id',
        save: _localService.savePalParkArea,
      );

  @override
  Future<Region> getRegion(int id) => _fetchCached(
        getCached: () => _localService.getRegion(id),
        path: 'region/$id',
        fromJson: Region.fromJson,
        label: 'region $id',
        save: _localService.saveRegion,
      );
  // endregion

  // region Machines
  @override
  Future<Machine> getMachine(int id) => _fetchCached(
        getCached: () => _localService.getMachine(id),
        path: 'machine/$id',
        fromJson: Machine.fromJson,
        label: 'machine $id',
        save: _localService.saveMachine,
      );
  // endregion

  // region Moves
  @override
  Future<Move> getMove(int id, {bool priority = false}) => _fetchCached(
        getCached: () => _localService.getMove(id),
        path: 'move/$id',
        fromJson: Move.fromJson,
        label: 'move $id',
        // Not saved here - the caller batches these saves together.
        save: null,
        priority: priority,
      );

  @override
  Future<MoveAilment> getMoveAilment(int id) => _fetchCached(
        getCached: () => _localService.getMoveAilment(id),
        path: 'move-ailment/$id',
        fromJson: MoveAilment.fromJson,
        label: 'move-ailment $id',
        save: _localService.saveMoveAilment,
      );

  @override
  Future<MoveBattleStyle> getMoveBattleStyle(int id) => _fetchCached(
        getCached: () => _localService.getMoveBattleStyle(id),
        path: 'move-battle-style/$id',
        fromJson: MoveBattleStyle.fromJson,
        label: 'move-battle-style $id',
        save: _localService.saveMoveBattleStyle,
      );

  @override
  Future<MoveCategory> getMoveCategory(int id) => _fetchCached(
        getCached: () => _localService.getMoveCategory(id),
        path: 'move-category/$id',
        fromJson: MoveCategory.fromJson,
        label: 'move-category $id',
        save: _localService.saveMoveCategory,
      );

  @override
  Future<MoveDamageClass> getMoveDamageClass(int id) => _fetchCached(
        getCached: () => _localService.getMoveDamageClass(id),
        path: 'move-damage-class/$id',
        fromJson: MoveDamageClass.fromJson,
        label: 'move-damage-class $id',
        save: _localService.saveMoveDamageClass,
      );

  @override
  Future<MoveLearnMethod> getMoveLearnMethod(int id) => _fetchCached(
        getCached: () => _localService.getMoveLearnMethod(id),
        path: 'move-learn-method/$id',
        fromJson: MoveLearnMethod.fromJson,
        label: 'move-learn-method $id',
        save: _localService.saveMoveLearnMethod,
      );

  @override
  Future<MoveTarget> getMoveTarget(int id) => _fetchCached(
        getCached: () => _localService.getMoveTarget(id),
        path: 'move-target/$id',
        fromJson: MoveTarget.fromJson,
        label: 'move-target $id',
        save: _localService.saveMoveTarget,
      );
  // endregion

  // region Abilities
  @override
  Future<Ability> getAbility(int id) => _fetchCached(
        getCached: () => _localService.getAbility(id),
        path: 'ability/$id',
        fromJson: Ability.fromJson,
        label: 'ability $id',
        // Not saved here - the caller batches these saves together.
        save: null,
      );
  // endregion

  // region Characteristics
  @override
  Future<Characteristic> getCharacteristic(int id) => _fetchCached(
        getCached: () => _localService.getCharacteristic(id),
        path: 'characteristic/$id',
        fromJson: Characteristic.fromJson,
        label: 'characteristic $id',
        save: _localService.saveCharacteristic,
      );
  // endregion

  // region Egg Groups
  @override
  Future<EggGroup> getEggGroup(int id) => _fetchCached(
        getCached: () => _localService.getEggGroup(id),
        path: 'egg-group/$id',
        fromJson: EggGroup.fromJson,
        label: 'egg-group $id',
        save: _localService.saveEggGroup,
      );
  // endregion

  // region Genders
  @override
  Future<Gender> getGender(int id) => _fetchCached(
        getCached: () => _localService.getGender(id),
        path: 'gender/$id',
        fromJson: Gender.fromJson,
        label: 'gender $id',
        save: _localService.saveGender,
      );
  // endregion

  // region Growth Rates
  @override
  Future<GrowthRate> getGrowthRate(int id) => _fetchCached(
        getCached: () => _localService.getGrowthRate(id),
        path: 'growth-rate/$id',
        fromJson: GrowthRate.fromJson,
        label: 'growth-rate $id',
        save: _localService.saveGrowthRate,
      );
  // endregion

  // region Natures
  @override
  Future<Nature> getNature(int id) => _fetchCached(
        getCached: () => _localService.getNature(id),
        path: 'nature/$id',
        fromJson: Nature.fromJson,
        label: 'nature $id',
        save: _localService.saveNature,
      );
  // endregion

  // region Pokeathlon Stats
  @override
  Future<PokeathlonStat> getPokeathlonStat(int id) => _fetchCached(
        getCached: () => _localService.getPokeathlonStat(id),
        path: 'pokeathlon-stat/$id',
        fromJson: PokeathlonStat.fromJson,
        label: 'pokeathlon-stat $id',
        save: _localService.savePokeathlonStat,
      );
  // endregion

  // region Stats
  @override
  Future<Stat> getStat(int id) => _fetchCached(
        getCached: () => _localService.getStat(id),
        path: 'stat/$id',
        fromJson: Stat.fromJson,
        label: 'stat $id',
        save: _localService.saveStat,
      );
  // endregion

  // region Languages
  @override
  Future<Language> getLanguage(int id) => _fetchCached(
        getCached: () => _localService.getLanguage(id),
        path: 'language/$id',
        fromJson: Language.fromJson,
        label: 'language $id',
        save: _localService.saveLanguage,
      );

  @override
  Future<List<MoveUrl?>> getAllMoveUrls() async {
    if (kDebugMode) {
      print('Fetching all move urls from API');
    }
    List<MoveUrl?> allMoves = [];
    // get list of all chain urls
    final response =
        await _get(Uri.parse('$_baseUrl/move?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allMoves.add(MoveUrl.fromJson(r));
      }
    } else {
      throw Exception('Failed to load move urls');
    }
    return allMoves;
  }

  @override
  Future<List<NamedApiResource?>> getAllAbilityUrls() async {
    if (kDebugMode) {
      print('Fetching all ability urls from API');
    }
    List<NamedApiResource?> allAbilities = [];
    // get list of all chain urls
    final response =
        await _get(Uri.parse('$_baseUrl/ability?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allAbilities.add(NamedApiResource.fromJson(r));
      }
    } else {
      throw Exception('Failed to load ability urls');
    }
    return allAbilities;
  }

  @override
  Future<List<NamedApiResource?>> getAllItemUrls() async {
    if (kDebugMode) {
      print('Fetching all item urls from API');
    }
    List<NamedApiResource?> allItems = [];
    // get list of all chain urls
    final response =
        await _get(Uri.parse('$_baseUrl/item?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allItems.add(NamedApiResource.fromJson(r));
      }
    } else {
      throw Exception('Failed to load item urls');
    }
    return allItems;
  }
}
