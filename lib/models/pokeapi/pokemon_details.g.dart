// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokemonDetailsCollection on Isar {
  IsarCollection<PokemonDetails> get pokemonDetails => this.collection();
}

const PokemonDetailsSchema = CollectionSchema(
  name: r'PokemonDetails',
  id: -4934907418900722843,
  properties: {
    r'abilities': PropertySchema(
      id: 0,
      name: r'abilities',
      type: IsarType.objectList,
      target: r'AbilityName',
    ),
    r'baseExperience': PropertySchema(
      id: 1,
      name: r'baseExperience',
      type: IsarType.long,
    ),
    r'forms': PropertySchema(
      id: 2,
      name: r'forms',
      type: IsarType.objectList,
      target: r'Species',
    ),
    r'gameIndices': PropertySchema(
      id: 3,
      name: r'gameIndices',
      type: IsarType.objectList,
      target: r'GameIndex',
    ),
    r'height': PropertySchema(
      id: 4,
      name: r'height',
      type: IsarType.long,
    ),
    r'heldItems': PropertySchema(
      id: 5,
      name: r'heldItems',
      type: IsarType.objectList,
      target: r'HeldItem',
    ),
    r'isDefault': PropertySchema(
      id: 6,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'locationAreaEncounters': PropertySchema(
      id: 7,
      name: r'locationAreaEncounters',
      type: IsarType.string,
    ),
    r'moves': PropertySchema(
      id: 8,
      name: r'moves',
      type: IsarType.objectList,
      target: r'MoveName',
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 10,
      name: r'order',
      type: IsarType.long,
    ),
    r'species': PropertySchema(
      id: 11,
      name: r'species',
      type: IsarType.object,
      target: r'Species',
    ),
    r'sprites': PropertySchema(
      id: 12,
      name: r'sprites',
      type: IsarType.object,
      target: r'Sprites',
    ),
    r'stats': PropertySchema(
      id: 13,
      name: r'stats',
      type: IsarType.objectList,
      target: r'StatInfo',
    ),
    r'types': PropertySchema(
      id: 14,
      name: r'types',
      type: IsarType.objectList,
      target: r'PokemonType',
    ),
    r'weight': PropertySchema(
      id: 15,
      name: r'weight',
      type: IsarType.long,
    )
  },
  estimateSize: _pokemonDetailsEstimateSize,
  serialize: _pokemonDetailsSerialize,
  deserialize: _pokemonDetailsDeserialize,
  deserializeProp: _pokemonDetailsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'AbilityName': AbilityNameSchema,
    r'Species': SpeciesSchema,
    r'GameIndex': GameIndexSchema,
    r'HeldItem': HeldItemSchema,
    r'VersionDetail': VersionDetailSchema,
    r'MoveName': MoveNameSchema,
    r'VersionGroupDetail': VersionGroupDetailSchema,
    r'Sprites': SpritesSchema,
    r'OtherSprite': OtherSpriteSchema,
    r'DreamWorld': DreamWorldSchema,
    r'Home': HomeSchema,
    r'OfficialArtwork': OfficialArtworkSchema,
    r'Versions': VersionsSchema,
    r'GenerationDetails': GenerationDetailsSchema,
    r'RedBlue': RedBlueSchema,
    r'Gold': GoldSchema,
    r'RubySapphire': RubySapphireSchema,
    r'FireRedLeafGreen': FireRedLeafGreenSchema,
    r'DiamondPearl': DiamondPearlSchema,
    r'HeartGoldSoulSilver': HeartGoldSoulSilverSchema,
    r'BlackWhite': BlackWhiteSchema,
    r'Animated': AnimatedSchema,
    r'Xy': XySchema,
    r'OmegarubyAlphasapphire': OmegarubyAlphasapphireSchema,
    r'Icons': IconsSchema,
    r'StatInfo': StatInfoSchema,
    r'PokemonType': PokemonTypeSchema
  },
  getId: _pokemonDetailsGetId,
  getLinks: _pokemonDetailsGetLinks,
  attach: _pokemonDetailsAttach,
  version: '3.3.2',
);

int _pokemonDetailsEstimateSize(
  PokemonDetails object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.abilities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AbilityName]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AbilityNameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.forms;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Species]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += SpeciesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.gameIndices;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[GameIndex]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              GameIndexSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.heldItems;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[HeldItem]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += HeldItemSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.locationAreaEncounters;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.moves;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MoveName]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += MoveNameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.species;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.sprites;
    if (value != null) {
      bytesCount += 3 +
          SpritesSchema.estimateSize(value, allOffsets[Sprites]!, allOffsets);
    }
  }
  {
    final list = object.stats;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[StatInfo]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += StatInfoSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.types;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PokemonType]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PokemonTypeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _pokemonDetailsSerialize(
  PokemonDetails object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AbilityName>(
    offsets[0],
    allOffsets,
    AbilityNameSchema.serialize,
    object.abilities,
  );
  writer.writeLong(offsets[1], object.baseExperience);
  writer.writeObjectList<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.forms,
  );
  writer.writeObjectList<GameIndex>(
    offsets[3],
    allOffsets,
    GameIndexSchema.serialize,
    object.gameIndices,
  );
  writer.writeLong(offsets[4], object.height);
  writer.writeObjectList<HeldItem>(
    offsets[5],
    allOffsets,
    HeldItemSchema.serialize,
    object.heldItems,
  );
  writer.writeBool(offsets[6], object.isDefault);
  writer.writeString(offsets[7], object.locationAreaEncounters);
  writer.writeObjectList<MoveName>(
    offsets[8],
    allOffsets,
    MoveNameSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[9], object.name);
  writer.writeLong(offsets[10], object.order);
  writer.writeObject<Species>(
    offsets[11],
    allOffsets,
    SpeciesSchema.serialize,
    object.species,
  );
  writer.writeObject<Sprites>(
    offsets[12],
    allOffsets,
    SpritesSchema.serialize,
    object.sprites,
  );
  writer.writeObjectList<StatInfo>(
    offsets[13],
    allOffsets,
    StatInfoSchema.serialize,
    object.stats,
  );
  writer.writeObjectList<PokemonType>(
    offsets[14],
    allOffsets,
    PokemonTypeSchema.serialize,
    object.types,
  );
  writer.writeLong(offsets[15], object.weight);
}

PokemonDetails _pokemonDetailsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonDetails(
    abilities: reader.readObjectList<AbilityName>(
      offsets[0],
      AbilityNameSchema.deserialize,
      allOffsets,
      AbilityName(),
    ),
    baseExperience: reader.readLongOrNull(offsets[1]),
    forms: reader.readObjectList<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
      Species(),
    ),
    gameIndices: reader.readObjectList<GameIndex>(
      offsets[3],
      GameIndexSchema.deserialize,
      allOffsets,
      GameIndex(),
    ),
    height: reader.readLongOrNull(offsets[4]),
    heldItems: reader.readObjectList<HeldItem>(
      offsets[5],
      HeldItemSchema.deserialize,
      allOffsets,
      HeldItem(),
    ),
    id: id,
    isDefault: reader.readBoolOrNull(offsets[6]),
    locationAreaEncounters: reader.readStringOrNull(offsets[7]),
    moves: reader.readObjectList<MoveName>(
      offsets[8],
      MoveNameSchema.deserialize,
      allOffsets,
      MoveName(),
    ),
    name: reader.readStringOrNull(offsets[9]),
    order: reader.readLongOrNull(offsets[10]),
    species: reader.readObjectOrNull<Species>(
      offsets[11],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    sprites: reader.readObjectOrNull<Sprites>(
      offsets[12],
      SpritesSchema.deserialize,
      allOffsets,
    ),
    stats: reader.readObjectList<StatInfo>(
      offsets[13],
      StatInfoSchema.deserialize,
      allOffsets,
      StatInfo(),
    ),
    types: reader.readObjectList<PokemonType>(
      offsets[14],
      PokemonTypeSchema.deserialize,
      allOffsets,
      PokemonType(),
    ),
    weight: reader.readLongOrNull(offsets[15]),
  );
  return object;
}

P _pokemonDetailsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AbilityName>(
        offset,
        AbilityNameSchema.deserialize,
        allOffsets,
        AbilityName(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
        Species(),
      )) as P;
    case 3:
      return (reader.readObjectList<GameIndex>(
        offset,
        GameIndexSchema.deserialize,
        allOffsets,
        GameIndex(),
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<HeldItem>(
        offset,
        HeldItemSchema.deserialize,
        allOffsets,
        HeldItem(),
      )) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readObjectList<MoveName>(
        offset,
        MoveNameSchema.deserialize,
        allOffsets,
        MoveName(),
      )) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 12:
      return (reader.readObjectOrNull<Sprites>(
        offset,
        SpritesSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readObjectList<StatInfo>(
        offset,
        StatInfoSchema.deserialize,
        allOffsets,
        StatInfo(),
      )) as P;
    case 14:
      return (reader.readObjectList<PokemonType>(
        offset,
        PokemonTypeSchema.deserialize,
        allOffsets,
        PokemonType(),
      )) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokemonDetailsGetId(PokemonDetails object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pokemonDetailsGetLinks(PokemonDetails object) {
  return [];
}

void _pokemonDetailsAttach(
    IsarCollection<dynamic> col, Id id, PokemonDetails object) {}

extension PokemonDetailsQueryWhereSort
    on QueryBuilder<PokemonDetails, PokemonDetails, QWhere> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokemonDetailsQueryWhere
    on QueryBuilder<PokemonDetails, PokemonDetails, QWhereClause> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonDetailsQueryFilter
    on QueryBuilder<PokemonDetails, PokemonDetails, QFilterCondition> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseExperience',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseExperience',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      baseExperienceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseExperience',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'forms',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'forms',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'forms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndices',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndices',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'gameIndices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heldItems',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heldItems',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'heldItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      isDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDefault',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      isDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDefault',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      isDefaultEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationAreaEncounters',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationAreaEncounters',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationAreaEncounters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationAreaEncounters',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationAreaEncounters',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationAreaEncounters',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      locationAreaEncountersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationAreaEncounters',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      orderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      speciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'species',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      speciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'species',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      spritesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sprites',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      spritesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sprites',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stats',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stats',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'stats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      weightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PokemonDetailsQueryObject
    on QueryBuilder<PokemonDetails, PokemonDetails, QFilterCondition> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      abilitiesElement(FilterQuery<AbilityName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'abilities');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      formsElement(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'forms');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      gameIndicesElement(FilterQuery<GameIndex> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'gameIndices');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      heldItemsElement(FilterQuery<HeldItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'heldItems');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      movesElement(FilterQuery<MoveName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition> species(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'species');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition> sprites(
      FilterQuery<Sprites> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sprites');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      statsElement(FilterQuery<StatInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stats');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterFilterCondition>
      typesElement(FilterQuery<PokemonType> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'types');
    });
  }
}

extension PokemonDetailsQueryLinks
    on QueryBuilder<PokemonDetails, PokemonDetails, QFilterCondition> {}

