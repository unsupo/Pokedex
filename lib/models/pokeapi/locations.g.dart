// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationCollection on Isar {
  IsarCollection<Location> get locations => this.collection();
}

const LocationSchema = CollectionSchema(
  name: r'Location',
  id: -8833727672639471650,
  properties: {
    r'areas': PropertySchema(
      id: 0,
      name: r'areas',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'gameIndices': PropertySchema(
      id: 1,
      name: r'gameIndices',
      type: IsarType.objectList,
      target: r'GenerationGameIndex',
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
    r'region': PropertySchema(
      id: 4,
      name: r'region',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _locationEstimateSize,
  serialize: _locationSerialize,
  deserialize: _locationDeserialize,
  deserializeProp: _locationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema,
    r'GenerationGameIndex': GenerationGameIndexSchema
  },
  getId: _locationGetId,
  getLinks: _locationGetLinks,
  attach: _locationAttach,
  version: '3.3.2',
);

int _locationEstimateSize(
  Location object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.areas;
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
    final list = object.gameIndices;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[GenerationGameIndex]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += GenerationGameIndexSchema.estimateSize(
              value, offsets, allOffsets);
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
    final value = object.region;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _locationSerialize(
  Location object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.areas,
  );
  writer.writeObjectList<GenerationGameIndex>(
    offsets[1],
    allOffsets,
    GenerationGameIndexSchema.serialize,
    object.gameIndices,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObject<NamedApiResource>(
    offsets[4],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.region,
  );
}

Location _locationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Location(
    areas: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    gameIndices: reader.readObjectList<GenerationGameIndex>(
      offsets[1],
      GenerationGameIndexSchema.deserialize,
      allOffsets,
      GenerationGameIndex(),
    ),
    id: id,
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    region: reader.readObjectOrNull<NamedApiResource>(
      offsets[4],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _locationDeserializeProp<P>(
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
      return (reader.readObjectList<GenerationGameIndex>(
        offset,
        GenerationGameIndexSchema.deserialize,
        allOffsets,
        GenerationGameIndex(),
      )) as P;
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
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locationGetId(Location object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationGetLinks(Location object) {
  return [];
}

void _locationAttach(IsarCollection<dynamic> col, Id id, Location object) {}

extension LocationQueryWhereSort on QueryBuilder<Location, Location, QWhere> {
  QueryBuilder<Location, Location, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocationQueryWhere on QueryBuilder<Location, Location, QWhereClause> {
  QueryBuilder<Location, Location, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Location, Location, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idBetween(
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

extension LocationQueryFilter
    on QueryBuilder<Location, Location, QFilterCondition> {
  QueryBuilder<Location, Location, QAfterFilterCondition> areasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'areas',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'areas',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      areasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> areasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'areas',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> gameIndicesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndices',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      gameIndicesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndices',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition> gameIndicesIsEmpty() {
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

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Location, Location, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition>
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

  QueryBuilder<Location, Location, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> regionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> regionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'region',
      ));
    });
  }
}

extension LocationQueryObject
    on QueryBuilder<Location, Location, QFilterCondition> {
  QueryBuilder<Location, Location, QAfterFilterCondition> areasElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'areas');
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> gameIndicesElement(
      FilterQuery<GenerationGameIndex> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'gameIndices');
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> region(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'region');
    });
  }
}

extension LocationQueryLinks
    on QueryBuilder<Location, Location, QFilterCondition> {}

extension LocationQuerySortBy on QueryBuilder<Location, Location, QSortBy> {
  QueryBuilder<Location, Location, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension LocationQuerySortThenBy
    on QueryBuilder<Location, Location, QSortThenBy> {
  QueryBuilder<Location, Location, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension LocationQueryWhereDistinct
    on QueryBuilder<Location, Location, QDistinct> {
  QueryBuilder<Location, Location, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension LocationQueryProperty
    on QueryBuilder<Location, Location, QQueryProperty> {
  QueryBuilder<Location, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Location, List<NamedApiResource>?, QQueryOperations>
      areasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areas');
    });
  }

  QueryBuilder<Location, List<GenerationGameIndex>?, QQueryOperations>
      gameIndicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameIndices');
    });
  }

  QueryBuilder<Location, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Location, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Location, NamedApiResource?, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationAreaCollection on Isar {
  IsarCollection<LocationArea> get locationAreas => this.collection();
}

const LocationAreaSchema = CollectionSchema(
  name: r'LocationArea',
  id: 8770656636127921169,
  properties: {
    r'encounterMethodRates': PropertySchema(
      id: 0,
      name: r'encounterMethodRates',
      type: IsarType.objectList,
      target: r'EncounterMethodRate',
    ),
    r'gameIndex': PropertySchema(
      id: 1,
      name: r'gameIndex',
      type: IsarType.long,
    ),
    r'location': PropertySchema(
      id: 2,
      name: r'location',
      type: IsarType.object,
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
    r'pokemonEncounters': PropertySchema(
      id: 5,
      name: r'pokemonEncounters',
      type: IsarType.objectList,
      target: r'PokemonEncounter',
    )
  },
  estimateSize: _locationAreaEstimateSize,
  serialize: _locationAreaSerialize,
  deserialize: _locationAreaDeserialize,
  deserializeProp: _locationAreaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'EncounterMethodRate': EncounterMethodRateSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'EncounterVersionDetails': EncounterVersionDetailsSchema,
    r'ApiName': ApiNameSchema,
    r'PokemonEncounter': PokemonEncounterSchema,
    r'VersionEncounterDetail': VersionEncounterDetailSchema,
    r'Encounter': EncounterSchema
  },
  getId: _locationAreaGetId,
  getLinks: _locationAreaGetLinks,
  attach: _locationAreaAttach,
  version: '3.3.2',
);

int _locationAreaEstimateSize(
  LocationArea object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.encounterMethodRates;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[EncounterMethodRate]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += EncounterMethodRateSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.location;
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
  {
    final list = object.pokemonEncounters;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PokemonEncounter]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PokemonEncounterSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _locationAreaSerialize(
  LocationArea object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<EncounterMethodRate>(
    offsets[0],
    allOffsets,
    EncounterMethodRateSchema.serialize,
    object.encounterMethodRates,
  );
  writer.writeLong(offsets[1], object.gameIndex);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.location,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<ApiName>(
    offsets[4],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<PokemonEncounter>(
    offsets[5],
    allOffsets,
    PokemonEncounterSchema.serialize,
    object.pokemonEncounters,
  );
}

LocationArea _locationAreaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationArea(
    encounterMethodRates: reader.readObjectList<EncounterMethodRate>(
      offsets[0],
      EncounterMethodRateSchema.deserialize,
      allOffsets,
      EncounterMethodRate(),
    ),
    gameIndex: reader.readLongOrNull(offsets[1]),
    id: id,
    location: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[3]),
    names: reader.readObjectList<ApiName>(
      offsets[4],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemonEncounters: reader.readObjectList<PokemonEncounter>(
      offsets[5],
      PokemonEncounterSchema.deserialize,
      allOffsets,
      PokemonEncounter(),
    ),
  );
  return object;
}

P _locationAreaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<EncounterMethodRate>(
        offset,
        EncounterMethodRateSchema.deserialize,
        allOffsets,
        EncounterMethodRate(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
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
      return (reader.readObjectList<PokemonEncounter>(
        offset,
        PokemonEncounterSchema.deserialize,
        allOffsets,
        PokemonEncounter(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _locationAreaGetId(LocationArea object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationAreaGetLinks(LocationArea object) {
  return [];
}

void _locationAreaAttach(
    IsarCollection<dynamic> col, Id id, LocationArea object) {}

extension LocationAreaQueryWhereSort
    on QueryBuilder<LocationArea, LocationArea, QWhere> {
  QueryBuilder<LocationArea, LocationArea, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocationAreaQueryWhere
    on QueryBuilder<LocationArea, LocationArea, QWhereClause> {
  QueryBuilder<LocationArea, LocationArea, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<LocationArea, LocationArea, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterWhereClause> idBetween(
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

extension LocationAreaQueryFilter
    on QueryBuilder<LocationArea, LocationArea, QFilterCondition> {
  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encounterMethodRates',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encounterMethodRates',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterMethodRates',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      gameIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      gameIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      gameIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      gameIndexLessThan(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      gameIndexBetween(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameContains(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
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

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonEncounters',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonEncounters',
      ));
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LocationAreaQueryObject
    on QueryBuilder<LocationArea, LocationArea, QFilterCondition> {
  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      encounterMethodRatesElement(FilterQuery<EncounterMethodRate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'encounterMethodRates');
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> location(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'location');
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterFilterCondition>
      pokemonEncountersElement(FilterQuery<PokemonEncounter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonEncounters');
    });
  }
}

extension LocationAreaQueryLinks
    on QueryBuilder<LocationArea, LocationArea, QFilterCondition> {}

extension LocationAreaQuerySortBy
    on QueryBuilder<LocationArea, LocationArea, QSortBy> {
  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> sortByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.asc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> sortByGameIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.desc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension LocationAreaQuerySortThenBy
    on QueryBuilder<LocationArea, LocationArea, QSortThenBy> {
  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.asc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenByGameIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.desc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocationArea, LocationArea, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension LocationAreaQueryWhereDistinct
    on QueryBuilder<LocationArea, LocationArea, QDistinct> {
  QueryBuilder<LocationArea, LocationArea, QDistinct> distinctByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameIndex');
    });
  }

  QueryBuilder<LocationArea, LocationArea, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension LocationAreaQueryProperty
    on QueryBuilder<LocationArea, LocationArea, QQueryProperty> {
  QueryBuilder<LocationArea, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationArea, List<EncounterMethodRate>?, QQueryOperations>
      encounterMethodRatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'encounterMethodRates');
    });
  }

  QueryBuilder<LocationArea, int?, QQueryOperations> gameIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameIndex');
    });
  }

  QueryBuilder<LocationArea, NamedApiResource?, QQueryOperations>
      locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<LocationArea, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocationArea, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<LocationArea, List<PokemonEncounter>?, QQueryOperations>
      pokemonEncountersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonEncounters');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPalParkAreaCollection on Isar {
  IsarCollection<PalParkArea> get palParkAreas => this.collection();
}

const PalParkAreaSchema = CollectionSchema(
  name: r'PalParkArea',
  id: 8967470466636053692,
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
    r'pokemonEncounters': PropertySchema(
      id: 2,
      name: r'pokemonEncounters',
      type: IsarType.objectList,
      target: r'PalParkEncounterSpecies',
    )
  },
  estimateSize: _palParkAreaEstimateSize,
  serialize: _palParkAreaSerialize,
  deserialize: _palParkAreaDeserialize,
  deserializeProp: _palParkAreaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'PalParkEncounterSpecies': PalParkEncounterSpeciesSchema
  },
  getId: _palParkAreaGetId,
  getLinks: _palParkAreaGetLinks,
  attach: _palParkAreaAttach,
  version: '3.3.2',
);

