import 'dart:convert';
import 'package:http/http.dart' as http;
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

class PokemonService {
  final String _baseUrl = 'https://pokeapi.co/api/v2';

  final LocalService _localService;

  PokemonService(this._localService);

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
    final response =
        await http.get(Uri.parse('$_baseUrl/pokemon?limit=100000&offset=0'));

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

  Future<PokemonDetails> getPokemonDetails(int id) async {
    if (kDebugMode) {
      print('Loading details for Pokemon $id from cache');
    }
    PokemonDetails? pokemonDetails = await _localService.getPokemonDetails(id);
    if (pokemonDetails == null) {
      if (kDebugMode) {
        print('Fetching details for Pokemon $id from API');
      }
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
      if (response.statusCode == 200) {
        final pokemonData = jsonDecode(response.body);
        pokemonDetails = PokemonDetails.fromJson(
            pokemonData); // Deserialize using PokemonDetails
        // don't do it here because we need to batch these saves
        // await _localService.savePokemonDetails(pokemonDetails);
      } else {
        throw Exception('Failed to load Pokemon details');
      }
    }
    return pokemonDetails;
  }

  Future<PokemonSpecies> getPokemonSpecies(int id, {force = false}) async {
    PokemonSpecies? pokemonSpecies;
    if (!force){
      pokemonSpecies = await _localService.getPokemonSpecies(id);
    }
    if (pokemonSpecies == null) {
      if (kDebugMode) {
        print('Fetching species for Pokemon $id from API');
      }
      final response =
          await http.get(Uri.parse('$_baseUrl/pokemon-species/$id'));
      if (response.statusCode == 200) {
        final speciesData = jsonDecode(response.body);
        pokemonSpecies = PokemonSpecies.fromJson(speciesData);
        // remove we need to save in batches need batch param
        // await _localService.savePokemonSpecies(pokemonSpecies);
      } else {
        throw Exception('Failed to load Pokemon species');
      }
    }
    return pokemonSpecies;
  }

