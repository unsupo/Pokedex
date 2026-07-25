// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeathlonstat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPokeathlonStatCollection on Isar {
  IsarCollection<PokeathlonStat> get pokeathlonStats => this.collection();
}

const PokeathlonStatSchema = CollectionSchema(
  name: r'PokeathlonStat',
  id: 8685853897545515337,
  properties: {
    r'affectingNatures': PropertySchema(
      id: 0,
      name: r'affectingNatures',
      type: IsarType.object,
      target: r'NaturePokeathlonStatAffectSets',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 2,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    )
  },
  estimateSize: _pokeathlonStatEstimateSize,
  serialize: _pokeathlonStatSerialize,
  deserialize: _pokeathlonStatDeserialize,
  deserializeProp: _pokeathlonStatDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'NaturePokeathlonStatAffectSets': NaturePokeathlonStatAffectSetsSchema,
    r'NaturePokeathlonStatAffect': NaturePokeathlonStatAffectSchema
  },
  getId: _pokeathlonStatGetId,
  getLinks: _pokeathlonStatGetLinks,
  attach: _pokeathlonStatAttach,
  version: '3.3.2',
);

int _pokeathlonStatEstimateSize(
  PokeathlonStat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.affectingNatures;
    if (value != null) {
      bytesCount += 3 +
          NaturePokeathlonStatAffectSetsSchema.estimateSize(
              value, allOffsets[NaturePokeathlonStatAffectSets]!, allOffsets);
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
  return bytesCount;
}

void _pokeathlonStatSerialize(
  PokeathlonStat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NaturePokeathlonStatAffectSets>(
    offsets[0],
    allOffsets,
    NaturePokeathlonStatAffectSetsSchema.serialize,
    object.affectingNatures,
  );
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<ApiName>(
    offsets[2],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

PokeathlonStat _pokeathlonStatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokeathlonStat(
    affectingNatures: reader.readObjectOrNull<NaturePokeathlonStatAffectSets>(
      offsets[0],
      NaturePokeathlonStatAffectSetsSchema.deserialize,
      allOffsets,
    ),
    id: id,
    name: reader.readStringOrNull(offsets[1]),
    names: reader.readObjectList<ApiName>(
      offsets[2],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _pokeathlonStatDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<NaturePokeathlonStatAffectSets>(
        offset,
        NaturePokeathlonStatAffectSetsSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pokeathlonStatGetId(PokeathlonStat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pokeathlonStatGetLinks(PokeathlonStat object) {
  return [];
}

void _pokeathlonStatAttach(
    IsarCollection<dynamic> col, Id id, PokeathlonStat object) {}

extension PokeathlonStatQueryWhereSort
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QWhere> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PokeathlonStatQueryWhere
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QWhereClause> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterWhereClause> idBetween(
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

extension PokeathlonStatQueryFilter
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QFilterCondition> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      affectingNaturesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'affectingNatures',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      affectingNaturesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'affectingNatures',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
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
}

extension PokeathlonStatQueryObject
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QFilterCondition> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      affectingNatures(FilterQuery<NaturePokeathlonStatAffectSets> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'affectingNatures');
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension PokeathlonStatQueryLinks
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QFilterCondition> {}

extension PokeathlonStatQuerySortBy
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QSortBy> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokeathlonStatQuerySortThenBy
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QSortThenBy> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PokeathlonStat, PokeathlonStat, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PokeathlonStatQueryWhereDistinct
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QDistinct> {
  QueryBuilder<PokeathlonStat, PokeathlonStat, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PokeathlonStatQueryProperty
    on QueryBuilder<PokeathlonStat, PokeathlonStat, QQueryProperty> {
  QueryBuilder<PokeathlonStat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PokeathlonStat, NaturePokeathlonStatAffectSets?,
      QQueryOperations> affectingNaturesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affectingNatures');
    });
  }

  QueryBuilder<PokeathlonStat, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PokeathlonStat, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NaturePokeathlonStatAffectSetsSchema = Schema(
  name: r'NaturePokeathlonStatAffectSets',
  id: -5457216957695496377,
  properties: {
    r'decrease': PropertySchema(
      id: 0,
      name: r'decrease',
      type: IsarType.objectList,
      target: r'NaturePokeathlonStatAffect',
    ),
    r'increase': PropertySchema(
      id: 1,
      name: r'increase',
      type: IsarType.objectList,
      target: r'NaturePokeathlonStatAffect',
    )
  },
  estimateSize: _naturePokeathlonStatAffectSetsEstimateSize,
  serialize: _naturePokeathlonStatAffectSetsSerialize,
  deserialize: _naturePokeathlonStatAffectSetsDeserialize,
  deserializeProp: _naturePokeathlonStatAffectSetsDeserializeProp,
);

int _naturePokeathlonStatAffectSetsEstimateSize(
  NaturePokeathlonStatAffectSets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.decrease;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NaturePokeathlonStatAffect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += NaturePokeathlonStatAffectSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.increase;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NaturePokeathlonStatAffect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += NaturePokeathlonStatAffectSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _naturePokeathlonStatAffectSetsSerialize(
  NaturePokeathlonStatAffectSets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NaturePokeathlonStatAffect>(
    offsets[0],
    allOffsets,
    NaturePokeathlonStatAffectSchema.serialize,
    object.decrease,
  );
  writer.writeObjectList<NaturePokeathlonStatAffect>(
    offsets[1],
    allOffsets,
    NaturePokeathlonStatAffectSchema.serialize,
    object.increase,
  );
}

NaturePokeathlonStatAffectSets _naturePokeathlonStatAffectSetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaturePokeathlonStatAffectSets(
    decrease: reader.readObjectList<NaturePokeathlonStatAffect>(
      offsets[0],
      NaturePokeathlonStatAffectSchema.deserialize,
      allOffsets,
      NaturePokeathlonStatAffect(),
    ),
    increase: reader.readObjectList<NaturePokeathlonStatAffect>(
      offsets[1],
      NaturePokeathlonStatAffectSchema.deserialize,
      allOffsets,
      NaturePokeathlonStatAffect(),
    ),
  );
  return object;
}

P _naturePokeathlonStatAffectSetsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<NaturePokeathlonStatAffect>(
        offset,
        NaturePokeathlonStatAffectSchema.deserialize,
        allOffsets,
        NaturePokeathlonStatAffect(),
      )) as P;
    case 1:
      return (reader.readObjectList<NaturePokeathlonStatAffect>(
        offset,
        NaturePokeathlonStatAffectSchema.deserialize,
        allOffsets,
        NaturePokeathlonStatAffect(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NaturePokeathlonStatAffectSetsQueryFilter on QueryBuilder<
    NaturePokeathlonStatAffectSets,
    NaturePokeathlonStatAffectSets,
    QFilterCondition> {
  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> decreaseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'decrease',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
      QAfterFilterCondition> increaseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'increase',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NaturePokeathlonStatAffectSetsQueryObject on QueryBuilder<
    NaturePokeathlonStatAffectSets,
    NaturePokeathlonStatAffectSets,
    QFilterCondition> {
  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
          QAfterFilterCondition>
      decreaseElement(FilterQuery<NaturePokeathlonStatAffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'decrease');
    });
  }

  QueryBuilder<NaturePokeathlonStatAffectSets, NaturePokeathlonStatAffectSets,
          QAfterFilterCondition>
      increaseElement(FilterQuery<NaturePokeathlonStatAffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'increase');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NaturePokeathlonStatAffectSchema = Schema(
  name: r'NaturePokeathlonStatAffect',
  id: -1889191580803138820,
  properties: {
    r'maxChange': PropertySchema(
      id: 0,
      name: r'maxChange',
      type: IsarType.long,
    ),
    r'nature': PropertySchema(
      id: 1,
      name: r'nature',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _naturePokeathlonStatAffectEstimateSize,
  serialize: _naturePokeathlonStatAffectSerialize,
  deserialize: _naturePokeathlonStatAffectDeserialize,
  deserializeProp: _naturePokeathlonStatAffectDeserializeProp,
);

int _naturePokeathlonStatAffectEstimateSize(
  NaturePokeathlonStatAffect object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nature;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _naturePokeathlonStatAffectSerialize(
  NaturePokeathlonStatAffect object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.maxChange);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.nature,
  );
}

NaturePokeathlonStatAffect _naturePokeathlonStatAffectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NaturePokeathlonStatAffect(
    maxChange: reader.readLongOrNull(offsets[0]),
    nature: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _naturePokeathlonStatAffectDeserializeProp<P>(
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

extension NaturePokeathlonStatAffectQueryFilter on QueryBuilder<
    NaturePokeathlonStatAffect, NaturePokeathlonStatAffect, QFilterCondition> {
  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxChange',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxChange',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> maxChangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxChange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> natureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nature',
      ));
    });
  }

  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> natureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nature',
      ));
    });
  }
}

