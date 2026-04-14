// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEvolutionChainCollection on Isar {
  IsarCollection<EvolutionChain> get evolutionChains => this.collection();
}

const EvolutionChainSchema = CollectionSchema(
  name: r'EvolutionChain',
  id: -6057061424654642886,
  properties: {
    r'babyTriggerItem': PropertySchema(
      id: 0,
      name: r'babyTriggerItem',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'chain': PropertySchema(
      id: 1,
      name: r'chain',
      type: IsarType.object,
      target: r'ChainLink',
    )
  },
  estimateSize: _evolutionChainEstimateSize,
  serialize: _evolutionChainSerialize,
  deserialize: _evolutionChainDeserialize,
  deserializeProp: _evolutionChainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ChainLink': ChainLinkSchema,
    r'Species': SpeciesSchema,
    r'EvolutionDetail': EvolutionDetailSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _evolutionChainGetId,
  getLinks: _evolutionChainGetLinks,
  attach: _evolutionChainAttach,
  version: '3.1.8',
);

int _evolutionChainEstimateSize(
  EvolutionChain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.babyTriggerItem;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  bytesCount += 3 +
      ChainLinkSchema.estimateSize(
          object.chain, allOffsets[ChainLink]!, allOffsets);
  return bytesCount;
}

void _evolutionChainSerialize(
  EvolutionChain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.babyTriggerItem,
  );
  writer.writeObject<ChainLink>(
    offsets[1],
    allOffsets,
    ChainLinkSchema.serialize,
    object.chain,
  );
}

EvolutionChain _evolutionChainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvolutionChain(
    babyTriggerItem: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    chain: reader.readObjectOrNull<ChainLink>(
          offsets[1],
          ChainLinkSchema.deserialize,
          allOffsets,
        ) ??
        ChainLink(),
    id: id,
  );
  return object;
}

P _evolutionChainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<ChainLink>(
            offset,
            ChainLinkSchema.deserialize,
            allOffsets,
          ) ??
          ChainLink()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evolutionChainGetId(EvolutionChain object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _evolutionChainGetLinks(EvolutionChain object) {
  return [];
}

void _evolutionChainAttach(
    IsarCollection<dynamic> col, Id id, EvolutionChain object) {}

extension EvolutionChainQueryWhereSort
    on QueryBuilder<EvolutionChain, EvolutionChain, QWhere> {
  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvolutionChainQueryWhere
    on QueryBuilder<EvolutionChain, EvolutionChain, QWhereClause> {
  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterWhereClause> idBetween(
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

extension EvolutionChainQueryFilter
    on QueryBuilder<EvolutionChain, EvolutionChain, QFilterCondition> {
  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition>
      babyTriggerItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'babyTriggerItem',
      ));
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition>
      babyTriggerItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'babyTriggerItem',
      ));
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition>
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

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition>
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

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition> idBetween(
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
}

extension EvolutionChainQueryObject
    on QueryBuilder<EvolutionChain, EvolutionChain, QFilterCondition> {
  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition>
      babyTriggerItem(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'babyTriggerItem');
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterFilterCondition> chain(
      FilterQuery<ChainLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'chain');
    });
  }
}

extension EvolutionChainQueryLinks
    on QueryBuilder<EvolutionChain, EvolutionChain, QFilterCondition> {}

extension EvolutionChainQuerySortBy
    on QueryBuilder<EvolutionChain, EvolutionChain, QSortBy> {}

