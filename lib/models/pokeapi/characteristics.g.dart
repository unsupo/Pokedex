// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characteristics.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCharacteristicCollection on Isar {
  IsarCollection<Characteristic> get characteristics => this.collection();
}

const CharacteristicSchema = CollectionSchema(
  name: r'Characteristic',
  id: 3906960274280470669,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'geneModulo': PropertySchema(
      id: 1,
      name: r'geneModulo',
      type: IsarType.long,
    ),
    r'highestStat': PropertySchema(
      id: 2,
      name: r'highestStat',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'possibleValues': PropertySchema(
      id: 3,
      name: r'possibleValues',
      type: IsarType.longList,
    )
  },
  estimateSize: _characteristicEstimateSize,
  serialize: _characteristicSerialize,
  deserialize: _characteristicDeserialize,
  deserializeProp: _characteristicDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'Description': DescriptionSchema
  },
  getId: _characteristicGetId,
  getLinks: _characteristicGetLinks,
  attach: _characteristicAttach,
  version: '3.1.8',
);

int _characteristicEstimateSize(
  Characteristic object,
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
    final value = object.highestStat;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.possibleValues;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _characteristicSerialize(
  Characteristic object,
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
  writer.writeLong(offsets[1], object.geneModulo);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.highestStat,
  );
  writer.writeLongList(offsets[3], object.possibleValues);
}

Characteristic _characteristicDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Characteristic(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    geneModulo: reader.readLongOrNull(offsets[1]),
    highestStat: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
    possibleValues: reader.readLongList(offsets[3]),
  );
  return object;
}

P _characteristicDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _characteristicGetId(Characteristic object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characteristicGetLinks(Characteristic object) {
  return [];
}

void _characteristicAttach(
    IsarCollection<dynamic> col, Id id, Characteristic object) {}

extension CharacteristicQueryWhereSort
    on QueryBuilder<Characteristic, Characteristic, QWhere> {
  QueryBuilder<Characteristic, Characteristic, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CharacteristicQueryWhere
    on QueryBuilder<Characteristic, Characteristic, QWhereClause> {
  QueryBuilder<Characteristic, Characteristic, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Characteristic, Characteristic, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterWhereClause> idBetween(
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

extension CharacteristicQueryFilter
    on QueryBuilder<Characteristic, Characteristic, QFilterCondition> {
  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      descriptionsIsEmpty() {
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geneModulo',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geneModulo',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geneModulo',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geneModulo',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geneModulo',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      geneModuloBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geneModulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      highestStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'highestStat',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      highestStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'highestStat',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'possibleValues',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'possibleValues',
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'possibleValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'possibleValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'possibleValues',
        value: value,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'possibleValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      possibleValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CharacteristicQueryObject
    on QueryBuilder<Characteristic, Characteristic, QFilterCondition> {
  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterFilterCondition>
      highestStat(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'highestStat');
    });
  }
}

extension CharacteristicQueryLinks
    on QueryBuilder<Characteristic, Characteristic, QFilterCondition> {}

extension CharacteristicQuerySortBy
    on QueryBuilder<Characteristic, Characteristic, QSortBy> {
  QueryBuilder<Characteristic, Characteristic, QAfterSortBy>
      sortByGeneModulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geneModulo', Sort.asc);
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterSortBy>
      sortByGeneModuloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geneModulo', Sort.desc);
    });
  }
}

extension CharacteristicQuerySortThenBy
    on QueryBuilder<Characteristic, Characteristic, QSortThenBy> {
  QueryBuilder<Characteristic, Characteristic, QAfterSortBy>
      thenByGeneModulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geneModulo', Sort.asc);
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterSortBy>
      thenByGeneModuloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geneModulo', Sort.desc);
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Characteristic, Characteristic, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CharacteristicQueryWhereDistinct
    on QueryBuilder<Characteristic, Characteristic, QDistinct> {
  QueryBuilder<Characteristic, Characteristic, QDistinct>
      distinctByGeneModulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geneModulo');
    });
  }

  QueryBuilder<Characteristic, Characteristic, QDistinct>
      distinctByPossibleValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'possibleValues');
    });
  }
}

extension CharacteristicQueryProperty
    on QueryBuilder<Characteristic, Characteristic, QQueryProperty> {
  QueryBuilder<Characteristic, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Characteristic, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<Characteristic, int?, QQueryOperations> geneModuloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geneModulo');
    });
  }

  QueryBuilder<Characteristic, NamedApiResource?, QQueryOperations>
      highestStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highestStat');
    });
  }

  QueryBuilder<Characteristic, List<int>?, QQueryOperations>
      possibleValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'possibleValues');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characteristic _$CharacteristicFromJson(Map<String, dynamic> json) =>
    Characteristic(
      id: (json['id'] as num).toInt(),
      geneModulo: (json['gene_modulo'] as num?)?.toInt(),
      possibleValues: (json['possible_values'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      highestStat: json['highest_stat'] == null
          ? null
          : NamedApiResource.fromJson(
              json['highest_stat'] as Map<String, dynamic>),
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacteristicToJson(Characteristic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gene_modulo': instance.geneModulo,
      'possible_values': instance.possibleValues,
      'highest_stat': instance.highestStat,
      'descriptions': instance.descriptions,
    };
