// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'natures.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNatureCollection on Isar {
  IsarCollection<Nature> get natures => this.collection();
}

const NatureSchema = CollectionSchema(
  name: r'Nature',
  id: 7534845346065108960,
  properties: {
    r'decreasedStat': PropertySchema(
      id: 0,
      name: r'decreasedStat',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'hatesFlavor': PropertySchema(
      id: 1,
      name: r'hatesFlavor',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'increasedStat': PropertySchema(
      id: 2,
      name: r'increasedStat',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'likesFlavor': PropertySchema(
      id: 3,
      name: r'likesFlavor',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'moveBattleStylePreferences': PropertySchema(
      id: 4,
      name: r'moveBattleStylePreferences',
      type: IsarType.objectList,
      target: r'MoveBattleStylePreference',
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 6,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'pokeathlonStatChanges': PropertySchema(
      id: 7,
      name: r'pokeathlonStatChanges',
      type: IsarType.objectList,
      target: r'NatureStatChange',
    )
  },
  estimateSize: _natureEstimateSize,
  serialize: _natureSerialize,
  deserialize: _natureDeserialize,
  deserializeProp: _natureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'NatureStatChange': NatureStatChangeSchema,
    r'MoveBattleStylePreference': MoveBattleStylePreferenceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _natureGetId,
  getLinks: _natureGetLinks,
  attach: _natureAttach,
  version: '3.1.8',
);

int _natureEstimateSize(
  Nature object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.decreasedStat;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.hatesFlavor;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.increasedStat;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.likesFlavor;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final list = object.moveBattleStylePreferences;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MoveBattleStylePreference]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += MoveBattleStylePreferenceSchema.estimateSize(
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
    final list = object.pokeathlonStatChanges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NatureStatChange]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NatureStatChangeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _natureSerialize(
  Nature object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.decreasedStat,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.hatesFlavor,
  );
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.increasedStat,
  );
  writer.writeObject<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.likesFlavor,
  );
  writer.writeObjectList<MoveBattleStylePreference>(
    offsets[4],
    allOffsets,
    MoveBattleStylePreferenceSchema.serialize,
    object.moveBattleStylePreferences,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeObjectList<ApiName>(
    offsets[6],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<NatureStatChange>(
    offsets[7],
    allOffsets,
    NatureStatChangeSchema.serialize,
    object.pokeathlonStatChanges,
  );
}

Nature _natureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nature(
    decreasedStat: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    hatesFlavor: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
    increasedStat: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    likesFlavor: reader.readObjectOrNull<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    moveBattleStylePreferences:
        reader.readObjectList<MoveBattleStylePreference>(
      offsets[4],
      MoveBattleStylePreferenceSchema.deserialize,
      allOffsets,
      MoveBattleStylePreference(),
    ),
    name: reader.readStringOrNull(offsets[5]),
    names: reader.readObjectList<ApiName>(
      offsets[6],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokeathlonStatChanges: reader.readObjectList<NatureStatChange>(
      offsets[7],
      NatureStatChangeSchema.deserialize,
      allOffsets,
      NatureStatChange(),
    ),
  );
  return object;
}

P _natureDeserializeProp<P>(
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
    case 3:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectList<MoveBattleStylePreference>(
        offset,
        MoveBattleStylePreferenceSchema.deserialize,
        allOffsets,
        MoveBattleStylePreference(),
      )) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 7:
      return (reader.readObjectList<NatureStatChange>(
        offset,
        NatureStatChangeSchema.deserialize,
        allOffsets,
        NatureStatChange(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _natureGetId(Nature object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _natureGetLinks(Nature object) {
  return [];
}

void _natureAttach(IsarCollection<dynamic> col, Id id, Nature object) {}

extension NatureQueryWhereSort on QueryBuilder<Nature, Nature, QWhere> {
  QueryBuilder<Nature, Nature, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NatureQueryWhere on QueryBuilder<Nature, Nature, QWhereClause> {
  QueryBuilder<Nature, Nature, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Nature, Nature, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterWhereClause> idBetween(
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

extension NatureQueryFilter on QueryBuilder<Nature, Nature, QFilterCondition> {
  QueryBuilder<Nature, Nature, QAfterFilterCondition> decreasedStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decreasedStat',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> decreasedStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decreasedStat',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> hatesFlavorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hatesFlavor',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> hatesFlavorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hatesFlavor',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> increasedStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'increasedStat',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> increasedStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'increasedStat',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> likesFlavorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'likesFlavor',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> likesFlavorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'likesFlavor',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moveBattleStylePreferences',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moveBattleStylePreferences',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moveBattleStylePreferences',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokeathlonStatChanges',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokeathlonStatChanges',
      ));
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokeathlonStatChanges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NatureQueryObject on QueryBuilder<Nature, Nature, QFilterCondition> {
  QueryBuilder<Nature, Nature, QAfterFilterCondition> decreasedStat(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'decreasedStat');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> hatesFlavor(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'hatesFlavor');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> increasedStat(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'increasedStat');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> likesFlavor(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'likesFlavor');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      moveBattleStylePreferencesElement(
          FilterQuery<MoveBattleStylePreference> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moveBattleStylePreferences');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Nature, Nature, QAfterFilterCondition>
      pokeathlonStatChangesElement(FilterQuery<NatureStatChange> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokeathlonStatChanges');
    });
  }
}

extension NatureQueryLinks on QueryBuilder<Nature, Nature, QFilterCondition> {}

extension NatureQuerySortBy on QueryBuilder<Nature, Nature, QSortBy> {
  QueryBuilder<Nature, Nature, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Nature, Nature, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension NatureQuerySortThenBy on QueryBuilder<Nature, Nature, QSortThenBy> {
  QueryBuilder<Nature, Nature, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Nature, Nature, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Nature, Nature, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Nature, Nature, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension NatureQueryWhereDistinct on QueryBuilder<Nature, Nature, QDistinct> {
  QueryBuilder<Nature, Nature, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension NatureQueryProperty on QueryBuilder<Nature, Nature, QQueryProperty> {
  QueryBuilder<Nature, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Nature, NamedApiResource?, QQueryOperations>
      decreasedStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decreasedStat');
    });
  }

  QueryBuilder<Nature, NamedApiResource?, QQueryOperations>
      hatesFlavorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hatesFlavor');
    });
  }

  QueryBuilder<Nature, NamedApiResource?, QQueryOperations>
      increasedStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'increasedStat');
    });
  }

  QueryBuilder<Nature, NamedApiResource?, QQueryOperations>
      likesFlavorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likesFlavor');
    });
  }

  QueryBuilder<Nature, List<MoveBattleStylePreference>?, QQueryOperations>
      moveBattleStylePreferencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moveBattleStylePreferences');
    });
  }

  QueryBuilder<Nature, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Nature, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Nature, List<NatureStatChange>?, QQueryOperations>
      pokeathlonStatChangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokeathlonStatChanges');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NatureStatChangeSchema = Schema(
  name: r'NatureStatChange',
  id: 5054224233398789019,
  properties: {
    r'maxChange': PropertySchema(
      id: 0,
      name: r'maxChange',
      type: IsarType.long,
    ),
    r'pokeathlonStat': PropertySchema(
      id: 1,
      name: r'pokeathlonStat',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _natureStatChangeEstimateSize,
  serialize: _natureStatChangeSerialize,
  deserialize: _natureStatChangeDeserialize,
  deserializeProp: _natureStatChangeDeserializeProp,
);

int _natureStatChangeEstimateSize(
  NatureStatChange object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pokeathlonStat;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _natureStatChangeSerialize(
  NatureStatChange object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.maxChange);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokeathlonStat,
  );
}

