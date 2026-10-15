import 'dart:async';
import 'package:isar_community/isar.dart';
import 'package:pokedex_app/models/pokeapi/abilities.dart';
import 'package:pokedex_app/models/pokeapi/berries.dart';
import 'package:pokedex_app/models/pokeapi/characteristics.dart';
import 'package:pokedex_app/models/pokeapi/contests.dart';
import 'package:pokedex_app/models/pokeapi/egg_groups.dart';
import 'package:pokedex_app/models/pokeapi/encounters.dart';
import 'package:pokedex_app/models/pokeapi/evolution.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/games.dart';
import 'package:pokedex_app/models/pokeapi/genders.dart';
import 'package:pokedex_app/models/pokeapi/growth_rates.dart';
import 'package:pokedex_app/models/pokeapi/items.dart';
import 'package:pokedex_app/models/pokeapi/locations.dart';
import 'package:pokedex_app/models/pokeapi/machines.dart';
import 'package:pokedex_app/models/pokeapi/moves.dart';
import 'package:pokedex_app/models/pokeapi/natures.dart';
import 'package:pokedex_app/models/pokeapi/pokeathlonstat.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
import 'package:pokedex_app/models/pokeapi/stat.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/models/binder_card_selection.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/models/user_data.dart';
import 'profile_migration.dart';
import '../../models/pokeapi/pokemon_details.dart';
import 'local_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class IsarService implements LocalService {
  late Isar _isar;
  Future<void> Function()? _onLegacyCaughtData;

  IsarService._(); // Private constructor

  /// [onLegacyCaughtData] runs when the database still holds pre-profile
  /// caught Pokemon, before the migration clears them. Use it to mark a
  /// one-time notice: if the app dies after the migration, the notice must
  /// still be there on the next launch.
  static Future<IsarService> create({
    Future<void> Function()? onLegacyCaughtData,
  }) async {
    final service = IsarService._();
    service._onLegacyCaughtData = onLegacyCaughtData;
    await service.init();
    return service;
  }

  @override
  Future<void> init() async {
    if (kDebugMode) {
      print('Initializing IsarService');
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        PokemonSchema,
        PokemonSpeciesSchema,
        PokemonDetailsSchema,
        EvolutionChainSchema,
        EvolutionChainUrlSchema,
        UserDataSchema,
        ProfileSchema,
        CaughtPokemonSchema,
        BerrySchema,
        BerryFlavorSchema,
        ContestTypeSchema,
        EncounterMethodSchema,
        EncounterConditionSchema,
        EncounterConditionValueSchema,
        EvolutionTriggerSchema,
        GenerationSchema,
        PokedexSchema,
        VersionSchema,
        VersionGroupSchema,
        ItemSchema,
        ItemAttributeSchema,
        ItemCategorySchema,
        ItemFlingEffectSchema,
        ItemPocketSchema,
        LocationSchema,
        LocationAreaSchema,
        PalParkAreaSchema,
        RegionSchema,
        MachineSchema,
        MoveSchema,
        MoveAilmentSchema,
        MoveBattleStyleSchema,
        MoveCategorySchema,
        MoveDamageClassSchema,
        MoveLearnMethodSchema,
        MoveTargetSchema,
        AbilitySchema,
        CharacteristicSchema,
        EggGroupSchema,
        GenderSchema,
        GrowthRateSchema,
        NatureSchema,
        PokeathlonStatSchema,
        StatSchema,
        LanguageSchema,
        CaughtTcgCardSchema,
        TcgCardSchema,
        BinderCardSelectionSchema,
      ],
      directory: dir.path,
    );
    if (_onLegacyCaughtData != null && await _isar.userDatas.count() > 0) {
      await _onLegacyCaughtData!();
    }
    await migrateCaughtDataToProfiles(_isar);
  }

  // Helper function to execute Isar transactions
  Future<T> _isarTransaction<T>(Future<T> Function(Isar isar) action) async {
    if (kDebugMode) {
      print('Starting Isar transaction');
    }
    final result = await action(_isar);
    return result;
  }

  // ... existing methods ...

  // region Berries
  @override
  Future<Berry?> getBerry(int id) async {
    return await _isarTransaction<Berry?>((isar) async {
      if (kDebugMode) {
        print('Fetching Berry $id from Isar');
      }
      return await isar.berrys.get(id);
    });
  }

  @override
  Future<void> saveBerry(Berry berry) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Berry ${berry.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.berrys.put(berry);
      });
    });
  }

  @override
  Future<BerryFlavor?> getBerryFlavor(int id) async {
    return await _isarTransaction<BerryFlavor?>((isar) async {
      if (kDebugMode) {
        print('Fetching BerryFlavor $id from Isar');
      }
      return await isar.berryFlavors.get(id);
    });
  }

  @override
  Future<void> saveBerryFlavor(BerryFlavor berryFlavor) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving BerryFlavor ${berryFlavor.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.berryFlavors.put(berryFlavor);
      });
    });
  }
  //endregion

  // region Contests
  @override
  Future<ContestType?> getContestType(int id) async {
    return await _isarTransaction<ContestType?>((isar) async {
      if (kDebugMode) {
        print('Fetching ContestType $id from Isar');
      }
      return await isar.contestTypes.get(id);
    });
  }

  @override
  Future<void> saveContestType(ContestType contestType) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving ContestType ${contestType.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.contestTypes.put(contestType);
      });
    });
  }
  //endregion

  // region Encounters
  @override
  Future<EncounterMethod?> getEncounterMethod(int id) async {
    return await _isarTransaction<EncounterMethod?>((isar) async {
      if (kDebugMode) {
        print('Fetching EncounterMethod $id from Isar');
      }
      return await isar.encounterMethods.get(id);
    });
  }

  @override
  Future<void> saveEncounterMethod(EncounterMethod encounterMethod) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving EncounterMethod ${encounterMethod.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.encounterMethods.put(encounterMethod);
      });
    });
  }

  @override
  Future<EncounterCondition?> getEncounterCondition(int id) async {
    return await _isarTransaction<EncounterCondition?>((isar) async {
      if (kDebugMode) {
        print('Fetching EncounterCondition $id from Isar');
      }
      return await isar.encounterConditions.get(id);
    });
  }

  @override
  Future<void> saveEncounterCondition(
      EncounterCondition encounterCondition) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving EncounterCondition ${encounterCondition.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.encounterConditions.put(encounterCondition);
      });
    });
  }

  @override
  Future<EncounterConditionValue?> getEncounterConditionValue(int id) async {
    return await _isarTransaction<EncounterConditionValue?>((isar) async {
      if (kDebugMode) {
        print('Fetching EncounterConditionValue $id from Isar');
      }
      return await isar.encounterConditionValues.get(id);
    });
  }

  @override
  Future<void> saveEncounterConditionValue(
      EncounterConditionValue encounterConditionValue) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print(
            'Saving EncounterConditionValue ${encounterConditionValue.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.encounterConditionValues.put(encounterConditionValue);
      });
    });
  }
  //endregion

  // region Evolution
  @override
  Future<EvolutionTrigger?> getEvolutionTrigger(int id) async {
    return await _isarTransaction<EvolutionTrigger?>((isar) async {
      if (kDebugMode) {
        print('Fetching EvolutionTrigger $id from Isar');
      }
      return await isar.evolutionTriggers.get(id);
    });
  }

  @override
  Future<void> saveEvolutionTrigger(EvolutionTrigger evolutionTrigger) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving EvolutionTrigger ${evolutionTrigger.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.evolutionTriggers.put(evolutionTrigger);
      });
    });
  }
  //endregion

  // region Games
  @override
  Future<Generation?> getGeneration(int id) async {
    return await _isarTransaction<Generation?>((isar) async {
      if (kDebugMode) {
        print('Fetching Generation $id from Isar');
      }
      return await isar.generations.get(id);
    });
  }

  @override
  Future<void> saveGeneration(Generation generation) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Generation ${generation.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.generations.put(generation);
      });
    });
  }

  @override
  Future<Pokedex?> getPokedex(int id) async {
    return await _isarTransaction<Pokedex?>((isar) async {
      if (kDebugMode) {
        print('Fetching Pokedex $id from Isar');
      }
      return await isar.pokedexs.get(id);
    });
  }

  @override
  Future<void> savePokedex(Pokedex pokedex) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Pokedex ${pokedex.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.pokedexs.put(pokedex);
      });
    });
  }

  @override
  Future<Version?> getVersion(int id) async {
    return await _isarTransaction<Version?>((isar) async {
      if (kDebugMode) {
        print('Fetching Version $id from Isar');
      }
      return await isar.versions.get(id);
    });
  }

  @override
  Future<void> saveVersion(Version version) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Version ${version.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.versions.put(version);
      });
    });
  }

  @override
  Future<VersionGroup?> getVersionGroup(int id) async {
    return await _isarTransaction<VersionGroup?>((isar) async {
      if (kDebugMode) {
        print('Fetching VersionGroup $id from Isar');
      }
      return await isar.versionGroups.get(id);
    });
  }

  @override
  Future<void> saveVersionGroup(VersionGroup versionGroup) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving VersionGroup ${versionGroup.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.versionGroups.put(versionGroup);
      });
    });
  }
  //endregion

  // region Items
  @override
  Future<Item?> getItem(int id) async {
    return await _isarTransaction<Item?>((isar) async {
      if (kDebugMode) {
        print('Fetching Item $id from Isar');
      }
      return await isar.items.get(id);
    });
  }

  @override
  Future<void> saveItem(Item item) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Item ${item.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.items.put(item);
      });
    });
  }

  @override
  Future<ItemAttribute?> getItemAttribute(int id) async {
    return await _isarTransaction<ItemAttribute?>((isar) async {
      if (kDebugMode) {
        print('Fetching ItemAttribute $id from Isar');
      }
      return await isar.itemAttributes.get(id);
    });
  }

  @override
  Future<void> saveItemAttribute(ItemAttribute itemAttribute) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving ItemAttribute ${itemAttribute.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.itemAttributes.put(itemAttribute);
      });
    });
  }

  @override
  Future<ItemCategory?> getItemCategory(int id) async {
    return await _isarTransaction<ItemCategory?>((isar) async {
      if (kDebugMode) {
        print('Fetching ItemCategory $id from Isar');
      }
      return await isar.itemCategorys.get(id);
    });
  }

  @override
  Future<void> saveItemCategory(ItemCategory itemCategory) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving ItemCategory ${itemCategory.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.itemCategorys.put(itemCategory);
      });
    });
  }

  @override
  Future<ItemFlingEffect?> getItemFlingEffect(int id) async {
    return await _isarTransaction<ItemFlingEffect?>((isar) async {
      if (kDebugMode) {
        print('Fetching ItemFlingEffect $id from Isar');
      }
      return await isar.itemFlingEffects.get(id);
    });
  }

  @override
  Future<void> saveItemFlingEffect(ItemFlingEffect itemFlingEffect) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving ItemFlingEffect ${itemFlingEffect.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.itemFlingEffects.put(itemFlingEffect);
      });
    });
  }

  @override
  Future<ItemPocket?> getItemPocket(int id) async {
    return await _isarTransaction<ItemPocket?>((isar) async {
      if (kDebugMode) {
        print('Fetching ItemPocket $id from Isar');
      }
      return await isar.itemPockets.get(id);
    });
  }

  @override
  Future<void> saveItemPocket(ItemPocket itemPocket) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving ItemPocket ${itemPocket.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.itemPockets.put(itemPocket);
      });
    });
  }
  //endregion

  // region Locations
  @override
  Future<Location?> getLocation(int id) async {
    return await _isarTransaction<Location?>((isar) async {
      if (kDebugMode) {
        print('Fetching Location $id from Isar');
      }
      return await isar.locations.get(id);
    });
  }

  @override
  Future<void> saveLocation(Location location) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Location ${location.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.locations.put(location);
      });
    });
  }

  @override
  Future<LocationArea?> getLocationArea(int id) async {
    return await _isarTransaction<LocationArea?>((isar) async {
      if (kDebugMode) {
        print('Fetching LocationArea $id from Isar');
      }
      return await isar.locationAreas.get(id);
    });
  }

  @override
  Future<void> saveLocationArea(LocationArea locationArea) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving LocationArea ${locationArea.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.locationAreas.put(locationArea);
      });
    });
  }

  @override
  Future<PalParkArea?> getPalParkArea(int id) async {
    return await _isarTransaction<PalParkArea?>((isar) async {
      if (kDebugMode) {
        print('Fetching PalParkArea $id from Isar');
      }
      return await isar.palParkAreas.get(id);
    });
  }

  @override
  Future<void> savePalParkArea(PalParkArea palParkArea) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving PalParkArea ${palParkArea.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.palParkAreas.put(palParkArea);
      });
    });
  }

  @override
  Future<Region?> getRegion(int id) async {
    return await _isarTransaction<Region?>((isar) async {
      if (kDebugMode) {
        print('Fetching Region $id from Isar');
      }
      return await isar.regions.get(id);
    });
  }

  @override
  Future<void> saveRegion(Region region) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Region ${region.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.regions.put(region);
      });
    });
  }
  //endregion

  // region Machines
  @override
  Future<Machine?> getMachine(int id) async {
    return await _isarTransaction<Machine?>((isar) async {
      if (kDebugMode) {
        print('Fetching Machine $id from Isar');
      }
      return await isar.machines.get(id);
    });
  }

  @override
  Future<void> saveMachine(Machine machine) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Machine ${machine.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.machines.put(machine);
      });
    });
  }
  //endregion

  // region Moves
  @override
  Future<Move?> getMove(int id) async {
    return await _isarTransaction<Move?>((isar) async {
      if (kDebugMode) {
        print('Fetching Move $id from Isar');
      }
      return await isar.moves.get(id);
    });
  }

  @override
  Future<void> saveMove(Move move) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Move ${move.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moves.put(move);
      });
    });
  }

  @override
  Future<MoveAilment?> getMoveAilment(int id) async {
    return await _isarTransaction<MoveAilment?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveAilment $id from Isar');
      }
      return await isar.moveAilments.get(id);
    });
  }

  @override
  Future<void> saveMoveAilment(MoveAilment moveAilment) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveAilment ${moveAilment.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveAilments.put(moveAilment);
      });
    });
  }

  @override
  Future<MoveBattleStyle?> getMoveBattleStyle(int id) async {
    return await _isarTransaction<MoveBattleStyle?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveBattleStyle $id from Isar');
      }
      return await isar.moveBattleStyles.get(id);
    });
  }

  @override
  Future<void> saveMoveBattleStyle(MoveBattleStyle moveBattleStyle) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveBattleStyle ${moveBattleStyle.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveBattleStyles.put(moveBattleStyle);
      });
    });
  }

  @override
  Future<MoveCategory?> getMoveCategory(int id) async {
    return await _isarTransaction<MoveCategory?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveCategory $id from Isar');
      }
      return await isar.moveCategorys.get(id);
    });
  }

  @override
  Future<void> saveMoveCategory(MoveCategory moveCategory) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveCategory ${moveCategory.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveCategorys.put(moveCategory);
      });
    });
  }

  @override
  Future<MoveDamageClass?> getMoveDamageClass(int id) async {
    return await _isarTransaction<MoveDamageClass?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveDamageClass $id from Isar');
      }
      return await isar.moveDamageClass.get(id);
    });
  }

  @override
  Future<void> saveMoveDamageClass(MoveDamageClass moveDamageClass) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveDamageClass ${moveDamageClass.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveDamageClass.put(moveDamageClass);
      });
    });
  }

  @override
  Future<MoveLearnMethod?> getMoveLearnMethod(int id) async {
    return await _isarTransaction<MoveLearnMethod?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveLearnMethod $id from Isar');
      }
      return await isar.moveLearnMethods.get(id);
    });
  }

  @override
  Future<void> saveMoveLearnMethod(MoveLearnMethod moveLearnMethod) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveLearnMethod ${moveLearnMethod.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveLearnMethods.put(moveLearnMethod);
      });
    });
  }

  @override
  Future<MoveTarget?> getMoveTarget(int id) async {
    return await _isarTransaction<MoveTarget?>((isar) async {
      if (kDebugMode) {
        print('Fetching MoveTarget $id from Isar');
      }
      return await isar.moveTargets.get(id);
    });
  }

  @override
  Future<void> saveMoveTarget(MoveTarget moveTarget) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving MoveTarget ${moveTarget.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.moveTargets.put(moveTarget);
      });
    });
  }
  //endregion

  // region Abilities
  @override
  Future<Ability?> getAbility(int id) async {
    return await _isarTransaction<Ability?>((isar) async {
      if (kDebugMode) {
        print('Fetching Ability $id from Isar');
      }
      return await isar.abilitys.get(id);
    });
  }

  @override
  Future<void> saveAbility(Ability ability) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Ability ${ability.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.abilitys.put(ability);
      });
    });
  }
  //endregion

  // region Characteristics
  @override
  Future<Characteristic?> getCharacteristic(int id) async {
    return await _isarTransaction<Characteristic?>((isar) async {
      if (kDebugMode) {
        print('Fetching Characteristic $id from Isar');
      }
      return await isar.characteristics.get(id);
    });
  }

  @override
  Future<void> saveCharacteristic(Characteristic characteristic) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Characteristic ${characteristic.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.characteristics.put(characteristic);
      });
    });
  }
  //endregion

  // region Egg Groups
  @override
  Future<EggGroup?> getEggGroup(int id) async {
    return await _isarTransaction<EggGroup?>((isar) async {
      if (kDebugMode) {
        print('Fetching EggGroup $id from Isar');
      }
      return await isar.eggGroups.get(id);
    });
  }

  @override
  Future<void> saveEggGroup(EggGroup eggGroup) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving EggGroup ${eggGroup.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.eggGroups.put(eggGroup);
      });
    });
  }
  //endregion

  // region Genders
  @override
  Future<Gender?> getGender(int id) async {
    return await _isarTransaction<Gender?>((isar) async {
      if (kDebugMode) {
        print('Fetching Gender $id from Isar');
      }
      return await isar.genders.get(id);
    });
  }

  @override
  Future<void> saveGender(Gender gender) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Gender ${gender.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.genders.put(gender);
      });
    });
  }
  //endregion

  // region Growth Rates
  @override
  Future<GrowthRate?> getGrowthRate(int id) async {
    return await _isarTransaction<GrowthRate?>((isar) async {
      if (kDebugMode) {
        print('Fetching GrowthRate $id from Isar');
      }
      return await isar.growthRates.get(id);
    });
  }

  @override
  Future<void> saveGrowthRate(GrowthRate growthRate) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving GrowthRate ${growthRate.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.growthRates.put(growthRate);
      });
    });
  }
  //endregion

  // region Natures
  @override
  Future<Nature?> getNature(int id) async {
    return await _isarTransaction<Nature?>((isar) async {
      if (kDebugMode) {
        print('Fetching Nature $id from Isar');
      }
      return await isar.natures.get(id);
    });
  }

  @override
  Future<void> saveNature(Nature nature) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Nature ${nature.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.natures.put(nature);
      });
    });
  }
  //endregion

  // region Pokeathlon Stats
  @override
  Future<PokeathlonStat?> getPokeathlonStat(int id) async {
    return await _isarTransaction<PokeathlonStat?>((isar) async {
      if (kDebugMode) {
        print('Fetching PokeathlonStat $id from Isar');
      }
      return await isar.pokeathlonStats.get(id);
    });
  }

  @override
  Future<void> savePokeathlonStat(PokeathlonStat pokeathlonStat) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving PokeathlonStat ${pokeathlonStat.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.pokeathlonStats.put(pokeathlonStat);
      });
    });
  }
  //endregion

  // region Stats
  @override
  Future<Stat?> getStat(int id) async {
    return await _isarTransaction<Stat?>((isar) async {
      if (kDebugMode) {
        print('Fetching Stat $id from Isar');
      }
      return await isar.stats.get(id);
    });
  }

  @override
  Future<void> saveStat(Stat stat) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Stat ${stat.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.stats.put(stat);
      });
    });
  }
  //endregion

  // region Types
  //endregion

  // region Languages
  @override
  Future<Language?> getLanguage(int id) async {
    return await _isarTransaction<Language?>((isar) async {
      if (kDebugMode) {
        print('Fetching Language $id from Isar');
      }
      return await isar.languages.get(id);
    });
  }

  @override
  Future<void> saveLanguage(Language language) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Language ${language.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.languages.put(language);
      });
    });
  }
  //endregion

  @override
  Future<List<Pokemon>> getPokemonList() async {
    return await _isarTransaction<List<Pokemon>>((isar) async {
      if (kDebugMode) {
        print('Fetching Pokemon list from Isar');
      }
      return await isar.pokemons.where().findAll();
    });
  }

  @override
  Future<PokemonDetails?> getPokemonDetails(int id) async {
    return await _isarTransaction<PokemonDetails?>((isar) async {
      if (kDebugMode) {
        print('Fetching details for Pokemon $id from Isar');
      }
      return await isar.pokemonDetails.filter().idEqualTo(id).findFirst();
    });
  }

  @override
  Future<void> savePokemonList(List<Pokemon> pokemonList) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving Pokemon list to Isar');
      }
      await isar.writeTxn(() async {
        await isar.pokemons.putAll(pokemonList);
      });
    });
  }

  @override
  Future<void> savePokemonDetails(PokemonDetails pokemondetails) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving details for Pokemon ${pokemondetails.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.pokemonDetails.put(pokemondetails);
      });
    });
  }

  @override
  Future<EvolutionChain?> getEvolutionChain(int id) async {
    return await _isarTransaction<EvolutionChain?>((isar) async {
      if (kDebugMode) {
        print('Fetching EvolutionChain data from Isar for pokemon $id');
      }
      return await isar.evolutionChains.filter().idEqualTo(id).findFirst();
    });
  }

  @override
  Future<void> saveEvolutionChain(EvolutionChain evolutionChain) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving evolutionChain for Pokemon ${evolutionChain.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.evolutionChains.put(evolutionChain);
      });
    });
  }

  // region Profiles
  @override
  Future<List<Profile>> getAllProfiles() async {
    return await _isarTransaction<List<Profile>>((isar) async {
      return await isar.profiles.where(sort: Sort.asc).findAll();
    });
  }

  @override
  Future<int> saveProfile(Profile profile) async {
    return await _isarTransaction<int>((isar) async {
      return await isar.writeTxn(() => isar.profiles.put(profile));
    });
  }

  @override
  Future<void> resetCaughtDataForProfile(int profileId) async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.caughtPokemons
            .filter()
            .profileIdEqualTo(profileId)
            .deleteAll();
        await isar.caughtTcgCards
            .filter()
            .profileIdEqualTo(profileId)
            .deleteAll();
      });
    });
  }
  //endregion

  // region Caught Pokemon
  @override
  Future<List<CaughtPokemon>> getCaughtPokemonForProfile(int profileId) async {
    return await _isarTransaction<List<CaughtPokemon>>((isar) async {
      return await isar.caughtPokemons
          .filter()
          .profileIdEqualTo(profileId)
          .findAll();
    });
  }

  @override
  Future<void> saveAllCaughtPokemon(List<CaughtPokemon> caughtPokemon) async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.caughtPokemons.putAll(caughtPokemon);
      });
    });
  }
  //endregion

  @override
  Future<void> saveAllPokemonSpecies(
      List<PokemonSpecies?> allPokemonSpecies) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all pokemon species to Isar');
      }
      final nonNullallPokemonSpecioes =
          allPokemonSpecies.whereType<PokemonSpecies>().toList();
      await isar.writeTxn(() async {
        await isar.pokemonSpecies.putAll(nonNullallPokemonSpecioes);
      });
    });
  }

  @override
  Future<void> saveAllPokemonDetails(
      List<PokemonDetails?> allPokemonDetails) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all pokemon details to Isar');
      }
      final nonNullallPokemonDetails =
          allPokemonDetails.whereType<PokemonDetails>().toList();
      await isar.writeTxn(() async {
        await isar.pokemonDetails.putAll(nonNullallPokemonDetails);
      });
    });
  }

  @override
  Future<PokemonSpecies?> getPokemonSpecies(int id) async {
    return await _isarTransaction<PokemonSpecies?>((isar) async {
      if (kDebugMode) {
        print('Fetching species for Pokemon $id from Isar');
      }
      return await isar.pokemonSpecies.filter().idEqualTo(id).findFirst();
    });
  }

  @override
  Future<void> savePokemonSpecies(PokemonSpecies pokemonSpecies) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving species for Pokemon ${pokemonSpecies.id} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.pokemonSpecies.put(pokemonSpecies);
      });
    });
  }

  @override
  Future<List<EvolutionChainUrl?>> getAllEvolutionChainUrls() async {
    return await _isarTransaction<List<EvolutionChainUrl?>>((isar) async {
      if (kDebugMode) {
        print('Getting all evolution chain urls from Isar');
      }
      return await isar.evolutionChainUrls.where().findAll();
    });
  }

  @override
  Future<List<EvolutionChain?>> getAllEvolutionChains() async {
    return await _isarTransaction<List<EvolutionChain?>>((isar) async {
      if (kDebugMode) {
        print('Getting all evolution chains from Isar');
      }
      return await isar.evolutionChains.where().findAll();
    });
  }

  @override
  Future<List<Move?>> getAllMoves() async {
    return await _isarTransaction<List<Move?>>((isar) async {
      if (kDebugMode) {
        print('Getting all evolution chains from Isar');
      }
      return await isar.moves.where().findAll();
    });
  }

  @override
  Future<List<PokemonDetails?>> getAllPokemonDetails() async {
    return await _isarTransaction<List<PokemonDetails?>>((isar) async {
      if (kDebugMode) {
        print('Getting all pokemon details from Isar');
      }
      return await isar.pokemonDetails.where().findAll();
    });
  }

  @override
  Future<List<PokemonSpecies?>> getAllPokemonSpecies() async {
    return await _isarTransaction<List<PokemonSpecies?>>((isar) async {
      if (kDebugMode) {
        print('Getting all pokemon details from Isar');
      }
      return await isar.pokemonSpecies.where().findAll();
    });
  }

  @override
  Future<void> saveAllEvolutionChains(
      List<EvolutionChain?> evolutionChains) async {
    return await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all evolution chains to Isar');
      }
      final nonNullEvolutionChains =
          evolutionChains.whereType<EvolutionChain>().toList();

      await isar.writeTxn(() async {
        await isar.evolutionChains.putAll(nonNullEvolutionChains);
      });
    });
  }

  @override
  Future<void> saveAllMoves(List<Move?> moves) async {
    return await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all evolution chains to Isar');
      }
      final nonNullEvolutionChains = moves.whereType<Move>().toList();

      await isar.writeTxn(() async {
        await isar.moves.putAll(nonNullEvolutionChains);
      });
    });
  }

  @override
  Future<List<Ability?>> getAllAbilities() async {
    return await _isarTransaction<List<Ability?>>((isar) async {
      if (kDebugMode) {
        print('Getting all abilities from Isar');
      }
      return await isar.abilitys.where().findAll();
    });
  }

  @override
  Future<void> saveAllAbilities(List<Ability?> abilities) async {
    return await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all abilities to Isar');
      }
      final nonNullEvolutionChains = abilities.whereType<Ability>().toList();

      await isar.writeTxn(() async {
        await isar.abilitys.putAll(nonNullEvolutionChains);
      });
    });
  }

  @override
  Future<List<Item?>> getAllItems() async {
    return await _isarTransaction<List<Item?>>((isar) async {
      if (kDebugMode) {
        print('Getting all items from Isar');
      }
      return await isar.items.where().findAll();
    });
  }

  @override
  Future<void> saveAllItems(List<Item?> items) async {
    return await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving all items to Isar');
      }
      final nonNullItems = items.whereType<Item>().toList();

      await isar.writeTxn(() async {
        await isar.items.putAll(nonNullItems);
      });
    });
  }

  // region TCG Cards
  @override
  Future<CaughtTcgCard?> getCaughtTcgCard(int profileId, String cardId) async {
    return await _isarTransaction<CaughtTcgCard?>((isar) async {
      if (kDebugMode) {
        print(
            'Fetching CaughtTcgCard $cardId for profile $profileId from Isar');
      }
      return await isar.caughtTcgCards
          .filter()
          .profileIdEqualTo(profileId)
          .cardIdEqualTo(cardId)
          .findFirst();
    });
  }

  @override
  Future<void> saveCaughtTcgCard(CaughtTcgCard caughtTcgCard) async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Saving CaughtTcgCard ${caughtTcgCard.cardId} to Isar');
      }
      await isar.writeTxn(() async {
        await isar.caughtTcgCards.put(caughtTcgCard);
      });
    });
  }

  @override
  Future<void> saveAllCaughtTcgCards(List<CaughtTcgCard> caughtTcgCards) async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.caughtTcgCards.putAll(caughtTcgCards);
      });
    });
  }

  @override
  Future<List<CaughtTcgCard>> getCaughtTcgCardsForProfile(int profileId) async {
    return await _isarTransaction<List<CaughtTcgCard>>((isar) async {
      return await isar.caughtTcgCards
          .filter()
          .profileIdEqualTo(profileId)
          .findAll();
    });
  }
  //endregion

  // region TCG Card cache
  @override
  Future<void> saveAllTcgCards(List<TcgCard> cards) async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.tcgCards.putAll(cards);
      });
    });
  }

  @override
  Future<List<TcgCard>> getCachedTcgCardsByIds(List<String> ids) async {
    return await _isarTransaction<List<TcgCard>>((isar) async {
      if (ids.isEmpty) return [];
      return await isar.tcgCards
          .filter()
          .anyOf(ids, (q, String id) => q.idEqualTo(id))
          .findAll();
    });
  }

  @override
  Future<void> clearTcgCardCache() async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.tcgCards.clear();
      });
    });
  }
  //endregion

  // region Card binder selections
  @override
  Future<BinderCardSelection?> getBinderSelection(
      int profileId, int pokemonId) async {
    return await _isarTransaction<BinderCardSelection?>((isar) async {
      return await isar.binderCardSelections
          .filter()
          .profileIdEqualTo(profileId)
          .pokemonIdEqualTo(pokemonId)
          .findFirst();
    });
  }

  @override
  Future<void> saveBinderSelection(BinderCardSelection selection) async {
    await _isarTransaction<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.binderCardSelections.put(selection);
      });
    });
  }

  @override
  Future<List<BinderCardSelection>> getBinderSelectionsForProfile(
      int profileId) async {
    return await _isarTransaction<List<BinderCardSelection>>((isar) async {
      return await isar.binderCardSelections
          .filter()
          .profileIdEqualTo(profileId)
          .findAll();
    });
  }
  //endregion

  @override
  Future<void> clearCache() async {
    await _isarTransaction<void>((isar) async {
      if (kDebugMode) {
        print('Clearing Isar cache');
      }
      await isar.writeTxn(() async {
        await isar.pokemons.clear();
        await isar.pokemonDetails.clear();
        await isar.pokemonSpecies.clear();
        await isar.evolutionChains.clear();
        await isar.evolutionChainUrls.clear();
        await isar.berrys.clear();
        await isar.berryFlavors.clear();
        await isar.contestTypes.clear();
        await isar.encounterMethods.clear();
        await isar.encounterConditions.clear();
        await isar.encounterConditionValues.clear();
        await isar.evolutionTriggers.clear();
        await isar.generations.clear();
        await isar.pokedexs.clear();
        await isar.versions.clear();
        await isar.versionGroups.clear();
        await isar.items.clear();
        await isar.itemAttributes.clear();
        await isar.itemCategorys.clear();
        await isar.itemFlingEffects.clear();
        await isar.itemPockets.clear();
        await isar.locations.clear();
        await isar.locationAreas.clear();
        await isar.palParkAreas.clear();
        await isar.regions.clear();
        await isar.machines.clear();
        await isar.moves.clear();
        await isar.moveAilments.clear();
        await isar.moveBattleStyles.clear();
        await isar.moveCategorys.clear();
        await isar.moveDamageClass.clear();
        await isar.moveLearnMethods.clear();
        await isar.moveTargets.clear();
        await isar.abilitys.clear();
        await isar.characteristics.clear();
        await isar.eggGroups.clear();
        await isar.genders.clear();
        await isar.growthRates.clear();
        await isar.natures.clear();
        await isar.pokeathlonStats.clear();
        await isar.stats.clear();
        await isar.languages.clear();
        await isar.caughtTcgCards.clear();
        await isar.tcgCards.clear();
        await isar.binderCardSelections.clear();
      });
    });
  }
}
