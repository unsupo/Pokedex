// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caught_pokemon.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCaughtPokemonCollection on Isar {
  IsarCollection<CaughtPokemon> get caughtPokemons => this.collection();
}

const CaughtPokemonSchema = CollectionSchema(
  name: r'CaughtPokemon',
  id: 8042440451159840496,
  properties: {
    r'isCaught': PropertySchema(
      id: 0,
      name: r'isCaught',
      type: IsarType.bool,
    ),
    r'pokemonId': PropertySchema(
      id: 1,
      name: r'pokemonId',
      type: IsarType.long,
    ),
    r'profileId': PropertySchema(
      id: 2,
      name: r'profileId',
      type: IsarType.long,
    ),
    r'scopeKey': PropertySchema(
      id: 3,
      name: r'scopeKey',
      type: IsarType.string,
    )
  },
  estimateSize: _caughtPokemonEstimateSize,
  serialize: _caughtPokemonSerialize,
  deserialize: _caughtPokemonDeserialize,
  deserializeProp: _caughtPokemonDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'profileId_scopeKey_pokemonId': IndexSchema(
      id: 3721041603490808944,
      name: r'profileId_scopeKey_pokemonId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'profileId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'scopeKey',
          type: IndexType.hash,
          caseSensitive: true,
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
  getId: _caughtPokemonGetId,
  getLinks: _caughtPokemonGetLinks,
  attach: _caughtPokemonAttach,
  version: '3.3.2',
);

int _caughtPokemonEstimateSize(
  CaughtPokemon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.scopeKey.length * 3;
  return bytesCount;
}

void _caughtPokemonSerialize(
  CaughtPokemon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCaught);
  writer.writeLong(offsets[1], object.pokemonId);
  writer.writeLong(offsets[2], object.profileId);
  writer.writeString(offsets[3], object.scopeKey);
}

CaughtPokemon _caughtPokemonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CaughtPokemon(
    isCaught: reader.readBool(offsets[0]),
    pokemonId: reader.readLong(offsets[1]),
    profileId: reader.readLong(offsets[2]),
    scopeKey: reader.readStringOrNull(offsets[3]) ?? nationalScopeKey,
  );
  object.isarId = id;
  return object;
}

P _caughtPokemonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? nationalScopeKey) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _caughtPokemonGetId(CaughtPokemon object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _caughtPokemonGetLinks(CaughtPokemon object) {
  return [];
}

void _caughtPokemonAttach(
    IsarCollection<dynamic> col, Id id, CaughtPokemon object) {
  object.isarId = id;
}

extension CaughtPokemonByIndex on IsarCollection<CaughtPokemon> {
  Future<CaughtPokemon?> getByProfileIdScopeKeyPokemonId(
      int profileId, String scopeKey, int pokemonId) {
    return getByIndex(
        r'profileId_scopeKey_pokemonId', [profileId, scopeKey, pokemonId]);
  }

  CaughtPokemon? getByProfileIdScopeKeyPokemonIdSync(
      int profileId, String scopeKey, int pokemonId) {
    return getByIndexSync(
        r'profileId_scopeKey_pokemonId', [profileId, scopeKey, pokemonId]);
  }

  Future<bool> deleteByProfileIdScopeKeyPokemonId(
      int profileId, String scopeKey, int pokemonId) {
    return deleteByIndex(
        r'profileId_scopeKey_pokemonId', [profileId, scopeKey, pokemonId]);
  }

  bool deleteByProfileIdScopeKeyPokemonIdSync(
      int profileId, String scopeKey, int pokemonId) {
    return deleteByIndexSync(
        r'profileId_scopeKey_pokemonId', [profileId, scopeKey, pokemonId]);
  }

  Future<List<CaughtPokemon?>> getAllByProfileIdScopeKeyPokemonId(
      List<int> profileIdValues,
      List<String> scopeKeyValues,
      List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(scopeKeyValues.length == len && pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], scopeKeyValues[i], pokemonIdValues[i]]);
    }

    return getAllByIndex(r'profileId_scopeKey_pokemonId', values);
  }

  List<CaughtPokemon?> getAllByProfileIdScopeKeyPokemonIdSync(
      List<int> profileIdValues,
      List<String> scopeKeyValues,
      List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(scopeKeyValues.length == len && pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], scopeKeyValues[i], pokemonIdValues[i]]);
    }

    return getAllByIndexSync(r'profileId_scopeKey_pokemonId', values);
  }

  Future<int> deleteAllByProfileIdScopeKeyPokemonId(List<int> profileIdValues,
      List<String> scopeKeyValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(scopeKeyValues.length == len && pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], scopeKeyValues[i], pokemonIdValues[i]]);
    }

    return deleteAllByIndex(r'profileId_scopeKey_pokemonId', values);
  }

  int deleteAllByProfileIdScopeKeyPokemonIdSync(List<int> profileIdValues,
      List<String> scopeKeyValues, List<int> pokemonIdValues) {
    final len = profileIdValues.length;
    assert(scopeKeyValues.length == len && pokemonIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([profileIdValues[i], scopeKeyValues[i], pokemonIdValues[i]]);
    }

    return deleteAllByIndexSync(r'profileId_scopeKey_pokemonId', values);
  }

  Future<Id> putByProfileIdScopeKeyPokemonId(CaughtPokemon object) {
    return putByIndex(r'profileId_scopeKey_pokemonId', object);
  }

  Id putByProfileIdScopeKeyPokemonIdSync(CaughtPokemon object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'profileId_scopeKey_pokemonId', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByProfileIdScopeKeyPokemonId(
      List<CaughtPokemon> objects) {
    return putAllByIndex(r'profileId_scopeKey_pokemonId', objects);
  }

  List<Id> putAllByProfileIdScopeKeyPokemonIdSync(List<CaughtPokemon> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'profileId_scopeKey_pokemonId', objects,
        saveLinks: saveLinks);
  }
}

