// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGenerationCollection on Isar {
  IsarCollection<Generation> get generations => this.collection();
}

const GenerationSchema = CollectionSchema(
  name: r'Generation',
  id: 8687047806530370254,
  properties: {
    r'abilities': PropertySchema(
      id: 0,
      name: r'abilities',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'mainRegion': PropertySchema(
      id: 1,
      name: r'mainRegion',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'moves': PropertySchema(
      id: 2,
      name: r'moves',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 4,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'pokemonSpecies': PropertySchema(
      id: 5,
      name: r'pokemonSpecies',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'types': PropertySchema(
      id: 6,
      name: r'types',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'versionGroups': PropertySchema(
      id: 7,
      name: r'versionGroups',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _generationEstimateSize,
  serialize: _generationSerialize,
  deserialize: _generationDeserialize,
  deserializeProp: _generationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _generationGetId,
  getLinks: _generationGetLinks,
  attach: _generationAttach,
  version: '3.1.8',
);

int _generationEstimateSize(
  Generation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.abilities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.mainRegion;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.moves;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
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
    final list = object.names;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ApiName]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ApiNameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.pokemonSpecies;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.types;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.versionGroups;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _generationSerialize(
  Generation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.abilities,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.mainRegion,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<ApiName>(
    offsets[4],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[5],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemonSpecies,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[6],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.types,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[7],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroups,
  );
}

Generation _generationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Generation(
    abilities: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    id: id,
    mainRegion: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    moves: reader.readObjectList<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[3]),
    names: reader.readObjectList<ApiName>(
      offsets[4],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemonSpecies: reader.readObjectList<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    types: reader.readObjectList<NamedApiResource>(
      offsets[6],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    versionGroups: reader.readObjectList<NamedApiResource>(
      offsets[7],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _generationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 1:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 5:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 6:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 7:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _generationGetId(Generation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _generationGetLinks(Generation object) {
  return [];
}

void _generationAttach(IsarCollection<dynamic> col, Id id, Generation object) {}

extension GenerationQueryWhereSort
    on QueryBuilder<Generation, Generation, QWhere> {
  QueryBuilder<Generation, Generation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GenerationQueryWhere
    on QueryBuilder<Generation, Generation, QWhereClause> {
  QueryBuilder<Generation, Generation, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Generation, Generation, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterWhereClause> idBetween(
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

extension GenerationQueryFilter
    on QueryBuilder<Generation, Generation, QFilterCondition> {
  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      abilitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      abilitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      mainRegionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainRegion',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      mainRegionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainRegion',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> movesIsEmpty() {
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpecies',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> typesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> typesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition> typesIsEmpty() {
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
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

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GenerationQueryObject
    on QueryBuilder<Generation, Generation, QFilterCondition> {
  QueryBuilder<Generation, Generation, QAfterFilterCondition> abilitiesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'abilities');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> mainRegion(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mainRegion');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> movesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      pokemonSpeciesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition> typesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'types');
    });
  }

  QueryBuilder<Generation, Generation, QAfterFilterCondition>
      versionGroupsElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroups');
    });
  }
}

extension GenerationQueryLinks
    on QueryBuilder<Generation, Generation, QFilterCondition> {}

extension GenerationQuerySortBy
    on QueryBuilder<Generation, Generation, QSortBy> {
  QueryBuilder<Generation, Generation, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Generation, Generation, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GenerationQuerySortThenBy
    on QueryBuilder<Generation, Generation, QSortThenBy> {
  QueryBuilder<Generation, Generation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Generation, Generation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Generation, Generation, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Generation, Generation, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GenerationQueryWhereDistinct
    on QueryBuilder<Generation, Generation, QDistinct> {
  QueryBuilder<Generation, Generation, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GenerationQueryProperty
    on QueryBuilder<Generation, Generation, QQueryProperty> {
  QueryBuilder<Generation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Generation, List<NamedApiResource>?, QQueryOperations>
      abilitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abilities');
    });
  }

  QueryBuilder<Generation, NamedApiResource?, QQueryOperations>
      mainRegionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainRegion');
    });
  }

  QueryBuilder<Generation, List<NamedApiResource>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<Generation, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Generation, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Generation, List<NamedApiResource>?, QQueryOperations>
      pokemonSpeciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonSpecies');
    });
  }

  QueryBuilder<Generation, List<NamedApiResource>?, QQueryOperations>
      typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }

  QueryBuilder<Generation, List<NamedApiResource>?, QQueryOperations>
      versionGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroups');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokedexCollection on Isar {
  IsarCollection<Pokedex> get pokedexs => this.collection();
}

const PokedexSchema = CollectionSchema(
  name: r'Pokedex',
  id: 5631182985824036954,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'isMainSeries': PropertySchema(
      id: 1,
      name: r'isMainSeries',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 3,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'pokemonEntries': PropertySchema(
      id: 4,
      name: r'pokemonEntries',
      type: IsarType.objectList,
      target: r'PokemonEntry',
    ),
    r'region': PropertySchema(
      id: 5,
      name: r'region',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'versionGroups': PropertySchema(
      id: 6,
      name: r'versionGroups',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _pokedexEstimateSize,
  serialize: _pokedexSerialize,
  deserialize: _pokedexDeserialize,
  deserializeProp: _pokedexDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Description': DescriptionSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema,
    r'PokemonEntry': PokemonEntrySchema
  },
  getId: _pokedexGetId,
  getLinks: _pokedexGetLinks,
  attach: _pokedexAttach,
  version: '3.1.8',
);

int _pokedexEstimateSize(
  Pokedex object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.descriptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Description]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DescriptionSchema.estimateSize(value, offsets, allOffsets);
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
    final list = object.names;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ApiName]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ApiNameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.pokemonEntries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PokemonEntry]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PokemonEntrySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.region;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.versionGroups;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _pokedexSerialize(
  Pokedex object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Description>(
    offsets[0],
    allOffsets,
    DescriptionSchema.serialize,
    object.descriptions,
  );
  writer.writeBool(offsets[1], object.isMainSeries);
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<PokemonEntry>(
    offsets[4],
    allOffsets,
    PokemonEntrySchema.serialize,
    object.pokemonEntries,
  );
  writer.writeObject<NamedApiResource>(
    offsets[5],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.region,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[6],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroups,
  );
}

Pokedex _pokedexDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pokedex(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    id: id,
    isMainSeries: reader.readBoolOrNull(offsets[1]),
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemonEntries: reader.readObjectList<PokemonEntry>(
      offsets[4],
      PokemonEntrySchema.deserialize,
      allOffsets,
      PokemonEntry(),
    ),
    region: reader.readObjectOrNull<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionGroups: reader.readObjectList<NamedApiResource>(
      offsets[6],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _pokedexDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Description>(
        offset,
        DescriptionSchema.deserialize,
        allOffsets,
        Description(),
      )) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 4:
      return (reader.readObjectList<PokemonEntry>(
        offset,
        PokemonEntrySchema.deserialize,
        allOffsets,
        PokemonEntry(),
      )) as P;
    case 5:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokedexGetId(Pokedex object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pokedexGetLinks(Pokedex object) {
  return [];
}

void _pokedexAttach(IsarCollection<dynamic> col, Id id, Pokedex object) {}

extension PokedexQueryWhereSort on QueryBuilder<Pokedex, Pokedex, QWhere> {
  QueryBuilder<Pokedex, Pokedex, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokedexQueryWhere on QueryBuilder<Pokedex, Pokedex, QWhereClause> {
  QueryBuilder<Pokedex, Pokedex, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pokedex, Pokedex, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterWhereClause> idBetween(
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

extension PokedexQueryFilter
    on QueryBuilder<Pokedex, Pokedex, QFilterCondition> {
  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> descriptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      descriptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'descriptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> isMainSeriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMainSeries',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      isMainSeriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMainSeries',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> isMainSeriesEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMainSeries',
        value: value,
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesLengthEqualTo(
      int length) {
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> pokemonEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonEntries',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonEntries',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      pokemonEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> regionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> regionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> versionGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> versionGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition>
      versionGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PokedexQueryObject
    on QueryBuilder<Pokedex, Pokedex, QFilterCondition> {
  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> descriptionsElement(
      FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> pokemonEntriesElement(
      FilterQuery<PokemonEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonEntries');
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> region(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'region');
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterFilterCondition> versionGroupsElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroups');
    });
  }
}

extension PokedexQueryLinks
    on QueryBuilder<Pokedex, Pokedex, QFilterCondition> {}

extension PokedexQuerySortBy on QueryBuilder<Pokedex, Pokedex, QSortBy> {
  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> sortByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.asc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> sortByIsMainSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.desc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokedexQuerySortThenBy
    on QueryBuilder<Pokedex, Pokedex, QSortThenBy> {
  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.asc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenByIsMainSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.desc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Pokedex, Pokedex, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokedexQueryWhereDistinct
    on QueryBuilder<Pokedex, Pokedex, QDistinct> {
  QueryBuilder<Pokedex, Pokedex, QDistinct> distinctByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMainSeries');
    });
  }

  QueryBuilder<Pokedex, Pokedex, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PokedexQueryProperty
    on QueryBuilder<Pokedex, Pokedex, QQueryProperty> {
  QueryBuilder<Pokedex, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pokedex, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<Pokedex, bool?, QQueryOperations> isMainSeriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMainSeries');
    });
  }

  QueryBuilder<Pokedex, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Pokedex, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Pokedex, List<PokemonEntry>?, QQueryOperations>
      pokemonEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonEntries');
    });
  }

  QueryBuilder<Pokedex, NamedApiResource?, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }

  QueryBuilder<Pokedex, List<NamedApiResource>?, QQueryOperations>
      versionGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroups');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVersionCollection on Isar {
  IsarCollection<Version> get versions => this.collection();
}

const VersionSchema = CollectionSchema(
  name: r'Version',
  id: 1032601149805461396,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 1,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'versionGroup': PropertySchema(
      id: 2,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _versionEstimateSize,
  serialize: _versionSerialize,
  deserialize: _versionDeserialize,
  deserializeProp: _versionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _versionGetId,
  getLinks: _versionGetLinks,
  attach: _versionAttach,
  version: '3.1.8',
);

int _versionEstimateSize(
  Version object,
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
    final list = object.names;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ApiName]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ApiNameSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.versionGroup;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _versionSerialize(
  Version object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<ApiName>(
    offsets[1],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

Version _versionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Version(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 2:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _versionGetId(Version object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _versionGetLinks(Version object) {
  return [];
}

void _versionAttach(IsarCollection<dynamic> col, Id id, Version object) {}

extension VersionQueryWhereSort on QueryBuilder<Version, Version, QWhere> {
  QueryBuilder<Version, Version, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VersionQueryWhere on QueryBuilder<Version, Version, QWhereClause> {
  QueryBuilder<Version, Version, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Version, Version, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idBetween(
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

extension VersionQueryFilter
    on QueryBuilder<Version, Version, QFilterCondition> {
  QueryBuilder<Version, Version, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> namesLengthEqualTo(
      int length) {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension VersionQueryObject
    on QueryBuilder<Version, Version, QFilterCondition> {
  QueryBuilder<Version, Version, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> versionGroup(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

extension VersionQueryLinks
    on QueryBuilder<Version, Version, QFilterCondition> {}

extension VersionQuerySortBy on QueryBuilder<Version, Version, QSortBy> {
  QueryBuilder<Version, Version, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension VersionQuerySortThenBy
    on QueryBuilder<Version, Version, QSortThenBy> {
  QueryBuilder<Version, Version, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension VersionQueryWhereDistinct
    on QueryBuilder<Version, Version, QDistinct> {
  QueryBuilder<Version, Version, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension VersionQueryProperty
    on QueryBuilder<Version, Version, QQueryProperty> {
  QueryBuilder<Version, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Version, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Version, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Version, NamedApiResource?, QQueryOperations>
      versionGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVersionGroupCollection on Isar {
  IsarCollection<VersionGroup> get versionGroups => this.collection();
}

const VersionGroupSchema = CollectionSchema(
  name: r'VersionGroup',
  id: -7382145698428164890,
  properties: {
    r'generation': PropertySchema(
      id: 0,
      name: r'generation',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'moveLearnMethods': PropertySchema(
      id: 1,
      name: r'moveLearnMethods',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 3,
      name: r'order',
      type: IsarType.long,
    ),
    r'pokedexes': PropertySchema(
      id: 4,
      name: r'pokedexes',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'regions': PropertySchema(
      id: 5,
      name: r'regions',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'versions': PropertySchema(
      id: 6,
      name: r'versions',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _versionGroupEstimateSize,
  serialize: _versionGroupSerialize,
  deserialize: _versionGroupDeserialize,
  deserializeProp: _versionGroupDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NamedApiResource': NamedApiResourceSchema},
  getId: _versionGroupGetId,
  getLinks: _versionGroupGetLinks,
  attach: _versionGroupAttach,
  version: '3.1.8',
);

int _versionGroupEstimateSize(
  VersionGroup object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.generation;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.moveLearnMethods;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
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
    final list = object.pokedexes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.regions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.versions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NamedApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NamedApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _versionGroupSerialize(
  VersionGroup object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.generation,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moveLearnMethods,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeLong(offsets[3], object.order);
  writer.writeObjectList<NamedApiResource>(
    offsets[4],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokedexes,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[5],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.regions,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[6],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versions,
  );
}

VersionGroup _versionGroupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionGroup(
    generation: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
    moveLearnMethods: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[2]),
    order: reader.readLongOrNull(offsets[3]),
    pokedexes: reader.readObjectList<NamedApiResource>(
      offsets[4],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    regions: reader.readObjectList<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    versions: reader.readObjectList<NamedApiResource>(
      offsets[6],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _versionGroupDeserializeProp<P>(
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
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 5:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 6:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _versionGroupGetId(VersionGroup object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _versionGroupGetLinks(VersionGroup object) {
  return [];
}

void _versionGroupAttach(
    IsarCollection<dynamic> col, Id id, VersionGroup object) {}

extension VersionGroupQueryWhereSort
    on QueryBuilder<VersionGroup, VersionGroup, QWhere> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VersionGroupQueryWhere
    on QueryBuilder<VersionGroup, VersionGroup, QWhereClause> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterWhereClause> idBetween(
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

extension VersionGroupQueryFilter
    on QueryBuilder<VersionGroup, VersionGroup, QFilterCondition> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moveLearnMethods',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moveLearnMethods',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveLearnMethods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameContains(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> orderEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> orderLessThan(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> orderBetween(
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

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokedexes',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokedexes',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokedexes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regions',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regions',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'regions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versions',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versions',
      ));
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension VersionGroupQueryObject
    on QueryBuilder<VersionGroup, VersionGroup, QFilterCondition> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition> generation(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generation');
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      moveLearnMethodsElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moveLearnMethods');
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      pokedexesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokedexes');
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      regionsElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'regions');
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterFilterCondition>
      versionsElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versions');
    });
  }
}

extension VersionGroupQueryLinks
    on QueryBuilder<VersionGroup, VersionGroup, QFilterCondition> {}

extension VersionGroupQuerySortBy
    on QueryBuilder<VersionGroup, VersionGroup, QSortBy> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension VersionGroupQuerySortThenBy
    on QueryBuilder<VersionGroup, VersionGroup, QSortThenBy> {
  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension VersionGroupQueryWhereDistinct
    on QueryBuilder<VersionGroup, VersionGroup, QDistinct> {
  QueryBuilder<VersionGroup, VersionGroup, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VersionGroup, VersionGroup, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }
}

extension VersionGroupQueryProperty
    on QueryBuilder<VersionGroup, VersionGroup, QQueryProperty> {
  QueryBuilder<VersionGroup, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VersionGroup, NamedApiResource?, QQueryOperations>
      generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<VersionGroup, List<NamedApiResource>?, QQueryOperations>
      moveLearnMethodsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moveLearnMethods');
    });
  }

  QueryBuilder<VersionGroup, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<VersionGroup, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<VersionGroup, List<NamedApiResource>?, QQueryOperations>
      pokedexesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokedexes');
    });
  }

  QueryBuilder<VersionGroup, List<NamedApiResource>?, QQueryOperations>
      regionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regions');
    });
  }

  QueryBuilder<VersionGroup, List<NamedApiResource>?, QQueryOperations>
      versionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versions');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokemonEntrySchema = Schema(
  name: r'PokemonEntry',
  id: 4441627208510156286,
  properties: {
    r'entryNumber': PropertySchema(
      id: 0,
      name: r'entryNumber',
      type: IsarType.long,
    ),
    r'pokemonSpecies': PropertySchema(
      id: 1,
      name: r'pokemonSpecies',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _pokemonEntryEstimateSize,
  serialize: _pokemonEntrySerialize,
  deserialize: _pokemonEntryDeserialize,
  deserializeProp: _pokemonEntryDeserializeProp,
);

int _pokemonEntryEstimateSize(
  PokemonEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pokemonSpecies;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _pokemonEntrySerialize(
  PokemonEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.entryNumber);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemonSpecies,
  );
}

PokemonEntry _pokemonEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonEntry(
    entryNumber: reader.readLongOrNull(offsets[0]),
    pokemonSpecies: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _pokemonEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PokemonEntryQueryFilter
    on QueryBuilder<PokemonEntry, PokemonEntry, QFilterCondition> {
  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      entryNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entryNumber',
      ));
    });
  }

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      entryNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entryNumber',
      ));
    });
  }

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      entryNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
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

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
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

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
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

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }
}

extension PokemonEntryQueryObject
    on QueryBuilder<PokemonEntry, PokemonEntry, QFilterCondition> {
  QueryBuilder<PokemonEntry, PokemonEntry, QAfterFilterCondition>
      pokemonSpecies(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Generation _$GenerationFromJson(Map<String, dynamic> json) => Generation(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainRegion: json['main_region'] == null
          ? null
          : NamedApiResource.fromJson(
              json['main_region'] as Map<String, dynamic>),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenerationToJson(Generation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abilities': instance.abilities,
      'names': instance.names,
      'main_region': instance.mainRegion,
      'moves': instance.moves,
      'pokemon_species': instance.pokemonSpecies,
      'types': instance.types,
      'version_groups': instance.versionGroups,
    };

Pokedex _$PokedexFromJson(Map<String, dynamic> json) => Pokedex(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      isMainSeries: json['is_main_series'] as bool?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonEntries: (json['pokemon_entries'] as List<dynamic>?)
          ?.map((e) => PokemonEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      region: json['region'] == null
          ? null
          : NamedApiResource.fromJson(json['region'] as Map<String, dynamic>),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokedexToJson(Pokedex instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_main_series': instance.isMainSeries,
      'descriptions': instance.descriptions,
      'names': instance.names,
      'pokemon_entries': instance.pokemonEntries,
      'region': instance.region,
      'version_groups': instance.versionGroups,
    };

PokemonEntry _$PokemonEntryFromJson(Map<String, dynamic> json) => PokemonEntry(
      entryNumber: (json['entry_number'] as num?)?.toInt(),
      pokemonSpecies: json['pokemon_species'] == null
          ? null
          : NamedApiResource.fromJson(
              json['pokemon_species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonEntryToJson(PokemonEntry instance) =>
    <String, dynamic>{
      'entry_number': instance.entryNumber,
      'pokemon_species': instance.pokemonSpecies,
    };

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
      'version_group': instance.versionGroup,
    };

VersionGroup _$VersionGroupFromJson(Map<String, dynamic> json) => VersionGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      order: (json['order'] as num?)?.toInt(),
      generation: json['generation'] == null
          ? null
          : NamedApiResource.fromJson(
              json['generation'] as Map<String, dynamic>),
      moveLearnMethods: (json['move_learn_methods'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexes: (json['pokedexes'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      versions: (json['versions'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VersionGroupToJson(VersionGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'generation': instance.generation,
      'move_learn_methods': instance.moveLearnMethods,
      'pokedexes': instance.pokedexes,
      'regions': instance.regions,
      'versions': instance.versions,
    };