NatureStatChange _natureStatChangeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NatureStatChange(
    maxChange: reader.readLongOrNull(offsets[0]),
    pokeathlonStat: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _natureStatChangeDeserializeProp<P>(
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

extension NatureStatChangeQueryFilter
    on QueryBuilder<NatureStatChange, NatureStatChange, QFilterCondition> {
  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxChange',
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxChange',
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxChange',
        value: value,
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      maxChangeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxChange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      pokeathlonStatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokeathlonStat',
      ));
    });
  }

  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      pokeathlonStatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokeathlonStat',
      ));
    });
  }
}

extension NatureStatChangeQueryObject
    on QueryBuilder<NatureStatChange, NatureStatChange, QFilterCondition> {
  QueryBuilder<NatureStatChange, NatureStatChange, QAfterFilterCondition>
      pokeathlonStat(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokeathlonStat');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveBattleStylePreferenceSchema = Schema(
  name: r'MoveBattleStylePreference',
  id: 4305213279285748318,
  properties: {
    r'highHpPreference': PropertySchema(
      id: 0,
      name: r'highHpPreference',
      type: IsarType.double,
    ),
    r'lowHpPreference': PropertySchema(
      id: 1,
      name: r'lowHpPreference',
      type: IsarType.double,
    ),
    r'moveBattleStyle': PropertySchema(
      id: 2,
      name: r'moveBattleStyle',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _moveBattleStylePreferenceEstimateSize,
  serialize: _moveBattleStylePreferenceSerialize,
  deserialize: _moveBattleStylePreferenceDeserialize,
  deserializeProp: _moveBattleStylePreferenceDeserializeProp,
);

int _moveBattleStylePreferenceEstimateSize(
  MoveBattleStylePreference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.moveBattleStyle;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveBattleStylePreferenceSerialize(
  MoveBattleStylePreference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.highHpPreference);
  writer.writeDouble(offsets[1], object.lowHpPreference);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moveBattleStyle,
  );
}

MoveBattleStylePreference _moveBattleStylePreferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveBattleStylePreference(
    highHpPreference: reader.readDoubleOrNull(offsets[0]),
    lowHpPreference: reader.readDoubleOrNull(offsets[1]),
    moveBattleStyle: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _moveBattleStylePreferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
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

extension MoveBattleStylePreferenceQueryFilter on QueryBuilder<
    MoveBattleStylePreference, MoveBattleStylePreference, QFilterCondition> {
  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'highHpPreference',
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'highHpPreference',
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'highHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'highHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> highHpPreferenceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'highHpPreference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowHpPreference',
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowHpPreference',
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lowHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lowHpPreference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> lowHpPreferenceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lowHpPreference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> moveBattleStyleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moveBattleStyle',
      ));
    });
  }

  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> moveBattleStyleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moveBattleStyle',
      ));
    });
  }
}