int _palParkAreaEstimateSize(
  PalParkArea object,
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
    final list = object.pokemonEncounters;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PalParkEncounterSpecies]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += PalParkEncounterSpeciesSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _palParkAreaSerialize(
  PalParkArea object,
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
  writer.writeObjectList<PalParkEncounterSpecies>(
    offsets[2],
    allOffsets,
    PalParkEncounterSpeciesSchema.serialize,
    object.pokemonEncounters,
  );
}

PalParkArea _palParkAreaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PalParkArea(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemonEncounters: reader.readObjectList<PalParkEncounterSpecies>(
      offsets[2],
      PalParkEncounterSpeciesSchema.deserialize,
      allOffsets,
      PalParkEncounterSpecies(),
    ),
  );
  return object;
}

P _palParkAreaDeserializeProp<P>(
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
      return (reader.readObjectList<PalParkEncounterSpecies>(
        offset,
        PalParkEncounterSpeciesSchema.deserialize,
        allOffsets,
        PalParkEncounterSpecies(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _palParkAreaGetId(PalParkArea object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _palParkAreaGetLinks(PalParkArea object) {
  return [];
}

void _palParkAreaAttach(
    IsarCollection<dynamic> col, Id id, PalParkArea object) {}

extension PalParkAreaQueryWhereSort
    on QueryBuilder<PalParkArea, PalParkArea, QWhere> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PalParkAreaQueryWhere
    on QueryBuilder<PalParkArea, PalParkArea, QWhereClause> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterWhereClause> idBetween(
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

extension PalParkAreaQueryFilter
    on QueryBuilder<PalParkArea, PalParkArea, QFilterCondition> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameContains(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
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

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonEncounters',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonEncounters',
      ));
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonEncounters',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension PalParkAreaQueryObject
    on QueryBuilder<PalParkArea, PalParkArea, QFilterCondition> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterFilterCondition>
      pokemonEncountersElement(FilterQuery<PalParkEncounterSpecies> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonEncounters');
    });
  }
}

extension PalParkAreaQueryLinks
    on QueryBuilder<PalParkArea, PalParkArea, QFilterCondition> {}

extension PalParkAreaQuerySortBy
    on QueryBuilder<PalParkArea, PalParkArea, QSortBy> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PalParkAreaQuerySortThenBy
    on QueryBuilder<PalParkArea, PalParkArea, QSortThenBy> {
  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PalParkArea, PalParkArea, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PalParkAreaQueryWhereDistinct
    on QueryBuilder<PalParkArea, PalParkArea, QDistinct> {
  QueryBuilder<PalParkArea, PalParkArea, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PalParkAreaQueryProperty
    on QueryBuilder<PalParkArea, PalParkArea, QQueryProperty> {
  QueryBuilder<PalParkArea, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PalParkArea, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PalParkArea, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<PalParkArea, List<PalParkEncounterSpecies>?, QQueryOperations>
      pokemonEncountersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonEncounters');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRegionCollection on Isar {
  IsarCollection<Region> get regions => this.collection();
}

const RegionSchema = CollectionSchema(
  name: r'Region',
  id: 8071854943712417412,
  properties: {
    r'locations': PropertySchema(
      id: 0,
      name: r'locations',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'mainGeneration': PropertySchema(
      id: 1,
      name: r'mainGeneration',
      type: IsarType.object,
      target: r'NamedApiResource',
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
    r'pokedexes': PropertySchema(
      id: 4,
      name: r'pokedexes',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'versionGroups': PropertySchema(
      id: 5,
      name: r'versionGroups',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _regionEstimateSize,
  serialize: _regionSerialize,
  deserialize: _regionDeserialize,
  deserializeProp: _regionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _regionGetId,
  getLinks: _regionGetLinks,
  attach: _regionAttach,
  version: '3.3.2',
);

int _regionEstimateSize(
  Region object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.locations;
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
    final value = object.mainGeneration;
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

void _regionSerialize(
  Region object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.locations,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.mainGeneration,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
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
    object.versionGroups,
  );
}

Region _regionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Region(
    id: id,
    locations: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    mainGeneration: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokedexes: reader.readObjectList<NamedApiResource>(
      offsets[4],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    versionGroups: reader.readObjectList<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _regionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _regionGetId(Region object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _regionGetLinks(Region object) {
  return [];
}

void _regionAttach(IsarCollection<dynamic> col, Id id, Region object) {}

extension RegionQueryWhereSort on QueryBuilder<Region, Region, QWhere> {
  QueryBuilder<Region, Region, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RegionQueryWhere on QueryBuilder<Region, Region, QWhereClause> {
  QueryBuilder<Region, Region, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Region, Region, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Region, Region, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Region, Region, QAfterWhereClause> idBetween(
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

extension RegionQueryFilter on QueryBuilder<Region, Region, QFilterCondition> {
  QueryBuilder<Region, Region, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locations',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locations',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition>
      locationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> locationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> mainGenerationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mainGeneration',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition>
      mainGenerationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mainGeneration',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Region, Region, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Region, Region, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokedexes',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokedexes',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesLengthEqualTo(
      int length) {
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

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesIsEmpty() {
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

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesIsNotEmpty() {
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

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesLengthLessThan(
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

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesLengthBetween(
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

  QueryBuilder<Region, Region, QAfterFilterCondition> versionGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> versionGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

  QueryBuilder<Region, Region, QAfterFilterCondition> versionGroupsIsEmpty() {
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

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

  QueryBuilder<Region, Region, QAfterFilterCondition>
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

extension RegionQueryObject on QueryBuilder<Region, Region, QFilterCondition> {
  QueryBuilder<Region, Region, QAfterFilterCondition> locationsElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'locations');
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> mainGeneration(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mainGeneration');
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> pokedexesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokedexes');
    });
  }

  QueryBuilder<Region, Region, QAfterFilterCondition> versionGroupsElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroups');
    });
  }
}

extension RegionQueryLinks on QueryBuilder<Region, Region, QFilterCondition> {}

extension RegionQuerySortBy on QueryBuilder<Region, Region, QSortBy> {
  QueryBuilder<Region, Region, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Region, Region, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension RegionQuerySortThenBy on QueryBuilder<Region, Region, QSortThenBy> {
  QueryBuilder<Region, Region, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Region, Region, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Region, Region, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Region, Region, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension RegionQueryWhereDistinct on QueryBuilder<Region, Region, QDistinct> {
  QueryBuilder<Region, Region, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension RegionQueryProperty on QueryBuilder<Region, Region, QQueryProperty> {
  QueryBuilder<Region, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Region, List<NamedApiResource>?, QQueryOperations>
      locationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locations');
    });
  }

  QueryBuilder<Region, NamedApiResource?, QQueryOperations>
      mainGenerationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainGeneration');
    });
  }

  QueryBuilder<Region, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Region, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Region, List<NamedApiResource>?, QQueryOperations>
      pokedexesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokedexes');
    });
  }

  QueryBuilder<Region, List<NamedApiResource>?, QQueryOperations>
      versionGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroups');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EncounterMethodRateSchema = Schema(
  name: r'EncounterMethodRate',
  id: -7238761907521095457,
  properties: {
    r'encounterMethod': PropertySchema(
      id: 0,
      name: r'encounterMethod',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'versionDetails': PropertySchema(
      id: 1,
      name: r'versionDetails',
      type: IsarType.objectList,
      target: r'EncounterVersionDetails',
    )
  },
  estimateSize: _encounterMethodRateEstimateSize,
  serialize: _encounterMethodRateSerialize,
  deserialize: _encounterMethodRateDeserialize,
  deserializeProp: _encounterMethodRateDeserializeProp,
);

int _encounterMethodRateEstimateSize(
  EncounterMethodRate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.encounterMethod;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.versionDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[EncounterVersionDetails]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += EncounterVersionDetailsSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _encounterMethodRateSerialize(
  EncounterMethodRate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.encounterMethod,
  );
  writer.writeObjectList<EncounterVersionDetails>(
    offsets[1],
    allOffsets,
    EncounterVersionDetailsSchema.serialize,
    object.versionDetails,
  );
}

EncounterMethodRate _encounterMethodRateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EncounterMethodRate(
    encounterMethod: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionDetails: reader.readObjectList<EncounterVersionDetails>(
      offsets[1],
      EncounterVersionDetailsSchema.deserialize,
      allOffsets,
      EncounterVersionDetails(),
    ),
  );
  return object;
}

P _encounterMethodRateDeserializeProp<P>(
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
      return (reader.readObjectList<EncounterVersionDetails>(
        offset,
        EncounterVersionDetailsSchema.deserialize,
        allOffsets,
        EncounterVersionDetails(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EncounterMethodRateQueryFilter on QueryBuilder<EncounterMethodRate,
    EncounterMethodRate, QFilterCondition> {
  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      encounterMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encounterMethod',
      ));
    });
  }

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      encounterMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encounterMethod',
      ));
    });
  }

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      versionDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      versionDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
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

extension EncounterMethodRateQueryObject on QueryBuilder<EncounterMethodRate,
    EncounterMethodRate, QFilterCondition> {
  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      encounterMethod(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'encounterMethod');
    });
  }

  QueryBuilder<EncounterMethodRate, EncounterMethodRate, QAfterFilterCondition>
      versionDetailsElement(FilterQuery<EncounterVersionDetails> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionDetails');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EncounterVersionDetailsSchema = Schema(
  name: r'EncounterVersionDetails',
  id: 3351267991095867199,
  properties: {
    r'rate': PropertySchema(
      id: 0,
      name: r'rate',
      type: IsarType.long,
    ),
    r'version': PropertySchema(
      id: 1,
      name: r'version',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _encounterVersionDetailsEstimateSize,
  serialize: _encounterVersionDetailsSerialize,
  deserialize: _encounterVersionDetailsDeserialize,
  deserializeProp: _encounterVersionDetailsDeserializeProp,
);

int _encounterVersionDetailsEstimateSize(
  EncounterVersionDetails object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.version;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _encounterVersionDetailsSerialize(
  EncounterVersionDetails object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.rate);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.version,
  );
}

EncounterVersionDetails _encounterVersionDetailsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EncounterVersionDetails(
    rate: reader.readLongOrNull(offsets[0]),
    version: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _encounterVersionDetailsDeserializeProp<P>(
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

extension EncounterVersionDetailsQueryFilter on QueryBuilder<
    EncounterVersionDetails, EncounterVersionDetails, QFilterCondition> {
  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> rateBetween(
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

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension EncounterVersionDetailsQueryObject on QueryBuilder<
    EncounterVersionDetails, EncounterVersionDetails, QFilterCondition> {
  QueryBuilder<EncounterVersionDetails, EncounterVersionDetails,
      QAfterFilterCondition> version(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokemonEncounterSchema = Schema(
  name: r'PokemonEncounter',
  id: -2005649210536428019,
  properties: {
    r'pokemon': PropertySchema(
      id: 0,
      name: r'pokemon',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'versionDetails': PropertySchema(
      id: 1,
      name: r'versionDetails',
      type: IsarType.objectList,
      target: r'VersionEncounterDetail',
    )
  },
  estimateSize: _pokemonEncounterEstimateSize,
  serialize: _pokemonEncounterSerialize,
  deserialize: _pokemonEncounterDeserialize,
  deserializeProp: _pokemonEncounterDeserializeProp,
);

int _pokemonEncounterEstimateSize(
  PokemonEncounter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pokemon;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.versionDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VersionEncounterDetail]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += VersionEncounterDetailSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _pokemonEncounterSerialize(
  PokemonEncounter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemon,
  );
  writer.writeObjectList<VersionEncounterDetail>(
    offsets[1],
    allOffsets,
    VersionEncounterDetailSchema.serialize,
    object.versionDetails,
  );
}

PokemonEncounter _pokemonEncounterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonEncounter(
    pokemon: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionDetails: reader.readObjectList<VersionEncounterDetail>(
      offsets[1],
      VersionEncounterDetailSchema.deserialize,
      allOffsets,
      VersionEncounterDetail(),
    ),
  );
  return object;
}

P _pokemonEncounterDeserializeProp<P>(
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
      return (reader.readObjectList<VersionEncounterDetail>(
        offset,
        VersionEncounterDetailSchema.deserialize,
        allOffsets,
        VersionEncounterDetail(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PokemonEncounterQueryFilter
    on QueryBuilder<PokemonEncounter, PokemonEncounter, QFilterCondition> {
  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      pokemonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      pokemonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      versionDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      versionDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionDetails',
      ));
    });
  }

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
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

extension PokemonEncounterQueryObject
    on QueryBuilder<PokemonEncounter, PokemonEncounter, QFilterCondition> {
  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      pokemon(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemon');
    });
  }

  QueryBuilder<PokemonEncounter, PokemonEncounter, QAfterFilterCondition>
      versionDetailsElement(FilterQuery<VersionEncounterDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionDetails');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PalParkEncounterSpeciesSchema = Schema(
  name: r'PalParkEncounterSpecies',
  id: 4714529417986425041,
  properties: {
    r'baseScore': PropertySchema(
      id: 0,
      name: r'baseScore',
      type: IsarType.long,
    ),
    r'pokemonSpecies': PropertySchema(
      id: 1,
      name: r'pokemonSpecies',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'rate': PropertySchema(
      id: 2,
      name: r'rate',
      type: IsarType.long,
    )
  },
  estimateSize: _palParkEncounterSpeciesEstimateSize,
  serialize: _palParkEncounterSpeciesSerialize,
  deserialize: _palParkEncounterSpeciesDeserialize,
  deserializeProp: _palParkEncounterSpeciesDeserializeProp,
);

int _palParkEncounterSpeciesEstimateSize(
  PalParkEncounterSpecies object,
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

void _palParkEncounterSpeciesSerialize(
  PalParkEncounterSpecies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.baseScore);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemonSpecies,
  );
  writer.writeLong(offsets[2], object.rate);
}

PalParkEncounterSpecies _palParkEncounterSpeciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PalParkEncounterSpecies(
    baseScore: reader.readLongOrNull(offsets[0]),
    pokemonSpecies: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    rate: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _palParkEncounterSpeciesDeserializeProp<P>(
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
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PalParkEncounterSpeciesQueryFilter on QueryBuilder<
    PalParkEncounterSpecies, PalParkEncounterSpecies, QFilterCondition> {
  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseScore',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseScore',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseScore',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreGreaterThan(
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

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreLessThan(
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

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> baseScoreBetween(
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

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> rateBetween(
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

extension PalParkEncounterSpeciesQueryObject on QueryBuilder<
    PalParkEncounterSpecies, PalParkEncounterSpecies, QFilterCondition> {
  QueryBuilder<PalParkEncounterSpecies, PalParkEncounterSpecies,
      QAfterFilterCondition> pokemonSpecies(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      region: json['region'] == null
          ? null
          : NamedApiResource.fromJson(json['region'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>?)
          ?.map((e) => GenerationGameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'names': instance.names,
      'game_indices': instance.gameIndices,
      'areas': instance.areas,
    };

LocationArea _$LocationAreaFromJson(Map<String, dynamic> json) => LocationArea(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      gameIndex: (json['game_index'] as num?)?.toInt(),
      encounterMethodRates: (json['encounter_method_rates'] as List<dynamic>?)
          ?.map((e) => EncounterMethodRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : NamedApiResource.fromJson(json['location'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonEncounters: (json['pokemon_encounters'] as List<dynamic>?)
          ?.map((e) => PokemonEncounter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationAreaToJson(LocationArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'game_index': instance.gameIndex,
      'encounter_method_rates': instance.encounterMethodRates,
      'location': instance.location,
      'names': instance.names,
      'pokemon_encounters': instance.pokemonEncounters,
    };

EncounterMethodRate _$EncounterMethodRateFromJson(Map<String, dynamic> json) =>
    EncounterMethodRate(
      encounterMethod: json['encounter_method'] == null
          ? null
          : NamedApiResource.fromJson(
              json['encounter_method'] as Map<String, dynamic>),
      versionDetails: (json['version_details'] as List<dynamic>?)
          ?.map((e) =>
              EncounterVersionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EncounterMethodRateToJson(
        EncounterMethodRate instance) =>
    <String, dynamic>{
      'encounter_method': instance.encounterMethod,
      'version_details': instance.versionDetails,
    };

EncounterVersionDetails _$EncounterVersionDetailsFromJson(
        Map<String, dynamic> json) =>
    EncounterVersionDetails(
      rate: (json['rate'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : NamedApiResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EncounterVersionDetailsToJson(
        EncounterVersionDetails instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'version': instance.version,
    };

PokemonEncounter _$PokemonEncounterFromJson(Map<String, dynamic> json) =>
    PokemonEncounter(
      pokemon: json['pokemon'] == null
          ? null
          : NamedApiResource.fromJson(json['pokemon'] as Map<String, dynamic>),
      versionDetails: (json['version_details'] as List<dynamic>?)
          ?.map(
              (e) => VersionEncounterDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonEncounterToJson(PokemonEncounter instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon,
      'version_details': instance.versionDetails,
    };

PalParkArea _$PalParkAreaFromJson(Map<String, dynamic> json) => PalParkArea(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonEncounters: (json['pokemon_encounters'] as List<dynamic>?)
          ?.map((e) =>
              PalParkEncounterSpecies.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PalParkAreaToJson(PalParkArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
      'pokemon_encounters': instance.pokemonEncounters,
    };

PalParkEncounterSpecies _$PalParkEncounterSpeciesFromJson(
        Map<String, dynamic> json) =>
    PalParkEncounterSpecies(
      baseScore: (json['base_score'] as num?)?.toInt(),
      rate: (json['rate'] as num?)?.toInt(),
      pokemonSpecies: json['pokemon_species'] == null
          ? null
          : NamedApiResource.fromJson(
              json['pokemon_species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PalParkEncounterSpeciesToJson(
        PalParkEncounterSpecies instance) =>
    <String, dynamic>{
      'base_score': instance.baseScore,
      'rate': instance.rate,
      'pokemon_species': instance.pokemonSpecies,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainGeneration: json['main_generation'] == null
          ? null
          : NamedApiResource.fromJson(
              json['main_generation'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokedexes: (json['pokedexes'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locations': instance.locations,
      'main_generation': instance.mainGeneration,
      'names': instance.names,
      'pokedexes': instance.pokedexes,
      'version_groups': instance.versionGroups,
    };
