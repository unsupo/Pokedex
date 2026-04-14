// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAbilityCollection on Isar {
  IsarCollection<Ability> get abilitys => this.collection();
}

const AbilitySchema = CollectionSchema(
  name: r'Ability',
  id: 5399669653591405753,
  properties: {
    r'effectChanges': PropertySchema(
      id: 0,
      name: r'effectChanges',
      type: IsarType.objectList,
      target: r'AbilityEffectChange',
    ),
    r'effectEntries': PropertySchema(
      id: 1,
      name: r'effectEntries',
      type: IsarType.objectList,
      target: r'VerboseEffect',
    ),
    r'flavorTextEntries': PropertySchema(
      id: 2,
      name: r'flavorTextEntries',
      type: IsarType.objectList,
      target: r'AbilityFlavorText',
    ),
    r'generation': PropertySchema(
      id: 3,
      name: r'generation',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'isMainSeries': PropertySchema(
      id: 4,
      name: r'isMainSeries',
      type: IsarType.bool,
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
    r'pokemon': PropertySchema(
      id: 7,
      name: r'pokemon',
      type: IsarType.objectList,
      target: r'AbilityPokemon',
    )
  },
  estimateSize: _abilityEstimateSize,
  serialize: _abilitySerialize,
  deserialize: _abilityDeserialize,
  deserializeProp: _abilityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema,
    r'VerboseEffect': VerboseEffectSchema,
    r'AbilityEffectChange': AbilityEffectChangeSchema,
    r'Effect': EffectSchema,
    r'AbilityFlavorText': AbilityFlavorTextSchema,
    r'AbilityPokemon': AbilityPokemonSchema
  },
  getId: _abilityGetId,
  getLinks: _abilityGetLinks,
  attach: _abilityAttach,
  version: '3.1.8',
);

int _abilityEstimateSize(
  Ability object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.effectChanges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AbilityEffectChange]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += AbilityEffectChangeSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.effectEntries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VerboseEffect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VerboseEffectSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.flavorTextEntries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AbilityFlavorText]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AbilityFlavorTextSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.generation;
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
    final list = object.pokemon;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AbilityPokemon]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AbilityPokemonSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _abilitySerialize(
  Ability object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AbilityEffectChange>(
    offsets[0],
    allOffsets,
    AbilityEffectChangeSchema.serialize,
    object.effectChanges,
  );
  writer.writeObjectList<VerboseEffect>(
    offsets[1],
    allOffsets,
    VerboseEffectSchema.serialize,
    object.effectEntries,
  );
  writer.writeObjectList<AbilityFlavorText>(
    offsets[2],
    allOffsets,
    AbilityFlavorTextSchema.serialize,
    object.flavorTextEntries,
  );
  writer.writeObject<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.generation,
  );
  writer.writeBool(offsets[4], object.isMainSeries);
  writer.writeString(offsets[5], object.name);
  writer.writeObjectList<ApiName>(
    offsets[6],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<AbilityPokemon>(
    offsets[7],
    allOffsets,
    AbilityPokemonSchema.serialize,
    object.pokemon,
  );
}

Ability _abilityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Ability(
    effectChanges: reader.readObjectList<AbilityEffectChange>(
      offsets[0],
      AbilityEffectChangeSchema.deserialize,
      allOffsets,
      AbilityEffectChange(),
    ),
    effectEntries: reader.readObjectList<VerboseEffect>(
      offsets[1],
      VerboseEffectSchema.deserialize,
      allOffsets,
      VerboseEffect(),
    ),
    flavorTextEntries: reader.readObjectList<AbilityFlavorText>(
      offsets[2],
      AbilityFlavorTextSchema.deserialize,
      allOffsets,
      AbilityFlavorText(),
    ),
    generation: reader.readObjectOrNull<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
    isMainSeries: reader.readBoolOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[5]),
    names: reader.readObjectList<ApiName>(
      offsets[6],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pokemon: reader.readObjectList<AbilityPokemon>(
      offsets[7],
      AbilityPokemonSchema.deserialize,
      allOffsets,
      AbilityPokemon(),
    ),
  );
  return object;
}