extension CaughtPokemonQueryWhereSort
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QWhere> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CaughtPokemonQueryWhere
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QWhereClause> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdEqualToAnyScopeKeyPokemonId(int profileId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'profileId_scopeKey_pokemonId',
        value: [profileId],
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdNotEqualToAnyScopeKeyPokemonId(int profileId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [],
              upper: [profileId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [],
              upper: [profileId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdGreaterThanAnyScopeKeyPokemonId(
    int profileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [profileId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdLessThanAnyScopeKeyPokemonId(
    int profileId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [],
        upper: [profileId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdBetweenAnyScopeKeyPokemonId(
    int lowerProfileId,
    int upperProfileId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [lowerProfileId],
        includeLower: includeLower,
        upper: [upperProfileId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyEqualToAnyPokemonId(int profileId, String scopeKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'profileId_scopeKey_pokemonId',
        value: [profileId, scopeKey],
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdEqualToScopeKeyNotEqualToAnyPokemonId(
          int profileId, String scopeKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId],
              upper: [profileId, scopeKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey],
              includeLower: false,
              upper: [profileId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey],
              includeLower: false,
              upper: [profileId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId],
              upper: [profileId, scopeKey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyPokemonIdEqualTo(
          int profileId, String scopeKey, int pokemonId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'profileId_scopeKey_pokemonId',
        value: [profileId, scopeKey, pokemonId],
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyEqualToPokemonIdNotEqualTo(
          int profileId, String scopeKey, int pokemonId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey],
              upper: [profileId, scopeKey, pokemonId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey, pokemonId],
              includeLower: false,
              upper: [profileId, scopeKey],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey, pokemonId],
              includeLower: false,
              upper: [profileId, scopeKey],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'profileId_scopeKey_pokemonId',
              lower: [profileId, scopeKey],
              upper: [profileId, scopeKey, pokemonId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyEqualToPokemonIdGreaterThan(
    int profileId,
    String scopeKey,
    int pokemonId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [profileId, scopeKey, pokemonId],
        includeLower: include,
        upper: [profileId, scopeKey],
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyEqualToPokemonIdLessThan(
    int profileId,
    String scopeKey,
    int pokemonId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [profileId, scopeKey],
        upper: [profileId, scopeKey, pokemonId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterWhereClause>
      profileIdScopeKeyEqualToPokemonIdBetween(
    int profileId,
    String scopeKey,
    int lowerPokemonId,
    int upperPokemonId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'profileId_scopeKey_pokemonId',
        lower: [profileId, scopeKey, lowerPokemonId],
        includeLower: includeLower,
        upper: [profileId, scopeKey, upperPokemonId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CaughtPokemonQueryFilter
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QFilterCondition> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      isCaughtEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCaught',
        value: value,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      pokemonIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pokemonId',
        value: value,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      profileIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileId',
        value: value,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
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

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scopeKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scopeKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scopeKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scopeKey',
        value: '',
      ));
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterFilterCondition>
      scopeKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scopeKey',
        value: '',
      ));
    });
  }
}

extension CaughtPokemonQueryObject
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QFilterCondition> {}

extension CaughtPokemonQueryLinks
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QFilterCondition> {}

extension CaughtPokemonQuerySortBy
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QSortBy> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> sortByIsCaught() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCaught', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      sortByIsCaughtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCaught', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> sortByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      sortByPokemonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> sortByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      sortByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> sortByScopeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      sortByScopeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.desc);
    });
  }
}

extension CaughtPokemonQuerySortThenBy
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QSortThenBy> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByIsCaught() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCaught', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      thenByIsCaughtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCaught', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      thenByPokemonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pokemonId', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      thenByProfileIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileId', Sort.desc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy> thenByScopeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.asc);
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QAfterSortBy>
      thenByScopeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scopeKey', Sort.desc);
    });
  }
}

extension CaughtPokemonQueryWhereDistinct
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QDistinct> {
  QueryBuilder<CaughtPokemon, CaughtPokemon, QDistinct> distinctByIsCaught() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCaught');
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QDistinct> distinctByPokemonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pokemonId');
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QDistinct> distinctByProfileId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileId');
    });
  }

  QueryBuilder<CaughtPokemon, CaughtPokemon, QDistinct> distinctByScopeKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scopeKey', caseSensitive: caseSensitive);
    });
  }
}

extension CaughtPokemonQueryProperty
    on QueryBuilder<CaughtPokemon, CaughtPokemon, QQueryProperty> {
  QueryBuilder<CaughtPokemon, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CaughtPokemon, bool, QQueryOperations> isCaughtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCaught');
    });
  }

  QueryBuilder<CaughtPokemon, int, QQueryOperations> pokemonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemonId');
    });
  }

  QueryBuilder<CaughtPokemon, int, QQueryOperations> profileIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileId');
    });
  }

  QueryBuilder<CaughtPokemon, String, QQueryOperations> scopeKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scopeKey');
    });
  }
}
