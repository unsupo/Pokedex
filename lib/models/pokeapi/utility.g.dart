// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utility.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLanguageCollection on Isar {
  IsarCollection<Language> get languages => this.collection();
}

const LanguageSchema = CollectionSchema(
  name: r'Language',
  id: -2011595345252117802,
  properties: {
    r'iso3166': PropertySchema(
      id: 0,
      name: r'iso3166',
      type: IsarType.string,
    ),
    r'iso639': PropertySchema(
      id: 1,
      name: r'iso639',
      type: IsarType.string,
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
    r'official': PropertySchema(
      id: 4,
      name: r'official',
      type: IsarType.bool,
    )
  },
  estimateSize: _languageEstimateSize,
  serialize: _languageSerialize,
  deserialize: _languageDeserialize,
  deserializeProp: _languageDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _languageGetId,
  getLinks: _languageGetLinks,
  attach: _languageAttach,
  version: '3.1.8',
);

int _languageEstimateSize(
  Language object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.iso3166;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.iso639;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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

void _languageSerialize(
  Language object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.iso3166);
  writer.writeString(offsets[1], object.iso639);
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeBool(offsets[4], object.official);
}

Language _languageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Language(
    id: id,
    iso3166: reader.readStringOrNull(offsets[0]),
    iso639: reader.readStringOrNull(offsets[1]),
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    official: reader.readBoolOrNull(offsets[4]),
  );
  return object;
}

P _languageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
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
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _languageGetId(Language object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _languageGetLinks(Language object) {
  return [];
}

void _languageAttach(IsarCollection<dynamic> col, Id id, Language object) {}

extension LanguageQueryWhereSort on QueryBuilder<Language, Language, QWhere> {
  QueryBuilder<Language, Language, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LanguageQueryWhere on QueryBuilder<Language, Language, QWhereClause> {
  QueryBuilder<Language, Language, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Language, Language, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Language, Language, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Language, Language, QAfterWhereClause> idBetween(
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

extension LanguageQueryFilter
    on QueryBuilder<Language, Language, QFilterCondition> {
  QueryBuilder<Language, Language, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iso3166',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iso3166',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iso3166',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iso3166',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iso3166',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso3166',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso3166IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iso3166',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iso639',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iso639',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iso639',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iso639',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iso639',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iso639',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> iso639IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iso639',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Language, Language, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Language, Language, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Language, Language, QAfterFilterCondition>
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

  QueryBuilder<Language, Language, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Language, Language, QAfterFilterCondition> officialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'official',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> officialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'official',
      ));
    });
  }

  QueryBuilder<Language, Language, QAfterFilterCondition> officialEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'official',
        value: value,
      ));
    });
  }
}

extension LanguageQueryObject
    on QueryBuilder<Language, Language, QFilterCondition> {
  QueryBuilder<Language, Language, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension LanguageQueryLinks
    on QueryBuilder<Language, Language, QFilterCondition> {}

extension LanguageQuerySortBy on QueryBuilder<Language, Language, QSortBy> {
  QueryBuilder<Language, Language, QAfterSortBy> sortByIso3166() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3166', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByIso3166Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3166', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByIso639() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso639', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByIso639Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso639', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'official', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> sortByOfficialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'official', Sort.desc);
    });
  }
}

extension LanguageQuerySortThenBy
    on QueryBuilder<Language, Language, QSortThenBy> {
  QueryBuilder<Language, Language, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByIso3166() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3166', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByIso3166Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso3166', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByIso639() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso639', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByIso639Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iso639', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'official', Sort.asc);
    });
  }

  QueryBuilder<Language, Language, QAfterSortBy> thenByOfficialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'official', Sort.desc);
    });
  }
}

extension LanguageQueryWhereDistinct
    on QueryBuilder<Language, Language, QDistinct> {
  QueryBuilder<Language, Language, QDistinct> distinctByIso3166(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iso3166', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Language, Language, QDistinct> distinctByIso639(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iso639', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Language, Language, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Language, Language, QDistinct> distinctByOfficial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'official');
    });
  }
}

