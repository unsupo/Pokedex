// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binder_card_selection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBinderCardSelectionCollection on Isar {
  IsarCollection<BinderCardSelection> get binderCardSelections =>
      this.collection();
}

const BinderCardSelectionSchema = CollectionSchema(
  name: r'BinderCardSelection',
  id: 672814661684178155,
  properties: {
    r'pokemonId': PropertySchema(
      id: 0,
      name: r'pokemonId',
      type: IsarType.long,
    ),
    r'profileId': PropertySchema(
      id: 1,
      name: r'profileId',
      type: IsarType.long,
    ),
    r'selectedCardId': PropertySchema(
      id: 2,
      name: r'selectedCardId',
      type: IsarType.string,
    )
  },
  estimateSize: _binderCardSelectionEstimateSize,
  serialize: _binderCardSelectionSerialize,
  deserialize: _binderCardSelectionDeserialize,
  deserializeProp: _binderCardSelectionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'profileId_pokemonId': IndexSchema(
      id: 3043672462987561868,
      name: r'profileId_pokemonId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'profileId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'pokemonId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _binderCardSelectionGetId,
  getLinks: _binderCardSelectionGetLinks,
  attach: _binderCardSelectionAttach,
  version: '3.3.2',
);

int _binderCardSelectionEstimateSize(
  BinderCardSelection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.selectedCardId.length * 3;
  return bytesCount;
}

void _binderCardSelectionSerialize(
  BinderCardSelection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.pokemonId);
  writer.writeLong(offsets[1], object.profileId);
  writer.writeString(offsets[2], object.selectedCardId);
}

BinderCardSelection _binderCardSelectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BinderCardSelection(
    pokemonId: reader.readLong(offsets[0]),
    profileId: reader.readLong(offsets[1]),
    selectedCardId: reader.readString(offsets[2]),
  );
  object.isarId = id;
  return object;
}

P _binderCardSelectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _binderCardSelectionGetId(BinderCardSelection object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _binderCardSelectionGetLinks(
    BinderCardSelection object) {
  return [];
}

void _binderCardSelectionAttach(
    IsarCollection<dynamic> col, Id id, BinderCardSelection object) {
  object.isarId = id;
}

extension BinderCardSelectionByIndex on IsarCollection<BinderCardSelection> {
  Future<BinderCardSelection?> getByProfileIdPokemonId(
      int profileId, int pokemonId) {
    return getByIndex(r'profileId_pokemonId', [profileId, pokemonId]);
  }

  BinderCardSelection? getByProfileIdPokemonIdSync(
      int profileId, int pokemonId) {
    return getByIndexSync(r'profileId_pokemonId', [profileId, pokemonId]);
  }

  Future<bool> deleteByProfileIdPokemonId(int profileId, int pokemonId) {
    return deleteByIndex(r'profileId_pokemonId', [profileId, pokemonId]);
  }

  bool deleteByProfileIdPokemonIdSync(int profileId, int pokemonId) {
    return deleteByIndexSync(r'profileId_pokemonId', [profileId, pokemonId]);
  }

  Future<List<BinderCardSelection?>> getAllByProfileIdPokemonId(
      List<int> profileIdValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], pokemonIdValues[i]]);
    }

    return getAllByIndex(r'profileId_pokemonId', values);
  }

  List<BinderCardSelection?> getAllByProfileIdPokemonIdSync(
      List<int> profileIdValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], pokemonIdValues[i]]);
    }

    return getAllByIndexSync(r'profileId_pokemonId', values);
  }

  Future<int> deleteAllByProfileIdPokemonId(
      List<int> profileIdValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], pokemonIdValues[i]]);
    }

    return deleteAllByIndex(r'profileId_pokemonId', values);
  }

  int deleteAllByProfileIdPokemonIdSync(
      List<int> profileIdValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], pokemonIdValues[i]]);
    }

    return deleteAllByIndexSync(r'profileId_pokemonId', values);
  }

  Future<Id> putByProfileIdPokemonId(BinderCardSelection object) {
    return putByIndex(r'profileId_pokemonId', object);
  }

  Id putByProfileIdPokemonIdSync(BinderCardSelection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'profileId_pokemonId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByProfileIdPokemonId(
      List<BinderCardSelection> objects) {
    return putAllByIndex(r'profileId_pokemonId', objects);
  }

  List<Id> putAllByProfileIdPokemonIdSync(List<BinderCardSelection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'profileId_pokemonId', objects,
        saveLinks: saveLinks);
  }
}