extension PokemonDetailsQuerySortBy
    on QueryBuilder<PokemonDetails, PokemonDetails, QSortBy> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByBaseExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByLocationAreaEncounters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationAreaEncounters', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByLocationAreaEncountersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationAreaEncounters', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PokemonDetailsQuerySortThenBy
    on QueryBuilder<PokemonDetails, PokemonDetails, QSortThenBy> {
  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByBaseExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseExperience', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByLocationAreaEncounters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationAreaEncounters', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByLocationAreaEncountersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationAreaEncounters', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QAfterSortBy>
      thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PokemonDetailsQueryWhereDistinct
    on QueryBuilder<PokemonDetails, PokemonDetails, QDistinct> {
  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct>
      distinctByBaseExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseExperience');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct>
      distinctByLocationAreaEncounters({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationAreaEncounters',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<PokemonDetails, PokemonDetails, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension PokemonDetailsQueryProperty
    on QueryBuilder<PokemonDetails, PokemonDetails, QQueryProperty> {
  QueryBuilder<PokemonDetails, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PokemonDetails, List<AbilityName>?, QQueryOperations>
      abilitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abilities');
    });
  }

  QueryBuilder<PokemonDetails, int?, QQueryOperations>
      baseExperienceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseExperience');
    });
  }

  QueryBuilder<PokemonDetails, List<Species>?, QQueryOperations>
      formsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forms');
    });
  }

  QueryBuilder<PokemonDetails, List<GameIndex>?, QQueryOperations>
      gameIndicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameIndices');
    });
  }

  QueryBuilder<PokemonDetails, int?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<PokemonDetails, List<HeldItem>?, QQueryOperations>
      heldItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'heldItems');
    });
  }

  QueryBuilder<PokemonDetails, bool?, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<PokemonDetails, String?, QQueryOperations>
      locationAreaEncountersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationAreaEncounters');
    });
  }

  QueryBuilder<PokemonDetails, List<MoveName>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<PokemonDetails, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PokemonDetails, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<PokemonDetails, Species?, QQueryOperations> speciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'species');
    });
  }

  QueryBuilder<PokemonDetails, Sprites?, QQueryOperations> spritesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sprites');
    });
  }

  QueryBuilder<PokemonDetails, List<StatInfo>?, QQueryOperations>
      statsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stats');
    });
  }

  QueryBuilder<PokemonDetails, List<PokemonType>?, QQueryOperations>
      typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }

  QueryBuilder<PokemonDetails, int?, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AbilityNameSchema = Schema(
  name: r'AbilityName',
  id: 8861180807589968416,
  properties: {
    r'ability': PropertySchema(
      id: 0,
      name: r'ability',
      type: IsarType.object,
      target: r'Species',
    ),
    r'isHidden': PropertySchema(
      id: 1,
      name: r'isHidden',
      type: IsarType.bool,
    ),
    r'slot': PropertySchema(
      id: 2,
      name: r'slot',
      type: IsarType.long,
    )
  },
  estimateSize: _abilityNameEstimateSize,
  serialize: _abilityNameSerialize,
  deserialize: _abilityNameDeserialize,
  deserializeProp: _abilityNameDeserializeProp,
);

int _abilityNameEstimateSize(
  AbilityName object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ability;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _abilityNameSerialize(
  AbilityName object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.ability,
  );
  writer.writeBool(offsets[1], object.isHidden);
  writer.writeLong(offsets[2], object.slot);
}