extension EvolutionChainQuerySortThenBy
    on QueryBuilder<EvolutionChain, EvolutionChain, QSortThenBy> {
  QueryBuilder<EvolutionChain, EvolutionChain, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvolutionChain, EvolutionChain, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension EvolutionChainQueryWhereDistinct
    on QueryBuilder<EvolutionChain, EvolutionChain, QDistinct> {}

extension EvolutionChainQueryProperty
    on QueryBuilder<EvolutionChain, EvolutionChain, QQueryProperty> {
  QueryBuilder<EvolutionChain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EvolutionChain, NamedApiResource?, QQueryOperations>
      babyTriggerItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'babyTriggerItem');
    });
  }

  QueryBuilder<EvolutionChain, ChainLink, QQueryOperations> chainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chain');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ChainLinkSchema = Schema(
  name: r'ChainLink',
  id: 8940119448044778683,
  properties: {
    r'evolutionDetails': PropertySchema(
      id: 0,
      name: r'evolutionDetails',
      type: IsarType.objectList,
      target: r'EvolutionDetail',
    ),
    r'evolvesTo': PropertySchema(
      id: 1,
      name: r'evolvesTo',
      type: IsarType.objectList,
      target: r'ChainLink',
    ),
    r'isBaby': PropertySchema(
      id: 2,
      name: r'isBaby',
      type: IsarType.bool,
    ),
    r'species': PropertySchema(
      id: 3,
      name: r'species',
      type: IsarType.object,
      target: r'Species',
    )
  },
  estimateSize: _chainLinkEstimateSize,
  serialize: _chainLinkSerialize,
  deserialize: _chainLinkDeserialize,
  deserializeProp: _chainLinkDeserializeProp,
);

int _chainLinkEstimateSize(
  ChainLink object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.evolutionDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[EvolutionDetail]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              EvolutionDetailSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.evolvesTo;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ChainLink]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ChainLinkSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.species;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _chainLinkSerialize(
  ChainLink object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<EvolutionDetail>(
    offsets[0],
    allOffsets,
    EvolutionDetailSchema.serialize,
    object.evolutionDetails,
  );
  writer.writeObjectList<ChainLink>(
    offsets[1],
    allOffsets,
    ChainLinkSchema.serialize,
    object.evolvesTo,
  );
  writer.writeBool(offsets[2], object.isBaby);
  writer.writeObject<Species>(
    offsets[3],
    allOffsets,
    SpeciesSchema.serialize,
    object.species,
  );
}

ChainLink _chainLinkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChainLink(
    evolutionDetails: reader.readObjectList<EvolutionDetail>(
      offsets[0],
      EvolutionDetailSchema.deserialize,
      allOffsets,
      EvolutionDetail(),
    ),
    evolvesTo: reader.readObjectList<ChainLink>(
      offsets[1],
      ChainLinkSchema.deserialize,
      allOffsets,
      ChainLink(),
    ),
    isBaby: reader.readBoolOrNull(offsets[2]),
    species: reader.readObjectOrNull<Species>(
      offsets[3],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _chainLinkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<EvolutionDetail>(
        offset,
        EvolutionDetailSchema.deserialize,
        allOffsets,
        EvolutionDetail(),
      )) as P;
    case 1:
      return (reader.readObjectList<ChainLink>(
        offset,
        ChainLinkSchema.deserialize,
        allOffsets,
        ChainLink(),
      )) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ChainLinkQueryFilter
    on QueryBuilder<ChainLink, ChainLink, QFilterCondition> {
  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evolutionDetails',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evolutionDetails',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolutionDetails',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> evolvesToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evolvesTo',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evolvesTo',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> evolvesToIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolvesToLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> isBabyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBaby',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> isBabyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBaby',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> isBabyEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBaby',
        value: value,
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> speciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'species',
      ));
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> speciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'species',
      ));
    });
  }
}