extension MoveBattleStylePreferenceQueryObject on QueryBuilder<
    MoveBattleStylePreference, MoveBattleStylePreference, QFilterCondition> {
  QueryBuilder<MoveBattleStylePreference, MoveBattleStylePreference,
      QAfterFilterCondition> moveBattleStyle(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moveBattleStyle');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nature _$NatureFromJson(Map<String, dynamic> json) => Nature(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      decreasedStat: json['decreased_stat'] == null
          ? null
          : NamedApiResource.fromJson(
              json['decreased_stat'] as Map<String, dynamic>),
      increasedStat: json['increased_stat'] == null
          ? null
          : NamedApiResource.fromJson(
              json['increased_stat'] as Map<String, dynamic>),
      hatesFlavor: json['hates_flavor'] == null
          ? null
          : NamedApiResource.fromJson(
              json['hates_flavor'] as Map<String, dynamic>),
      likesFlavor: json['likes_flavor'] == null
          ? null
          : NamedApiResource.fromJson(
              json['likes_flavor'] as Map<String, dynamic>),
      pokeathlonStatChanges: (json['pokeathlon_stat_changes'] as List<dynamic>?)
          ?.map((e) => NatureStatChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      moveBattleStylePreferences:
          (json['move_battle_style_preferences'] as List<dynamic>?)
              ?.map((e) =>
                  MoveBattleStylePreference.fromJson(e as Map<String, dynamic>))
              .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NatureToJson(Nature instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'decreased_stat': instance.decreasedStat,
      'increased_stat': instance.increasedStat,
      'hates_flavor': instance.hatesFlavor,
      'likes_flavor': instance.likesFlavor,
      'pokeathlon_stat_changes': instance.pokeathlonStatChanges,
      'move_battle_style_preferences': instance.moveBattleStylePreferences,
      'names': instance.names,
    };

NatureStatChange _$NatureStatChangeFromJson(Map<String, dynamic> json) =>
    NatureStatChange(
      maxChange: (json['max_change'] as num?)?.toInt(),
      pokeathlonStat: json['pokeathlon_stat'] == null
          ? null
          : NamedApiResource.fromJson(
              json['pokeathlon_stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NatureStatChangeToJson(NatureStatChange instance) =>
    <String, dynamic>{
      'max_change': instance.maxChange,
      'pokeathlon_stat': instance.pokeathlonStat,
    };

MoveBattleStylePreference _$MoveBattleStylePreferenceFromJson(
        Map<String, dynamic> json) =>
    MoveBattleStylePreference(
      lowHpPreference: (json['low_hp_preference'] as num?)?.toDouble(),
      highHpPreference: (json['high_hp_preference'] as num?)?.toDouble(),
      moveBattleStyle: json['move_battle_style'] == null
          ? null
          : NamedApiResource.fromJson(
              json['move_battle_style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveBattleStylePreferenceToJson(
        MoveBattleStylePreference instance) =>
    <String, dynamic>{
      'low_hp_preference': instance.lowHpPreference,
      'high_hp_preference': instance.highHpPreference,
      'move_battle_style': instance.moveBattleStyle,
    };