AbilityName _abilityNameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AbilityName(
    ability: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    isHidden: reader.readBoolOrNull(offsets[1]),
    slot: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _abilityNameDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AbilityNameQueryFilter
    on QueryBuilder<AbilityName, AbilityName, QFilterCondition> {
  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition>
      abilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ability',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition>
      abilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ability',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition>
      isHiddenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition>
      isHiddenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> isHiddenEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHidden',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition>
      slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> slotEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AbilityNameQueryObject
    on QueryBuilder<AbilityName, AbilityName, QFilterCondition> {
  QueryBuilder<AbilityName, AbilityName, QAfterFilterCondition> ability(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ability');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SpeciesSchema = Schema(
  name: r'Species',
  id: -1724512414814962385,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _speciesEstimateSize,
  serialize: _speciesSerialize,
  deserialize: _speciesDeserialize,
  deserializeProp: _speciesDeserializeProp,
);

int _speciesEstimateSize(
  Species object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _speciesSerialize(
  Species object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.url);
}

Species _speciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Species(
    name: reader.readStringOrNull(offsets[0]),
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _speciesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SpeciesQueryFilter
    on QueryBuilder<Species, Species, QFilterCondition> {
  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Species, Species, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension SpeciesQueryObject
    on QueryBuilder<Species, Species, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GameIndexSchema = Schema(
  name: r'GameIndex',
  id: 4350993040634368407,
  properties: {
    r'gameIndex': PropertySchema(
      id: 0,
      name: r'gameIndex',
      type: IsarType.long,
    ),
    r'version': PropertySchema(
      id: 1,
      name: r'version',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _gameIndexEstimateSize,
  serialize: _gameIndexSerialize,
  deserialize: _gameIndexDeserialize,
  deserializeProp: _gameIndexDeserializeProp,
);

int _gameIndexEstimateSize(
  GameIndex object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _gameIndexSerialize(
  GameIndex object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.gameIndex);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.version,
  );
}

GameIndex _gameIndexDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameIndex(
    gameIndex: reader.readLongOrNull(offsets[0]),
    version: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _gameIndexDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GameIndexQueryFilter
    on QueryBuilder<GameIndex, GameIndex, QFilterCondition> {
  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> gameIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition>
      gameIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> gameIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition>
      gameIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> gameIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> gameIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gameIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension GameIndexQueryObject
    on QueryBuilder<GameIndex, GameIndex, QFilterCondition> {
  QueryBuilder<GameIndex, GameIndex, QAfterFilterCondition> version(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HeldItemSchema = Schema(
  name: r'HeldItem',
  id: -2809852416845482349,
  properties: {
    r'item': PropertySchema(
      id: 0,
      name: r'item',
      type: IsarType.object,
      target: r'Species',
    ),
    r'versionDetails': PropertySchema(
      id: 1,
      name: r'versionDetails',
      type: IsarType.objectList,
      target: r'VersionDetail',
    )
  },
  estimateSize: _heldItemEstimateSize,
  serialize: _heldItemSerialize,
  deserialize: _heldItemDeserialize,
  deserializeProp: _heldItemDeserializeProp,
);

int _heldItemEstimateSize(
  HeldItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.item;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final list = object.versionDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VersionDetail]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VersionDetailSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _heldItemSerialize(
  HeldItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.item,
  );
  writer.writeObjectList<VersionDetail>(
    offsets[1],
    allOffsets,
    VersionDetailSchema.serialize,
    object.versionDetails,
  );
}

HeldItem _heldItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HeldItem(
    item: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    versionDetails: reader.readObjectList<VersionDetail>(
      offsets[1],
      VersionDetailSchema.deserialize,
      allOffsets,
      VersionDetail(),
    ),
  );
  return object;
}

P _heldItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<VersionDetail>(
        offset,
        VersionDetailSchema.deserialize,
        allOffsets,
        VersionDetail(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HeldItemQueryFilter
    on QueryBuilder<HeldItem, HeldItem, QFilterCondition> {
  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition> itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition> itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition>
      versionDetailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionDetails',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension HeldItemQueryObject
    on QueryBuilder<HeldItem, HeldItem, QFilterCondition> {
  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition> item(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<HeldItem, HeldItem, QAfterFilterCondition> versionDetailsElement(
      FilterQuery<VersionDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionDetails');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionDetailSchema = Schema(
  name: r'VersionDetail',
  id: -1171287925696371790,
  properties: {
    r'rarity': PropertySchema(
      id: 0,
      name: r'rarity',
      type: IsarType.long,
    ),
    r'version': PropertySchema(
      id: 1,
      name: r'version',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _versionDetailEstimateSize,
  serialize: _versionDetailSerialize,
  deserialize: _versionDetailDeserialize,
  deserializeProp: _versionDetailDeserializeProp,
);

int _versionDetailEstimateSize(
  VersionDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _versionDetailSerialize(
  VersionDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.rarity);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.version,
  );
}

VersionDetail _versionDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionDetail(
    rarity: reader.readLongOrNull(offsets[0]),
    version: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VersionDetailQueryFilter
    on QueryBuilder<VersionDetail, VersionDetail, QFilterCondition> {
  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rarity',
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rarity',
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rarity',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rarity',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      rarityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension VersionDetailQueryObject
    on QueryBuilder<VersionDetail, VersionDetail, QFilterCondition> {
  QueryBuilder<VersionDetail, VersionDetail, QAfterFilterCondition> version(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveNameSchema = Schema(
  name: r'MoveName',
  id: 4424031394807178061,
  properties: {
    r'move': PropertySchema(
      id: 0,
      name: r'move',
      type: IsarType.object,
      target: r'Species',
    ),
    r'versionGroupDetails': PropertySchema(
      id: 1,
      name: r'versionGroupDetails',
      type: IsarType.objectList,
      target: r'VersionGroupDetail',
    )
  },
  estimateSize: _moveNameEstimateSize,
  serialize: _moveNameSerialize,
  deserialize: _moveNameDeserialize,
  deserializeProp: _moveNameDeserializeProp,
);

int _moveNameEstimateSize(
  MoveName object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.move;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final list = object.versionGroupDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VersionGroupDetail]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VersionGroupDetailSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _moveNameSerialize(
  MoveName object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.move,
  );
  writer.writeObjectList<VersionGroupDetail>(
    offsets[1],
    allOffsets,
    VersionGroupDetailSchema.serialize,
    object.versionGroupDetails,
  );
}

MoveName _moveNameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveName(
    move: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    versionGroupDetails: reader.readObjectList<VersionGroupDetail>(
      offsets[1],
      VersionGroupDetailSchema.deserialize,
      allOffsets,
      VersionGroupDetail(),
    ),
  );
  return object;
}

P _moveNameDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<VersionGroupDetail>(
        offset,
        VersionGroupDetailSchema.deserialize,
        allOffsets,
        VersionGroupDetail(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MoveNameQueryFilter
    on QueryBuilder<MoveName, MoveName, QFilterCondition> {
  QueryBuilder<MoveName, MoveName, QAfterFilterCondition> moveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition> moveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroupDetails',
      ));
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroupDetails',
      ));
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroupDetails',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MoveNameQueryObject
    on QueryBuilder<MoveName, MoveName, QFilterCondition> {
  QueryBuilder<MoveName, MoveName, QAfterFilterCondition> move(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'move');
    });
  }

  QueryBuilder<MoveName, MoveName, QAfterFilterCondition>
      versionGroupDetailsElement(FilterQuery<VersionGroupDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroupDetails');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionGroupDetailSchema = Schema(
  name: r'VersionGroupDetail',
  id: 6825776471361947656,
  properties: {
    r'levelLearnedAt': PropertySchema(
      id: 0,
      name: r'levelLearnedAt',
      type: IsarType.long,
    ),
    r'moveLearnMethod': PropertySchema(
      id: 1,
      name: r'moveLearnMethod',
      type: IsarType.object,
      target: r'Species',
    ),
    r'versionGroup': PropertySchema(
      id: 2,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _versionGroupDetailEstimateSize,
  serialize: _versionGroupDetailSerialize,
  deserialize: _versionGroupDetailDeserialize,
  deserializeProp: _versionGroupDetailDeserializeProp,
);

int _versionGroupDetailEstimateSize(
  VersionGroupDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.moveLearnMethod;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.versionGroup;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _versionGroupDetailSerialize(
  VersionGroupDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.levelLearnedAt);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.moveLearnMethod,
  );
  writer.writeObject<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.versionGroup,
  );
}

VersionGroupDetail _versionGroupDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionGroupDetail(
    levelLearnedAt: reader.readLongOrNull(offsets[0]),
    moveLearnMethod: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    versionGroup: reader.readObjectOrNull<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionGroupDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VersionGroupDetailQueryFilter
    on QueryBuilder<VersionGroupDetail, VersionGroupDetail, QFilterCondition> {
  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelLearnedAt',
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelLearnedAt',
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelLearnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelLearnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelLearnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      levelLearnedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelLearnedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      moveLearnMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moveLearnMethod',
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      moveLearnMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moveLearnMethod',
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension VersionGroupDetailQueryObject
    on QueryBuilder<VersionGroupDetail, VersionGroupDetail, QFilterCondition> {
  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      moveLearnMethod(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moveLearnMethod');
    });
  }

  QueryBuilder<VersionGroupDetail, VersionGroupDetail, QAfterFilterCondition>
      versionGroup(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SpritesSchema = Schema(
  name: r'Sprites',
  id: 8940576078698991143,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backFemale': PropertySchema(
      id: 1,
      name: r'backFemale',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 2,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backShinyFemale': PropertySchema(
      id: 3,
      name: r'backShinyFemale',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 4,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 5,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 6,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 7,
      name: r'frontShinyFemale',
      type: IsarType.string,
    ),
    r'other': PropertySchema(
      id: 8,
      name: r'other',
      type: IsarType.object,
      target: r'OtherSprite',
    ),
    r'versions': PropertySchema(
      id: 9,
      name: r'versions',
      type: IsarType.object,
      target: r'Versions',
    )
  },
  estimateSize: _spritesEstimateSize,
  serialize: _spritesSerialize,
  deserialize: _spritesDeserialize,
  deserializeProp: _spritesDeserializeProp,
);

int _spritesEstimateSize(
  Sprites object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.other;
    if (value != null) {
      bytesCount += 3 +
          OtherSpriteSchema.estimateSize(
              value, allOffsets[OtherSprite]!, allOffsets);
    }
  }
  {
    final value = object.versions;
    if (value != null) {
      bytesCount += 3 +
          VersionsSchema.estimateSize(value, allOffsets[Versions]!, allOffsets);
    }
  }
  return bytesCount;
}

void _spritesSerialize(
  Sprites object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backFemale);
  writer.writeString(offsets[2], object.backShiny);
  writer.writeString(offsets[3], object.backShinyFemale);
  writer.writeString(offsets[4], object.frontDefault);
  writer.writeString(offsets[5], object.frontFemale);
  writer.writeString(offsets[6], object.frontShiny);
  writer.writeString(offsets[7], object.frontShinyFemale);
  writer.writeObject<OtherSprite>(
    offsets[8],
    allOffsets,
    OtherSpriteSchema.serialize,
    object.other,
  );
  writer.writeObject<Versions>(
    offsets[9],
    allOffsets,
    VersionsSchema.serialize,
    object.versions,
  );
}

Sprites _spritesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Sprites(
    backDefault: reader.readStringOrNull(offsets[0]),
    backFemale: reader.readStringOrNull(offsets[1]),
    backShiny: reader.readStringOrNull(offsets[2]),
    backShinyFemale: reader.readStringOrNull(offsets[3]),
    frontDefault: reader.readStringOrNull(offsets[4]),
    frontFemale: reader.readStringOrNull(offsets[5]),
    frontShiny: reader.readStringOrNull(offsets[6]),
    frontShinyFemale: reader.readStringOrNull(offsets[7]),
    other: reader.readObjectOrNull<OtherSprite>(
      offsets[8],
      OtherSpriteSchema.deserialize,
      allOffsets,
    ),
    versions: reader.readObjectOrNull<Versions>(
      offsets[9],
      VersionsSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _spritesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<OtherSprite>(
        offset,
        OtherSpriteSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readObjectOrNull<Versions>(
        offset,
        VersionsSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SpritesQueryFilter
    on QueryBuilder<Sprites, Sprites, QFilterCondition> {
  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> backShinyFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      backShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> frontShinyFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition>
      frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> otherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'other',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> otherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'other',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> versionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versions',
      ));
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> versionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versions',
      ));
    });
  }
}

extension SpritesQueryObject
    on QueryBuilder<Sprites, Sprites, QFilterCondition> {
  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> other(
      FilterQuery<OtherSprite> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'other');
    });
  }

  QueryBuilder<Sprites, Sprites, QAfterFilterCondition> versions(
      FilterQuery<Versions> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OtherSpriteSchema = Schema(
  name: r'OtherSprite',
  id: 4604035636838841141,
  properties: {
    r'dreamWorld': PropertySchema(
      id: 0,
      name: r'dreamWorld',
      type: IsarType.object,
      target: r'DreamWorld',
    ),
    r'home': PropertySchema(
      id: 1,
      name: r'home',
      type: IsarType.object,
      target: r'Home',
    ),
    r'officialArtwork': PropertySchema(
      id: 2,
      name: r'officialArtwork',
      type: IsarType.object,
      target: r'OfficialArtwork',
    )
  },
  estimateSize: _otherSpriteEstimateSize,
  serialize: _otherSpriteSerialize,
  deserialize: _otherSpriteDeserialize,
  deserializeProp: _otherSpriteDeserializeProp,
);

int _otherSpriteEstimateSize(
  OtherSprite object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dreamWorld;
    if (value != null) {
      bytesCount += 3 +
          DreamWorldSchema.estimateSize(
              value, allOffsets[DreamWorld]!, allOffsets);
    }
  }
  {
    final value = object.home;
    if (value != null) {
      bytesCount +=
          3 + HomeSchema.estimateSize(value, allOffsets[Home]!, allOffsets);
    }
  }
  {
    final value = object.officialArtwork;
    if (value != null) {
      bytesCount += 3 +
          OfficialArtworkSchema.estimateSize(
              value, allOffsets[OfficialArtwork]!, allOffsets);
    }
  }
  return bytesCount;
}

void _otherSpriteSerialize(
  OtherSprite object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<DreamWorld>(
    offsets[0],
    allOffsets,
    DreamWorldSchema.serialize,
    object.dreamWorld,
  );
  writer.writeObject<Home>(
    offsets[1],
    allOffsets,
    HomeSchema.serialize,
    object.home,
  );
  writer.writeObject<OfficialArtwork>(
    offsets[2],
    allOffsets,
    OfficialArtworkSchema.serialize,
    object.officialArtwork,
  );
}

OtherSprite _otherSpriteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OtherSprite(
    dreamWorld: reader.readObjectOrNull<DreamWorld>(
      offsets[0],
      DreamWorldSchema.deserialize,
      allOffsets,
    ),
    home: reader.readObjectOrNull<Home>(
      offsets[1],
      HomeSchema.deserialize,
      allOffsets,
    ),
    officialArtwork: reader.readObjectOrNull<OfficialArtwork>(
      offsets[2],
      OfficialArtworkSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _otherSpriteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<DreamWorld>(
        offset,
        DreamWorldSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<Home>(
        offset,
        HomeSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<OfficialArtwork>(
        offset,
        OfficialArtworkSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OtherSpriteQueryFilter
    on QueryBuilder<OtherSprite, OtherSprite, QFilterCondition> {
  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition>
      dreamWorldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dreamWorld',
      ));
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition>
      dreamWorldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dreamWorld',
      ));
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition> homeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'home',
      ));
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition>
      homeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'home',
      ));
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition>
      officialArtworkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'officialArtwork',
      ));
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition>
      officialArtworkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'officialArtwork',
      ));
    });
  }
}

extension OtherSpriteQueryObject
    on QueryBuilder<OtherSprite, OtherSprite, QFilterCondition> {
  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition> dreamWorld(
      FilterQuery<DreamWorld> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dreamWorld');
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition> home(
      FilterQuery<Home> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'home');
    });
  }

  QueryBuilder<OtherSprite, OtherSprite, QAfterFilterCondition> officialArtwork(
      FilterQuery<OfficialArtwork> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'officialArtwork');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DreamWorldSchema = Schema(
  name: r'DreamWorld',
  id: 4941079313636853223,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 1,
      name: r'frontFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _dreamWorldEstimateSize,
  serialize: _dreamWorldSerialize,
  deserialize: _dreamWorldDeserialize,
  deserializeProp: _dreamWorldDeserializeProp,
);

int _dreamWorldEstimateSize(
  DreamWorld object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dreamWorldSerialize(
  DreamWorld object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontFemale);
}

DreamWorld _dreamWorldDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DreamWorld(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontFemale: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _dreamWorldDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DreamWorldQueryFilter
    on QueryBuilder<DreamWorld, DreamWorld, QFilterCondition> {
  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamWorld, DreamWorld, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }
}

extension DreamWorldQueryObject
    on QueryBuilder<DreamWorld, DreamWorld, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HomeSchema = Schema(
  name: r'Home',
  id: 7640934929095212351,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 1,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 2,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 3,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _homeEstimateSize,
  serialize: _homeSerialize,
  deserialize: _homeDeserialize,
  deserializeProp: _homeDeserializeProp,
);

int _homeEstimateSize(
  Home object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _homeSerialize(
  Home object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontFemale);
  writer.writeString(offsets[2], object.frontShiny);
  writer.writeString(offsets[3], object.frontShinyFemale);
}

Home _homeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Home(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontFemale: reader.readStringOrNull(offsets[1]),
    frontShiny: reader.readStringOrNull(offsets[2]),
    frontShinyFemale: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _homeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HomeQueryFilter on QueryBuilder<Home, Home, QFilterCondition> {
  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Home, Home, QAfterFilterCondition> frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension HomeQueryObject on QueryBuilder<Home, Home, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OfficialArtworkSchema = Schema(
  name: r'OfficialArtwork',
  id: -3294983473660781732,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 1,
      name: r'frontShiny',
      type: IsarType.string,
    )
  },
  estimateSize: _officialArtworkEstimateSize,
  serialize: _officialArtworkSerialize,
  deserialize: _officialArtworkDeserialize,
  deserializeProp: _officialArtworkDeserializeProp,
);

int _officialArtworkEstimateSize(
  OfficialArtwork object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _officialArtworkSerialize(
  OfficialArtwork object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontShiny);
}

OfficialArtwork _officialArtworkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OfficialArtwork(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontShiny: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _officialArtworkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OfficialArtworkQueryFilter
    on QueryBuilder<OfficialArtwork, OfficialArtwork, QFilterCondition> {
  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<OfficialArtwork, OfficialArtwork, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }
}

