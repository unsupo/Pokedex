// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encounters.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEncounterMethodCollection on Isar {
  IsarCollection<EncounterMethod> get encounterMethods => this.collection();
}

const EncounterMethodSchema = CollectionSchema(
  name: r'EncounterMethod',
  id: -4858132747698498467,
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
    r'order': PropertySchema(
      id: 2,
      name: r'order',
      type: IsarType.long,
    )
  },
  estimateSize: _encounterMethodEstimateSize,
  serialize: _encounterMethodSerialize,
  deserialize: _encounterMethodDeserialize,
  deserializeProp: _encounterMethodDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _encounterMethodGetId,
  getLinks: _encounterMethodGetLinks,
  attach: _encounterMethodAttach,
  version: '3.1.8',
);

int _encounterMethodEstimateSize(
  EncounterMethod object,
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
  return bytesCount;
}

void _encounterMethodSerialize(
  EncounterMethod object,
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
  writer.writeLong(offsets[2], object.order);
}

EncounterMethod _encounterMethodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EncounterMethod(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    order: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _encounterMethodDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _encounterMethodGetId(EncounterMethod object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _encounterMethodGetLinks(EncounterMethod object) {
  return [];
}

void _encounterMethodAttach(
    IsarCollection<dynamic> col, Id id, EncounterMethod object) {}

extension EncounterMethodQueryWhereSort
    on QueryBuilder<EncounterMethod, EncounterMethod, QWhere> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EncounterMethodQueryWhere
    on QueryBuilder<EncounterMethod, EncounterMethod, QWhereClause> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhereClause>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterWhereClause> idBetween(
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

extension EncounterMethodQueryFilter
    on QueryBuilder<EncounterMethod, EncounterMethod, QFilterCondition> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      orderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'order',
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      orderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
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
}

extension EncounterMethodQueryObject
    on QueryBuilder<EncounterMethod, EncounterMethod, QFilterCondition> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension EncounterMethodQueryLinks
    on QueryBuilder<EncounterMethod, EncounterMethod, QFilterCondition> {}

extension EncounterMethodQuerySortBy
    on QueryBuilder<EncounterMethod, EncounterMethod, QSortBy> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy>
      sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension EncounterMethodQuerySortThenBy
    on QueryBuilder<EncounterMethod, EncounterMethod, QSortThenBy> {
  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QAfterSortBy>
      thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension EncounterMethodQueryWhereDistinct
    on QueryBuilder<EncounterMethod, EncounterMethod, QDistinct> {
  QueryBuilder<EncounterMethod, EncounterMethod, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EncounterMethod, EncounterMethod, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }
}

extension EncounterMethodQueryProperty
    on QueryBuilder<EncounterMethod, EncounterMethod, QQueryProperty> {
  QueryBuilder<EncounterMethod, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EncounterMethod, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<EncounterMethod, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<EncounterMethod, int?, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEncounterConditionCollection on Isar {
  IsarCollection<EncounterCondition> get encounterConditions =>
      this.collection();
}

const EncounterConditionSchema = CollectionSchema(
  name: r'EncounterCondition',
  id: 3227693446001612573,
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
    r'values': PropertySchema(
      id: 2,
      name: r'values',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _encounterConditionEstimateSize,
  serialize: _encounterConditionSerialize,
  deserialize: _encounterConditionDeserialize,
  deserializeProp: _encounterConditionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _encounterConditionGetId,
  getLinks: _encounterConditionGetLinks,
  attach: _encounterConditionAttach,
  version: '3.1.8',
);

int _encounterConditionEstimateSize(
  EncounterCondition object,
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
    final list = object.values;
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

void _encounterConditionSerialize(
  EncounterCondition object,
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
  writer.writeObjectList<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.values,
  );
}

EncounterCondition _encounterConditionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EncounterCondition(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    values: reader.readObjectList<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _encounterConditionDeserializeProp<P>(
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

Id _encounterConditionGetId(EncounterCondition object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _encounterConditionGetLinks(
    EncounterCondition object) {
  return [];
}

void _encounterConditionAttach(
    IsarCollection<dynamic> col, Id id, EncounterCondition object) {}

extension EncounterConditionQueryWhereSort
    on QueryBuilder<EncounterCondition, EncounterCondition, QWhere> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EncounterConditionQueryWhere
    on QueryBuilder<EncounterCondition, EncounterCondition, QWhereClause> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhereClause>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterWhereClause>
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

extension EncounterConditionQueryFilter
    on QueryBuilder<EncounterCondition, EncounterCondition, QFilterCondition> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
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

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'values',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'values',
      ));
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'values',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EncounterConditionQueryObject
    on QueryBuilder<EncounterCondition, EncounterCondition, QFilterCondition> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterFilterCondition>
      valuesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'values');
    });
  }
}

extension EncounterConditionQueryLinks
    on QueryBuilder<EncounterCondition, EncounterCondition, QFilterCondition> {}

extension EncounterConditionQuerySortBy
    on QueryBuilder<EncounterCondition, EncounterCondition, QSortBy> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EncounterConditionQuerySortThenBy
    on QueryBuilder<EncounterCondition, EncounterCondition, QSortThenBy> {
  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterCondition, EncounterCondition, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EncounterConditionQueryWhereDistinct
    on QueryBuilder<EncounterCondition, EncounterCondition, QDistinct> {
  QueryBuilder<EncounterCondition, EncounterCondition, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension EncounterConditionQueryProperty
    on QueryBuilder<EncounterCondition, EncounterCondition, QQueryProperty> {
  QueryBuilder<EncounterCondition, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EncounterCondition, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<EncounterCondition, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<EncounterCondition, List<NamedApiResource>?, QQueryOperations>
      valuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'values');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEncounterConditionValueCollection on Isar {
  IsarCollection<EncounterConditionValue> get encounterConditionValues =>
      this.collection();
}

const EncounterConditionValueSchema = CollectionSchema(
  name: r'EncounterConditionValue',
  id: 1940816940446306350,
  properties: {
    r'condition': PropertySchema(
      id: 0,
      name: r'condition',
      type: IsarType.object,
      target: r'NamedApiResource',
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
  estimateSize: _encounterConditionValueEstimateSize,
  serialize: _encounterConditionValueSerialize,
  deserialize: _encounterConditionValueDeserialize,
  deserializeProp: _encounterConditionValueDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _encounterConditionValueGetId,
  getLinks: _encounterConditionValueGetLinks,
  attach: _encounterConditionValueAttach,
  version: '3.1.8',
);

int _encounterConditionValueEstimateSize(
  EncounterConditionValue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.condition;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
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

void _encounterConditionValueSerialize(
  EncounterConditionValue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.condition,
  );
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<ApiName>(
    offsets[2],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

EncounterConditionValue _encounterConditionValueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EncounterConditionValue(
    condition: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
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

P _encounterConditionValueDeserializeProp<P>(
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

Id _encounterConditionValueGetId(EncounterConditionValue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _encounterConditionValueGetLinks(
    EncounterConditionValue object) {
  return [];
}

void _encounterConditionValueAttach(
    IsarCollection<dynamic> col, Id id, EncounterConditionValue object) {}

extension EncounterConditionValueQueryWhereSort
    on QueryBuilder<EncounterConditionValue, EncounterConditionValue, QWhere> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EncounterConditionValueQueryWhere on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QWhereClause> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterWhereClause> idBetween(
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

extension EncounterConditionValueQueryFilter on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QFilterCondition> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> conditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'condition',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> conditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'condition',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesLengthEqualTo(int length) {
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesLengthBetween(
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

extension EncounterConditionValueQueryObject on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QFilterCondition> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> condition(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'condition');
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue,
      QAfterFilterCondition> namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension EncounterConditionValueQueryLinks on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QFilterCondition> {}

extension EncounterConditionValueQuerySortBy
    on QueryBuilder<EncounterConditionValue, EncounterConditionValue, QSortBy> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EncounterConditionValueQuerySortThenBy on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QSortThenBy> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EncounterConditionValueQueryWhereDistinct on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QDistinct> {
  QueryBuilder<EncounterConditionValue, EncounterConditionValue, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension EncounterConditionValueQueryProperty on QueryBuilder<
    EncounterConditionValue, EncounterConditionValue, QQueryProperty> {
  QueryBuilder<EncounterConditionValue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EncounterConditionValue, NamedApiResource?, QQueryOperations>
      conditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condition');
    });
  }

  QueryBuilder<EncounterConditionValue, String?, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<EncounterConditionValue, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncounterMethod _$EncounterMethodFromJson(Map<String, dynamic> json) =>
    EncounterMethod(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      order: (json['order'] as num?)?.toInt(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EncounterMethodToJson(EncounterMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'names': instance.names,
    };

EncounterCondition _$EncounterConditionFromJson(Map<String, dynamic> json) =>
    EncounterCondition(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EncounterConditionToJson(EncounterCondition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
      'values': instance.values,
    };

EncounterConditionValue _$EncounterConditionValueFromJson(
        Map<String, dynamic> json) =>
    EncounterConditionValue(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      condition: json['condition'] == null
          ? null
          : NamedApiResource.fromJson(
              json['condition'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EncounterConditionValueToJson(
        EncounterConditionValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'condition': instance.condition,
      'names': instance.names,
    };
