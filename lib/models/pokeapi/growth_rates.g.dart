// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_rates.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGrowthRateCollection on Isar {
  IsarCollection<GrowthRate> get growthRates => this.collection();
}

const GrowthRateSchema = CollectionSchema(
  name: r'GrowthRate',
  id: 5045574455198677970,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'formula': PropertySchema(
      id: 1,
      name: r'formula',
      type: IsarType.string,
    ),
    r'levels': PropertySchema(
      id: 2,
      name: r'levels',
      type: IsarType.objectList,
      target: r'GrowthRateExperienceLevel',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'pokemonSpecies': PropertySchema(
      id: 4,
      name: r'pokemonSpecies',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _growthRateEstimateSize,
  serialize: _growthRateSerialize,
  deserialize: _growthRateDeserialize,
  deserializeProp: _growthRateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Description': DescriptionSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'GrowthRateExperienceLevel': GrowthRateExperienceLevelSchema
  },
  getId: _growthRateGetId,
  getLinks: _growthRateGetLinks,
  attach: _growthRateAttach,
  version: '3.3.2',
);

int _growthRateEstimateSize(
  GrowthRate object,
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
    final value = object.formula;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.levels;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[GrowthRateExperienceLevel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += GrowthRateExperienceLevelSchema.estimateSize(
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

void _growthRateSerialize(
  GrowthRate object,
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
  writer.writeString(offsets[1], object.formula);
  writer.writeObjectList<GrowthRateExperienceLevel>(
    offsets[2],
    allOffsets,
    GrowthRateExperienceLevelSchema.serialize,
    object.levels,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<NamedApiResource>(
    offsets[4],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemonSpecies,
  );
}

GrowthRate _growthRateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GrowthRate(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    formula: reader.readStringOrNull(offsets[1]),
    id: id,
    levels: reader.readObjectList<GrowthRateExperienceLevel>(
      offsets[2],
      GrowthRateExperienceLevelSchema.deserialize,
      allOffsets,
      GrowthRateExperienceLevel(),
    ),
    name: reader.readStringOrNull(offsets[3]),
    pokemonSpecies: reader.readObjectList<NamedApiResource>(
      offsets[4],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _growthRateDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<GrowthRateExperienceLevel>(
        offset,
        GrowthRateExperienceLevelSchema.deserialize,
        allOffsets,
        GrowthRateExperienceLevel(),
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
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

Id _growthRateGetId(GrowthRate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _growthRateGetLinks(GrowthRate object) {
  return [];
}

void _growthRateAttach(IsarCollection<dynamic> col, Id id, GrowthRate object) {}

extension GrowthRateQueryWhereSort
    on QueryBuilder<GrowthRate, GrowthRate, QWhere> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GrowthRateQueryWhere
    on QueryBuilder<GrowthRate, GrowthRate, QWhereClause> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterWhereClause> idBetween(
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

extension GrowthRateQueryFilter
    on QueryBuilder<GrowthRate, GrowthRate, QFilterCondition> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'formula',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      formulaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'formula',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      formulaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formula',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formula',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formula',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> formulaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formula',
        value: '',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      formulaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formula',
        value: '',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> levelsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> levelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      levelsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameContains(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
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

extension GrowthRateQueryObject
    on QueryBuilder<GrowthRate, GrowthRate, QFilterCondition> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition> levelsElement(
      FilterQuery<GrowthRateExperienceLevel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'levels');
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterFilterCondition>
      pokemonSpeciesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }
}

extension GrowthRateQueryLinks
    on QueryBuilder<GrowthRate, GrowthRate, QFilterCondition> {}

extension GrowthRateQuerySortBy
    on QueryBuilder<GrowthRate, GrowthRate, QSortBy> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> sortByFormula() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formula', Sort.asc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> sortByFormulaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formula', Sort.desc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GrowthRateQuerySortThenBy
    on QueryBuilder<GrowthRate, GrowthRate, QSortThenBy> {
  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenByFormula() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formula', Sort.asc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenByFormulaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formula', Sort.desc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GrowthRateQueryWhereDistinct
    on QueryBuilder<GrowthRate, GrowthRate, QDistinct> {
  QueryBuilder<GrowthRate, GrowthRate, QDistinct> distinctByFormula(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formula', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GrowthRate, GrowthRate, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GrowthRateQueryProperty
    on QueryBuilder<GrowthRate, GrowthRate, QQueryProperty> {
  QueryBuilder<GrowthRate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GrowthRate, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<GrowthRate, String?, QQueryOperations> formulaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formula');
    });
  }

  QueryBuilder<GrowthRate, List<GrowthRateExperienceLevel>?, QQueryOperations>
      levelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levels');
    });
  }

  QueryBuilder<GrowthRate, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GrowthRate, List<NamedApiResource>?, QQueryOperations>
      pokemonSpeciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonSpecies');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GrowthRateExperienceLevelSchema = Schema(
  name: r'GrowthRateExperienceLevel',
  id: 4753356398997013543,
  properties: {
    r'experience': PropertySchema(
      id: 0,
      name: r'experience',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 1,
      name: r'level',
      type: IsarType.long,
    )
  },
  estimateSize: _growthRateExperienceLevelEstimateSize,
  serialize: _growthRateExperienceLevelSerialize,
  deserialize: _growthRateExperienceLevelDeserialize,
  deserializeProp: _growthRateExperienceLevelDeserializeProp,
);

int _growthRateExperienceLevelEstimateSize(
  GrowthRateExperienceLevel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _growthRateExperienceLevelSerialize(
  GrowthRateExperienceLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.experience);
  writer.writeLong(offsets[1], object.level);
}

GrowthRateExperienceLevel _growthRateExperienceLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GrowthRateExperienceLevel(
    experience: reader.readLongOrNull(offsets[0]),
    level: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _growthRateExperienceLevelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GrowthRateExperienceLevelQueryFilter on QueryBuilder<
    GrowthRateExperienceLevel, GrowthRateExperienceLevel, QFilterCondition> {
  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'experience',
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'experience',
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experience',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'experience',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'experience',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> experienceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'experience',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'level',
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<GrowthRateExperienceLevel, GrowthRateExperienceLevel,
      QAfterFilterCondition> levelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GrowthRateExperienceLevelQueryObject on QueryBuilder<
    GrowthRateExperienceLevel, GrowthRateExperienceLevel, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrowthRate _$GrowthRateFromJson(Map<String, dynamic> json) => GrowthRate(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      formula: json['formula'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) =>
              GrowthRateExperienceLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrowthRateToJson(GrowthRate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'formula': instance.formula,
      'descriptions': instance.descriptions,
      'levels': instance.levels,
      'pokemon_species': instance.pokemonSpecies,
    };

GrowthRateExperienceLevel _$GrowthRateExperienceLevelFromJson(
        Map<String, dynamic> json) =>
    GrowthRateExperienceLevel(
      level: (json['level'] as num?)?.toInt(),
      experience: (json['experience'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GrowthRateExperienceLevelToJson(
        GrowthRateExperienceLevel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'experience': instance.experience,
    };