extension OfficialArtworkQueryObject
    on QueryBuilder<OfficialArtwork, OfficialArtwork, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StatInfoSchema = Schema(
  name: r'StatInfo',
  id: 2914881003504983226,
  properties: {
    r'baseStat': PropertySchema(
      id: 0,
      name: r'baseStat',
      type: IsarType.long,
    ),
    r'effort': PropertySchema(
      id: 1,
      name: r'effort',
      type: IsarType.long,
    ),
    r'stat': PropertySchema(
      id: 2,
      name: r'stat',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _statInfoEstimateSize,
  serialize: _statInfoSerialize,
  deserialize: _statInfoDeserialize,
  deserializeProp: _statInfoDeserializeProp,
);

int _statInfoEstimateSize(
  StatInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.stat;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _statInfoSerialize(
  StatInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.baseStat);
  writer.writeLong(offsets[1], object.effort);
  writer.writeObject<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.stat,
  );
}

StatInfo _statInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StatInfo(
    baseStat: reader.readLongOrNull(offsets[0]),
    effort: reader.readLongOrNull(offsets[1]),
    stat: reader.readObjectOrNull<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _statInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StatInfoQueryFilter
    on QueryBuilder<StatInfo, StatInfo, QFilterCondition> {
  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseStat',
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseStat',
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseStat',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> baseStatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effort',
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effort',
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effort',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effort',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effort',
        value: value,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> effortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> statIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stat',
      ));
    });
  }

  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> statIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stat',
      ));
    });
  }
}

