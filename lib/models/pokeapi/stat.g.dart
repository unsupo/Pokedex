// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStatCollection on Isar {
  IsarCollection<Stat> get stats => this.collection();
}

const StatSchema = CollectionSchema(
  name: r'Stat',
  id: -739457159820072843,
  properties: {
    r'affectingMoves': PropertySchema(
      id: 0,
      name: r'affectingMoves',
      type: IsarType.object,
      target: r'MoveStatAffectSets',
    ),
    r'affectingNatures': PropertySchema(
      id: 1,
      name: r'affectingNatures',
      type: IsarType.object,
      target: r'NatureStatAffectSets',
    ),
    r'characteristics': PropertySchema(
      id: 2,
      name: r'characteristics',
      type: IsarType.objectList,
      target: r'ApiResource',
    ),
    r'gameIndex': PropertySchema(
      id: 3,
      name: r'gameIndex',
      type: IsarType.long,
    ),
    r'isBattleOnly': PropertySchema(
      id: 4,
      name: r'isBattleOnly',
      type: IsarType.bool,
    ),
    r'moveDamageClass': PropertySchema(
      id: 5,
      name: r'moveDamageClass',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 7,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    )
  },
  estimateSize: _statEstimateSize,
  serialize: _statSerialize,
  deserialize: _statDeserialize,
  deserializeProp: _statDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'MoveStatAffectSets': MoveStatAffectSetsSchema,
    r'MoveStatAffect': MoveStatAffectSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'NatureStatAffectSets': NatureStatAffectSetsSchema,
    r'ApiResource': ApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _statGetId,
  getLinks: _statGetLinks,
  attach: _statAttach,
  version: '3.3.2',
);

int _statEstimateSize(
  Stat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.affectingMoves;
    if (value != null) {
      bytesCount += 3 +
          MoveStatAffectSetsSchema.estimateSize(
              value, allOffsets[MoveStatAffectSets]!, allOffsets);
    }
  }
  {
    final value = object.affectingNatures;
    if (value != null) {
      bytesCount += 3 +
          NatureStatAffectSetsSchema.estimateSize(
              value, allOffsets[NatureStatAffectSets]!, allOffsets);
    }
  }
  {
    final list = object.characteristics;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ApiResource]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ApiResourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.moveDamageClass;
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