extension LanguageQueryProperty
    on QueryBuilder<Language, Language, QQueryProperty> {
  QueryBuilder<Language, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Language, String?, QQueryOperations> iso3166Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iso3166');
    });
  }

  QueryBuilder<Language, String?, QQueryOperations> iso639Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iso639');
    });
  }

  QueryBuilder<Language, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Language, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Language, bool?, QQueryOperations> officialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'official');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ApiResourceSchema = Schema(
  name: r'ApiResource',
  id: -80332385689404658,
  properties: {
    r'url': PropertySchema(
      id: 0,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _apiResourceEstimateSize,
  serialize: _apiResourceSerialize,
  deserialize: _apiResourceDeserialize,
  deserializeProp: _apiResourceDeserializeProp,
);

int _apiResourceEstimateSize(
  ApiResource object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _apiResourceSerialize(
  ApiResource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.url);
}

ApiResource _apiResourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ApiResource(
    url: reader.readStringOrNull(offsets[0]),
  );
  return object;
}

P _apiResourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ApiResourceQueryFilter
    on QueryBuilder<ApiResource, ApiResource, QFilterCondition> {
  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlEqualTo(
    String? value, {
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlGreaterThan(
    String? value, {
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlLessThan(
    String? value, {
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiResource, ApiResource, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension ApiResourceQueryObject
    on QueryBuilder<ApiResource, ApiResource, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DescriptionSchema = Schema(
  name: r'Description',
  id: 405142296649109475,
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
      target: r'NamedApiResource',
    )
  },
  estimateSize: _descriptionEstimateSize,
  serialize: _descriptionSerialize,
  deserialize: _descriptionDeserialize,
  deserializeProp: _descriptionDeserializeProp,
);

int _descriptionEstimateSize(
  Description object,
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
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _descriptionSerialize(
  Description object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
}

Description _descriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Description(
    description: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _descriptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension DescriptionQueryFilter
    on QueryBuilder<Description, Description, QFilterCondition> {
  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
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

  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Description, Description, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }
}

extension DescriptionQueryObject
    on QueryBuilder<Description, Description, QFilterCondition> {
  QueryBuilder<Description, Description, QAfterFilterCondition> language(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EffectSchema = Schema(
  name: r'Effect',
  id: -708053119052845544,
  properties: {
    r'effect': PropertySchema(
      id: 0,
      name: r'effect',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 1,
      name: r'language',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _effectEstimateSize,
  serialize: _effectSerialize,
  deserialize: _effectDeserialize,
  deserializeProp: _effectDeserializeProp,
);

int _effectEstimateSize(
  Effect object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.effect;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _effectSerialize(
  Effect object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.effect);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
}

Effect _effectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Effect(
    effect: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _effectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
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

extension EffectQueryFilter on QueryBuilder<Effect, Effect, QFilterCondition> {
  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effect',
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effect',
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'effect',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effect',
        value: '',
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> effectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'effect',
        value: '',
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<Effect, Effect, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }
}

extension EffectQueryObject on QueryBuilder<Effect, Effect, QFilterCondition> {
  QueryBuilder<Effect, Effect, QAfterFilterCondition> language(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EncounterSchema = Schema(
  name: r'Encounter',
  id: -8681791109818789125,
  properties: {
    r'chance': PropertySchema(
      id: 0,
      name: r'chance',
      type: IsarType.long,
    ),
    r'conditionValues': PropertySchema(
      id: 1,
      name: r'conditionValues',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'maxLevel': PropertySchema(
      id: 2,
      name: r'maxLevel',
      type: IsarType.long,
    ),
    r'method': PropertySchema(
      id: 3,
      name: r'method',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'minLevel': PropertySchema(
      id: 4,
      name: r'minLevel',
      type: IsarType.long,
    )
  },
  estimateSize: _encounterEstimateSize,
  serialize: _encounterSerialize,
  deserialize: _encounterDeserialize,
  deserializeProp: _encounterDeserializeProp,
);

int _encounterEstimateSize(
  Encounter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.conditionValues;
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
    final value = object.method;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _encounterSerialize(
  Encounter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chance);
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.conditionValues,
  );
  writer.writeLong(offsets[2], object.maxLevel);
  writer.writeObject<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.method,
  );
  writer.writeLong(offsets[4], object.minLevel);
}

Encounter _encounterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Encounter(
    chance: reader.readLongOrNull(offsets[0]),
    conditionValues: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    maxLevel: reader.readLongOrNull(offsets[2]),
    method: reader.readObjectOrNull<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    minLevel: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _encounterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EncounterQueryFilter
    on QueryBuilder<Encounter, Encounter, QFilterCondition> {
  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chance',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chance',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chance',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chance',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chance',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> chanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conditionValues',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conditionValues',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'conditionValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> maxLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxLevel',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      maxLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxLevel',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> maxLevelEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> maxLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> maxLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> maxLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> methodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'method',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> methodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'method',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> minLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minLevel',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      minLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minLevel',
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> minLevelEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> minLevelGreaterThan(
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

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> minLevelLessThan(
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

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> minLevelBetween(
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
}

extension EncounterQueryObject
    on QueryBuilder<Encounter, Encounter, QFilterCondition> {
  QueryBuilder<Encounter, Encounter, QAfterFilterCondition>
      conditionValuesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'conditionValues');
    });
  }

  QueryBuilder<Encounter, Encounter, QAfterFilterCondition> method(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'method');
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
      target: r'NamedApiResource',
    ),
    r'version': PropertySchema(
      id: 2,
      name: r'version',
      type: IsarType.object,
      target: r'NamedApiResource',
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
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
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

void _flavorTextSerialize(
  FlavorText object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.flavorText);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
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
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    version: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
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
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
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
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }

  QueryBuilder<FlavorText, FlavorText, QAfterFilterCondition> version(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GenerationGameIndexSchema = Schema(
  name: r'GenerationGameIndex',
  id: 8881863741767168385,
  properties: {
    r'gameIndex': PropertySchema(
      id: 0,
      name: r'gameIndex',
      type: IsarType.long,
    ),
    r'generation': PropertySchema(
      id: 1,
      name: r'generation',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _generationGameIndexEstimateSize,
  serialize: _generationGameIndexSerialize,
  deserialize: _generationGameIndexDeserialize,
  deserializeProp: _generationGameIndexDeserializeProp,
);

int _generationGameIndexEstimateSize(
  GenerationGameIndex object,
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
  return bytesCount;
}

void _generationGameIndexSerialize(
  GenerationGameIndex object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.gameIndex);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.generation,
  );
}

GenerationGameIndex _generationGameIndexDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GenerationGameIndex(
    gameIndex: reader.readLongOrNull(offsets[0]),
    generation: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _generationGameIndexDeserializeProp<P>(
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

extension GenerationGameIndexQueryFilter on QueryBuilder<GenerationGameIndex,
    GenerationGameIndex, QFilterCondition> {
  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      gameIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      gameIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      gameIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
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

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
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

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
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

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }
}

extension GenerationGameIndexQueryObject on QueryBuilder<GenerationGameIndex,
    GenerationGameIndex, QFilterCondition> {
  QueryBuilder<GenerationGameIndex, GenerationGameIndex, QAfterFilterCondition>
      generation(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generation');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MachineVersionDetailSchema = Schema(
  name: r'MachineVersionDetail',
  id: -5813310541272133221,
  properties: {
    r'machine': PropertySchema(
      id: 0,
      name: r'machine',
      type: IsarType.object,
      target: r'ApiResource',
    ),
    r'versionGroup': PropertySchema(
      id: 1,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _machineVersionDetailEstimateSize,
  serialize: _machineVersionDetailSerialize,
  deserialize: _machineVersionDetailDeserialize,
  deserializeProp: _machineVersionDetailDeserializeProp,
);

int _machineVersionDetailEstimateSize(
  MachineVersionDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.machine;
    if (value != null) {
      bytesCount += 3 +
          ApiResourceSchema.estimateSize(
              value, allOffsets[ApiResource]!, allOffsets);
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

void _machineVersionDetailSerialize(
  MachineVersionDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ApiResource>(
    offsets[0],
    allOffsets,
    ApiResourceSchema.serialize,
    object.machine,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

MachineVersionDetail _machineVersionDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MachineVersionDetail(
    machine: reader.readObjectOrNull<ApiResource>(
      offsets[0],
      ApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _machineVersionDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ApiResource>(
        offset,
        ApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
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

extension MachineVersionDetailQueryFilter on QueryBuilder<MachineVersionDetail,
    MachineVersionDetail, QFilterCondition> {
  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> machineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> machineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machine',
      ));
    });
  }

  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension MachineVersionDetailQueryObject on QueryBuilder<MachineVersionDetail,
    MachineVersionDetail, QFilterCondition> {
  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> machine(FilterQuery<ApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'machine');
    });
  }

  QueryBuilder<MachineVersionDetail, MachineVersionDetail,
      QAfterFilterCondition> versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ApiNameSchema = Schema(
  name: r'ApiName',
  id: 5101113377550768996,
  properties: {
    r'language': PropertySchema(
      id: 0,
      name: r'language',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _apiNameEstimateSize,
  serialize: _apiNameSerialize,
  deserialize: _apiNameDeserialize,
  deserializeProp: _apiNameDeserializeProp,
);

int _apiNameEstimateSize(
  ApiName object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.language;
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
  return bytesCount;
}

void _apiNameSerialize(
  ApiName object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
  writer.writeString(offsets[1], object.name);
}

ApiName _apiNameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ApiName(
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _apiNameDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ApiNameQueryFilter
    on QueryBuilder<ApiName, ApiName, QFilterCondition> {
  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameContains(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension ApiNameQueryObject
    on QueryBuilder<ApiName, ApiName, QFilterCondition> {
  QueryBuilder<ApiName, ApiName, QAfterFilterCondition> language(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NamedApiResourceSchema = Schema(
  name: r'NamedApiResource',
  id: 6401748191243771623,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _namedApiResourceEstimateSize,
  serialize: _namedApiResourceSerialize,
  deserialize: _namedApiResourceDeserialize,
  deserializeProp: _namedApiResourceDeserializeProp,
);

int _namedApiResourceEstimateSize(
  NamedApiResource object,
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
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _namedApiResourceSerialize(
  NamedApiResource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.url);
}

NamedApiResource _namedApiResourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NamedApiResource(
    name: reader.readStringOrNull(offsets[0]),
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _namedApiResourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NamedApiResourceQueryFilter
    on QueryBuilder<NamedApiResource, NamedApiResource, QFilterCondition> {
  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlEqualTo(
    String? value, {
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlLessThan(
    String? value, {
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
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

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<NamedApiResource, NamedApiResource, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension NamedApiResourceQueryObject
    on QueryBuilder<NamedApiResource, NamedApiResource, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VerboseEffectSchema = Schema(
  name: r'VerboseEffect',
  id: 860738014678385563,
  properties: {
    r'effect': PropertySchema(
      id: 0,
      name: r'effect',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 1,
      name: r'language',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'shortEffect': PropertySchema(
      id: 2,
      name: r'shortEffect',
      type: IsarType.string,
    )
  },
  estimateSize: _verboseEffectEstimateSize,
  serialize: _verboseEffectSerialize,
  deserialize: _verboseEffectDeserialize,
  deserializeProp: _verboseEffectDeserializeProp,
);

int _verboseEffectEstimateSize(
  VerboseEffect object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.effect;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.shortEffect;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _verboseEffectSerialize(
  VerboseEffect object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.effect);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
  writer.writeString(offsets[2], object.shortEffect);
}

VerboseEffect _verboseEffectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VerboseEffect(
    effect: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    shortEffect: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _verboseEffectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VerboseEffectQueryFilter
    on QueryBuilder<VerboseEffect, VerboseEffect, QFilterCondition> {
  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effect',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effect',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'effect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'effect',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effect',
        value: '',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      effectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'effect',
        value: '',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shortEffect',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shortEffect',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortEffect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortEffect',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortEffect',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortEffect',
        value: '',
      ));
    });
  }

  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition>
      shortEffectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortEffect',
        value: '',
      ));
    });
  }
}

extension VerboseEffectQueryObject
    on QueryBuilder<VerboseEffect, VerboseEffect, QFilterCondition> {
  QueryBuilder<VerboseEffect, VerboseEffect, QAfterFilterCondition> language(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionEncounterDetailSchema = Schema(
  name: r'VersionEncounterDetail',
  id: -5348597995533812259,
  properties: {
    r'encounterDetails': PropertySchema(
      id: 0,
      name: r'encounterDetails',
      type: IsarType.objectList,
      target: r'Encounter',
    ),
    r'maxChance': PropertySchema(
      id: 1,
      name: r'maxChance',
      type: IsarType.long,
    ),
    r'version': PropertySchema(
      id: 2,
      name: r'version',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _versionEncounterDetailEstimateSize,
  serialize: _versionEncounterDetailSerialize,
  deserialize: _versionEncounterDetailDeserialize,
  deserializeProp: _versionEncounterDetailDeserializeProp,
);

int _versionEncounterDetailEstimateSize(
  VersionEncounterDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.encounterDetails;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Encounter]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              EncounterSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
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

void _versionEncounterDetailSerialize(
  VersionEncounterDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Encounter>(
    offsets[0],
    allOffsets,
    EncounterSchema.serialize,
    object.encounterDetails,
  );
  writer.writeLong(offsets[1], object.maxChance);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.version,
  );
}

VersionEncounterDetail _versionEncounterDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionEncounterDetail(
    encounterDetails: reader.readObjectList<Encounter>(
      offsets[0],
      EncounterSchema.deserialize,
      allOffsets,
      Encounter(),
    ),
    maxChance: reader.readLongOrNull(offsets[1]),
    version: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionEncounterDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Encounter>(
        offset,
        EncounterSchema.deserialize,
        allOffsets,
        Encounter(),
      )) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
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

extension VersionEncounterDetailQueryFilter on QueryBuilder<
    VersionEncounterDetail, VersionEncounterDetail, QFilterCondition> {
  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'encounterDetails',
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'encounterDetails',
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'encounterDetails',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxChance',
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxChance',
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxChance',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxChance',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxChance',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> maxChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension VersionEncounterDetailQueryObject on QueryBuilder<
    VersionEncounterDetail, VersionEncounterDetail, QFilterCondition> {
  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> encounterDetailsElement(FilterQuery<Encounter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'encounterDetails');
    });
  }

  QueryBuilder<VersionEncounterDetail, VersionEncounterDetail,
      QAfterFilterCondition> version(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionGameIndexSchema = Schema(
  name: r'VersionGameIndex',
  id: -3689215272779363189,
  properties: {
    r'gameIndex': PropertySchema(
      id: 0,
      name: r'gameIndex',
      type: IsarType.long,
    ),
    r'version': PropertySchema(
      id: 1,
      name: r'version',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _versionGameIndexEstimateSize,
  serialize: _versionGameIndexSerialize,
  deserialize: _versionGameIndexDeserialize,
  deserializeProp: _versionGameIndexDeserializeProp,
);

int _versionGameIndexEstimateSize(
  VersionGameIndex object,
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

void _versionGameIndexSerialize(
  VersionGameIndex object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.gameIndex);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.version,
  );
}

VersionGameIndex _versionGameIndexDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionGameIndex(
    gameIndex: reader.readLongOrNull(offsets[0]),
    version: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionGameIndexDeserializeProp<P>(
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

extension VersionGameIndexQueryFilter
    on QueryBuilder<VersionGameIndex, VersionGameIndex, QFilterCondition> {
  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      gameIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      gameIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      gameIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
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

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
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

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
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

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      versionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'version',
      ));
    });
  }

  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      versionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'version',
      ));
    });
  }
}

extension VersionGameIndexQueryObject
    on QueryBuilder<VersionGameIndex, VersionGameIndex, QFilterCondition> {
  QueryBuilder<VersionGameIndex, VersionGameIndex, QAfterFilterCondition>
      version(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VersionGroupFlavorTextSchema = Schema(
  name: r'VersionGroupFlavorText',
  id: -6297435795766394428,
  properties: {
    r'language': PropertySchema(
      id: 0,
      name: r'language',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'text': PropertySchema(
      id: 1,
      name: r'text',
      type: IsarType.string,
    ),
    r'versionGroup': PropertySchema(
      id: 2,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _versionGroupFlavorTextEstimateSize,
  serialize: _versionGroupFlavorTextSerialize,
  deserialize: _versionGroupFlavorTextDeserialize,
  deserializeProp: _versionGroupFlavorTextDeserializeProp,
);

int _versionGroupFlavorTextEstimateSize(
  VersionGroupFlavorText object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
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

void _versionGroupFlavorTextSerialize(
  VersionGroupFlavorText object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.language,
  );
  writer.writeString(offsets[1], object.text);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

VersionGroupFlavorText _versionGroupFlavorTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VersionGroupFlavorText(
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    text: reader.readStringOrNull(offsets[1]),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _versionGroupFlavorTextDeserializeProp<P>(
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
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VersionGroupFlavorTextQueryFilter on QueryBuilder<
    VersionGroupFlavorText, VersionGroupFlavorText, QFilterCondition> {
  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
          QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
          QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension VersionGroupFlavorTextQueryObject on QueryBuilder<
    VersionGroupFlavorText, VersionGroupFlavorText, QFilterCondition> {
  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> language(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }

  QueryBuilder<VersionGroupFlavorText, VersionGroupFlavorText,
      QAfterFilterCondition> versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResource _$ApiResourceFromJson(Map<String, dynamic> json) => ApiResource(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ApiResourceToJson(ApiResource instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      description: json['description'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'description': instance.description,
      'language': instance.language,
    };

Effect _$EffectFromJson(Map<String, dynamic> json) => Effect(
      effect: json['effect'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EffectToJson(Effect instance) => <String, dynamic>{
      'effect': instance.effect,
      'language': instance.language,
    };

Encounter _$EncounterFromJson(Map<String, dynamic> json) => Encounter(
      minLevel: (json['min_level'] as num?)?.toInt(),
      maxLevel: (json['max_level'] as num?)?.toInt(),
      conditionValues: (json['condition_values'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      chance: (json['chance'] as num?)?.toInt(),
      method: json['method'] == null
          ? null
          : NamedApiResource.fromJson(json['method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EncounterToJson(Encounter instance) => <String, dynamic>{
      'min_level': instance.minLevel,
      'max_level': instance.maxLevel,
      'condition_values': instance.conditionValues,
      'chance': instance.chance,
      'method': instance.method,
    };

FlavorText _$FlavorTextFromJson(Map<String, dynamic> json) => FlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : NamedApiResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextToJson(FlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

GenerationGameIndex _$GenerationGameIndexFromJson(Map<String, dynamic> json) =>
    GenerationGameIndex(
      gameIndex: (json['game_index'] as num?)?.toInt(),
      generation: json['generation'] == null
          ? null
          : NamedApiResource.fromJson(
              json['generation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerationGameIndexToJson(
        GenerationGameIndex instance) =>
    <String, dynamic>{
      'game_index': instance.gameIndex,
      'generation': instance.generation,
    };

MachineVersionDetail _$MachineVersionDetailFromJson(
        Map<String, dynamic> json) =>
    MachineVersionDetail(
      machine: json['machine'] == null
          ? null
          : ApiResource.fromJson(json['machine'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MachineVersionDetailToJson(
        MachineVersionDetail instance) =>
    <String, dynamic>{
      'machine': instance.machine,
      'version_group': instance.versionGroup,
    };

ApiName _$ApiNameFromJson(Map<String, dynamic> json) => ApiName(
      name: json['name'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiNameToJson(ApiName instance) => <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };

NamedApiResource _$NamedApiResourceFromJson(Map<String, dynamic> json) =>
    NamedApiResource(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NamedApiResourceToJson(NamedApiResource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      official: json['official'] as bool?,
      iso639: json['iso639'] as String?,
      iso3166: json['iso3166'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'official': instance.official,
      'iso639': instance.iso639,
      'iso3166': instance.iso3166,
      'names': instance.names,
    };

VerboseEffect _$VerboseEffectFromJson(Map<String, dynamic> json) =>
    VerboseEffect(
      effect: json['effect'] as String?,
      shortEffect: json['short_effect'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerboseEffectToJson(VerboseEffect instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
      'language': instance.language,
    };

VersionEncounterDetail _$VersionEncounterDetailFromJson(
        Map<String, dynamic> json) =>
    VersionEncounterDetail(
      version: json['version'] == null
          ? null
          : NamedApiResource.fromJson(json['version'] as Map<String, dynamic>),
      maxChance: (json['max_chance'] as num?)?.toInt(),
      encounterDetails: (json['encounter_details'] as List<dynamic>?)
          ?.map((e) => Encounter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VersionEncounterDetailToJson(
        VersionEncounterDetail instance) =>
    <String, dynamic>{
      'version': instance.version,
      'max_chance': instance.maxChance,
      'encounter_details': instance.encounterDetails,
    };

VersionGameIndex _$VersionGameIndexFromJson(Map<String, dynamic> json) =>
    VersionGameIndex(
      gameIndex: (json['game_index'] as num?)?.toInt(),
      version: json['version'] == null
          ? null
          : NamedApiResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGameIndexToJson(VersionGameIndex instance) =>
    <String, dynamic>{
      'game_index': instance.gameIndex,
      'version': instance.version,
    };

VersionGroupFlavorText _$VersionGroupFlavorTextFromJson(
        Map<String, dynamic> json) =>
    VersionGroupFlavorText(
      text: json['text'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupFlavorTextToJson(
        VersionGroupFlavorText instance) =>
    <String, dynamic>{
      'text': instance.text,
      'language': instance.language,
      'version_group': instance.versionGroup,
    };