extension StatInfoQueryObject
    on QueryBuilder<StatInfo, StatInfo, QFilterCondition> {
  QueryBuilder<StatInfo, StatInfo, QAfterFilterCondition> stat(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stat');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokemonTypeSchema = Schema(
  name: r'PokemonType',
  id: 229780386400146563,
  properties: {
    r'slot': PropertySchema(
      id: 0,
      name: r'slot',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _pokemonTypeEstimateSize,
  serialize: _pokemonTypeSerialize,
  deserialize: _pokemonTypeDeserialize,
  deserializeProp: _pokemonTypeDeserializeProp,
);

int _pokemonTypeEstimateSize(
  PokemonType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _pokemonTypeSerialize(
  PokemonType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.slot);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.type,
  );
}

PokemonType _pokemonTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonType(
    slot: reader.readLongOrNull(offsets[0]),
    type: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _pokemonTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PokemonTypeQueryFilter
    on QueryBuilder<PokemonType, PokemonType, QFilterCondition> {
  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition>
      slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }
}

extension PokemonTypeQueryObject
    on QueryBuilder<PokemonType, PokemonType, QFilterCondition> {
  QueryBuilder<PokemonType, PokemonType, QAfterFilterCondition> type(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionsSchema = Schema(
  name: r'Versions',
  id: -3891429200809633971,
  properties: {
    r'generationI': PropertySchema(
      id: 0,
      name: r'generationI',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationIi': PropertySchema(
      id: 1,
      name: r'generationIi',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationIii': PropertySchema(
      id: 2,
      name: r'generationIii',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationIv': PropertySchema(
      id: 3,
      name: r'generationIv',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationV': PropertySchema(
      id: 4,
      name: r'generationV',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationVi': PropertySchema(
      id: 5,
      name: r'generationVi',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationVii': PropertySchema(
      id: 6,
      name: r'generationVii',
      type: IsarType.object,
      target: r'GenerationDetails',
    ),
    r'generationViii': PropertySchema(
      id: 7,
      name: r'generationViii',
      type: IsarType.object,
      target: r'GenerationDetails',
    )
  },
  estimateSize: _versionsEstimateSize,
  serialize: _versionsSerialize,
  deserialize: _versionsDeserialize,
  deserializeProp: _versionsDeserializeProp,
);

int _versionsEstimateSize(
  Versions object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.generationI;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationIi;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationIii;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationIv;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationV;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationVi;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationVii;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  {
    final value = object.generationViii;
    if (value != null) {
      bytesCount += 3 +
          GenerationDetailsSchema.estimateSize(
              value, allOffsets[GenerationDetails]!, allOffsets);
    }
  }
  return bytesCount;
}

void _versionsSerialize(
  Versions object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<GenerationDetails>(
    offsets[0],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationI,
  );
  writer.writeObject<GenerationDetails>(
    offsets[1],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationIi,
  );
  writer.writeObject<GenerationDetails>(
    offsets[2],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationIii,
  );
  writer.writeObject<GenerationDetails>(
    offsets[3],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationIv,
  );
  writer.writeObject<GenerationDetails>(
    offsets[4],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationV,
  );
  writer.writeObject<GenerationDetails>(
    offsets[5],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationVi,
  );
  writer.writeObject<GenerationDetails>(
    offsets[6],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationVii,
  );
  writer.writeObject<GenerationDetails>(
    offsets[7],
    allOffsets,
    GenerationDetailsSchema.serialize,
    object.generationViii,
  );
}

Versions _versionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Versions(
    generationI: reader.readObjectOrNull<GenerationDetails>(
      offsets[0],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationIi: reader.readObjectOrNull<GenerationDetails>(
      offsets[1],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationIii: reader.readObjectOrNull<GenerationDetails>(
      offsets[2],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationIv: reader.readObjectOrNull<GenerationDetails>(
      offsets[3],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationV: reader.readObjectOrNull<GenerationDetails>(
      offsets[4],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationVi: reader.readObjectOrNull<GenerationDetails>(
      offsets[5],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationVii: reader.readObjectOrNull<GenerationDetails>(
      offsets[6],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
    generationViii: reader.readObjectOrNull<GenerationDetails>(
      offsets[7],
      GenerationDetailsSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readObjectOrNull<GenerationDetails>(
        offset,
        GenerationDetailsSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VersionsQueryFilter
    on QueryBuilder<Versions, Versions, QFilterCondition> {
  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationI',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationI',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationIi',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationIiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationIi',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationIiiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationIii',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationIiiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationIii',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIvIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationIv',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationIvIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationIv',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationVIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationV',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationVIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationV',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationViIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationVi',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationViIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationVi',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationViiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationVii',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationViiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationVii',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationViiiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generationViii',
      ));
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition>
      generationViiiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generationViii',
      ));
    });
  }
}

extension VersionsQueryObject
    on QueryBuilder<Versions, Versions, QFilterCondition> {
  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationI(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationI');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIi(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationIi');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIii(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationIii');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationIv(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationIv');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationV(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationV');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationVi(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationVi');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationVii(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationVii');
    });
  }

  QueryBuilder<Versions, Versions, QAfterFilterCondition> generationViii(
      FilterQuery<GenerationDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generationViii');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GenerationDetailsSchema = Schema(
  name: r'GenerationDetails',
  id: -5903268795850441533,
  properties: {
    r'animated': PropertySchema(
      id: 0,
      name: r'animated',
      type: IsarType.object,
      target: r'Animated',
    ),
    r'blackWhite': PropertySchema(
      id: 1,
      name: r'blackWhite',
      type: IsarType.object,
      target: r'BlackWhite',
    ),
    r'crystal': PropertySchema(
      id: 2,
      name: r'crystal',
      type: IsarType.object,
      target: r'Gold',
    ),
    r'diamondPearl': PropertySchema(
      id: 3,
      name: r'diamondPearl',
      type: IsarType.object,
      target: r'DiamondPearl',
    ),
    r'emerald': PropertySchema(
      id: 4,
      name: r'emerald',
      type: IsarType.object,
      target: r'RubySapphire',
    ),
    r'fireRedLeafGreen': PropertySchema(
      id: 5,
      name: r'fireRedLeafGreen',
      type: IsarType.object,
      target: r'FireRedLeafGreen',
    ),
    r'gold': PropertySchema(
      id: 6,
      name: r'gold',
      type: IsarType.object,
      target: r'Gold',
    ),
    r'heartGoldSoulSilver': PropertySchema(
      id: 7,
      name: r'heartGoldSoulSilver',
      type: IsarType.object,
      target: r'HeartGoldSoulSilver',
    ),
    r'icons': PropertySchema(
      id: 8,
      name: r'icons',
      type: IsarType.object,
      target: r'Icons',
    ),
    r'omegaRubyAlphaSapphire': PropertySchema(
      id: 9,
      name: r'omegaRubyAlphaSapphire',
      type: IsarType.object,
      target: r'OmegarubyAlphasapphire',
    ),
    r'platinum': PropertySchema(
      id: 10,
      name: r'platinum',
      type: IsarType.object,
      target: r'DiamondPearl',
    ),
    r'redBlue': PropertySchema(
      id: 11,
      name: r'redBlue',
      type: IsarType.object,
      target: r'RedBlue',
    ),
    r'rubySapphire': PropertySchema(
      id: 12,
      name: r'rubySapphire',
      type: IsarType.object,
      target: r'RubySapphire',
    ),
    r'silver': PropertySchema(
      id: 13,
      name: r'silver',
      type: IsarType.object,
      target: r'Gold',
    ),
    r'ultraSunUltraMoon': PropertySchema(
      id: 14,
      name: r'ultraSunUltraMoon',
      type: IsarType.object,
      target: r'Icons',
    ),
    r'xy': PropertySchema(
      id: 15,
      name: r'xy',
      type: IsarType.object,
      target: r'Xy',
    ),
    r'yellow': PropertySchema(
      id: 16,
      name: r'yellow',
      type: IsarType.object,
      target: r'RedBlue',
    )
  },
  estimateSize: _generationDetailsEstimateSize,
  serialize: _generationDetailsSerialize,
  deserialize: _generationDetailsDeserialize,
  deserializeProp: _generationDetailsDeserializeProp,
);

int _generationDetailsEstimateSize(
  GenerationDetails object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.animated;
    if (value != null) {
      bytesCount += 3 +
          AnimatedSchema.estimateSize(value, allOffsets[Animated]!, allOffsets);
    }
  }
  {
    final value = object.blackWhite;
    if (value != null) {
      bytesCount += 3 +
          BlackWhiteSchema.estimateSize(
              value, allOffsets[BlackWhite]!, allOffsets);
    }
  }
  {
    final value = object.crystal;
    if (value != null) {
      bytesCount +=
          3 + GoldSchema.estimateSize(value, allOffsets[Gold]!, allOffsets);
    }
  }
  {
    final value = object.diamondPearl;
    if (value != null) {
      bytesCount += 3 +
          DiamondPearlSchema.estimateSize(
              value, allOffsets[DiamondPearl]!, allOffsets);
    }
  }
  {
    final value = object.emerald;
    if (value != null) {
      bytesCount += 3 +
          RubySapphireSchema.estimateSize(
              value, allOffsets[RubySapphire]!, allOffsets);
    }
  }
  {
    final value = object.fireRedLeafGreen;
    if (value != null) {
      bytesCount += 3 +
          FireRedLeafGreenSchema.estimateSize(
              value, allOffsets[FireRedLeafGreen]!, allOffsets);
    }
  }
  {
    final value = object.gold;
    if (value != null) {
      bytesCount +=
          3 + GoldSchema.estimateSize(value, allOffsets[Gold]!, allOffsets);
    }
  }
  {
    final value = object.heartGoldSoulSilver;
    if (value != null) {
      bytesCount += 3 +
          HeartGoldSoulSilverSchema.estimateSize(
              value, allOffsets[HeartGoldSoulSilver]!, allOffsets);
    }
  }
  {
    final value = object.icons;
    if (value != null) {
      bytesCount +=
          3 + IconsSchema.estimateSize(value, allOffsets[Icons]!, allOffsets);
    }
  }
  {
    final value = object.omegaRubyAlphaSapphire;
    if (value != null) {
      bytesCount += 3 +
          OmegarubyAlphasapphireSchema.estimateSize(
              value, allOffsets[OmegarubyAlphasapphire]!, allOffsets);
    }
  }
  {
    final value = object.platinum;
    if (value != null) {
      bytesCount += 3 +
          DiamondPearlSchema.estimateSize(
              value, allOffsets[DiamondPearl]!, allOffsets);
    }
  }
  {
    final value = object.redBlue;
    if (value != null) {
      bytesCount += 3 +
          RedBlueSchema.estimateSize(value, allOffsets[RedBlue]!, allOffsets);
    }
  }
  {
    final value = object.rubySapphire;
    if (value != null) {
      bytesCount += 3 +
          RubySapphireSchema.estimateSize(
              value, allOffsets[RubySapphire]!, allOffsets);
    }
  }
  {
    final value = object.silver;
    if (value != null) {
      bytesCount +=
          3 + GoldSchema.estimateSize(value, allOffsets[Gold]!, allOffsets);
    }
  }
  {
    final value = object.ultraSunUltraMoon;
    if (value != null) {
      bytesCount +=
          3 + IconsSchema.estimateSize(value, allOffsets[Icons]!, allOffsets);
    }
  }
  {
    final value = object.xy;
    if (value != null) {
      bytesCount +=
          3 + XySchema.estimateSize(value, allOffsets[Xy]!, allOffsets);
    }
  }
  {
    final value = object.yellow;
    if (value != null) {
      bytesCount += 3 +
          RedBlueSchema.estimateSize(value, allOffsets[RedBlue]!, allOffsets);
    }
  }
  return bytesCount;
}

void _generationDetailsSerialize(
  GenerationDetails object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Animated>(
    offsets[0],
    allOffsets,
    AnimatedSchema.serialize,
    object.animated,
  );
  writer.writeObject<BlackWhite>(
    offsets[1],
    allOffsets,
    BlackWhiteSchema.serialize,
    object.blackWhite,
  );
  writer.writeObject<Gold>(
    offsets[2],
    allOffsets,
    GoldSchema.serialize,
    object.crystal,
  );
  writer.writeObject<DiamondPearl>(
    offsets[3],
    allOffsets,
    DiamondPearlSchema.serialize,
    object.diamondPearl,
  );
  writer.writeObject<RubySapphire>(
    offsets[4],
    allOffsets,
    RubySapphireSchema.serialize,
    object.emerald,
  );
  writer.writeObject<FireRedLeafGreen>(
    offsets[5],
    allOffsets,
    FireRedLeafGreenSchema.serialize,
    object.fireRedLeafGreen,
  );
  writer.writeObject<Gold>(
    offsets[6],
    allOffsets,
    GoldSchema.serialize,
    object.gold,
  );
  writer.writeObject<HeartGoldSoulSilver>(
    offsets[7],
    allOffsets,
    HeartGoldSoulSilverSchema.serialize,
    object.heartGoldSoulSilver,
  );
  writer.writeObject<Icons>(
    offsets[8],
    allOffsets,
    IconsSchema.serialize,
    object.icons,
  );
  writer.writeObject<OmegarubyAlphasapphire>(
    offsets[9],
    allOffsets,
    OmegarubyAlphasapphireSchema.serialize,
    object.omegaRubyAlphaSapphire,
  );
  writer.writeObject<DiamondPearl>(
    offsets[10],
    allOffsets,
    DiamondPearlSchema.serialize,
    object.platinum,
  );
  writer.writeObject<RedBlue>(
    offsets[11],
    allOffsets,
    RedBlueSchema.serialize,
    object.redBlue,
  );
  writer.writeObject<RubySapphire>(
    offsets[12],
    allOffsets,
    RubySapphireSchema.serialize,
    object.rubySapphire,
  );
  writer.writeObject<Gold>(
    offsets[13],
    allOffsets,
    GoldSchema.serialize,
    object.silver,
  );
  writer.writeObject<Icons>(
    offsets[14],
    allOffsets,
    IconsSchema.serialize,
    object.ultraSunUltraMoon,
  );
  writer.writeObject<Xy>(
    offsets[15],
    allOffsets,
    XySchema.serialize,
    object.xy,
  );
  writer.writeObject<RedBlue>(
    offsets[16],
    allOffsets,
    RedBlueSchema.serialize,
    object.yellow,
  );
}

GenerationDetails _generationDetailsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GenerationDetails(
    animated: reader.readObjectOrNull<Animated>(
      offsets[0],
      AnimatedSchema.deserialize,
      allOffsets,
    ),
    blackWhite: reader.readObjectOrNull<BlackWhite>(
      offsets[1],
      BlackWhiteSchema.deserialize,
      allOffsets,
    ),
    crystal: reader.readObjectOrNull<Gold>(
      offsets[2],
      GoldSchema.deserialize,
      allOffsets,
    ),
    diamondPearl: reader.readObjectOrNull<DiamondPearl>(
      offsets[3],
      DiamondPearlSchema.deserialize,
      allOffsets,
    ),
    emerald: reader.readObjectOrNull<RubySapphire>(
      offsets[4],
      RubySapphireSchema.deserialize,
      allOffsets,
    ),
    fireRedLeafGreen: reader.readObjectOrNull<FireRedLeafGreen>(
      offsets[5],
      FireRedLeafGreenSchema.deserialize,
      allOffsets,
    ),
    gold: reader.readObjectOrNull<Gold>(
      offsets[6],
      GoldSchema.deserialize,
      allOffsets,
    ),
    heartGoldSoulSilver: reader.readObjectOrNull<HeartGoldSoulSilver>(
      offsets[7],
      HeartGoldSoulSilverSchema.deserialize,
      allOffsets,
    ),
    icons: reader.readObjectOrNull<Icons>(
      offsets[8],
      IconsSchema.deserialize,
      allOffsets,
    ),
    omegaRubyAlphaSapphire: reader.readObjectOrNull<OmegarubyAlphasapphire>(
      offsets[9],
      OmegarubyAlphasapphireSchema.deserialize,
      allOffsets,
    ),
    platinum: reader.readObjectOrNull<DiamondPearl>(
      offsets[10],
      DiamondPearlSchema.deserialize,
      allOffsets,
    ),
    redBlue: reader.readObjectOrNull<RedBlue>(
      offsets[11],
      RedBlueSchema.deserialize,
      allOffsets,
    ),
    rubySapphire: reader.readObjectOrNull<RubySapphire>(
      offsets[12],
      RubySapphireSchema.deserialize,
      allOffsets,
    ),
    silver: reader.readObjectOrNull<Gold>(
      offsets[13],
      GoldSchema.deserialize,
      allOffsets,
    ),
    ultraSunUltraMoon: reader.readObjectOrNull<Icons>(
      offsets[14],
      IconsSchema.deserialize,
      allOffsets,
    ),
    xy: reader.readObjectOrNull<Xy>(
      offsets[15],
      XySchema.deserialize,
      allOffsets,
    ),
    yellow: reader.readObjectOrNull<RedBlue>(
      offsets[16],
      RedBlueSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _generationDetailsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Animated>(
        offset,
        AnimatedSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<BlackWhite>(
        offset,
        BlackWhiteSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Gold>(
        offset,
        GoldSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<DiamondPearl>(
        offset,
        DiamondPearlSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<RubySapphire>(
        offset,
        RubySapphireSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectOrNull<FireRedLeafGreen>(
        offset,
        FireRedLeafGreenSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readObjectOrNull<Gold>(
        offset,
        GoldSchema.deserialize,
        allOffsets,
      )) as P;
    case 7:
      return (reader.readObjectOrNull<HeartGoldSoulSilver>(
        offset,
        HeartGoldSoulSilverSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readObjectOrNull<Icons>(
        offset,
        IconsSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readObjectOrNull<OmegarubyAlphasapphire>(
        offset,
        OmegarubyAlphasapphireSchema.deserialize,
        allOffsets,
      )) as P;
    case 10:
      return (reader.readObjectOrNull<DiamondPearl>(
        offset,
        DiamondPearlSchema.deserialize,
        allOffsets,
      )) as P;
    case 11:
      return (reader.readObjectOrNull<RedBlue>(
        offset,
        RedBlueSchema.deserialize,
        allOffsets,
      )) as P;
    case 12:
      return (reader.readObjectOrNull<RubySapphire>(
        offset,
        RubySapphireSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readObjectOrNull<Gold>(
        offset,
        GoldSchema.deserialize,
        allOffsets,
      )) as P;
    case 14:
      return (reader.readObjectOrNull<Icons>(
        offset,
        IconsSchema.deserialize,
        allOffsets,
      )) as P;
    case 15:
      return (reader.readObjectOrNull<Xy>(
        offset,
        XySchema.deserialize,
        allOffsets,
      )) as P;
    case 16:
      return (reader.readObjectOrNull<RedBlue>(
        offset,
        RedBlueSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GenerationDetailsQueryFilter
    on QueryBuilder<GenerationDetails, GenerationDetails, QFilterCondition> {
  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      animatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'animated',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      animatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'animated',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      blackWhiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'blackWhite',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      blackWhiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'blackWhite',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      crystalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crystal',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      crystalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crystal',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      diamondPearlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diamondPearl',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      diamondPearlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diamondPearl',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      emeraldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emerald',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      emeraldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emerald',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      fireRedLeafGreenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fireRedLeafGreen',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      fireRedLeafGreenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fireRedLeafGreen',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      goldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gold',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      goldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gold',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      heartGoldSoulSilverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heartGoldSoulSilver',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      heartGoldSoulSilverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heartGoldSoulSilver',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      iconsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icons',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      iconsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icons',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      omegaRubyAlphaSapphireIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'omegaRubyAlphaSapphire',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      omegaRubyAlphaSapphireIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'omegaRubyAlphaSapphire',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      platinumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'platinum',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      platinumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'platinum',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      redBlueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'redBlue',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      redBlueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'redBlue',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      rubySapphireIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rubySapphire',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      rubySapphireIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rubySapphire',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      silverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'silver',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      silverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'silver',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      ultraSunUltraMoonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultraSunUltraMoon',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      ultraSunUltraMoonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultraSunUltraMoon',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      xyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xy',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      xyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xy',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      yellowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yellow',
      ));
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      yellowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yellow',
      ));
    });
  }
}

extension GenerationDetailsQueryObject
    on QueryBuilder<GenerationDetails, GenerationDetails, QFilterCondition> {
  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      animated(FilterQuery<Animated> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'animated');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      blackWhite(FilterQuery<BlackWhite> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'blackWhite');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      crystal(FilterQuery<Gold> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'crystal');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      diamondPearl(FilterQuery<DiamondPearl> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'diamondPearl');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      emerald(FilterQuery<RubySapphire> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'emerald');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      fireRedLeafGreen(FilterQuery<FireRedLeafGreen> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fireRedLeafGreen');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      gold(FilterQuery<Gold> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'gold');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      heartGoldSoulSilver(FilterQuery<HeartGoldSoulSilver> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'heartGoldSoulSilver');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      icons(FilterQuery<Icons> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'icons');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      omegaRubyAlphaSapphire(FilterQuery<OmegarubyAlphasapphire> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'omegaRubyAlphaSapphire');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      platinum(FilterQuery<DiamondPearl> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'platinum');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      redBlue(FilterQuery<RedBlue> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'redBlue');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      rubySapphire(FilterQuery<RubySapphire> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rubySapphire');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      silver(FilterQuery<Gold> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'silver');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      ultraSunUltraMoon(FilterQuery<Icons> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ultraSunUltraMoon');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition> xy(
      FilterQuery<Xy> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'xy');
    });
  }

  QueryBuilder<GenerationDetails, GenerationDetails, QAfterFilterCondition>
      yellow(FilterQuery<RedBlue> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'yellow');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RedBlueSchema = Schema(
  name: r'RedBlue',
  id: 7638652701505242197,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backGray': PropertySchema(
      id: 1,
      name: r'backGray',
      type: IsarType.string,
    ),
    r'backTransparent': PropertySchema(
      id: 2,
      name: r'backTransparent',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 3,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontGray': PropertySchema(
      id: 4,
      name: r'frontGray',
      type: IsarType.string,
    ),
    r'frontTransparent': PropertySchema(
      id: 5,
      name: r'frontTransparent',
      type: IsarType.string,
    )
  },
  estimateSize: _redBlueEstimateSize,
  serialize: _redBlueSerialize,
  deserialize: _redBlueDeserialize,
  deserializeProp: _redBlueDeserializeProp,
);

int _redBlueEstimateSize(
  RedBlue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backGray;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backTransparent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontGray;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontTransparent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _redBlueSerialize(
  RedBlue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backGray);
  writer.writeString(offsets[2], object.backTransparent);
  writer.writeString(offsets[3], object.frontDefault);
  writer.writeString(offsets[4], object.frontGray);
  writer.writeString(offsets[5], object.frontTransparent);
}

RedBlue _redBlueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RedBlue(
    backDefault: reader.readStringOrNull(offsets[0]),
    backGray: reader.readStringOrNull(offsets[1]),
    backTransparent: reader.readStringOrNull(offsets[2]),
    frontDefault: reader.readStringOrNull(offsets[3]),
    frontGray: reader.readStringOrNull(offsets[4]),
    frontTransparent: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _redBlueDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RedBlueQueryFilter
    on QueryBuilder<RedBlue, RedBlue, QFilterCondition> {
  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backGray',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backGray',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backGray',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backGray',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backGray',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backGrayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backGray',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backTransparent',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backTransparent',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backTransparent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> backTransparentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backTransparent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      backTransparentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontGray',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontGray',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontGray',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontGray',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontGray',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontGray',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontGrayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontGray',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontTransparent',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontTransparent',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontTransparentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontTransparentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontTransparent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition> frontTransparentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontTransparent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<RedBlue, RedBlue, QAfterFilterCondition>
      frontTransparentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontTransparent',
        value: '',
      ));
    });
  }
}

extension RedBlueQueryObject
    on QueryBuilder<RedBlue, RedBlue, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GoldSchema = Schema(
  name: r'Gold',
  id: -2711613783730319721,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 1,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backTransparent': PropertySchema(
      id: 2,
      name: r'backTransparent',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 3,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 4,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontTransparent': PropertySchema(
      id: 5,
      name: r'frontTransparent',
      type: IsarType.string,
    )
  },
  estimateSize: _goldEstimateSize,
  serialize: _goldSerialize,
  deserialize: _goldDeserialize,
  deserializeProp: _goldDeserializeProp,
);