extension ChainLinkQueryObject
    on QueryBuilder<ChainLink, ChainLink, QFilterCondition> {
  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition>
      evolutionDetailsElement(FilterQuery<EvolutionDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'evolutionDetails');
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> evolvesToElement(
      FilterQuery<ChainLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'evolvesTo');
    });
  }

  QueryBuilder<ChainLink, ChainLink, QAfterFilterCondition> species(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'species');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EvolutionDetailSchema = Schema(
  name: r'EvolutionDetail',
  id: -9198463139682628095,
  properties: {
    r'gender': PropertySchema(
      id: 0,
      name: r'gender',
      type: IsarType.long,
    ),
    r'heldItem': PropertySchema(
      id: 1,
      name: r'heldItem',
      type: IsarType.object,
      target: r'Species',
    ),
    r'item': PropertySchema(
      id: 2,
      name: r'item',
      type: IsarType.object,
      target: r'Species',
    ),
    r'knownMove': PropertySchema(
      id: 3,
      name: r'knownMove',
      type: IsarType.object,
      target: r'Species',
    ),
    r'knownMoveType': PropertySchema(
      id: 4,
      name: r'knownMoveType',
      type: IsarType.object,
      target: r'Species',
    ),
    r'location': PropertySchema(
      id: 5,
      name: r'location',
      type: IsarType.object,
      target: r'Species',
    ),
    r'minAffection': PropertySchema(
      id: 6,
      name: r'minAffection',
      type: IsarType.long,
    ),
    r'minBeauty': PropertySchema(
      id: 7,
      name: r'minBeauty',
      type: IsarType.long,
    ),
    r'minHappiness': PropertySchema(
      id: 8,
      name: r'minHappiness',
      type: IsarType.long,
    ),
    r'minLevel': PropertySchema(
      id: 9,
      name: r'minLevel',
      type: IsarType.long,
    ),
    r'needsOverworldRain': PropertySchema(
      id: 10,
      name: r'needsOverworldRain',
      type: IsarType.bool,
    ),
    r'partySpecies': PropertySchema(
      id: 11,
      name: r'partySpecies',
      type: IsarType.object,
      target: r'Species',
    ),
    r'partyType': PropertySchema(
      id: 12,
      name: r'partyType',
      type: IsarType.object,
      target: r'Species',
    ),
    r'relativePhysicalStats': PropertySchema(
      id: 13,
      name: r'relativePhysicalStats',
      type: IsarType.long,
    ),
    r'timeOfDay': PropertySchema(
      id: 14,
      name: r'timeOfDay',
      type: IsarType.string,
    ),
    r'tradeSpecies': PropertySchema(
      id: 15,
      name: r'tradeSpecies',
      type: IsarType.object,
      target: r'Species',
    ),
    r'trigger': PropertySchema(
      id: 16,
      name: r'trigger',
      type: IsarType.object,
      target: r'Species',
    ),
    r'turnUpsideDown': PropertySchema(
      id: 17,
      name: r'turnUpsideDown',
      type: IsarType.bool,
    )
  },
  estimateSize: _evolutionDetailEstimateSize,
  serialize: _evolutionDetailSerialize,
  deserialize: _evolutionDetailDeserialize,
  deserializeProp: _evolutionDetailDeserializeProp,
);

int _evolutionDetailEstimateSize(
  EvolutionDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.heldItem;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.item;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.knownMove;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.knownMoveType;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.partySpecies;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.partyType;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.timeOfDay;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tradeSpecies;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  {
    final value = object.trigger;
    if (value != null) {
      bytesCount += 3 +
          SpeciesSchema.estimateSize(value, allOffsets[Species]!, allOffsets);
    }
  }
  return bytesCount;
}

void _evolutionDetailSerialize(
  EvolutionDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.gender);
  writer.writeObject<Species>(
    offsets[1],
    allOffsets,
    SpeciesSchema.serialize,
    object.heldItem,
  );
  writer.writeObject<Species>(
    offsets[2],
    allOffsets,
    SpeciesSchema.serialize,
    object.item,
  );
  writer.writeObject<Species>(
    offsets[3],
    allOffsets,
    SpeciesSchema.serialize,
    object.knownMove,
  );
  writer.writeObject<Species>(
    offsets[4],
    allOffsets,
    SpeciesSchema.serialize,
    object.knownMoveType,
  );
  writer.writeObject<Species>(
    offsets[5],
    allOffsets,
    SpeciesSchema.serialize,
    object.location,
  );
  writer.writeLong(offsets[6], object.minAffection);
  writer.writeLong(offsets[7], object.minBeauty);
  writer.writeLong(offsets[8], object.minHappiness);
  writer.writeLong(offsets[9], object.minLevel);
  writer.writeBool(offsets[10], object.needsOverworldRain);
  writer.writeObject<Species>(
    offsets[11],
    allOffsets,
    SpeciesSchema.serialize,
    object.partySpecies,
  );
  writer.writeObject<Species>(
    offsets[12],
    allOffsets,
    SpeciesSchema.serialize,
    object.partyType,
  );
  writer.writeLong(offsets[13], object.relativePhysicalStats);
  writer.writeString(offsets[14], object.timeOfDay);
  writer.writeObject<Species>(
    offsets[15],
    allOffsets,
    SpeciesSchema.serialize,
    object.tradeSpecies,
  );
  writer.writeObject<Species>(
    offsets[16],
    allOffsets,
    SpeciesSchema.serialize,
    object.trigger,
  );
  writer.writeBool(offsets[17], object.turnUpsideDown);
}

