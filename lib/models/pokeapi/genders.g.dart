// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genders.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGenderCollection on Isar {
  IsarCollection<Gender> get genders => this.collection();
}

const GenderSchema = CollectionSchema(
  name: r'Gender',
  id: -3936478105572216743,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'pokemonSpeciesDetails': PropertySchema(
      id: 1,
      name: r'pokemonSpeciesDetails',
      type: IsarType.objectList,
      target: r'PokemonSpeciesGender',
    ),
    r'requiredForEvolution': PropertySchema(
      id: 2,
      name: r'requiredForEvolution',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _genderEstimateSize,
  serialize: _genderSerialize,
  deserialize: _genderDeserialize,
  deserializeProp: _genderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'PokemonSpeciesGender': PokemonSpeciesGenderSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _genderGetId,
  getLinks: _genderGetLinks,
  attach: _genderAttach,
  version: '3.1.8',
);

int _genderEstimateSize(
  Gender object,
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
    final list = object.pokemonSpeciesDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PokemonSpeciesGender]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += PokemonSpeciesGenderSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.requiredForEvolution;
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

void _genderSerialize(
  Gender object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObjectList<PokemonSpeciesGender>(
    offsets[1],
    allOffsets,
    PokemonSpeciesGenderSchema.serialize,
    object.pokemonSpeciesDetails,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.requiredForEvolution,
  );
}

Gender _genderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Gender(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    pokemonSpeciesDetails: reader.readObjectList<PokemonSpeciesGender>(
      offsets[1],
      PokemonSpeciesGenderSchema.deserialize,
      allOffsets,
      PokemonSpeciesGender(),
    ),
    requiredForEvolution: reader.readObjectList<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _genderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<PokemonSpeciesGender>(
        offset,
        PokemonSpeciesGenderSchema.deserialize,
        allOffsets,
        PokemonSpeciesGender(),
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

Id _genderGetId(Gender object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _genderGetLinks(Gender object) {
  return [];
}

void _genderAttach(IsarCollection<dynamic> col, Id id, Gender object) {}

extension GenderQueryWhereSort on QueryBuilder<Gender, Gender, QWhere> {
  QueryBuilder<Gender, Gender, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GenderQueryWhere on QueryBuilder<Gender, Gender, QWhereClause> {
  QueryBuilder<Gender, Gender, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Gender, Gender, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idBetween(
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

extension GenderQueryFilter on QueryBuilder<Gender, Gender, QFilterCondition> {
  QueryBuilder<Gender, Gender, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpeciesDetails',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpeciesDetails',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemonSpeciesDetails',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requiredForEvolution',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requiredForEvolution',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requiredForEvolution',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GenderQueryObject on QueryBuilder<Gender, Gender, QFilterCondition> {
  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      pokemonSpeciesDetailsElement(FilterQuery<PokemonSpeciesGender> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpeciesDetails');
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition>
      requiredForEvolutionElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'requiredForEvolution');
    });
  }
}

extension GenderQueryLinks on QueryBuilder<Gender, Gender, QFilterCondition> {}

extension GenderQuerySortBy on QueryBuilder<Gender, Gender, QSortBy> {
  QueryBuilder<Gender, Gender, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GenderQuerySortThenBy on QueryBuilder<Gender, Gender, QSortThenBy> {
  QueryBuilder<Gender, Gender, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GenderQueryWhereDistinct on QueryBuilder<Gender, Gender, QDistinct> {
  QueryBuilder<Gender, Gender, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GenderQueryProperty on QueryBuilder<Gender, Gender, QQueryProperty> {
  QueryBuilder<Gender, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Gender, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Gender, List<PokemonSpeciesGender>?, QQueryOperations>
      pokemonSpeciesDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonSpeciesDetails');
    });
  }

  QueryBuilder<Gender, List<NamedApiResource>?, QQueryOperations>
      requiredForEvolutionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requiredForEvolution');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PokemonSpeciesGenderSchema = Schema(
  name: r'PokemonSpeciesGender',
  id: 6529379875146410704,
  properties: {
    r'pokemonSpecies': PropertySchema(
      id: 0,
      name: r'pokemonSpecies',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'rate': PropertySchema(
      id: 1,
      name: r'rate',
      type: IsarType.long,
    )
  },
  estimateSize: _pokemonSpeciesGenderEstimateSize,
  serialize: _pokemonSpeciesGenderSerialize,
  deserialize: _pokemonSpeciesGenderDeserialize,
  deserializeProp: _pokemonSpeciesGenderDeserializeProp,
);

int _pokemonSpeciesGenderEstimateSize(
  PokemonSpeciesGender object,
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

void _pokemonSpeciesGenderSerialize(
  PokemonSpeciesGender object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemonSpecies,
  );
  writer.writeLong(offsets[1], object.rate);
}

PokemonSpeciesGender _pokemonSpeciesGenderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PokemonSpeciesGender(
    pokemonSpecies: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    rate: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _pokemonSpeciesGenderDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PokemonSpeciesGenderQueryFilter on QueryBuilder<PokemonSpeciesGender,
    PokemonSpeciesGender, QFilterCondition> {
  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> pokemonSpeciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> pokemonSpeciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemonSpecies',
      ));
    });
  }

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> rateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
      ));
    });
  }

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
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

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
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

  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
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

extension PokemonSpeciesGenderQueryObject on QueryBuilder<PokemonSpeciesGender,
    PokemonSpeciesGender, QFilterCondition> {
  QueryBuilder<PokemonSpeciesGender, PokemonSpeciesGender,
      QAfterFilterCondition> pokemonSpecies(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemonSpecies');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      pokemonSpeciesDetails: (json['pokemon_species_details'] as List<dynamic>?)
          ?.map((e) => PokemonSpeciesGender.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredForEvolution: (json['required_for_evolution'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pokemon_species_details': instance.pokemonSpeciesDetails,
      'required_for_evolution': instance.requiredForEvolution,
    };

PokemonSpeciesGender _$PokemonSpeciesGenderFromJson(
        Map<String, dynamic> json) =>
    PokemonSpeciesGender(
      rate: (json['rate'] as num?)?.toInt(),
      pokemonSpecies: json['pokemon_species'] == null
          ? null
          : NamedApiResource.fromJson(
              json['pokemon_species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpeciesGenderToJson(
        PokemonSpeciesGender instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'pokemon_species': instance.pokemonSpecies,
    };