int _goldEstimateSize(
  Gold object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backTransparent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontTransparent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _goldSerialize(
  Gold object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backShiny);
  writer.writeString(offsets[2], object.backTransparent);
  writer.writeString(offsets[3], object.frontDefault);
  writer.writeString(offsets[4], object.frontShiny);
  writer.writeString(offsets[5], object.frontTransparent);
}

Gold _goldDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Gold(
    backDefault: reader.readStringOrNull(offsets[0]),
    backShiny: reader.readStringOrNull(offsets[1]),
    backTransparent: reader.readStringOrNull(offsets[2]),
    frontDefault: reader.readStringOrNull(offsets[3]),
    frontShiny: reader.readStringOrNull(offsets[4]),
    frontTransparent: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _goldDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GoldQueryFilter on QueryBuilder<Gold, Gold, QFilterCondition> {
  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backTransparent',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backTransparent',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backTransparent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backTransparent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> backTransparentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontTransparent',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontTransparent',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontTransparent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontTransparent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontTransparent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontTransparent',
        value: '',
      ));
    });
  }

  QueryBuilder<Gold, Gold, QAfterFilterCondition> frontTransparentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontTransparent',
        value: '',
      ));
    });
  }
}

extension GoldQueryObject on QueryBuilder<Gold, Gold, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RubySapphireSchema = Schema(
  name: r'RubySapphire',
  id: -7091073253984632402,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 1,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 2,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 3,
      name: r'frontShiny',
      type: IsarType.string,
    )
  },
  estimateSize: _rubySapphireEstimateSize,
  serialize: _rubySapphireSerialize,
  deserialize: _rubySapphireDeserialize,
  deserializeProp: _rubySapphireDeserializeProp,
);

int _rubySapphireEstimateSize(
  RubySapphire object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rubySapphireSerialize(
  RubySapphire object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backShiny);
  writer.writeString(offsets[2], object.frontDefault);
  writer.writeString(offsets[3], object.frontShiny);
}

RubySapphire _rubySapphireDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RubySapphire(
    backDefault: reader.readStringOrNull(offsets[0]),
    backShiny: reader.readStringOrNull(offsets[1]),
    frontDefault: reader.readStringOrNull(offsets[2]),
    frontShiny: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _rubySapphireDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RubySapphireQueryFilter
    on QueryBuilder<RubySapphire, RubySapphire, QFilterCondition> {
  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<RubySapphire, RubySapphire, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }
}

extension RubySapphireQueryObject
    on QueryBuilder<RubySapphire, RubySapphire, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FireRedLeafGreenSchema = Schema(
  name: r'FireRedLeafGreen',
  id: -4384750430415023500,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 1,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 2,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 3,
      name: r'frontShiny',
      type: IsarType.string,
    )
  },
  estimateSize: _fireRedLeafGreenEstimateSize,
  serialize: _fireRedLeafGreenSerialize,
  deserialize: _fireRedLeafGreenDeserialize,
  deserializeProp: _fireRedLeafGreenDeserializeProp,
);

int _fireRedLeafGreenEstimateSize(
  FireRedLeafGreen object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _fireRedLeafGreenSerialize(
  FireRedLeafGreen object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backShiny);
  writer.writeString(offsets[2], object.frontDefault);
  writer.writeString(offsets[3], object.frontShiny);
}

FireRedLeafGreen _fireRedLeafGreenDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FireRedLeafGreen(
    backDefault: reader.readStringOrNull(offsets[0]),
    backShiny: reader.readStringOrNull(offsets[1]),
    frontDefault: reader.readStringOrNull(offsets[2]),
    frontShiny: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _fireRedLeafGreenDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FireRedLeafGreenQueryFilter
    on QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QFilterCondition> {
  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }
}

extension FireRedLeafGreenQueryObject
    on QueryBuilder<FireRedLeafGreen, FireRedLeafGreen, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DiamondPearlSchema = Schema(
  name: r'DiamondPearl',
  id: -3632292849884458345,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backFemale': PropertySchema(
      id: 1,
      name: r'backFemale',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 2,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backShinyFemale': PropertySchema(
      id: 3,
      name: r'backShinyFemale',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 4,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 5,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 6,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 7,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _diamondPearlEstimateSize,
  serialize: _diamondPearlSerialize,
  deserialize: _diamondPearlDeserialize,
  deserializeProp: _diamondPearlDeserializeProp,
);

int _diamondPearlEstimateSize(
  DiamondPearl object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _diamondPearlSerialize(
  DiamondPearl object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backFemale);
  writer.writeString(offsets[2], object.backShiny);
  writer.writeString(offsets[3], object.backShinyFemale);
  writer.writeString(offsets[4], object.frontDefault);
  writer.writeString(offsets[5], object.frontFemale);
  writer.writeString(offsets[6], object.frontShiny);
  writer.writeString(offsets[7], object.frontShinyFemale);
}