extension NaturePokeathlonStatAffectQueryObject on QueryBuilder<
    NaturePokeathlonStatAffect, NaturePokeathlonStatAffect, QFilterCondition> {
  QueryBuilder<NaturePokeathlonStatAffect, NaturePokeathlonStatAffect,
      QAfterFilterCondition> nature(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nature');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeathlonStat _$PokeathlonStatFromJson(Map<String, dynamic> json) =>
    PokeathlonStat(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      affectingNatures: json['affecting_natures'] == null
          ? null
          : NaturePokeathlonStatAffectSets.fromJson(
              json['affecting_natures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokeathlonStatToJson(PokeathlonStat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
      'affecting_natures': instance.affectingNatures,
    };

NaturePokeathlonStatAffectSets _$NaturePokeathlonStatAffectSetsFromJson(
        Map<String, dynamic> json) =>
    NaturePokeathlonStatAffectSets(
      increase: (json['increase'] as List<dynamic>?)
          ?.map((e) =>
              NaturePokeathlonStatAffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      decrease: (json['decrease'] as List<dynamic>?)
          ?.map((e) =>
              NaturePokeathlonStatAffect.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaturePokeathlonStatAffectSetsToJson(
        NaturePokeathlonStatAffectSets instance) =>
    <String, dynamic>{
      'increase': instance.increase,
      'decrease': instance.decrease,
    };

NaturePokeathlonStatAffect _$NaturePokeathlonStatAffectFromJson(
        Map<String, dynamic> json) =>
    NaturePokeathlonStatAffect(
      maxChange: (json['max_change'] as num?)?.toInt(),
      nature: json['nature'] == null
          ? null
          : NamedApiResource.fromJson(json['nature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NaturePokeathlonStatAffectToJson(
        NaturePokeathlonStatAffect instance) =>
    <String, dynamic>{
      'max_change': instance.maxChange,
      'nature': instance.nature,
    };