P _abilityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AbilityEffectChange>(
        offset,
        AbilityEffectChangeSchema.deserialize,
        allOffsets,
        AbilityEffectChange(),
      )) as P;
    case 1:
      return (reader.readObjectList<VerboseEffect>(
        offset,
        VerboseEffectSchema.deserialize,
        allOffsets,
        VerboseEffect(),
      )) as P;
    case 2:
      return (reader.readObjectList<AbilityFlavorText>(
        offset,
        AbilityFlavorTextSchema.deserialize,
        allOffsets,
        AbilityFlavorText(),
      )) as P;
    case 3:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
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
      return (reader.readObjectList<AbilityPokemon>(
        offset,
        AbilityPokemonSchema.deserialize,
        allOffsets,
        AbilityPokemon(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _abilityGetId(Ability object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _abilityGetLinks(Ability object) {
  return [];
}

void _abilityAttach(IsarCollection<dynamic> col, Id id, Ability object) {}

extension AbilityQueryWhereSort on QueryBuilder<Ability, Ability, QWhere> {
  QueryBuilder<Ability, Ability, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AbilityQueryWhere on QueryBuilder<Ability, Ability, QWhereClause> {
  QueryBuilder<Ability, Ability, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Ability, Ability, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterWhereClause> idBetween(
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

extension AbilityQueryFilter
    on QueryBuilder<Ability, Ability, QFilterCondition> {
  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectChangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectChanges',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectChanges',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectChangesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectChangesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectChanges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      effectEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavorTextEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> isMainSeriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMainSeries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      isMainSeriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMainSeries',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> isMainSeriesEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMainSeries',
        value: value,
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      pokemonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pokemon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AbilityQueryObject
    on QueryBuilder<Ability, Ability, QFilterCondition> {
  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectChangesElement(
      FilterQuery<AbilityEffectChange> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectChanges');
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> effectEntriesElement(
      FilterQuery<VerboseEffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectEntries');
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition>
      flavorTextEntriesElement(FilterQuery<AbilityFlavorText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'flavorTextEntries');
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> generation(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generation');
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Ability, Ability, QAfterFilterCondition> pokemonElement(
      FilterQuery<AbilityPokemon> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemon');
    });
  }
}

extension AbilityQueryLinks
    on QueryBuilder<Ability, Ability, QFilterCondition> {}

extension AbilityQuerySortBy on QueryBuilder<Ability, Ability, QSortBy> {
  QueryBuilder<Ability, Ability, QAfterSortBy> sortByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.asc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> sortByIsMainSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.desc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension AbilityQuerySortThenBy
    on QueryBuilder<Ability, Ability, QSortThenBy> {
  QueryBuilder<Ability, Ability, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> thenByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.asc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> thenByIsMainSeriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMainSeries', Sort.desc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Ability, Ability, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension AbilityQueryWhereDistinct
    on QueryBuilder<Ability, Ability, QDistinct> {
  QueryBuilder<Ability, Ability, QDistinct> distinctByIsMainSeries() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMainSeries');
    });
  }

  QueryBuilder<Ability, Ability, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension AbilityQueryProperty
    on QueryBuilder<Ability, Ability, QQueryProperty> {
  QueryBuilder<Ability, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Ability, List<AbilityEffectChange>?, QQueryOperations>
      effectChangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectChanges');
    });
  }

  QueryBuilder<Ability, List<VerboseEffect>?, QQueryOperations>
      effectEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectEntries');
    });
  }

  QueryBuilder<Ability, List<AbilityFlavorText>?, QQueryOperations>
      flavorTextEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flavorTextEntries');
    });
  }

  QueryBuilder<Ability, NamedApiResource?, QQueryOperations>
      generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Ability, bool?, QQueryOperations> isMainSeriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMainSeries');
    });
  }

  QueryBuilder<Ability, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Ability, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Ability, List<AbilityPokemon>?, QQueryOperations>
      pokemonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pokemon');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AbilityEffectChangeSchema = Schema(
  name: r'AbilityEffectChange',
  id: 1260557215585391237,
  properties: {
    r'effectEntries': PropertySchema(
      id: 0,
      name: r'effectEntries',
      type: IsarType.objectList,
      target: r'Effect',
    ),
    r'versionGroup': PropertySchema(
      id: 1,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _abilityEffectChangeEstimateSize,
  serialize: _abilityEffectChangeSerialize,
  deserialize: _abilityEffectChangeDeserialize,
  deserializeProp: _abilityEffectChangeDeserializeProp,
);

int _abilityEffectChangeEstimateSize(
  AbilityEffectChange object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.effectEntries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Effect]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += EffectSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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

void _abilityEffectChangeSerialize(
  AbilityEffectChange object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Effect>(
    offsets[0],
    allOffsets,
    EffectSchema.serialize,
    object.effectEntries,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

AbilityEffectChange _abilityEffectChangeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AbilityEffectChange(
    effectEntries: reader.readObjectList<Effect>(
      offsets[0],
      EffectSchema.deserialize,
      allOffsets,
      Effect(),
    ),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _abilityEffectChangeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Effect>(
        offset,
        EffectSchema.deserialize,
        allOffsets,
        Effect(),
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

extension AbilityEffectChangeQueryFilter on QueryBuilder<AbilityEffectChange,
    AbilityEffectChange, QFilterCondition> {
  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'effectEntries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension AbilityEffectChangeQueryObject on QueryBuilder<AbilityEffectChange,
    AbilityEffectChange, QFilterCondition> {
  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      effectEntriesElement(FilterQuery<Effect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectEntries');
    });
  }

  QueryBuilder<AbilityEffectChange, AbilityEffectChange, QAfterFilterCondition>
      versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AbilityFlavorTextSchema = Schema(
  name: r'AbilityFlavorText',
  id: -6615590410663927558,
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
    r'versionGroup': PropertySchema(
      id: 2,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _abilityFlavorTextEstimateSize,
  serialize: _abilityFlavorTextSerialize,
  deserialize: _abilityFlavorTextDeserialize,
  deserializeProp: _abilityFlavorTextDeserializeProp,
);

int _abilityFlavorTextEstimateSize(
  AbilityFlavorText object,
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
    final value = object.versionGroup;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _abilityFlavorTextSerialize(
  AbilityFlavorText object,
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
    object.versionGroup,
  );
}

AbilityFlavorText _abilityFlavorTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AbilityFlavorText(
    flavorText: reader.readStringOrNull(offsets[0]),
    language: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _abilityFlavorTextDeserializeProp<P>(
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

extension AbilityFlavorTextQueryFilter
    on QueryBuilder<AbilityFlavorText, AbilityFlavorText, QFilterCondition> {
  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextEqualTo(
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextBetween(
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
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

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flavorText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      flavorTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension AbilityFlavorTextQueryObject
    on QueryBuilder<AbilityFlavorText, AbilityFlavorText, QFilterCondition> {
  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      language(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }

  QueryBuilder<AbilityFlavorText, AbilityFlavorText, QAfterFilterCondition>
      versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AbilityPokemonSchema = Schema(
  name: r'AbilityPokemon',
  id: 6456178490252500841,
  properties: {
    r'isHidden': PropertySchema(
      id: 0,
      name: r'isHidden',
      type: IsarType.bool,
    ),
    r'pokemon': PropertySchema(
      id: 1,
      name: r'pokemon',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'slot': PropertySchema(
      id: 2,
      name: r'slot',
      type: IsarType.long,
    )
  },
  estimateSize: _abilityPokemonEstimateSize,
  serialize: _abilityPokemonSerialize,
  deserialize: _abilityPokemonDeserialize,
  deserializeProp: _abilityPokemonDeserializeProp,
);

int _abilityPokemonEstimateSize(
  AbilityPokemon object,
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
  return bytesCount;
}

void _abilityPokemonSerialize(
  AbilityPokemon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isHidden);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.pokemon,
  );
  writer.writeLong(offsets[2], object.slot);
}

AbilityPokemon _abilityPokemonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AbilityPokemon(
    isHidden: reader.readBoolOrNull(offsets[0]),
    pokemon: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    slot: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _abilityPokemonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
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

extension AbilityPokemonQueryFilter
    on QueryBuilder<AbilityPokemon, AbilityPokemon, QFilterCondition> {
  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      isHiddenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      isHiddenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isHidden',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      isHiddenEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHidden',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      pokemonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      pokemonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pokemon',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slot',
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slot',
        value: value,
      ));
    });
  }

  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition>
      slotBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AbilityPokemonQueryObject
    on QueryBuilder<AbilityPokemon, AbilityPokemon, QFilterCondition> {
  QueryBuilder<AbilityPokemon, AbilityPokemon, QAfterFilterCondition> pokemon(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pokemon');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      isMainSeries: json['is_main_series'] as bool?,
      generation: json['generation'] == null
          ? null
          : NamedApiResource.fromJson(
              json['generation'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => VerboseEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      effectChanges: (json['effect_changes'] as List<dynamic>?)
          ?.map((e) => AbilityEffectChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => AbilityFlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      pokemon: (json['pokemon'] as List<dynamic>?)
          ?.map((e) => AbilityPokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_main_series': instance.isMainSeries,
      'generation': instance.generation,
      'names': instance.names,
      'effect_entries': instance.effectEntries,
      'effect_changes': instance.effectChanges,
      'flavor_text_entries': instance.flavorTextEntries,
      'pokemon': instance.pokemon,
    };

AbilityEffectChange _$AbilityEffectChangeFromJson(Map<String, dynamic> json) =>
    AbilityEffectChange(
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => Effect.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityEffectChangeToJson(
        AbilityEffectChange instance) =>
    <String, dynamic>{
      'effect_entries': instance.effectEntries,
      'version_group': instance.versionGroup,
    };

AbilityFlavorText _$AbilityFlavorTextFromJson(Map<String, dynamic> json) =>
    AbilityFlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityFlavorTextToJson(AbilityFlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version_group': instance.versionGroup,
    };

AbilityPokemon _$AbilityPokemonFromJson(Map<String, dynamic> json) =>
    AbilityPokemon(
      isHidden: json['is_hidden'] as bool?,
      slot: (json['slot'] as num?)?.toInt(),
      pokemon: json['pokemon'] == null
          ? null
          : NamedApiResource.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityPokemonToJson(AbilityPokemon instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'pokemon': instance.pokemon,
    };
