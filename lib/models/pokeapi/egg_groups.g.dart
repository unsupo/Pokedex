// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'egg_groups.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEggGroupCollection on Isar {
  IsarCollection<EggGroup> get eggGroups => this.collection();
}

const EggGroupSchema = CollectionSchema(
  name: r'EggGroup',
  id: -9197729819725225350,
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
    r'pokemonSpecies': PropertySchema(
      id: 2,
      name: r'pokemonSpecies',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _eggGroupEstimateSize,
  serialize: _eggGroupSerialize,
  deserialize: _eggGroupDeserialize,
  deserializeProp: _eggGroupDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _eggGroupGetId,
  getLinks: _eggGroupGetLinks,
  attach: _eggGroupAttach,
  version: '3.1.8',
);

int _eggGroupEstimateSize(
  EggGroup object,
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
  return bytesCount;
}

void _eggGroupSerialize(
  EggGroup object,
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
    object.pokemonSpecies,
  );
}

EggGroup _eggGroupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EggGroup(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemonSpecies: reader.readObjectList<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _eggGroupDeserializeProp<P>(
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

Id _eggGroupGetId(EggGroup object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eggGroupGetLinks(EggGroup object) {
  return [];
}

void _eggGroupAttach(IsarCollection<dynamic> col, Id id, EggGroup object) {}

extension EggGroupQueryWhereSort on QueryBuilder<EggGroup, EggGroup, QWhere> {
  QueryBuilder<EggGroup, EggGroup, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EggGroupQueryWhere on QueryBuilder<EggGroup, EggGroup, QWhereClause> {
  QueryBuilder<EggGroup, EggGroup, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<EggGroup, EggGroup, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterWhereClause> idBetween(
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

extension EggGroupQueryFilter
    on QueryBuilder<EggGroup, EggGroup, QFilterCondition> {
  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameContains(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
      pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
      pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition>
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
}

extension EggGroupQueryObject
    on QueryBuilder<EggGroup, EggGroup, QFilterCondition> {
  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterFilterCondition> pokemonSpeciesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }
}

extension EggGroupQueryLinks
    on QueryBuilder<EggGroup, EggGroup, QFilterCondition> {}

extension EggGroupQuerySortBy on QueryBuilder<EggGroup, EggGroup, QSortBy> {
  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EggGroupQuerySortThenBy
    on QueryBuilder<EggGroup, EggGroup, QSortThenBy> {
  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<EggGroup, EggGroup, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension EggGroupQueryWhereDistinct
    on QueryBuilder<EggGroup, EggGroup, QDistinct> {
  QueryBuilder<EggGroup, EggGroup, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension EggGroupQueryProperty
    on QueryBuilder<EggGroup, EggGroup, QQueryProperty> {
  QueryBuilder<EggGroup, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EggGroup, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<EggGroup, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<EggGroup, List<NamedApiResource>?, QQueryOperations>
      pokemonSpeciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonSpecies');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EggGroup _$EggGroupFromJson(Map<String, dynamic> json) => EggGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EggGroupToJson(EggGroup instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
      'pokemon_species': instance.pokemonSpecies,
    };