DiamondPearl _diamondPearlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiamondPearl(
    backDefault: reader.readStringOrNull(offsets[0]),
    backFemale: reader.readStringOrNull(offsets[1]),
    backShiny: reader.readStringOrNull(offsets[2]),
    backShinyFemale: reader.readStringOrNull(offsets[3]),
    frontDefault: reader.readStringOrNull(offsets[4]),
    frontFemale: reader.readStringOrNull(offsets[5]),
    frontShiny: reader.readStringOrNull(offsets[6]),
    frontShinyFemale: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _diamondPearlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DiamondPearlQueryFilter
    on QueryBuilder<DiamondPearl, DiamondPearl, QFilterCondition> {
  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      backShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<DiamondPearl, DiamondPearl, QAfterFilterCondition>
      frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension DiamondPearlQueryObject
    on QueryBuilder<DiamondPearl, DiamondPearl, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HeartGoldSoulSilverSchema = Schema(
  name: r'HeartGoldSoulSilver',
  id: -8670084114213545558,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backFemale': PropertySchema(
      id: 1,
      name: r'backFemale',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 2,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backShinyFemale': PropertySchema(
      id: 3,
      name: r'backShinyFemale',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 4,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 5,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 6,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 7,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _heartGoldSoulSilverEstimateSize,
  serialize: _heartGoldSoulSilverSerialize,
  deserialize: _heartGoldSoulSilverDeserialize,
  deserializeProp: _heartGoldSoulSilverDeserializeProp,
);

int _heartGoldSoulSilverEstimateSize(
  HeartGoldSoulSilver object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _heartGoldSoulSilverSerialize(
  HeartGoldSoulSilver object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backFemale);
  writer.writeString(offsets[2], object.backShiny);
  writer.writeString(offsets[3], object.backShinyFemale);
  writer.writeString(offsets[4], object.frontDefault);
  writer.writeString(offsets[5], object.frontFemale);
  writer.writeString(offsets[6], object.frontShiny);
  writer.writeString(offsets[7], object.frontShinyFemale);
}

HeartGoldSoulSilver _heartGoldSoulSilverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HeartGoldSoulSilver(
    backDefault: reader.readStringOrNull(offsets[0]),
    backFemale: reader.readStringOrNull(offsets[1]),
    backShiny: reader.readStringOrNull(offsets[2]),
    backShinyFemale: reader.readStringOrNull(offsets[3]),
    frontDefault: reader.readStringOrNull(offsets[4]),
    frontFemale: reader.readStringOrNull(offsets[5]),
    frontShiny: reader.readStringOrNull(offsets[6]),
    frontShinyFemale: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _heartGoldSoulSilverDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension HeartGoldSoulSilverQueryFilter on QueryBuilder<HeartGoldSoulSilver,
    HeartGoldSoulSilver, QFilterCondition> {
  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      backShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<HeartGoldSoulSilver, HeartGoldSoulSilver, QAfterFilterCondition>
      frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension HeartGoldSoulSilverQueryObject on QueryBuilder<HeartGoldSoulSilver,
    HeartGoldSoulSilver, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BlackWhiteSchema = Schema(
  name: r'BlackWhite',
  id: 5391536512687860243,
  properties: {
    r'animated': PropertySchema(
      id: 0,
      name: r'animated',
      type: IsarType.object,
      target: r'Animated',
    ),
    r'backDefault': PropertySchema(
      id: 1,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backFemale': PropertySchema(
      id: 2,
      name: r'backFemale',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 3,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backShinyFemale': PropertySchema(
      id: 4,
      name: r'backShinyFemale',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 5,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 6,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 7,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 8,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _blackWhiteEstimateSize,
  serialize: _blackWhiteSerialize,
  deserialize: _blackWhiteDeserialize,
  deserializeProp: _blackWhiteDeserializeProp,
);

int _blackWhiteEstimateSize(
  BlackWhite object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.animated;
    if (value != null) {
      bytesCount += 3 +
          AnimatedSchema.estimateSize(value, allOffsets[Animated]!, allOffsets);
    }
  }
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _blackWhiteSerialize(
  BlackWhite object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Animated>(
    offsets[0],
    allOffsets,
    AnimatedSchema.serialize,
    object.animated,
  );
  writer.writeString(offsets[1], object.backDefault);
  writer.writeString(offsets[2], object.backFemale);
  writer.writeString(offsets[3], object.backShiny);
  writer.writeString(offsets[4], object.backShinyFemale);
  writer.writeString(offsets[5], object.frontDefault);
  writer.writeString(offsets[6], object.frontFemale);
  writer.writeString(offsets[7], object.frontShiny);
  writer.writeString(offsets[8], object.frontShinyFemale);
}

BlackWhite _blackWhiteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlackWhite(
    animated: reader.readObjectOrNull<Animated>(
      offsets[0],
      AnimatedSchema.deserialize,
      allOffsets,
    ),
    backDefault: reader.readStringOrNull(offsets[1]),
    backFemale: reader.readStringOrNull(offsets[2]),
    backShiny: reader.readStringOrNull(offsets[3]),
    backShinyFemale: reader.readStringOrNull(offsets[4]),
    frontDefault: reader.readStringOrNull(offsets[5]),
    frontFemale: reader.readStringOrNull(offsets[6]),
    frontShiny: reader.readStringOrNull(offsets[7]),
    frontShinyFemale: reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _blackWhiteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Animated>(
        offset,
        AnimatedSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BlackWhiteQueryFilter
    on QueryBuilder<BlackWhite, BlackWhite, QFilterCondition> {
  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> animatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'animated',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      animatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'animated',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> backShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      backShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> frontShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition>
      frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension BlackWhiteQueryObject
    on QueryBuilder<BlackWhite, BlackWhite, QFilterCondition> {
  QueryBuilder<BlackWhite, BlackWhite, QAfterFilterCondition> animated(
      FilterQuery<Animated> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'animated');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnimatedSchema = Schema(
  name: r'Animated',
  id: -3749877267538791408,
  properties: {
    r'backDefault': PropertySchema(
      id: 0,
      name: r'backDefault',
      type: IsarType.string,
    ),
    r'backFemale': PropertySchema(
      id: 1,
      name: r'backFemale',
      type: IsarType.string,
    ),
    r'backShiny': PropertySchema(
      id: 2,
      name: r'backShiny',
      type: IsarType.string,
    ),
    r'backShinyFemale': PropertySchema(
      id: 3,
      name: r'backShinyFemale',
      type: IsarType.string,
    ),
    r'frontDefault': PropertySchema(
      id: 4,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 5,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 6,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 7,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _animatedEstimateSize,
  serialize: _animatedSerialize,
  deserialize: _animatedDeserialize,
  deserializeProp: _animatedDeserializeProp,
);

int _animatedEstimateSize(
  Animated object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animatedSerialize(
  Animated object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backDefault);
  writer.writeString(offsets[1], object.backFemale);
  writer.writeString(offsets[2], object.backShiny);
  writer.writeString(offsets[3], object.backShinyFemale);
  writer.writeString(offsets[4], object.frontDefault);
  writer.writeString(offsets[5], object.frontFemale);
  writer.writeString(offsets[6], object.frontShiny);
  writer.writeString(offsets[7], object.frontShinyFemale);
}

Animated _animatedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Animated(
    backDefault: reader.readStringOrNull(offsets[0]),
    backFemale: reader.readStringOrNull(offsets[1]),
    backShiny: reader.readStringOrNull(offsets[2]),
    backShinyFemale: reader.readStringOrNull(offsets[3]),
    frontDefault: reader.readStringOrNull(offsets[4]),
    frontFemale: reader.readStringOrNull(offsets[5]),
    frontShiny: reader.readStringOrNull(offsets[6]),
    frontShinyFemale: reader.readStringOrNull(offsets[7]),
  );
  return object;
}

P _animatedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnimatedQueryFilter
    on QueryBuilder<Animated, Animated, QFilterCondition> {
  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backDefault',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShiny',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> backShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backShinyFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      backShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Animated, Animated, QAfterFilterCondition>
      frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension AnimatedQueryObject
    on QueryBuilder<Animated, Animated, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const XySchema = Schema(
  name: r'Xy',
  id: -683048895802842632,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 1,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 2,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 3,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _xyEstimateSize,
  serialize: _xySerialize,
  deserialize: _xyDeserialize,
  deserializeProp: _xyDeserializeProp,
);

int _xyEstimateSize(
  Xy object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _xySerialize(
  Xy object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontFemale);
  writer.writeString(offsets[2], object.frontShiny);
  writer.writeString(offsets[3], object.frontShinyFemale);
}

Xy _xyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Xy(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontFemale: reader.readStringOrNull(offsets[1]),
    frontShiny: reader.readStringOrNull(offsets[2]),
    frontShinyFemale: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _xyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension XyQueryFilter on QueryBuilder<Xy, Xy, QFilterCondition> {
  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Xy, Xy, QAfterFilterCondition> frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension XyQueryObject on QueryBuilder<Xy, Xy, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const OmegarubyAlphasapphireSchema = Schema(
  name: r'OmegarubyAlphasapphire',
  id: -2939780885019619706,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 1,
      name: r'frontFemale',
      type: IsarType.string,
    ),
    r'frontShiny': PropertySchema(
      id: 2,
      name: r'frontShiny',
      type: IsarType.string,
    ),
    r'frontShinyFemale': PropertySchema(
      id: 3,
      name: r'frontShinyFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _omegarubyAlphasapphireEstimateSize,
  serialize: _omegarubyAlphasapphireSerialize,
  deserialize: _omegarubyAlphasapphireDeserialize,
  deserializeProp: _omegarubyAlphasapphireDeserializeProp,
);

int _omegarubyAlphasapphireEstimateSize(
  OmegarubyAlphasapphire object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShiny;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontShinyFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _omegarubyAlphasapphireSerialize(
  OmegarubyAlphasapphire object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontFemale);
  writer.writeString(offsets[2], object.frontShiny);
  writer.writeString(offsets[3], object.frontShinyFemale);
}

OmegarubyAlphasapphire _omegarubyAlphasapphireDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OmegarubyAlphasapphire(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontFemale: reader.readStringOrNull(offsets[1]),
    frontShiny: reader.readStringOrNull(offsets[2]),
    frontShinyFemale: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _omegarubyAlphasapphireDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension OmegarubyAlphasapphireQueryFilter on QueryBuilder<
    OmegarubyAlphasapphire, OmegarubyAlphasapphire, QFilterCondition> {
  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontDefaultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontDefaultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShiny',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShiny',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontShinyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShiny',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontShinyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShiny',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShiny',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontShinyFemale',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontShinyFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontShinyFemaleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontShinyFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
          QAfterFilterCondition>
      frontShinyFemaleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontShinyFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<OmegarubyAlphasapphire, OmegarubyAlphasapphire,
      QAfterFilterCondition> frontShinyFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontShinyFemale',
        value: '',
      ));
    });
  }
}

extension OmegarubyAlphasapphireQueryObject on QueryBuilder<
    OmegarubyAlphasapphire, OmegarubyAlphasapphire, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IconsSchema = Schema(
  name: r'Icons',
  id: 3047615925134683506,
  properties: {
    r'frontDefault': PropertySchema(
      id: 0,
      name: r'frontDefault',
      type: IsarType.string,
    ),
    r'frontFemale': PropertySchema(
      id: 1,
      name: r'frontFemale',
      type: IsarType.string,
    )
  },
  estimateSize: _iconsEstimateSize,
  serialize: _iconsSerialize,
  deserialize: _iconsDeserialize,
  deserializeProp: _iconsDeserializeProp,
);

int _iconsEstimateSize(
  Icons object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frontDefault;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frontFemale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _iconsSerialize(
  Icons object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.frontDefault);
  writer.writeString(offsets[1], object.frontFemale);
}

Icons _iconsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Icons(
    frontDefault: reader.readStringOrNull(offsets[0]),
    frontFemale: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _iconsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IconsQueryFilter on QueryBuilder<Icons, Icons, QFilterCondition> {
  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontDefault',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontDefault',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontDefault',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontDefault',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontDefaultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontDefault',
        value: '',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frontFemale',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frontFemale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frontFemale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frontFemale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frontFemale',
        value: '',
      ));
    });
  }

  QueryBuilder<Icons, Icons, QAfterFilterCondition> frontFemaleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frontFemale',
        value: '',
      ));
    });
  }
}

extension IconsQueryObject on QueryBuilder<Icons, Icons, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) =>
    PokemonDetails(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      baseExperience: (json['base_experience'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      isDefault: json['is_default'] as bool?,
      order: (json['order'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilityName.fromJson(e as Map<String, dynamic>))
          .toList(),
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>?)
          ?.map((e) => GameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      heldItems: (json['held_items'] as List<dynamic>?)
          ?.map((e) => HeldItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationAreaEncounters: json['location_area_encounters'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => MoveName.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => StatInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailsToJson(PokemonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'forms': instance.forms,
      'game_indices': instance.gameIndices,
      'held_items': instance.heldItems,
      'location_area_encounters': instance.locationAreaEncounters,
      'moves': instance.moves,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };

AbilityName _$AbilityNameFromJson(Map<String, dynamic> json) => AbilityName(
      isHidden: json['is_hidden'] as bool?,
      slot: (json['slot'] as num?)?.toInt(),
      ability: json['ability'] == null
          ? null
          : Species.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityNameToJson(AbilityName instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GameIndex _$GameIndexFromJson(Map<String, dynamic> json) => GameIndex(
      gameIndex: (json['game_index'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GameIndexToJson(GameIndex instance) => <String, dynamic>{
      'game_index': instance.gameIndex,
      'version': instance.version,
    };

HeldItem _$HeldItemFromJson(Map<String, dynamic> json) => HeldItem(
      item: json['item'] == null
          ? null
          : Species.fromJson(json['item'] as Map<String, dynamic>),
      versionDetails: (json['version_details'] as List<dynamic>?)
          ?.map((e) => VersionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeldItemToJson(HeldItem instance) => <String, dynamic>{
      'item': instance.item,
      'version_details': instance.versionDetails,
    };

VersionDetail _$VersionDetailFromJson(Map<String, dynamic> json) =>
    VersionDetail(
      rarity: (json['rarity'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionDetailToJson(VersionDetail instance) =>
    <String, dynamic>{
      'rarity': instance.rarity,
      'version': instance.version,
    };

MoveName _$MoveNameFromJson(Map<String, dynamic> json) => MoveName(
      move: json['move'] == null
          ? null
          : Species.fromJson(json['move'] as Map<String, dynamic>),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
          ?.map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveNameToJson(MoveName instance) => <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.versionGroupDetails,
    };

VersionGroupDetail _$VersionGroupDetailFromJson(Map<String, dynamic> json) =>
    VersionGroupDetail(
      levelLearnedAt: (json['level_learned_at'] as num?)?.toInt(),
      moveLearnMethod: json['move_learn_method'] == null
          ? null
          : Species.fromJson(json['move_learn_method'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : Species.fromJson(json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupDetailToJson(VersionGroupDetail instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
      other: json['other'] == null
          ? null
          : OtherSprite.fromJson(json['other'] as Map<String, dynamic>),
      versions: json['versions'] == null
          ? null
          : Versions.fromJson(json['versions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
      'other': instance.other,
      'versions': instance.versions,
    };

OtherSprite _$OtherSpriteFromJson(Map<String, dynamic> json) => OtherSprite(
      dreamWorld: json['dream_world'] == null
          ? null
          : DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>),
      home: json['home'] == null
          ? null
          : Home.fromJson(json['home'] as Map<String, dynamic>),
      officialArtwork: json['official-artwork'] == null
          ? null
          : OfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherSpriteToJson(OtherSprite instance) =>
    <String, dynamic>{
      'dream_world': instance.dreamWorld,
      'home': instance.home,
      'official-artwork': instance.officialArtwork,
    };

DreamWorld _$DreamWorldFromJson(Map<String, dynamic> json) => DreamWorld(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$DreamWorldToJson(DreamWorld instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) =>
    OfficialArtwork(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$OfficialArtworkToJson(OfficialArtwork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) => StatInfo(
      baseStat: (json['base_stat'] as num?)?.toInt(),
      effort: (json['effort'] as num?)?.toInt(),
      stat: json['stat'] == null
          ? null
          : Species.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatInfoToJson(StatInfo instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      slot: (json['slot'] as num?)?.toInt(),
      type: json['type'] == null
          ? null
          : Species.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Versions _$VersionsFromJson(Map<String, dynamic> json) => Versions(
      generationI: json['generation-i'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-i'] as Map<String, dynamic>),
      generationIi: json['generation-ii'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-ii'] as Map<String, dynamic>),
      generationIii: json['generation-iii'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-iii'] as Map<String, dynamic>),
      generationIv: json['generation-iv'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-iv'] as Map<String, dynamic>),
      generationV: json['generation-v'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-v'] as Map<String, dynamic>),
      generationVi: json['generation-vi'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-vi'] as Map<String, dynamic>),
      generationVii: json['generation-vii'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-vii'] as Map<String, dynamic>),
      generationViii: json['generation-viii'] == null
          ? null
          : GenerationDetails.fromJson(
              json['generation-viii'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionsToJson(Versions instance) => <String, dynamic>{
      'generation-i': instance.generationI,
      'generation-ii': instance.generationIi,
      'generation-iii': instance.generationIii,
      'generation-iv': instance.generationIv,
      'generation-v': instance.generationV,
      'generation-vi': instance.generationVi,
      'generation-vii': instance.generationVii,
      'generation-viii': instance.generationViii,
    };

GenerationDetails _$GenerationDetailsFromJson(Map<String, dynamic> json) =>
    GenerationDetails(
      redBlue: json['red-blue'] == null
          ? null
          : RedBlue.fromJson(json['red-blue'] as Map<String, dynamic>),
      yellow: json['yellow'] == null
          ? null
          : RedBlue.fromJson(json['yellow'] as Map<String, dynamic>),
      gold: json['gold'] == null
          ? null
          : Gold.fromJson(json['gold'] as Map<String, dynamic>),
      silver: json['silver'] == null
          ? null
          : Gold.fromJson(json['silver'] as Map<String, dynamic>),
      crystal: json['crystal'] == null
          ? null
          : Gold.fromJson(json['crystal'] as Map<String, dynamic>),
      rubySapphire: json['rubysapphire'] == null
          ? null
          : RubySapphire.fromJson(json['rubysapphire'] as Map<String, dynamic>),
      emerald: json['emerald'] == null
          ? null
          : RubySapphire.fromJson(json['emerald'] as Map<String, dynamic>),
      fireRedLeafGreen: json['firered-leafgreen'] == null
          ? null
          : FireRedLeafGreen.fromJson(
              json['firered-leafgreen'] as Map<String, dynamic>),
      diamondPearl: json['diamond-pearl'] == null
          ? null
          : DiamondPearl.fromJson(
              json['diamond-pearl'] as Map<String, dynamic>),
      platinum: json['platinum'] == null
          ? null
          : DiamondPearl.fromJson(json['platinum'] as Map<String, dynamic>),
      heartGoldSoulSilver: json['heartgold-soulsilver'] == null
          ? null
          : HeartGoldSoulSilver.fromJson(
              json['heartgold-soulsilver'] as Map<String, dynamic>),
      blackWhite: json['black-white'] == null
          ? null
          : BlackWhite.fromJson(json['black-white'] as Map<String, dynamic>),
      xy: json['x-y'] == null
          ? null
          : Xy.fromJson(json['x-y'] as Map<String, dynamic>),
      omegaRubyAlphaSapphire: json['omegaruby-alphasapphire'] == null
          ? null
          : OmegarubyAlphasapphire.fromJson(
              json['omegaruby-alphasapphire'] as Map<String, dynamic>),
      icons: json['icons'] == null
          ? null
          : Icons.fromJson(json['icons'] as Map<String, dynamic>),
      ultraSunUltraMoon: json['ultra-sun-ultra-moon'] == null
          ? null
          : Icons.fromJson(
              json['ultra-sun-ultra-moon'] as Map<String, dynamic>),
      animated: json['animated'] == null
          ? null
          : Animated.fromJson(json['animated'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationDetailsToJson(GenerationDetails instance) =>
    <String, dynamic>{
      'red-blue': instance.redBlue,
      'yellow': instance.yellow,
      'gold': instance.gold,
      'silver': instance.silver,
      'crystal': instance.crystal,
      'rubysapphire': instance.rubySapphire,
      'emerald': instance.emerald,
      'firered-leafgreen': instance.fireRedLeafGreen,
      'diamond-pearl': instance.diamondPearl,
      'platinum': instance.platinum,
      'heartgold-soulsilver': instance.heartGoldSoulSilver,
      'black-white': instance.blackWhite,
      'x-y': instance.xy,
      'omegaruby-alphasapphire': instance.omegaRubyAlphaSapphire,
      'icons': instance.icons,
      'ultra-sun-ultra-moon': instance.ultraSunUltraMoon,
      'animated': instance.animated,
    };

RedBlue _$RedBlueFromJson(Map<String, dynamic> json) => RedBlue(
      backDefault: json['back_default'] as String?,
      backGray: json['back_gray'] as String?,
      backTransparent: json['back_transparent'] as String?,
      frontDefault: json['front_default'] as String?,
      frontGray: json['front_gray'] as String?,
      frontTransparent: json['front_transparent'] as String?,
    );

Map<String, dynamic> _$RedBlueToJson(RedBlue instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_gray': instance.backGray,
      'back_transparent': instance.backTransparent,
      'front_default': instance.frontDefault,
      'front_gray': instance.frontGray,
      'front_transparent': instance.frontTransparent,
    };

Gold _$GoldFromJson(Map<String, dynamic> json) => Gold(
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      backTransparent: json['back_transparent'] as String?,
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontTransparent: json['front_transparent'] as String?,
    );

Map<String, dynamic> _$GoldToJson(Gold instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'back_transparent': instance.backTransparent,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
      'front_transparent': instance.frontTransparent,
    };

RubySapphire _$RubySapphireFromJson(Map<String, dynamic> json) => RubySapphire(
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$RubySapphireToJson(RubySapphire instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };

FireRedLeafGreen _$FireRedLeafGreenFromJson(Map<String, dynamic> json) =>
    FireRedLeafGreen(
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
    );

Map<String, dynamic> _$FireRedLeafGreenToJson(FireRedLeafGreen instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_shiny': instance.backShiny,
      'front_default': instance.frontDefault,
      'front_shiny': instance.frontShiny,
    };

DiamondPearl _$DiamondPearlFromJson(Map<String, dynamic> json) => DiamondPearl(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$DiamondPearlToJson(DiamondPearl instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

HeartGoldSoulSilver _$HeartGoldSoulSilverFromJson(Map<String, dynamic> json) =>
    HeartGoldSoulSilver(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$HeartGoldSoulSilverToJson(
        HeartGoldSoulSilver instance) =>
    <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

BlackWhite _$BlackWhiteFromJson(Map<String, dynamic> json) => BlackWhite(
      animated: json['animated'] == null
          ? null
          : Animated.fromJson(json['animated'] as Map<String, dynamic>),
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$BlackWhiteToJson(BlackWhite instance) =>
    <String, dynamic>{
      'animated': instance.animated,
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

Animated _$AnimatedFromJson(Map<String, dynamic> json) => Animated(
      backDefault: json['back_default'] as String?,
      backFemale: json['back_female'] as String?,
      backShiny: json['back_shiny'] as String?,
      backShinyFemale: json['back_shiny_female'] as String?,
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$AnimatedToJson(Animated instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'back_female': instance.backFemale,
      'back_shiny': instance.backShiny,
      'back_shiny_female': instance.backShinyFemale,
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

Xy _$XyFromJson(Map<String, dynamic> json) => Xy(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$XyToJson(Xy instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

OmegarubyAlphasapphire _$OmegarubyAlphasapphireFromJson(
        Map<String, dynamic> json) =>
    OmegarubyAlphasapphire(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
      frontShiny: json['front_shiny'] as String?,
      frontShinyFemale: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$OmegarubyAlphasapphireToJson(
        OmegarubyAlphasapphire instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
      'front_shiny': instance.frontShiny,
      'front_shiny_female': instance.frontShinyFemale,
    };

Icons _$IconsFromJson(Map<String, dynamic> json) => Icons(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$IconsToJson(Icons instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };
