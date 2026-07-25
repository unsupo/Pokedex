// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokemonSpeciesCollection on Isar {
  IsarCollection<PokemonSpecies> get pokemonSpecies => this.collection();
}

const PokemonSpeciesSchema = CollectionSchema(
  name: r'PokemonSpecies',
  id: 8435672502614335400,
  properties: {
    r'baseHappiness': PropertySchema(
      id: 0,
      name: r'baseHappiness',
      type: IsarType.long,
    ),
    r'captureRate': PropertySchema(
      id: 1,
      name: r'captureRate',
      type: IsarType.long,
    ),
    r'color': PropertySchema(
      id: 2,
      name: r'color',
      type: IsarType.object,
      target: r'Species',
    ),
    r'eggGroups': PropertySchema(
      id: 3,
      name: r'eggGroups',
      type: IsarType.objectList,
      target: r'Species',
    ),
    r'evolvesFromSpecies': PropertySchema(
      id: 4,
      name: r'evolvesFromSpecies',
      type: IsarType.object,
      target: r'Species',
    ),
    r'flavorTextEntries': PropertySchema(
      id: 5,
      name: r'flavorTextEntries',
      type: IsarType.objectList,
      target: r'FlavorText',
    ),
    r'formDescriptions': PropertySchema(
      id: 6,
      name: r'formDescriptions',
      type: IsarType.objectList,
      target: r'FormDescription',
    ),
    r'formsSwitchable': PropertySchema(
      id: 7,
      name: r'formsSwitchable',
      type: IsarType.bool,
    ),
    r'genderRate': PropertySchema(
      id: 8,
      name: r'genderRate',
      type: IsarType.long,
    ),
    r'genera': PropertySchema(
      id: 9,
      name: r'genera',
      type: IsarType.objectList,
      target: r'Genus',
    ),
    r'generation': PropertySchema(
      id: 10,
      name: r'generation',
      type: IsarType.object,
      target: r'Species',
    ),
    r'growthRate': PropertySchema(
      id: 11,
      name: r'growthRate',
      type: IsarType.object,
      target: r'Species',
    ),
    r'habitat': PropertySchema(
      id: 12,
      name: r'habitat',
      type: IsarType.object,
      target: r'Species',
    ),
    r'hasGenderDifferences': PropertySchema(
      id: 13,
      name: r'hasGenderDifferences',
      type: IsarType.bool,
    ),
    r'hatchCounter': PropertySchema(
      id: 14,
      name: r'hatchCounter',
      type: IsarType.long,
    ),
    r'isBaby': PropertySchema(
      id: 15,
      name: r'isBaby',
      type: IsarType.bool,
    ),
    r'isLegendary': PropertySchema(
      id: 16,
      name: r'isLegendary',
      type: IsarType.bool,
    ),
    r'isMythical': PropertySchema(
      id: 17,
      name: r'isMythical',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 18,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 19,
      name: r'names',
      type: IsarType.objectList,
      target: r'Name',
    ),
    r'order': PropertySchema(
      id: 20,
      name: r'order',
      type: IsarType.long,
    ),
    r'palParkEncounters': PropertySchema(
      id: 21,
      name: r'palParkEncounters',
      type: IsarType.objectList,
      target: r'PalParkEncounter',
    ),
    r'pokedexNumbers': PropertySchema(
      id: 22,
      name: r'pokedexNumbers',
      type: IsarType.objectList,
      target: r'PokedexNumber',
    ),
    r'shape': PropertySchema(
      id: 23,
      name: r'shape',
      type: IsarType.object,
      target: r'Species',
    ),
    r'varieties': PropertySchema(
      id: 24,
      name: r'varieties',
      type: IsarType.objectList,
      target: r'Species',
    )
  },
  estimateSize: _pokemonSpeciesEstimateSize,
  serialize: _pokemonSpeciesSerialize,
  deserialize: _pokemonSpeciesDeserialize,
  deserializeProp: _pokemonSpeciesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Species': SpeciesSchema,
    r'FlavorText': FlavorTextSchema,
    r'FormDescription': FormDescriptionSchema,
    r'Genus': GenusSchema,
    r'Name': NameSchema,
    r'PalParkEncounter': PalParkEncounterSchema,
    r'PokedexNumber': PokedexNumberSchema
  },
  getId: _pokemonSpeciesGetId,
  getLinks: _pokemonSpeciesGetLinks,
  attach: _pokemonSpeciesAttach,
  version: '3.3.2',
);

int _pokemonSpeciesEstimateSize(
  PokemonSpecies object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.color;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final list = object.eggGroups;
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
    final value = object.evolvesFromSpecies;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final list = object.flavorTextEntries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FlavorText]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FlavorTextSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.formDescriptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FormDescription]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FormDescriptionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.genera;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Genus]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += GenusSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.generation;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.growthRate;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.habitat;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.names;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Name]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += NameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.palParkEncounters;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PalParkEncounter]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PalParkEncounterSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.pokedexNumbers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PokedexNumber]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PokedexNumberSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.shape;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final list = object.varieties;
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
  return bytesCount;
}

void _pokemonSpeciesSerialize(
  PokemonSpecies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.baseHappiness);
  writer.writeLong(offsets[1], object.captureRate);
  writer.writeObject<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.color,
  );
  writer.writeObjectList<Species>(
    offsets[3],
    allOffsets,
    SpeciesSchema.serialize,
    object.eggGroups,
  );
  writer.writeObject<Species>(
    offsets[4],
    allOffsets,
    SpeciesSchema.serialize,
    object.evolvesFromSpecies,
  );
  writer.writeObjectList<FlavorText>(
    offsets[5],
    allOffsets,
    FlavorTextSchema.serialize,
    object.flavorTextEntries,
  );
  writer.writeObjectList<FormDescription>(
    offsets[6],
    allOffsets,
    FormDescriptionSchema.serialize,
    object.formDescriptions,
  );
  writer.writeBool(offsets[7], object.formsSwitchable);
  writer.writeLong(offsets[8], object.genderRate);
  writer.writeObjectList<Genus>(
    offsets[9],
    allOffsets,
    GenusSchema.serialize,
    object.genera,
  );
  writer.writeObject<Species>(
    offsets[10],
    allOffsets,
    SpeciesSchema.serialize,
    object.generation,
  );
  writer.writeObject<Species>(
    offsets[11],
    allOffsets,
    SpeciesSchema.serialize,
    object.growthRate,
  );
  writer.writeObject<Species>(
    offsets[12],
    allOffsets,
    SpeciesSchema.serialize,
    object.habitat,
  );
  writer.writeBool(offsets[13], object.hasGenderDifferences);
  writer.writeLong(offsets[14], object.hatchCounter);
  writer.writeBool(offsets[15], object.isBaby);
  writer.writeBool(offsets[16], object.isLegendary);
  writer.writeBool(offsets[17], object.isMythical);
  writer.writeString(offsets[18], object.name);
  writer.writeObjectList<Name>(
    offsets[19],
    allOffsets,
    NameSchema.serialize,
    object.names,
  );
  writer.writeLong(offsets[20], object.order);
  writer.writeObjectList<PalParkEncounter>(
    offsets[21],
    allOffsets,
    PalParkEncounterSchema.serialize,
    object.palParkEncounters,
  );
  writer.writeObjectList<PokedexNumber>(
    offsets[22],
    allOffsets,
    PokedexNumberSchema.serialize,
    object.pokedexNumbers,
  );
  writer.writeObject<Species>(
    offsets[23],
    allOffsets,
    SpeciesSchema.serialize,
    object.shape,
  );
  writer.writeObjectList<Species>(
    offsets[24],
    allOffsets,
    SpeciesSchema.serialize,
    object.varieties,
  );
}

PokemonSpecies _pokemonSpeciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonSpecies(
    baseHappiness: reader.readLongOrNull(offsets[0]),
    captureRate: reader.readLongOrNull(offsets[1]),
    color: reader.readObjectOrNull<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    eggGroups: reader.readObjectList<Species>(
      offsets[3],
      SpeciesSchema.deserialize,
      allOffsets,
      Species(),
    ),
    evolvesFromSpecies: reader.readObjectOrNull<Species>(
      offsets[4],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    flavorTextEntries: reader.readObjectList<FlavorText>(
      offsets[5],
      FlavorTextSchema.deserialize,
      allOffsets,
      FlavorText(),
    ),
    formDescriptions: reader.readObjectList<FormDescription>(
      offsets[6],
      FormDescriptionSchema.deserialize,
      allOffsets,
      FormDescription(),
    ),
    formsSwitchable: reader.readBoolOrNull(offsets[7]),
    genderRate: reader.readLongOrNull(offsets[8]),
    genera: reader.readObjectList<Genus>(
      offsets[9],
      GenusSchema.deserialize,
      allOffsets,
      Genus(),
    ),
    generation: reader.readObjectOrNull<Species>(
      offsets[10],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    growthRate: reader.readObjectOrNull<Species>(
      offsets[11],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    habitat: reader.readObjectOrNull<Species>(
      offsets[12],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    hasGenderDifferences: reader.readBoolOrNull(offsets[13]),
    hatchCounter: reader.readLongOrNull(offsets[14]),
    id: id,
    isBaby: reader.readBoolOrNull(offsets[15]),
    isLegendary: reader.readBoolOrNull(offsets[16]),
    isMythical: reader.readBoolOrNull(offsets[17]),
    name: reader.readStringOrNull(offsets[18]),
    names: reader.readObjectList<Name>(
      offsets[19],
      NameSchema.deserialize,
      allOffsets,
      Name(),
    ),
    order: reader.readLongOrNull(offsets[20]),
    palParkEncounters: reader.readObjectList<PalParkEncounter>(
      offsets[21],
      PalParkEncounterSchema.deserialize,
      allOffsets,
      PalParkEncounter(),
    ),
    pokedexNumbers: reader.readObjectList<PokedexNumber>(
      offsets[22],
      PokedexNumberSchema.deserialize,
      allOffsets,
      PokedexNumber(),
    ),
    shape: reader.readObjectOrNull<Species>(
      offsets[23],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    varieties: reader.readObjectList<Species>(
      offsets[24],
      SpeciesSchema.deserialize,
      allOffsets,
      Species(),
    ),
  );
  return object;
}

P _pokemonSpeciesDeserializeProp<P>(
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
    case 3:
      return (reader.readObjectList<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
        Species(),
      )) as P;
    case 4:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectList<FlavorText>(
        offset,
        FlavorTextSchema.deserialize,
        allOffsets,
        FlavorText(),
      )) as P;
    case 6:
      return (reader.readObjectList<FormDescription>(
        offset,
        FormDescriptionSchema.deserialize,
        allOffsets,
        FormDescription(),
      )) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readObjectList<Genus>(
        offset,
        GenusSchema.deserialize,
        allOffsets,
        Genus(),
      )) as P;
    case 10:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 11:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 12:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readObjectList<Name>(
        offset,
        NameSchema.deserialize,
        allOffsets,
        Name(),
      )) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readObjectList<PalParkEncounter>(
        offset,
        PalParkEncounterSchema.deserialize,
        allOffsets,
        PalParkEncounter(),
      )) as P;
    case 22:
      return (reader.readObjectList<PokedexNumber>(
        offset,
        PokedexNumberSchema.deserialize,
        allOffsets,
        PokedexNumber(),
      )) as P;
    case 23:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 24:
      return (reader.readObjectList<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
        Species(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokemonSpeciesGetId(PokemonSpecies object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pokemonSpeciesGetLinks(PokemonSpecies object) {
  return [];
}

void _pokemonSpeciesAttach(
    IsarCollection<dynamic> col, Id id, PokemonSpecies object) {
  object.id = id;
}

extension PokemonSpeciesQueryWhereSort
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QWhere> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokemonSpeciesQueryWhere
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QWhereClause> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterWhereClause> idBetween(
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

extension PokemonSpeciesQueryFilter
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QFilterCondition> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseHappiness',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseHappiness',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      baseHappinessBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseHappiness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'captureRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'captureRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'captureRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'captureRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'captureRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      captureRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'captureRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eggGroups',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eggGroups',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'eggGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      evolvesFromSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evolvesFromSpecies',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      evolvesFromSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evolvesFromSpecies',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formDescriptions',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formDescriptions',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'formDescriptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formsSwitchableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formsSwitchable',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formsSwitchableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formsSwitchable',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formsSwitchableEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formsSwitchable',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genderRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genderRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genderRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genderRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genderRate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      genderRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genderRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genera',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genera',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genera',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      growthRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'growthRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      growthRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'growthRate',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      habitatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'habitat',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      habitatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'habitat',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hasGenderDifferencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasGenderDifferences',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hasGenderDifferencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasGenderDifferences',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hasGenderDifferencesEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGenderDifferences',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hatchCounter',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hatchCounter',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hatchCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hatchCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hatchCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      hatchCounterBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hatchCounter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isBabyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBaby',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isBabyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBaby',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isBabyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBaby',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isLegendaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLegendary',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isLegendaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLegendary',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isLegendaryEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLegendary',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isMythicalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMythical',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isMythicalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMythical',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      isMythicalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMythical',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'names',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
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

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'palParkEncounters',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'palParkEncounters',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'palParkEncounters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokedexNumbers',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokedexNumbers',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexNumbers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      shapeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shape',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      shapeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shape',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'varieties',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'varieties',
      ));
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'varieties',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PokemonSpeciesQueryObject
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QFilterCondition> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition> color(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'color');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      eggGroupsElement(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'eggGroups');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      evolvesFromSpecies(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'evolvesFromSpecies');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      flavorTextEntriesElement(FilterQuery<FlavorText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'flavorTextEntries');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      formDescriptionsElement(FilterQuery<FormDescription> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'formDescriptions');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generaElement(FilterQuery<Genus> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'genera');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      generation(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generation');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      growthRate(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'growthRate');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition> habitat(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'habitat');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      namesElement(FilterQuery<Name> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      palParkEncountersElement(FilterQuery<PalParkEncounter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'palParkEncounters');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      pokedexNumbersElement(FilterQuery<PokedexNumber> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokedexNumbers');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition> shape(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'shape');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterFilterCondition>
      varietiesElement(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'varieties');
    });
  }
}

extension PokemonSpeciesQueryLinks
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QFilterCondition> {}

extension PokemonSpeciesQuerySortBy
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QSortBy> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByBaseHappiness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseHappiness', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByBaseHappinessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseHappiness', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByCaptureRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureRate', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByCaptureRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureRate', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByFormsSwitchable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formsSwitchable', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByFormsSwitchableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formsSwitchable', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByGenderRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderRate', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByGenderRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderRate', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByHasGenderDifferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGenderDifferences', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByHasGenderDifferencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGenderDifferences', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByHatchCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hatchCounter', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByHatchCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hatchCounter', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> sortByIsBaby() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBaby', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByIsBabyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBaby', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByIsLegendary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLegendary', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByIsLegendaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLegendary', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByIsMythical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMythical', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      sortByIsMythicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMythical', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension PokemonSpeciesQuerySortThenBy
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QSortThenBy> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByBaseHappiness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseHappiness', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByBaseHappinessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseHappiness', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByCaptureRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureRate', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByCaptureRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'captureRate', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByFormsSwitchable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formsSwitchable', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByFormsSwitchableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formsSwitchable', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByGenderRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderRate', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByGenderRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderRate', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByHasGenderDifferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGenderDifferences', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByHasGenderDifferencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGenderDifferences', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByHatchCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hatchCounter', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByHatchCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hatchCounter', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByIsBaby() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBaby', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByIsBabyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBaby', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByIsLegendary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLegendary', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByIsLegendaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLegendary', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByIsMythical() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMythical', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy>
      thenByIsMythicalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMythical', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension PokemonSpeciesQueryWhereDistinct
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct> {
  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByBaseHappiness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseHappiness');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByCaptureRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'captureRate');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByFormsSwitchable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formsSwitchable');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByGenderRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genderRate');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByHasGenderDifferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGenderDifferences');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByHatchCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hatchCounter');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct> distinctByIsBaby() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBaby');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByIsLegendary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLegendary');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct>
      distinctByIsMythical() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMythical');
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PokemonSpecies, PokemonSpecies, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }
}

extension PokemonSpeciesQueryProperty
    on QueryBuilder<PokemonSpecies, PokemonSpecies, QQueryProperty> {
  QueryBuilder<PokemonSpecies, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PokemonSpecies, int?, QQueryOperations> baseHappinessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseHappiness');
    });
  }

  QueryBuilder<PokemonSpecies, int?, QQueryOperations> captureRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'captureRate');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<PokemonSpecies, List<Species>?, QQueryOperations>
      eggGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eggGroups');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations>
      evolvesFromSpeciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evolvesFromSpecies');
    });
  }

  QueryBuilder<PokemonSpecies, List<FlavorText>?, QQueryOperations>
      flavorTextEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flavorTextEntries');
    });
  }

  QueryBuilder<PokemonSpecies, List<FormDescription>?, QQueryOperations>
      formDescriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formDescriptions');
    });
  }

  QueryBuilder<PokemonSpecies, bool?, QQueryOperations>
      formsSwitchableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formsSwitchable');
    });
  }

  QueryBuilder<PokemonSpecies, int?, QQueryOperations> genderRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genderRate');
    });
  }

  QueryBuilder<PokemonSpecies, List<Genus>?, QQueryOperations>
      generaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genera');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations>
      generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations>
      growthRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'growthRate');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations> habitatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitat');
    });
  }

  QueryBuilder<PokemonSpecies, bool?, QQueryOperations>
      hasGenderDifferencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGenderDifferences');
    });
  }

  QueryBuilder<PokemonSpecies, int?, QQueryOperations> hatchCounterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hatchCounter');
    });
  }

  QueryBuilder<PokemonSpecies, bool?, QQueryOperations> isBabyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBaby');
    });
  }

  QueryBuilder<PokemonSpecies, bool?, QQueryOperations> isLegendaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLegendary');
    });
  }

  QueryBuilder<PokemonSpecies, bool?, QQueryOperations> isMythicalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMythical');
    });
  }

  QueryBuilder<PokemonSpecies, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PokemonSpecies, List<Name>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<PokemonSpecies, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<PokemonSpecies, List<PalParkEncounter>?, QQueryOperations>
      palParkEncountersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'palParkEncounters');
    });
  }

  QueryBuilder<PokemonSpecies, List<PokedexNumber>?, QQueryOperations>
      pokedexNumbersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokedexNumbers');
    });
  }

  QueryBuilder<PokemonSpecies, Species?, QQueryOperations> shapeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shape');
    });
  }

  QueryBuilder<PokemonSpecies, List<Species>?, QQueryOperations>
      varietiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'varieties');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEvolutionChainUrlCollection on Isar {
  IsarCollection<EvolutionChainUrl> get evolutionChainUrls => this.collection();
}

const EvolutionChainUrlSchema = CollectionSchema(
  name: r'EvolutionChainUrl',
  id: -6472774062969520687,
  properties: {
    r'url': PropertySchema(
      id: 0,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _evolutionChainUrlEstimateSize,
  serialize: _evolutionChainUrlSerialize,
  deserialize: _evolutionChainUrlDeserialize,
  deserializeProp: _evolutionChainUrlDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _evolutionChainUrlGetId,
  getLinks: _evolutionChainUrlGetLinks,
  attach: _evolutionChainUrlAttach,
  version: '3.3.2',
);

int _evolutionChainUrlEstimateSize(
  EvolutionChainUrl object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _evolutionChainUrlSerialize(
  EvolutionChainUrl object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.url);
}

EvolutionChainUrl _evolutionChainUrlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvolutionChainUrl(
    url: reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _evolutionChainUrlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evolutionChainUrlGetId(EvolutionChainUrl object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _evolutionChainUrlGetLinks(
    EvolutionChainUrl object) {
  return [];
}

void _evolutionChainUrlAttach(
    IsarCollection<dynamic> col, Id id, EvolutionChainUrl object) {
  object.id = id;
}

extension EvolutionChainUrlQueryWhereSort
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QWhere> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvolutionChainUrlQueryWhere
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QWhereClause> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterWhereClause>
      idBetween(
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

extension EvolutionChainUrlQueryFilter
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QFilterCondition> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlEqualTo(
    String value, {
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlGreaterThan(
    String value, {
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlLessThan(
    String value, {
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlBetween(
    String lower,
    String upper, {
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlStartsWith(
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlEndsWith(
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

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension EvolutionChainUrlQueryObject
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QFilterCondition> {}

extension EvolutionChainUrlQueryLinks
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QFilterCondition> {}

extension EvolutionChainUrlQuerySortBy
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QSortBy> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy>
      sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension EvolutionChainUrlQuerySortThenBy
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QSortThenBy> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QAfterSortBy>
      thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension EvolutionChainUrlQueryWhereDistinct
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QDistinct> {
  QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension EvolutionChainUrlQueryProperty
    on QueryBuilder<EvolutionChainUrl, EvolutionChainUrl, QQueryProperty> {
  QueryBuilder<EvolutionChainUrl, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EvolutionChainUrl, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FormDescriptionSchema = Schema(
  name: r'FormDescription',
  id: 7186515254422887950,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 1,
      name: r'language',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _formDescriptionEstimateSize,
  serialize: _formDescriptionSerialize,
  deserialize: _formDescriptionDeserialize,
  deserializeProp: _formDescriptionDeserializeProp,
);

int _formDescriptionEstimateSize(
  FormDescription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _formDescriptionSerialize(
  FormDescription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.language,
  );
}

FormDescription _formDescriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FormDescription(
    description: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _formDescriptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension FormDescriptionQueryFilter
    on QueryBuilder<FormDescription, FormDescription, QFilterCondition> {
  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }
}

extension FormDescriptionQueryObject
    on QueryBuilder<FormDescription, FormDescription, QFilterCondition> {
  QueryBuilder<FormDescription, FormDescription, QAfterFilterCondition>
      language(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FlavorTextSchema = Schema(
  name: r'FlavorText',
  id: 7847939112280314545,
  properties: {
    r'flavorText': PropertySchema(
      id: 0,
      name: r'flavorText',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 1,
      name: r'language',
      type: IsarType.object,
      target: r'Species',
    ),
    r'version': PropertySchema(
      id: 2,
      name: r'version',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _flavorTextEstimateSize,
  serialize: _flavorTextSerialize,
  deserialize: _flavorTextDeserialize,
  deserializeProp: _flavorTextDeserializeProp,
);

int _flavorTextEstimateSize(
  FlavorText object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.flavorText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _flavorTextSerialize(
  FlavorText object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.flavorText);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.language,
  );
  writer.writeObject<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.version,
  );
}

FlavorText _flavorTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlavorText(
    flavorText: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    version: reader.readObjectOrNull<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _flavorTextDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension FlavorTextQueryFilter
    on QueryBuilder<FlavorText, FlavorText, QFilterCondition> {
  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> flavorTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> flavorTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flavorText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> flavorTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flavorText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      flavorTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension FlavorTextQueryObject
    on QueryBuilder<FlavorText, FlavorText, QFilterCondition> {
  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> language(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> version(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GenusSchema = Schema(
  name: r'Genus',
  id: -3274943756369739870,
  properties: {
    r'genus': PropertySchema(
      id: 0,
      name: r'genus',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 1,
      name: r'language',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _genusEstimateSize,
  serialize: _genusSerialize,
  deserialize: _genusDeserialize,
  deserializeProp: _genusDeserializeProp,
);

int _genusEstimateSize(
  Genus object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.genus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _genusSerialize(
  Genus object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genus);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.language,
  );
}

Genus _genusDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Genus(
    genus: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _genusDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension GenusQueryFilter on QueryBuilder<Genus, Genus, QFilterCondition> {
  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genus',
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genus',
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genus',
        value: '',
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> genusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genus',
        value: '',
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Genus, Genus, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }
}

extension GenusQueryObject on QueryBuilder<Genus, Genus, QFilterCondition> {
  QueryBuilder<Genus, Genus, QAfterFilterCondition> language(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NameSchema = Schema(
  name: r'Name',
  id: 8655181185809606191,
  properties: {
    r'language': PropertySchema(
      id: 0,
      name: r'language',
      type: IsarType.object,
      target: r'Species',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _nameEstimateSize,
  serialize: _nameSerialize,
  deserialize: _nameDeserialize,
  deserializeProp: _nameDeserializeProp,
);

int _nameEstimateSize(
  Name object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nameSerialize(
  Name object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.language,
  );
  writer.writeString(offsets[1], object.name);
}

Name _nameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Name(
    language: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _nameDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NameQueryFilter on QueryBuilder<Name, Name, QFilterCondition> {
  QueryBuilder<Name, Name, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Name, Name, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension NameQueryObject on QueryBuilder<Name, Name, QFilterCondition> {
  QueryBuilder<Name, Name, QAfterFilterCondition> language(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PalParkEncounterSchema = Schema(
  name: r'PalParkEncounter',
  id: 9220801059127590025,
  properties: {
    r'area': PropertySchema(
      id: 0,
      name: r'area',
      type: IsarType.object,
      target: r'Species',
    ),
    r'baseScore': PropertySchema(
      id: 1,
      name: r'baseScore',
      type: IsarType.long,
    ),
    r'rate': PropertySchema(
      id: 2,
      name: r'rate',
      type: IsarType.long,
    )
  },
  estimateSize: _palParkEncounterEstimateSize,
  serialize: _palParkEncounterSerialize,
  deserialize: _palParkEncounterDeserialize,
  deserializeProp: _palParkEncounterDeserializeProp,
);

int _palParkEncounterEstimateSize(
  PalParkEncounter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.area;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _palParkEncounterSerialize(
  PalParkEncounter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Species>(
    offsets[0],
    allOffsets,
    SpeciesSchema.serialize,
    object.area,
  );
  writer.writeLong(offsets[1], object.baseScore);
  writer.writeLong(offsets[2], object.rate);
}

PalParkEncounter _palParkEncounterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PalParkEncounter(
    area: reader.readObjectOrNull<Species>(
      offsets[0],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    baseScore: reader.readLongOrNull(offsets[1]),
    rate: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _palParkEncounterDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PalParkEncounterQueryFilter
    on QueryBuilder<PalParkEncounter, PalParkEncounter, QFilterCondition> {
  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      areaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      areaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'area',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseScore',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseScore',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      baseScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition>
      rateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PalParkEncounterQueryObject
    on QueryBuilder<PalParkEncounter, PalParkEncounter, QFilterCondition> {
  QueryBuilder<PalParkEncounter, PalParkEncounter, QAfterFilterCondition> area(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'area');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokedexNumberSchema = Schema(
  name: r'PokedexNumber',
  id: -655763402369666502,
  properties: {
    r'entryNumber': PropertySchema(
      id: 0,
      name: r'entryNumber',
      type: IsarType.long,
    ),
    r'pokedex': PropertySchema(
      id: 1,
      name: r'pokedex',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _pokedexNumberEstimateSize,
  serialize: _pokedexNumberSerialize,
  deserialize: _pokedexNumberDeserialize,
  deserializeProp: _pokedexNumberDeserializeProp,
);

int _pokedexNumberEstimateSize(
  PokedexNumber object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pokedex;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _pokedexNumberSerialize(
  PokedexNumber object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.entryNumber);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.pokedex,
  );
}

PokedexNumber _pokedexNumberDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokedexNumber(
    entryNumber: reader.readLongOrNull(offsets[0]),
    pokedex: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _pokedexNumberDeserializeProp<P>(
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

extension PokedexNumberQueryFilter
    on QueryBuilder<PokedexNumber, PokedexNumber, QFilterCondition> {
  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entryNumber',
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entryNumber',
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      entryNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      pokedexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokedex',
      ));
    });
  }

  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition>
      pokedexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokedex',
      ));
    });
  }
}

extension PokedexNumberQueryObject
    on QueryBuilder<PokedexNumber, PokedexNumber, QFilterCondition> {
  QueryBuilder<PokedexNumber, PokedexNumber, QAfterFilterCondition> pokedex(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokedex');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpecies _$PokemonSpeciesFromJson(Map<String, dynamic> json) =>
    PokemonSpecies(
      id: (json['id'] as num).toInt(),
      baseHappiness: (json['base_happiness'] as num?)?.toInt(),
      captureRate: (json['capture_rate'] as num?)?.toInt(),
      color: json['color'] == null
          ? null
          : Species.fromJson(json['color'] as Map<String, dynamic>),
      eggGroups: (json['egg_groups'] as List<dynamic>?)
          ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionChain: json['evolution_chain'] == null
          ? null
          : EvolutionChainUrl.fromJson(
              json['evolution_chain'] as Map<String, dynamic>),
      evolvesFromSpecies: json['evolves_from_species'] == null
          ? null
          : Species.fromJson(
              json['evolves_from_species'] as Map<String, dynamic>),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      formDescriptions: (json['form_descriptions'] as List<dynamic>?)
          ?.map((e) => FormDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      formsSwitchable: json['forms_switchable'] as bool?,
      genderRate: (json['gender_rate'] as num?)?.toInt(),
      genera: (json['genera'] as List<dynamic>?)
          ?.map((e) => Genus.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: json['generation'] == null
          ? null
          : Species.fromJson(json['generation'] as Map<String, dynamic>),
      growthRate: json['growth_rate'] == null
          ? null
          : Species.fromJson(json['growth_rate'] as Map<String, dynamic>),
      habitat: json['habitat'] == null
          ? null
          : Species.fromJson(json['habitat'] as Map<String, dynamic>),
      hasGenderDifferences: json['has_gender_differences'] as bool?,
      hatchCounter: (json['hatch_counter'] as num?)?.toInt(),
      isBaby: json['is_baby'] as bool?,
      isLegendary: json['is_legendary'] as bool?,
      isMythical: json['is_mythical'] as bool?,
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['order'] as num?)?.toInt(),
      palParkEncounters: (json['pal_park_encounters'] as List<dynamic>?)
          ?.map((e) => PalParkEncounter.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexNumbers: (json['pokedex_numbers'] as List<dynamic>?)
          ?.map((e) => PokedexNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      shape: json['shape'] == null
          ? null
          : Species.fromJson(json['shape'] as Map<String, dynamic>),
      varieties: (json['varieties'] as List<dynamic>?)
          ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpeciesToJson(PokemonSpecies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_happiness': instance.baseHappiness,
      'capture_rate': instance.captureRate,
      'color': instance.color,
      'egg_groups': instance.eggGroups,
      'evolution_chain': instance.evolutionChain,
      'evolves_from_species': instance.evolvesFromSpecies,
      'flavor_text_entries': instance.flavorTextEntries,
      'form_descriptions': instance.formDescriptions,
      'forms_switchable': instance.formsSwitchable,
      'gender_rate': instance.genderRate,
      'genera': instance.genera,
      'generation': instance.generation,
      'growth_rate': instance.growthRate,
      'habitat': instance.habitat,
      'has_gender_differences': instance.hasGenderDifferences,
      'hatch_counter': instance.hatchCounter,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
      'name': instance.name,
      'names': instance.names,
      'order': instance.order,
      'pal_park_encounters': instance.palParkEncounters,
      'pokedex_numbers': instance.pokedexNumbers,
      'shape': instance.shape,
      'varieties': instance.varieties,
    };

FormDescription _$FormDescriptionFromJson(Map<String, dynamic> json) =>
    FormDescription(
      description: json['description'] as String?,
      language: json['language'] == null
          ? null
          : Species.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormDescriptionToJson(FormDescription instance) =>
    <String, dynamic>{
      'description': instance.description,
      'language': instance.language,
    };

EvolutionChainUrl _$EvolutionChainUrlFromJson(Map<String, dynamic> json) =>
    EvolutionChainUrl(
      url: json['url'] as String,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$EvolutionChainUrlToJson(EvolutionChainUrl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

FlavorText _$FlavorTextFromJson(Map<String, dynamic> json) => FlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : Species.fromJson(json['language'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : Species.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextToJson(FlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

Genus _$GenusFromJson(Map<String, dynamic> json) => Genus(
      genus: json['genus'] as String?,
      language: json['language'] == null
          ? null
          : Species.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenusToJson(Genus instance) => <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      language: json['language'] == null
          ? null
          : Species.fromJson(json['language'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'language': instance.language,
      'name': instance.name,
    };

PalParkEncounter _$PalParkEncounterFromJson(Map<String, dynamic> json) =>
    PalParkEncounter(
      area: json['area'] == null
          ? null
          : Species.fromJson(json['area'] as Map<String, dynamic>),
      baseScore: (json['base_score'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PalParkEncounterToJson(PalParkEncounter instance) =>
    <String, dynamic>{
      'area': instance.area,
      'base_score': instance.baseScore,
      'rate': instance.rate,
    };

PokedexNumber _$PokedexNumberFromJson(Map<String, dynamic> json) =>
    PokedexNumber(
      entryNumber: (json['entry_number'] as num?)?.toInt(),
      pokedex: json['pokedex'] == null
          ? null
          : Species.fromJson(json['pokedex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokedexNumberToJson(PokedexNumber instance) =>
    <String, dynamic>{
      'entry_number': instance.entryNumber,
      'pokedex': instance.pokedex,
    };