  Future<EvolutionChain?> getEvolutionChain(int id, {bool? batch}) async {
    EvolutionChain? evolutionChain = await _localService.getEvolutionChain(id);
    if (evolutionChain == null) {
      if (kDebugMode) {
        print('Fetching evolution chain for chain $id from API');
      }
      final response =
          await http.get(Uri.parse('$_baseUrl/evolution-chain/$id'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        evolutionChain = EvolutionChain.fromJson(data);
        if(batch != null && batch) {
          await _localService.saveEvolutionChain(evolutionChain);
        }
      } else {
        throw Exception('Failed to load evolution chain');
      }
    }
    return evolutionChain;
  }

  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls() async {
    var evolutionChain = await _localService.getAllEvolutionChainUrls();
    List<EvolutionChainUrl?> allChains = [];
    if (evolutionChain.isEmpty || evolutionChain.length < 500) {
      if (kDebugMode) {
        print('Fetching all evolution chain urls from API');
      }
      // get list of all chain urls
      final response = await http
          .get(Uri.parse('$_baseUrl/evolution-chain?limit=100000&offset=0'));

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
  Future<Berry> getBerry(int id) async {
    // Implement local caching similar to getPokemonDetails
    Berry? berry = await _localService.getBerry(id);
    if (berry == null) {
      if (kDebugMode) {
        print('Fetching berry $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/berry/$id'));
      if (response.statusCode == 200) {
        berry = Berry.fromJson(jsonDecode(response.body));
        await _localService.saveBerry(berry);
      } else {
        throw Exception('Failed to load berry');
      }
    }
    return berry;
  }

  Future<BerryFlavor> getBerryFlavor(int id) async {
    BerryFlavor? berryFlavor = await _localService.getBerryFlavor(id);
    if (berryFlavor == null) {
      if (kDebugMode) {
        print('Fetching berry-flavor $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/berry-flavor/$id'));
      if (response.statusCode == 200) {
        berryFlavor = BerryFlavor.fromJson(jsonDecode(response.body));
        await _localService.saveBerryFlavor(berryFlavor);
      } else {
        throw Exception('Failed to load berry flavor');
      }
    }
    return berryFlavor;
  }
  // endregion

  // region Contests
  Future<ContestType> getContestType(int id) async {
    ContestType? contestType = await _localService.getContestType(id);
    if (contestType == null) {
      if (kDebugMode) {
        print('Fetching contest-type $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/contest-type/$id'));
      if (response.statusCode == 200) {
        contestType = ContestType.fromJson(jsonDecode(response.body));
        await _localService.saveContestType(contestType);
      } else {
        throw Exception('Failed to load contest type');
      }
    }
    return contestType;
  }
  // endregion

  // region Encounters
  Future<EncounterMethod> getEncounterMethod(int id) async {
    EncounterMethod? encounterMethod = await _localService.getEncounterMethod(id);
    if (encounterMethod == null) {
      if (kDebugMode) {
        print('Fetching encounter-method $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/encounter-method/$id'));
      if (response.statusCode == 200) {
        encounterMethod = EncounterMethod.fromJson(jsonDecode(response.body));
        await _localService.saveEncounterMethod(encounterMethod);
      } else {
        throw Exception('Failed to load encounter method');
      }
    }
    return encounterMethod;
  }

  Future<EncounterCondition> getEncounterCondition(int id) async {
    EncounterCondition? encounterCondition =
    await _localService.getEncounterCondition(id);
    if (encounterCondition == null) {
      if (kDebugMode) {
        print('Fetching encounter-condition $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/encounter-condition/$id'));
      if (response.statusCode == 200) {
        encounterCondition =
            EncounterCondition.fromJson(jsonDecode(response.body));
        await _localService.saveEncounterCondition(encounterCondition);
      } else {
        throw Exception('Failed to load encounter condition');
      }
    }
    return encounterCondition;
  }

  Future<EncounterConditionValue> getEncounterConditionValue(int id) async {
    EncounterConditionValue? encounterConditionValue =
    await _localService.getEncounterConditionValue(id);
    if (encounterConditionValue == null) {
      if (kDebugMode) {
        print('Fetching encounter-condition-value $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/encounter-condition-value/$id'));
      if (response.statusCode == 200) {
        encounterConditionValue =
            EncounterConditionValue.fromJson(jsonDecode(response.body));
        await _localService.saveEncounterConditionValue(encounterConditionValue);
      } else {
        throw Exception('Failed to load encounter condition value');
      }
    }
    return encounterConditionValue;
  }
  // endregion

  // region Evolution
  Future<EvolutionTrigger> getEvolutionTrigger(int id) async {
    EvolutionTrigger? evolutionTrigger =
    await _localService.getEvolutionTrigger(id);
    if (evolutionTrigger == null) {
      if (kDebugMode) {
        print('Fetching evolution-trigger $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/evolution-trigger/$id'));
      if (response.statusCode == 200) {
        evolutionTrigger = EvolutionTrigger.fromJson(jsonDecode(response.body));
        await _localService.saveEvolutionTrigger(evolutionTrigger);
      } else {
        throw Exception('Failed to load evolution trigger');
      }
    }
    return evolutionTrigger;
  }
  // endregion

  // region Games
  Future<Generation> getGeneration(int id) async {
    Generation? generation = await _localService.getGeneration(id);
    if (generation == null) {
      if (kDebugMode) {
        print('Fetching generation $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/generation/$id'));
      if (response.statusCode == 200) {
        generation = Generation.fromJson(jsonDecode(response.body));
        await _localService.saveGeneration(generation);
      } else {
        throw Exception('Failed to load generation');
      }
    }
    return generation;
  }

  Future<Pokedex> getPokedex(int id) async {
    Pokedex? pokedex = await _localService.getPokedex(id);
    if (pokedex == null) {
      if (kDebugMode) {
        print('Fetching pokedex $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/pokedex/$id'));
      if (response.statusCode == 200) {
        pokedex = Pokedex.fromJson(jsonDecode(response.body));
        await _localService.savePokedex(pokedex);
      } else {
        throw Exception('Failed to load pokedex');
      }
    }
    return pokedex;
  }

  Future<Version> getVersion(int id) async {
    Version? version = await _localService.getVersion(id);
    if (version == null) {
      if (kDebugMode) {
        print('Fetching version $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/version/$id'));
      if (response.statusCode == 200) {
        version = Version.fromJson(jsonDecode(response.body));
        await _localService.saveVersion(version);
      } else {
        throw Exception('Failed to load version');
      }
    }
    return version;
  }

  Future<VersionGroup> getVersionGroup(int id) async {
    VersionGroup? versionGroup = await _localService.getVersionGroup(id);
    if (versionGroup == null) {
      if (kDebugMode) {
        print('Fetching version-group $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/version-group/$id'));
      if (response.statusCode == 200) {
        versionGroup = VersionGroup.fromJson(jsonDecode(response.body));
        await _localService.saveVersionGroup(versionGroup);
      } else {
        throw Exception('Failed to load version group');
      }
    }
    return versionGroup;
  }
  // endregion

  // region Items
  Future<Item> getItem(int id) async {
    Item? item = await _localService.getItem(id);
    if (item == null) {
      if (kDebugMode) {
        print('Fetching item $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/item/$id'));
      if (response.statusCode == 200) {
        item = Item.fromJson(jsonDecode(response.body));
        // await _localService.saveItem(item);
      } else {
        throw Exception('Failed to load item');
      }
    }
    return item;
  }

  Future<ItemAttribute> getItemAttribute(int id) async {
    ItemAttribute? itemAttribute = await _localService.getItemAttribute(id);
    if (itemAttribute == null) {
      if (kDebugMode) {
        print('Fetching item-attribute $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/item-attribute/$id'));
      if (response.statusCode == 200) {
        itemAttribute = ItemAttribute.fromJson(jsonDecode(response.body));
        await _localService.saveItemAttribute(itemAttribute);
      } else {
        throw Exception('Failed to load item attribute');
      }
    }
    return itemAttribute;
  }

  Future<ItemCategory> getItemCategory(int id) async {
    ItemCategory? itemCategory = await _localService.getItemCategory(id);
    if (itemCategory == null) {
      if (kDebugMode) {
        print('Fetching item-category $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/item-category/$id'));
      if (response.statusCode == 200) {
        itemCategory = ItemCategory.fromJson(jsonDecode(response.body));
        await _localService.saveItemCategory(itemCategory);
      } else {
        throw Exception('Failed to load item category');
      }
    }
    return itemCategory;
  }

  Future<ItemFlingEffect> getItemFlingEffect(int id) async {
    ItemFlingEffect? itemFlingEffect =
    await _localService.getItemFlingEffect(id);
    if (itemFlingEffect == null) {
      if (kDebugMode) {
        print('Fetching item-fling-effect $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/item-fling-effect/$id'));
      if (response.statusCode == 200) {
        itemFlingEffect = ItemFlingEffect.fromJson(jsonDecode(response.body));
        await _localService.saveItemFlingEffect(itemFlingEffect);
      } else {
        throw Exception('Failed to load item fling effect');
      }
    }
    return itemFlingEffect;
  }

  Future<ItemPocket> getItemPocket(int id) async {
    ItemPocket? itemPocket = await _localService.getItemPocket(id);
    if (itemPocket == null) {
      if (kDebugMode) {
        print('Fetching item-pocket $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/item-pocket/$id'));
      if (response.statusCode == 200) {
        itemPocket = ItemPocket.fromJson(jsonDecode(response.body));
        await _localService.saveItemPocket(itemPocket);
      } else {
        throw Exception('Failed to load item pocket');
      }
    }
    return itemPocket;
  }
  // endregion

  // region Locations
  Future<Location> getLocation(int id) async {
    Location? location = await _localService.getLocation(id);
    if (location == null) {
      if (kDebugMode) {
        print('Fetching location $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/location/$id'));
      if (response.statusCode == 200) {
        location = Location.fromJson(jsonDecode(response.body));
        await _localService.saveLocation(location);
      } else {
        throw Exception('Failed to load location');
      }
    }
    return location;
  }

  Future<LocationArea> getLocationArea(int id) async {
    LocationArea? locationArea = await _localService.getLocationArea(id);
    if (locationArea == null) {
      if (kDebugMode) {
        print('Fetching location-area $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/location-area/$id'));
      if (response.statusCode == 200) {
        locationArea = LocationArea.fromJson(jsonDecode(response.body));
        await _localService.saveLocationArea(locationArea);
      } else {
        throw Exception('Failed to load location area');
      }
    }
    return locationArea;
  }

  Future<PalParkArea> getPalParkArea(int id) async {
    PalParkArea? palParkArea = await _localService.getPalParkArea(id);
    if (palParkArea == null) {
      if (kDebugMode) {
        print('Fetching pal-park-area $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/pal-park-area/$id'));
      if (response.statusCode == 200) {
        palParkArea = PalParkArea.fromJson(jsonDecode(response.body));
        await _localService.savePalParkArea(palParkArea);
      } else {
        throw Exception('Failed to load pal park area');
      }
    }
    return palParkArea;
  }

  Future<Region> getRegion(int id) async {
    Region? region = await _localService.getRegion(id);
    if (region == null) {
      if (kDebugMode) {
        print('Fetching region $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/region/$id'));
      if (response.statusCode == 200) {
        region = Region.fromJson(jsonDecode(response.body));
        await _localService.saveRegion(region);
      } else {
        throw Exception('Failed to load region');
      }
    }
    return region;
  }
  // endregion

  // region Machines
  Future<Machine> getMachine(int id) async {
    Machine? machine = await _localService.getMachine(id);
    if (machine == null) {
      if (kDebugMode) {
        print('Fetching machine $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/machine/$id'));
      if (response.statusCode == 200) {
        machine = Machine.fromJson(jsonDecode(response.body));
        await _localService.saveMachine(machine);
      } else {
        throw Exception('Failed to load machine');
      }
    }
    return machine;
  }
  // endregion

  // region Moves
  Future<Move> getMove(int id) async {
    Move? move = await _localService.getMove(id);
    if (move == null) {
      if (kDebugMode) {
        print('Fetching move $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/move/$id'));
      if (response.statusCode == 200) {
        move = Move.fromJson(jsonDecode(response.body));
        // await _localService.saveMove(move);
      } else {
        throw Exception('Failed to load move');
      }
    }
    return move;
  }

  Future<MoveAilment> getMoveAilment(int id) async {
    MoveAilment? moveAilment = await _localService.getMoveAilment(id);
    if (moveAilment == null) {
      if (kDebugMode) {
        print('Fetching move-ailment $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/move-ailment/$id'));
      if (response.statusCode == 200) {
        moveAilment = MoveAilment.fromJson(jsonDecode(response.body));
        await _localService.saveMoveAilment(moveAilment);
      } else {
        throw Exception('Failed to load move ailment');
      }
    }
    return moveAilment;
  }

  Future<MoveBattleStyle> getMoveBattleStyle(int id) async {
    MoveBattleStyle? moveBattleStyle =
    await _localService.getMoveBattleStyle(id);
    if (moveBattleStyle == null) {
      if (kDebugMode) {
        print('Fetching move-battle-style $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/move-battle-style/$id'));
      if (response.statusCode == 200) {
        moveBattleStyle = MoveBattleStyle.fromJson(jsonDecode(response.body));
        await _localService.saveMoveBattleStyle(moveBattleStyle);
      } else {
        throw Exception('Failed to load move battle style');
      }
    }
    return moveBattleStyle;
  }

  Future<MoveCategory> getMoveCategory(int id) async {
    MoveCategory? moveCategory = await _localService.getMoveCategory(id);
    if (moveCategory == null) {
      if (kDebugMode) {
        print('Fetching move-category $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/move-category/$id'));
      if (response.statusCode == 200) {
        moveCategory = MoveCategory.fromJson(jsonDecode(response.body));
        await _localService.saveMoveCategory(moveCategory);
      } else {
        throw Exception('Failed to load move category');
      }
    }
    return moveCategory;
  }

  Future<MoveDamageClass> getMoveDamageClass(int id) async {
    MoveDamageClass? moveDamageClass =
    await _localService.getMoveDamageClass(id);
    if (moveDamageClass == null) {
      if (kDebugMode) {
        print('Fetching move-damage-class $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/move-damage-class/$id'));
      if (response.statusCode == 200) {
        moveDamageClass = MoveDamageClass.fromJson(jsonDecode(response.body));
        await _localService.saveMoveDamageClass(moveDamageClass);
      } else {
        throw Exception('Failed to load move damage class');
      }
    }
    return moveDamageClass;
  }

  Future<MoveLearnMethod> getMoveLearnMethod(int id) async {
    MoveLearnMethod? moveLearnMethod =
    await _localService.getMoveLearnMethod(id);
    if (moveLearnMethod == null) {
      if (kDebugMode) {
        print('Fetching move-learn-method $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/move-learn-method/$id'));
      if (response.statusCode == 200) {
        moveLearnMethod = MoveLearnMethod.fromJson(jsonDecode(response.body));
        await _localService.saveMoveLearnMethod(moveLearnMethod);
      } else {
        throw Exception('Failed to load move learn method');
      }
    }
    return moveLearnMethod;
  }

  Future<MoveTarget> getMoveTarget(int id) async {
    MoveTarget? moveTarget = await _localService.getMoveTarget(id);
    if (moveTarget == null) {
      if (kDebugMode) {
        print('Fetching move-target $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/move-target/$id'));
      if (response.statusCode == 200) {
        moveTarget = MoveTarget.fromJson(jsonDecode(response.body));
        await _localService.saveMoveTarget(moveTarget);
      } else {
        throw Exception('Failed to load move target');
      }
    }
    return moveTarget;
  }
  // endregion

  // region Abilities
  Future<Ability> getAbility(int id) async {
    Ability? ability = await _localService.getAbility(id);
    if (ability == null) {
      if (kDebugMode) {
        print('Fetching ability $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/ability/$id'));
      if (response.statusCode == 200) {
        ability = Ability.fromJson(jsonDecode(response.body));
        // await _localService.saveAbility(ability);
      } else {
        throw Exception('Failed to load ability');
      }
    }
    return ability;
  }
  // endregion

  // region Characteristics
  Future<Characteristic> getCharacteristic(int id) async {
    Characteristic? characteristic = await _localService.getCharacteristic(id);
    if (characteristic == null) {
      if (kDebugMode) {
        print('Fetching characteristic $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/characteristic/$id'));
      if (response.statusCode == 200) {
        characteristic = Characteristic.fromJson(jsonDecode(response.body));
        await _localService.saveCharacteristic(characteristic);
      } else {
        throw Exception('Failed to load characteristic');
      }
    }
    return characteristic;
  }
  // endregion

  // region Egg Groups
  Future<EggGroup> getEggGroup(int id) async {
    EggGroup? eggGroup = await _localService.getEggGroup(id);
    if (eggGroup == null) {
      if (kDebugMode) {
        print('Fetching egg-group $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/egg-group/$id'));
      if (response.statusCode == 200) {
        eggGroup = EggGroup.fromJson(jsonDecode(response.body));
        await _localService.saveEggGroup(eggGroup);
      } else {
        throw Exception('Failed to load egg group');
      }
    }
    return eggGroup;
  }
  // endregion

  // region Genders
  Future<Gender> getGender(int id) async {
    Gender? gender = await _localService.getGender(id);
    if (gender == null) {
      if (kDebugMode) {
        print('Fetching gender $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/gender/$id'));
      if (response.statusCode == 200) {
        gender = Gender.fromJson(jsonDecode(response.body));
        await _localService.saveGender(gender);
      } else {
        throw Exception('Failed to load gender');
      }
    }
    return gender;
  }
  // endregion

  // region Growth Rates
  Future<GrowthRate> getGrowthRate(int id) async {
    GrowthRate? growthRate = await _localService.getGrowthRate(id);
    if (growthRate == null) {
      if (kDebugMode) {
        print('Fetching growth-rate $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/growth-rate/$id'));
      if (response.statusCode == 200) {
        growthRate = GrowthRate.fromJson(jsonDecode(response.body));
        await _localService.saveGrowthRate(growthRate);
      } else {
        throw Exception('Failed to load growth rate');
      }
    }
    return growthRate;
  }
  // endregion

  // region Natures
  Future<Nature> getNature(int id) async {
    Nature? nature = await _localService.getNature(id);
    if (nature == null) {
      if (kDebugMode) {
        print('Fetching nature $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/nature/$id'));
      if (response.statusCode == 200) {
        nature = Nature.fromJson(jsonDecode(response.body));
        await _localService.saveNature(nature);
      } else {
        throw Exception('Failed to load nature');
      }
    }
    return nature;
  }
  // endregion

  // region Pokeathlon Stats
  Future<PokeathlonStat> getPokeathlonStat(int id) async {
    PokeathlonStat? pokeathlonStat = await _localService.getPokeathlonStat(id);
    if (pokeathlonStat == null) {
      if (kDebugMode) {
        print('Fetching pokeathlon-stat $id from API');
      }
      final response =
      await http.get(Uri.parse('$_baseUrl/pokeathlon-stat/$id'));
      if (response.statusCode == 200) {
        pokeathlonStat = PokeathlonStat.fromJson(jsonDecode(response.body));
        await _localService.savePokeathlonStat(pokeathlonStat);
      } else {
        throw Exception('Failed to load pokeathlon stat');
      }
    }
    return pokeathlonStat;
  }
  // endregion

  // region Stats
  Future<Stat> getStat(int id) async {
    Stat? stat = await _localService.getStat(id);
    if (stat == null) {
      if (kDebugMode) {
        print('Fetching stat $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/stat/$id'));
      if (response.statusCode == 200) {
        stat = Stat.fromJson(jsonDecode(response.body));
        await _localService.saveStat(stat);
      } else {
        throw Exception('Failed to load stat');
      }
    }
    return stat;
  }
  // endregion

  // region Types
  // endregion

  // region Languages
  Future<Language> getLanguage(int id) async {
    Language? language = await _localService.getLanguage(id);
    if (language == null) {
      if (kDebugMode) {
        print('Fetching language $id from API');
      }
      final response = await http.get(Uri.parse('$_baseUrl/language/$id'));
      if (response.statusCode == 200) {
        language = Language.fromJson(jsonDecode(response.body));
        await _localService.saveLanguage(language);
      } else {
        throw Exception('Failed to load language');
      }
    }
    return language;
  }


  Future<List<MoveUrl?>> getAllMoveUrls() async {
    if (kDebugMode) {
      print('Fetching all move urls from API');
    }
    List<MoveUrl?> allMoves = [];
    // get list of all chain urls
    final response = await http
        .get(Uri.parse('$_baseUrl/move?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allMoves.add(MoveUrl.fromJson(r));
      }
    } else {
      throw Exception('Failed to load move urls');
    }
    return allMoves;
  }

  Future<List<NamedApiResource?>> getAllAbilityUrls() async {
    if (kDebugMode) {
      print('Fetching all ability urls from API');
    }
    List<NamedApiResource?> allAbilities = [];
    // get list of all chain urls
    final response = await http
        .get(Uri.parse('$_baseUrl/ability?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allAbilities.add(NamedApiResource.fromJson(r));
      }
    } else {
      throw Exception('Failed to load ability urls');
    }
    return allAbilities;
  }


  Future<List<NamedApiResource?>> getAllItemUrls() async {
    if (kDebugMode) {
      print('Fetching all item urls from API');
    }
    List<NamedApiResource?> allItems = [];
    // get list of all chain urls
    final response = await http
        .get(Uri.parse('$_baseUrl/item?limit=100000&offset=0'));

    if (response.statusCode == 200) {
      for (var r in jsonDecode(response.body)['results']) {
        allItems.add(NamedApiResource.fromJson(r));
      }
    } else {
      throw Exception('Failed to load item urls');
    }
    return allItems;
  }
// endregion
}