void _statSerialize(
  Stat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<MoveStatAffectSets>(
    offsets[0],
    allOffsets,
    MoveStatAffectSetsSchema.serialize,
    object.affectingMoves,
  );
  writer.writeObject<NatureStatAffectSets>(
    offsets[1],
    allOffsets,
    NatureStatAffectSetsSchema.serialize,
    object.affectingNatures,
  );
  writer.writeObjectList<ApiResource>(
    offsets[2],
    allOffsets,
    ApiResourceSchema.serialize,
    object.characteristics,
  );
  writer.writeLong(offsets[3], object.gameIndex);
  writer.writeBool(offsets[4], object.isBattleOnly);
  writer.writeObject<NamedApiResource>(
    offsets[5],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moveDamageClass,
  );
  writer.writeString(offsets[6], object.name);
  writer.writeObjectList<ApiName>(
    offsets[7],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

Stat _statDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Stat(
    affectingMoves: reader.readObjectOrNull<MoveStatAffectSets>(
      offsets[0],
      MoveStatAffectSetsSchema.deserialize,
      allOffsets,
    ),
    affectingNatures: reader.readObjectOrNull<NatureStatAffectSets>(
      offsets[1],
      NatureStatAffectSetsSchema.deserialize,
      allOffsets,
    ),
    characteristics: reader.readObjectList<ApiResource>(
      offsets[2],
      ApiResourceSchema.deserialize,
      allOffsets,
      ApiResource(),
    ),
    gameIndex: reader.readLongOrNull(offsets[3]),
    id: id,
    isBattleOnly: reader.readBoolOrNull(offsets[4]),
    moveDamageClass: reader.readObjectOrNull<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[6]),
    names: reader.readObjectList<ApiName>(
      offsets[7],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _statDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<MoveStatAffectSets>(
        offset,
        MoveStatAffectSetsSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<NatureStatAffectSets>(
        offset,
        NatureStatAffectSetsSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectList<ApiResource>(
        offset,
        ApiResourceSchema.deserialize,
        allOffsets,
        ApiResource(),
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
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

Id _statGetId(Stat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _statGetLinks(Stat object) {
  return [];
}

void _statAttach(IsarCollection<dynamic> col, Id id, Stat object) {}

extension StatQueryWhereSort on QueryBuilder<Stat, Stat, QWhere> {
  QueryBuilder<Stat, Stat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StatQueryWhere on QueryBuilder<Stat, Stat, QWhereClause> {
  QueryBuilder<Stat, Stat, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Stat, Stat, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterWhereClause> idBetween(
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

extension StatQueryFilter on QueryBuilder<Stat, Stat, QFilterCondition> {
  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingMovesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'affectingMoves',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingMovesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'affectingMoves',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingNaturesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'affectingNatures',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingNaturesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'affectingNatures',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'characteristics',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'characteristics',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition>
      characteristicsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'characteristics',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameIndex',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexGreaterThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexLessThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> gameIndexBetween(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> isBattleOnlyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBattleOnly',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> isBattleOnlyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBattleOnly',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> isBattleOnlyEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBattleOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> moveDamageClassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moveDamageClass',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> moveDamageClassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moveDamageClass',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesLengthBetween(
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

extension StatQueryObject on QueryBuilder<Stat, Stat, QFilterCondition> {
  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingMoves(
      FilterQuery<MoveStatAffectSets> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'affectingMoves');
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> affectingNatures(
      FilterQuery<NatureStatAffectSets> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'affectingNatures');
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> characteristicsElement(
      FilterQuery<ApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'characteristics');
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> moveDamageClass(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moveDamageClass');
    });
  }

  QueryBuilder<Stat, Stat, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension StatQueryLinks on QueryBuilder<Stat, Stat, QFilterCondition> {}

extension StatQuerySortBy on QueryBuilder<Stat, Stat, QSortBy> {
  QueryBuilder<Stat, Stat, QAfterSortBy> sortByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> sortByGameIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.desc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> sortByIsBattleOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBattleOnly', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> sortByIsBattleOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBattleOnly', Sort.desc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension StatQuerySortThenBy on QueryBuilder<Stat, Stat, QSortThenBy> {
  QueryBuilder<Stat, Stat, QAfterSortBy> thenByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByGameIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameIndex', Sort.desc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByIsBattleOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBattleOnly', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByIsBattleOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBattleOnly', Sort.desc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Stat, Stat, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension StatQueryWhereDistinct on QueryBuilder<Stat, Stat, QDistinct> {
  QueryBuilder<Stat, Stat, QDistinct> distinctByGameIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameIndex');
    });
  }

  QueryBuilder<Stat, Stat, QDistinct> distinctByIsBattleOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBattleOnly');
    });
  }

  QueryBuilder<Stat, Stat, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension StatQueryProperty on QueryBuilder<Stat, Stat, QQueryProperty> {
  QueryBuilder<Stat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Stat, MoveStatAffectSets?, QQueryOperations>
      affectingMovesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affectingMoves');
    });
  }

  QueryBuilder<Stat, NatureStatAffectSets?, QQueryOperations>
      affectingNaturesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affectingNatures');
    });
  }

  QueryBuilder<Stat, List<ApiResource>?, QQueryOperations>
      characteristicsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characteristics');
    });
  }

  QueryBuilder<Stat, int?, QQueryOperations> gameIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameIndex');
    });
  }

  QueryBuilder<Stat, bool?, QQueryOperations> isBattleOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBattleOnly');
    });
  }

  QueryBuilder<Stat, NamedApiResource?, QQueryOperations>
      moveDamageClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moveDamageClass');
    });
  }

  QueryBuilder<Stat, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Stat, List<ApiName>?, QQueryOperations> namesProperty() {
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

const MoveStatAffectSetsSchema = Schema(
  name: r'MoveStatAffectSets',
  id: 935210495838661183,
  properties: {
    r'decrease': PropertySchema(
      id: 0,
      name: r'decrease',
      type: IsarType.objectList,
      target: r'MoveStatAffect',
    ),
    r'increase': PropertySchema(
      id: 1,
      name: r'increase',
      type: IsarType.objectList,
      target: r'MoveStatAffect',
    )
  },
  estimateSize: _moveStatAffectSetsEstimateSize,
  serialize: _moveStatAffectSetsSerialize,
  deserialize: _moveStatAffectSetsDeserialize,
  deserializeProp: _moveStatAffectSetsDeserializeProp,
);

int _moveStatAffectSetsEstimateSize(
  MoveStatAffectSets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.decrease;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MoveStatAffect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              MoveStatAffectSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.increase;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MoveStatAffect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              MoveStatAffectSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _moveStatAffectSetsSerialize(
  MoveStatAffectSets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<MoveStatAffect>(
    offsets[0],
    allOffsets,
    MoveStatAffectSchema.serialize,
    object.decrease,
  );
  writer.writeObjectList<MoveStatAffect>(
    offsets[1],
    allOffsets,
    MoveStatAffectSchema.serialize,
    object.increase,
  );
}

MoveStatAffectSets _moveStatAffectSetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveStatAffectSets(
    decrease: reader.readObjectList<MoveStatAffect>(
      offsets[0],
      MoveStatAffectSchema.deserialize,
      allOffsets,
      MoveStatAffect(),
    ),
    increase: reader.readObjectList<MoveStatAffect>(
      offsets[1],
      MoveStatAffectSchema.deserialize,
      allOffsets,
      MoveStatAffect(),
    ),
  );
  return object;
}

P _moveStatAffectSetsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<MoveStatAffect>(
        offset,
        MoveStatAffectSchema.deserialize,
        allOffsets,
        MoveStatAffect(),
      )) as P;
    case 1:
      return (reader.readObjectList<MoveStatAffect>(
        offset,
        MoveStatAffectSchema.deserialize,
        allOffsets,
        MoveStatAffect(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MoveStatAffectSetsQueryFilter
    on QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QFilterCondition> {
  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseLengthEqualTo(int length) {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseIsEmpty() {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseIsNotEmpty() {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseLengthLessThan(
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseLengthGreaterThan(
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseLengthBetween(
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseLengthEqualTo(int length) {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseIsEmpty() {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseIsNotEmpty() {
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseLengthLessThan(
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseLengthGreaterThan(
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

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseLengthBetween(
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

extension MoveStatAffectSetsQueryObject
    on QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QFilterCondition> {
  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      decreaseElement(FilterQuery<MoveStatAffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'decrease');
    });
  }

  QueryBuilder<MoveStatAffectSets, MoveStatAffectSets, QAfterFilterCondition>
      increaseElement(FilterQuery<MoveStatAffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'increase');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveStatAffectSchema = Schema(
  name: r'MoveStatAffect',
  id: 6851617709298863254,
  properties: {
    r'change': PropertySchema(
      id: 0,
      name: r'change',
      type: IsarType.long,
    ),
    r'move': PropertySchema(
      id: 1,
      name: r'move',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _moveStatAffectEstimateSize,
  serialize: _moveStatAffectSerialize,
  deserialize: _moveStatAffectDeserialize,
  deserializeProp: _moveStatAffectDeserializeProp,
);

int _moveStatAffectEstimateSize(
  MoveStatAffect object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.move;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveStatAffectSerialize(
  MoveStatAffect object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.change);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.move,
  );
}

MoveStatAffect _moveStatAffectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveStatAffect(
    change: reader.readLongOrNull(offsets[0]),
    move: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _moveStatAffectDeserializeProp<P>(
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

extension MoveStatAffectQueryFilter
    on QueryBuilder<MoveStatAffect, MoveStatAffect, QFilterCondition> {
  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'change',
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'change',
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'change',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'change',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'change',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      changeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'change',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      moveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition>
      moveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move',
      ));
    });
  }
}

extension MoveStatAffectQueryObject
    on QueryBuilder<MoveStatAffect, MoveStatAffect, QFilterCondition> {
  QueryBuilder<MoveStatAffect, MoveStatAffect, QAfterFilterCondition> move(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'move');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NatureStatAffectSetsSchema = Schema(
  name: r'NatureStatAffectSets',
  id: -1963961832533644924,
  properties: {
    r'decrease': PropertySchema(
      id: 0,
      name: r'decrease',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'increase': PropertySchema(
      id: 1,
      name: r'increase',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _natureStatAffectSetsEstimateSize,
  serialize: _natureStatAffectSetsSerialize,
  deserialize: _natureStatAffectSetsDeserialize,
  deserializeProp: _natureStatAffectSetsDeserializeProp,
);

int _natureStatAffectSetsEstimateSize(
  NatureStatAffectSets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.decrease;
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
    final list = object.increase;
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

void _natureStatAffectSetsSerialize(
  NatureStatAffectSets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.decrease,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.increase,
  );
}

NatureStatAffectSets _natureStatAffectSetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NatureStatAffectSets(
    decrease: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    increase: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _natureStatAffectSetsDeserializeProp<P>(
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

extension NatureStatAffectSetsQueryFilter on QueryBuilder<NatureStatAffectSets,
    NatureStatAffectSets, QFilterCondition> {
  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> decreaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> decreaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decrease',
      ));
    });
  }

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> increaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> increaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'increase',
      ));
    });
  }

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
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

extension NatureStatAffectSetsQueryObject on QueryBuilder<NatureStatAffectSets,
    NatureStatAffectSets, QFilterCondition> {
  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> decreaseElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'decrease');
    });
  }

  QueryBuilder<NatureStatAffectSets, NatureStatAffectSets,
      QAfterFilterCondition> increaseElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'increase');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      gameIndex: (json['game_index'] as num?)?.toInt(),
      isBattleOnly: json['is_battle_only'] as bool?,
      affectingMoves: json['affecting_moves'] == null
          ? null
          : MoveStatAffectSets.fromJson(
              json['affecting_moves'] as Map<String, dynamic>),
      affectingNatures: json['affecting_natures'] == null
          ? null
          : NatureStatAffectSets.fromJson(
              json['affecting_natures'] as Map<String, dynamic>),
      characteristics: (json['characteristics'] as List<dynamic>?)
          ?.map((e) => ApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      moveDamageClass: json['move_damage_class'] == null
          ? null
          : NamedApiResource.fromJson(
              json['move_damage_class'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'game_index': instance.gameIndex,
      'is_battle_only': instance.isBattleOnly,
      'affecting_moves': instance.affectingMoves,
      'affecting_natures': instance.affectingNatures,
      'characteristics': instance.characteristics,
      'move_damage_class': instance.moveDamageClass,
      'names': instance.names,
    };

MoveStatAffectSets _$MoveStatAffectSetsFromJson(Map<String, dynamic> json) =>
    MoveStatAffectSets(
      increase: (json['increase'] as List<dynamic>?)
          ?.map((e) => MoveStatAffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      decrease: (json['decrease'] as List<dynamic>?)
          ?.map((e) => MoveStatAffect.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveStatAffectSetsToJson(MoveStatAffectSets instance) =>
    <String, dynamic>{
      'increase': instance.increase,
      'decrease': instance.decrease,
    };

MoveStatAffect _$MoveStatAffectFromJson(Map<String, dynamic> json) =>
    MoveStatAffect(
      change: (json['change'] as num?)?.toInt(),
      move: json['move'] == null
          ? null
          : NamedApiResource.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveStatAffectToJson(MoveStatAffect instance) =>
    <String, dynamic>{
      'change': instance.change,
      'move': instance.move,
    };

NatureStatAffectSets _$NatureStatAffectSetsFromJson(
        Map<String, dynamic> json) =>
    NatureStatAffectSets(
      increase: (json['increase'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      decrease: (json['decrease'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NatureStatAffectSetsToJson(
        NatureStatAffectSets instance) =>
    <String, dynamic>{
      'increase': instance.increase,
      'decrease': instance.decrease,
    };