EvolutionDetail _evolutionDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvolutionDetail(
    gender: reader.readLongOrNull(offsets[0]),
    heldItem: reader.readObjectOrNull<Species>(
      offsets[1],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    item: reader.readObjectOrNull<Species>(
      offsets[2],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    knownMove: reader.readObjectOrNull<Species>(
      offsets[3],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    knownMoveType: reader.readObjectOrNull<Species>(
      offsets[4],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    location: reader.readObjectOrNull<Species>(
      offsets[5],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    minAffection: reader.readLongOrNull(offsets[6]),
    minBeauty: reader.readLongOrNull(offsets[7]),
    minHappiness: reader.readLongOrNull(offsets[8]),
    minLevel: reader.readLongOrNull(offsets[9]),
    needsOverworldRain: reader.readBoolOrNull(offsets[10]),
    partySpecies: reader.readObjectOrNull<Species>(
      offsets[11],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    partyType: reader.readObjectOrNull<Species>(
      offsets[12],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    relativePhysicalStats: reader.readLongOrNull(offsets[13]),
    timeOfDay: reader.readStringOrNull(offsets[14]),
    tradeSpecies: reader.readObjectOrNull<Species>(
      offsets[15],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    trigger: reader.readObjectOrNull<Species>(
      offsets[16],
      SpeciesSchema.deserialize,
      allOffsets,
    ),
    turnUpsideDown: reader.readBoolOrNull(offsets[17]),
  );
  return object;
}

P _evolutionDetailDeserializeProp<P>(
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
    case 3:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
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
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 16:
      return (reader.readObjectOrNull<Species>(
        offset,
        SpeciesSchema.deserialize,
        allOffsets,
      )) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EvolutionDetailQueryFilter
    on QueryBuilder<EvolutionDetail, EvolutionDetail, QFilterCondition> {
  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      genderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      heldItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heldItem',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      heldItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heldItem',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMoveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'knownMove',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMoveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'knownMove',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMoveTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'knownMoveType',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMoveTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'knownMoveType',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minAffection',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minAffection',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minAffection',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minAffection',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minAffection',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minAffectionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minAffection',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minBeauty',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minBeauty',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minBeauty',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minBeauty',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minBeauty',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minBeautyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minBeauty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minHappiness',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minHappiness',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minHappiness',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minHappinessBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minHappiness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minLevel',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minLevel',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      minLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      needsOverworldRainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'needsOverworldRain',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      needsOverworldRainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'needsOverworldRain',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      needsOverworldRainEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsOverworldRain',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partySpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partySpecies',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partySpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partySpecies',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partyTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partyType',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partyTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partyType',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relativePhysicalStats',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relativePhysicalStats',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativePhysicalStats',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relativePhysicalStats',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relativePhysicalStats',
        value: value,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      relativePhysicalStatsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relativePhysicalStats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeOfDay',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeOfDay',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeOfDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeOfDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeOfDay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      timeOfDayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeOfDay',
        value: '',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      tradeSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tradeSpecies',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      tradeSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tradeSpecies',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      triggerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trigger',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      triggerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trigger',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      turnUpsideDownIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'turnUpsideDown',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      turnUpsideDownIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'turnUpsideDown',
      ));
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      turnUpsideDownEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turnUpsideDown',
        value: value,
      ));
    });
  }
}

extension EvolutionDetailQueryObject
    on QueryBuilder<EvolutionDetail, EvolutionDetail, QFilterCondition> {
  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      heldItem(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'heldItem');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition> item(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMove(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'knownMove');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      knownMoveType(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'knownMoveType');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      location(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'location');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partySpecies(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'partySpecies');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      partyType(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'partyType');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition>
      tradeSpecies(FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tradeSpecies');
    });
  }

  QueryBuilder<EvolutionDetail, EvolutionDetail, QAfterFilterCondition> trigger(
      FilterQuery<Species> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'trigger');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      id: (json['id'] as num).toInt(),
      chain: ChainLink.fromJson(json['chain'] as Map<String, dynamic>),
      babyTriggerItem: json['baby_trigger_item'] == null
          ? null
          : NamedApiResource.fromJson(
              json['baby_trigger_item'] as Map<String, dynamic>),
    )..isLoading = json['isLoading'] as bool;

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chain': instance.chain,
      'baby_trigger_item': instance.babyTriggerItem,
      'isLoading': instance.isLoading,
    };