extension BinderCardSelectionQueryWhereSort
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QWhere> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhere>
      anyProfileIdPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'profileId_pokemonId'),
      );
    });
  }
}

extension BinderCardSelectionQueryWhere
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QWhereClause> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdEqualToAnyPokemonId(int profileId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'profileId_pokemonId',
        value: [profileId],
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdNotEqualToAnyPokemonId(int profileId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [],
              upper: [profileId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [],
              upper: [profileId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdGreaterThanAnyPokemonId(
    int profileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [profileId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdLessThanAnyPokemonId(
    int profileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [],
        upper: [profileId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdBetweenAnyPokemonId(
    int lowerProfileId,
    int upperProfileId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [lowerProfileId],
        includeLower: includeLower,
        upper: [upperProfileId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdPokemonIdEqualTo(int profileId, int pokemonId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'profileId_pokemonId',
        value: [profileId, pokemonId],
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdEqualToPokemonIdNotEqualTo(int profileId, int pokemonId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId],
              upper: [profileId, pokemonId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId, pokemonId],
              includeLower: false,
              upper: [profileId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId, pokemonId],
              includeLower: false,
              upper: [profileId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_pokemonId',
              lower: [profileId],
              upper: [profileId, pokemonId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdEqualToPokemonIdGreaterThan(
    int profileId,
    int pokemonId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [profileId, pokemonId],
        includeLower: include,
        upper: [profileId],
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdEqualToPokemonIdLessThan(
    int profileId,
    int pokemonId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [profileId],
        upper: [profileId, pokemonId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterWhereClause>
      profileIdEqualToPokemonIdBetween(
    int profileId,
    int lowerPokemonId,
    int upperPokemonId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_pokemonId',
        lower: [profileId, lowerPokemonId],
        includeLower: includeLower,
        upper: [profileId, upperPokemonId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BinderCardSelectionQueryFilter on QueryBuilder<BinderCardSelection,
    BinderCardSelection, QFilterCondition> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      pokemonIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pokemonId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      pokemonIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pokemonId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      pokemonIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pokemonId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      pokemonIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pokemonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      profileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      profileIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profileId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      profileIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profileId',
        value: value,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      profileIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profileId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedCardId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedCardId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedCardId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedCardId',
        value: '',
      ));
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterFilterCondition>
      selectedCardIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedCardId',
        value: '',
      ));
    });
  }
}

extension BinderCardSelectionQueryObject on QueryBuilder<BinderCardSelection,
    BinderCardSelection, QFilterCondition> {}

extension BinderCardSelectionQueryLinks on QueryBuilder<BinderCardSelection,
    BinderCardSelection, QFilterCondition> {}

extension BinderCardSelectionQuerySortBy
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QSortBy> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortByPokemonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.desc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortBySelectedCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCardId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      sortBySelectedCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCardId', Sort.desc);
    });
  }
}

extension BinderCardSelectionQuerySortThenBy
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QSortThenBy> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByPokemonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.desc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenBySelectedCardId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCardId', Sort.asc);
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QAfterSortBy>
      thenBySelectedCardIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedCardId', Sort.desc);
    });
  }
}

extension BinderCardSelectionQueryWhereDistinct
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QDistinct> {
  QueryBuilder<BinderCardSelection, BinderCardSelection, QDistinct>
      distinctByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pokemonId');
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QDistinct>
      distinctByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileId');
    });
  }

  QueryBuilder<BinderCardSelection, BinderCardSelection, QDistinct>
      distinctBySelectedCardId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedCardId',
          caseSensitive: caseSensitive);
    });
  }
}

extension BinderCardSelectionQueryProperty
    on QueryBuilder<BinderCardSelection, BinderCardSelection, QQueryProperty> {
  QueryBuilder<BinderCardSelection, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<BinderCardSelection, int, QQueryOperations> pokemonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonId');
    });
  }

  QueryBuilder<BinderCardSelection, int, QQueryOperations> profileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileId');
    });
  }

  QueryBuilder<BinderCardSelection, String, QQueryOperations>
      selectedCardIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedCardId');
    });
  }
}