ChainLink _$ChainLinkFromJson(Map<String, dynamic> json) => ChainLink(
      isBaby: json['is_baby'] as bool?,
      species: json['species'] == null
          ? null
          : Species.fromJson(json['species'] as Map<String, dynamic>),
      evolvesTo: (json['evolves_to'] as List<dynamic>?)
          ?.map((e) => ChainLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionDetails: (json['evolution_details'] as List<dynamic>?)
          ?.map((e) => EvolutionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChainLinkToJson(ChainLink instance) => <String, dynamic>{
      'is_baby': instance.isBaby,
      'species': instance.species,
      'evolves_to': instance.evolvesTo,
      'evolution_details': instance.evolutionDetails,
    };

EvolutionDetail _$EvolutionDetailFromJson(Map<String, dynamic> json) =>
    EvolutionDetail(
      item: json['item'] == null
          ? null
          : Species.fromJson(json['item'] as Map<String, dynamic>),
      trigger: json['trigger'] == null
          ? null
          : Species.fromJson(json['trigger'] as Map<String, dynamic>),
      gender: (json['gender'] as num?)?.toInt(),
      heldItem: json['held_item'] == null
          ? null
          : Species.fromJson(json['held_item'] as Map<String, dynamic>),
      knownMove: json['known_move'] == null
          ? null
          : Species.fromJson(json['known_move'] as Map<String, dynamic>),
      knownMoveType: json['known_move_type'] == null
          ? null
          : Species.fromJson(json['known_move_type'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Species.fromJson(json['location'] as Map<String, dynamic>),
      minLevel: (json['min_level'] as num?)?.toInt(),
      minHappiness: (json['min_happiness'] as num?)?.toInt(),
      minBeauty: (json['min_beauty'] as num?)?.toInt(),
      minAffection: (json['min_affection'] as num?)?.toInt(),
      needsOverworldRain: json['needs_overworld_rain'] as bool?,
      partySpecies: json['party_species'] == null
          ? null
          : Species.fromJson(json['party_species'] as Map<String, dynamic>),
      partyType: json['party_type'] == null
          ? null
          : Species.fromJson(json['party_type'] as Map<String, dynamic>),
      relativePhysicalStats: (json['relative_physical_stats'] as num?)?.toInt(),
      timeOfDay: json['time_of_day'] as String?,
      tradeSpecies: json['trade_species'] == null
          ? null
          : Species.fromJson(json['trade_species'] as Map<String, dynamic>),
      turnUpsideDown: json['turn_upside_down'] as bool?,
    );

Map<String, dynamic> _$EvolutionDetailToJson(EvolutionDetail instance) =>
    <String, dynamic>{
      'item': instance.item,
      'trigger': instance.trigger,
      'gender': instance.gender,
      'held_item': instance.heldItem,
      'known_move': instance.knownMove,
      'known_move_type': instance.knownMoveType,
      'location': instance.location,
      'min_level': instance.minLevel,
      'min_happiness': instance.minHappiness,
      'min_beauty': instance.minBeauty,
      'min_affection': instance.minAffection,
      'needs_overworld_rain': instance.needsOverworldRain,
      'party_species': instance.partySpecies,
      'party_type': instance.partyType,
      'relative_physical_stats': instance.relativePhysicalStats,
      'time_of_day': instance.timeOfDay,
      'trade_species': instance.tradeSpecies,
      'turn_upside_down': instance.turnUpsideDown,
    };
