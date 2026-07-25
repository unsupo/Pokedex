// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveCollection on Isar {
  IsarCollection<Move> get moves => this.collection();
}

const MoveSchema = CollectionSchema(
  name: r'Move',
  id: 5504967249916866048,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.long,
    ),
    r'contestCombos': PropertySchema(
      id: 1,
      name: r'contestCombos',
      type: IsarType.object,
      target: r'ContestComboSets',
    ),
    r'contestEffect': PropertySchema(
      id: 2,
      name: r'contestEffect',
      type: IsarType.object,
      target: r'ApiResource',
    ),
    r'contestType': PropertySchema(
      id: 3,
      name: r'contestType',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'damageClass': PropertySchema(
      id: 4,
      name: r'damageClass',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'effectChance': PropertySchema(
      id: 5,
      name: r'effectChance',
      type: IsarType.long,
    ),
    r'effectChanges': PropertySchema(
      id: 6,
      name: r'effectChanges',
      type: IsarType.objectList,
      target: r'AbilityEffectChange',
    ),
    r'effectEntries': PropertySchema(
      id: 7,
      name: r'effectEntries',
      type: IsarType.objectList,
      target: r'VerboseEffect',
    ),
    r'flavorTextEntries': PropertySchema(
      id: 8,
      name: r'flavorTextEntries',
      type: IsarType.objectList,
      target: r'MoveFlavorText',
    ),
    r'generation': PropertySchema(
      id: 9,
      name: r'generation',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'learnedByPokemon': PropertySchema(
      id: 10,
      name: r'learnedByPokemon',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'machines': PropertySchema(
      id: 11,
      name: r'machines',
      type: IsarType.objectList,
      target: r'MachineVersionDetail',
    ),
    r'meta': PropertySchema(
      id: 12,
      name: r'meta',
      type: IsarType.object,
      target: r'MoveMetaData',
    ),
    r'name': PropertySchema(
      id: 13,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 14,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'pastValues': PropertySchema(
      id: 15,
      name: r'pastValues',
      type: IsarType.objectList,
      target: r'PastMoveStatValues',
    ),
    r'power': PropertySchema(
      id: 16,
      name: r'power',
      type: IsarType.long,
    ),
    r'pp': PropertySchema(
      id: 17,
      name: r'pp',
      type: IsarType.long,
    ),
    r'priority': PropertySchema(
      id: 18,
      name: r'priority',
      type: IsarType.long,
    ),
    r'statChanges': PropertySchema(
      id: 19,
      name: r'statChanges',
      type: IsarType.objectList,
      target: r'MoveStatChange',
    ),
    r'superContestEffect': PropertySchema(
      id: 20,
      name: r'superContestEffect',
      type: IsarType.object,
      target: r'ApiResource',
    ),
    r'target': PropertySchema(
      id: 21,
      name: r'target',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'type': PropertySchema(
      id: 22,
      name: r'type',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _moveEstimateSize,
  serialize: _moveSerialize,
  deserialize: _moveDeserialize,
  deserializeProp: _moveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ContestComboSets': ContestComboSetsSchema,
    r'ContestComboDetail': ContestComboDetailSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiResource': ApiResourceSchema,
    r'VerboseEffect': VerboseEffectSchema,
    r'AbilityEffectChange': AbilityEffectChangeSchema,
    r'Effect': EffectSchema,
    r'MoveFlavorText': MoveFlavorTextSchema,
    r'MachineVersionDetail': MachineVersionDetailSchema,
    r'MoveMetaData': MoveMetaDataSchema,
    r'ApiName': ApiNameSchema,
    r'PastMoveStatValues': PastMoveStatValuesSchema,
    r'MoveStatChange': MoveStatChangeSchema
  },
  getId: _moveGetId,
  getLinks: _moveGetLinks,
  attach: _moveAttach,
  version: '3.3.2',
);

int _moveEstimateSize(
  Move object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contestCombos;
    if (value != null) {
      bytesCount += 3 +
          ContestComboSetsSchema.estimateSize(
              value, allOffsets[ContestComboSets]!, allOffsets);
    }
  }
  {
    final value = object.contestEffect;
    if (value != null) {
      bytesCount += 3 +
          ApiResourceSchema.estimateSize(
              value, allOffsets[ApiResource]!, allOffsets);
    }
  }
  {
    final value = object.contestType;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.damageClass;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
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
        final offsets = allOffsets[MoveFlavorText]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              MoveFlavorTextSchema.estimateSize(value, offsets, allOffsets);
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
    final list = object.learnedByPokemon;
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
    final list = object.machines;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MachineVersionDetail]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += MachineVersionDetailSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.meta;
    if (value != null) {
      bytesCount += 3 +
          MoveMetaDataSchema.estimateSize(
              value, allOffsets[MoveMetaData]!, allOffsets);
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
    final list = object.pastValues;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[PastMoveStatValues]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              PastMoveStatValuesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.statChanges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[MoveStatChange]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              MoveStatChangeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.superContestEffect;
    if (value != null) {
      bytesCount += 3 +
          ApiResourceSchema.estimateSize(
              value, allOffsets[ApiResource]!, allOffsets);
    }
  }
  {
    final value = object.target;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveSerialize(
  Move object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accuracy);
  writer.writeObject<ContestComboSets>(
    offsets[1],
    allOffsets,
    ContestComboSetsSchema.serialize,
    object.contestCombos,
  );
  writer.writeObject<ApiResource>(
    offsets[2],
    allOffsets,
    ApiResourceSchema.serialize,
    object.contestEffect,
  );
  writer.writeObject<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.contestType,
  );
  writer.writeObject<NamedApiResource>(
    offsets[4],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.damageClass,
  );
  writer.writeLong(offsets[5], object.effectChance);
  writer.writeObjectList<AbilityEffectChange>(
    offsets[6],
    allOffsets,
    AbilityEffectChangeSchema.serialize,
    object.effectChanges,
  );
  writer.writeObjectList<VerboseEffect>(
    offsets[7],
    allOffsets,
    VerboseEffectSchema.serialize,
    object.effectEntries,
  );
  writer.writeObjectList<MoveFlavorText>(
    offsets[8],
    allOffsets,
    MoveFlavorTextSchema.serialize,
    object.flavorTextEntries,
  );
  writer.writeObject<NamedApiResource>(
    offsets[9],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.generation,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[10],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.learnedByPokemon,
  );
  writer.writeObjectList<MachineVersionDetail>(
    offsets[11],
    allOffsets,
    MachineVersionDetailSchema.serialize,
    object.machines,
  );
  writer.writeObject<MoveMetaData>(
    offsets[12],
    allOffsets,
    MoveMetaDataSchema.serialize,
    object.meta,
  );
  writer.writeString(offsets[13], object.name);
  writer.writeObjectList<ApiName>(
    offsets[14],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<PastMoveStatValues>(
    offsets[15],
    allOffsets,
    PastMoveStatValuesSchema.serialize,
    object.pastValues,
  );
  writer.writeLong(offsets[16], object.power);
  writer.writeLong(offsets[17], object.pp);
  writer.writeLong(offsets[18], object.priority);
  writer.writeObjectList<MoveStatChange>(
    offsets[19],
    allOffsets,
    MoveStatChangeSchema.serialize,
    object.statChanges,
  );
  writer.writeObject<ApiResource>(
    offsets[20],
    allOffsets,
    ApiResourceSchema.serialize,
    object.superContestEffect,
  );
  writer.writeObject<NamedApiResource>(
    offsets[21],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.target,
  );
  writer.writeObject<NamedApiResource>(
    offsets[22],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.type,
  );
}

Move _moveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Move(
    accuracy: reader.readLongOrNull(offsets[0]),
    contestCombos: reader.readObjectOrNull<ContestComboSets>(
      offsets[1],
      ContestComboSetsSchema.deserialize,
      allOffsets,
    ),
    contestEffect: reader.readObjectOrNull<ApiResource>(
      offsets[2],
      ApiResourceSchema.deserialize,
      allOffsets,
    ),
    contestType: reader.readObjectOrNull<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    damageClass: reader.readObjectOrNull<NamedApiResource>(
      offsets[4],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    effectChance: reader.readLongOrNull(offsets[5]),
    effectChanges: reader.readObjectList<AbilityEffectChange>(
      offsets[6],
      AbilityEffectChangeSchema.deserialize,
      allOffsets,
      AbilityEffectChange(),
    ),
    effectEntries: reader.readObjectList<VerboseEffect>(
      offsets[7],
      VerboseEffectSchema.deserialize,
      allOffsets,
      VerboseEffect(),
    ),
    flavorTextEntries: reader.readObjectList<MoveFlavorText>(
      offsets[8],
      MoveFlavorTextSchema.deserialize,
      allOffsets,
      MoveFlavorText(),
    ),
    generation: reader.readObjectOrNull<NamedApiResource>(
      offsets[9],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
    learnedByPokemon: reader.readObjectList<NamedApiResource>(
      offsets[10],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    machines: reader.readObjectList<MachineVersionDetail>(
      offsets[11],
      MachineVersionDetailSchema.deserialize,
      allOffsets,
      MachineVersionDetail(),
    ),
    meta: reader.readObjectOrNull<MoveMetaData>(
      offsets[12],
      MoveMetaDataSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[13]),
    names: reader.readObjectList<ApiName>(
      offsets[14],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    pastValues: reader.readObjectList<PastMoveStatValues>(
      offsets[15],
      PastMoveStatValuesSchema.deserialize,
      allOffsets,
      PastMoveStatValues(),
    ),
    power: reader.readLongOrNull(offsets[16]),
    pp: reader.readLongOrNull(offsets[17]),
    priority: reader.readLongOrNull(offsets[18]),
    statChanges: reader.readObjectList<MoveStatChange>(
      offsets[19],
      MoveStatChangeSchema.deserialize,
      allOffsets,
      MoveStatChange(),
    ),
    superContestEffect: reader.readObjectOrNull<ApiResource>(
      offsets[20],
      ApiResourceSchema.deserialize,
      allOffsets,
    ),
    target: reader.readObjectOrNull<NamedApiResource>(
      offsets[21],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    type: reader.readObjectOrNull<NamedApiResource>(
      offsets[22],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _moveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<ContestComboSets>(
        offset,
        ContestComboSetsSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<ApiResource>(
        offset,
        ApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readObjectList<AbilityEffectChange>(
        offset,
        AbilityEffectChangeSchema.deserialize,
        allOffsets,
        AbilityEffectChange(),
      )) as P;
    case 7:
      return (reader.readObjectList<VerboseEffect>(
        offset,
        VerboseEffectSchema.deserialize,
        allOffsets,
        VerboseEffect(),
      )) as P;
    case 8:
      return (reader.readObjectList<MoveFlavorText>(
        offset,
        MoveFlavorTextSchema.deserialize,
        allOffsets,
        MoveFlavorText(),
      )) as P;
    case 9:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 10:
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 11:
      return (reader.readObjectList<MachineVersionDetail>(
        offset,
        MachineVersionDetailSchema.deserialize,
        allOffsets,
        MachineVersionDetail(),
      )) as P;
    case 12:
      return (reader.readObjectOrNull<MoveMetaData>(
        offset,
        MoveMetaDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 15:
      return (reader.readObjectList<PastMoveStatValues>(
        offset,
        PastMoveStatValuesSchema.deserialize,
        allOffsets,
        PastMoveStatValues(),
      )) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readObjectList<MoveStatChange>(
        offset,
        MoveStatChangeSchema.deserialize,
        allOffsets,
        MoveStatChange(),
      )) as P;
    case 20:
      return (reader.readObjectOrNull<ApiResource>(
        offset,
        ApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 21:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 22:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moveGetId(Move object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveGetLinks(Move object) {
  return [];
}

void _moveAttach(IsarCollection<dynamic> col, Id id, Move object) {}

extension MoveQueryWhereSort on QueryBuilder<Move, Move, QWhere> {
  QueryBuilder<Move, Move, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveQueryWhere on QueryBuilder<Move, Move, QWhereClause> {
  QueryBuilder<Move, Move, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Move, Move, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Move, Move, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Move, Move, QAfterWhereClause> idBetween(
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

extension MoveQueryFilter on QueryBuilder<Move, Move, QFilterCondition> {
  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accuracy',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accuracy',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> accuracyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestCombosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contestCombos',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestCombosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contestCombos',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestEffectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contestEffect',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestEffectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contestEffect',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contestType',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contestType',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> damageClassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'damageClass',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> damageClassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'damageClass',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectChance',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectChance',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectChanges',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectChanges',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesLengthEqualTo(
      int length) {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesIsEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesIsNotEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesLengthLessThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesLengthBetween(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesLengthEqualTo(
      int length) {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesIsEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesIsNotEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesLengthLessThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesLengthBetween(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> flavorTextEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> flavorTextEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorTextEntries',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition> flavorTextEntriesIsEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition>
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

  QueryBuilder<Move, Move, QAfterFilterCondition> generationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> generationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generation',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'learnedByPokemon',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'learnedByPokemon',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition>
      learnedByPokemonLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition>
      learnedByPokemonLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'learnedByPokemon',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'machines',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'machines',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'machines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> metaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'meta',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> metaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'meta',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> namesLengthEqualTo(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> namesIsNotEmpty() {
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

  QueryBuilder<Move, Move, QAfterFilterCondition> namesLengthLessThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> namesLengthGreaterThan(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> namesLengthBetween(
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

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pastValues',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pastValues',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'pastValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'power',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'power',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> powerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'power',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pp',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pp',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> ppBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priority',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priority',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> priorityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'statChanges',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'statChanges',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'statChanges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> superContestEffectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superContestEffect',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition>
      superContestEffectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superContestEffect',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> targetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> targetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }
}

extension MoveQueryObject on QueryBuilder<Move, Move, QFilterCondition> {
  QueryBuilder<Move, Move, QAfterFilterCondition> contestCombos(
      FilterQuery<ContestComboSets> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'contestCombos');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestEffect(
      FilterQuery<ApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'contestEffect');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> contestType(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'contestType');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> damageClass(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'damageClass');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectChangesElement(
      FilterQuery<AbilityEffectChange> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectChanges');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> effectEntriesElement(
      FilterQuery<VerboseEffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectEntries');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> flavorTextEntriesElement(
      FilterQuery<MoveFlavorText> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'flavorTextEntries');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> generation(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generation');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> learnedByPokemonElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'learnedByPokemon');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> machinesElement(
      FilterQuery<MachineVersionDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'machines');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> meta(
      FilterQuery<MoveMetaData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'meta');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> pastValuesElement(
      FilterQuery<PastMoveStatValues> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'pastValues');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> statChangesElement(
      FilterQuery<MoveStatChange> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'statChanges');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> superContestEffect(
      FilterQuery<ApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'superContestEffect');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> target(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'target');
    });
  }

  QueryBuilder<Move, Move, QAfterFilterCondition> type(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'type');
    });
  }
}

extension MoveQueryLinks on QueryBuilder<Move, Move, QFilterCondition> {}

extension MoveQuerySortBy on QueryBuilder<Move, Move, QSortBy> {
  QueryBuilder<Move, Move, QAfterSortBy> sortByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByEffectChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectChance', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByEffectChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectChance', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'power', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPowerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'power', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }
}

extension MoveQuerySortThenBy on QueryBuilder<Move, Move, QSortThenBy> {
  QueryBuilder<Move, Move, QAfterSortBy> thenByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByEffectChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectChance', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByEffectChanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectChance', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'power', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPowerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'power', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<Move, Move, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }
}

extension MoveQueryWhereDistinct on QueryBuilder<Move, Move, QDistinct> {
  QueryBuilder<Move, Move, QDistinct> distinctByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracy');
    });
  }

  QueryBuilder<Move, Move, QDistinct> distinctByEffectChance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectChance');
    });
  }

  QueryBuilder<Move, Move, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Move, Move, QDistinct> distinctByPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'power');
    });
  }

  QueryBuilder<Move, Move, QDistinct> distinctByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pp');
    });
  }

  QueryBuilder<Move, Move, QDistinct> distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }
}

extension MoveQueryProperty on QueryBuilder<Move, Move, QQueryProperty> {
  QueryBuilder<Move, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Move, int?, QQueryOperations> accuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracy');
    });
  }

  QueryBuilder<Move, ContestComboSets?, QQueryOperations>
      contestCombosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contestCombos');
    });
  }

  QueryBuilder<Move, ApiResource?, QQueryOperations> contestEffectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contestEffect');
    });
  }

  QueryBuilder<Move, NamedApiResource?, QQueryOperations>
      contestTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contestType');
    });
  }

  QueryBuilder<Move, NamedApiResource?, QQueryOperations>
      damageClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'damageClass');
    });
  }

  QueryBuilder<Move, int?, QQueryOperations> effectChanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectChance');
    });
  }

  QueryBuilder<Move, List<AbilityEffectChange>?, QQueryOperations>
      effectChangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectChanges');
    });
  }

  QueryBuilder<Move, List<VerboseEffect>?, QQueryOperations>
      effectEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectEntries');
    });
  }

  QueryBuilder<Move, List<MoveFlavorText>?, QQueryOperations>
      flavorTextEntriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flavorTextEntries');
    });
  }

  QueryBuilder<Move, NamedApiResource?, QQueryOperations> generationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generation');
    });
  }

  QueryBuilder<Move, List<NamedApiResource>?, QQueryOperations>
      learnedByPokemonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'learnedByPokemon');
    });
  }

  QueryBuilder<Move, List<MachineVersionDetail>?, QQueryOperations>
      machinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'machines');
    });
  }

  QueryBuilder<Move, MoveMetaData?, QQueryOperations> metaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meta');
    });
  }

  QueryBuilder<Move, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Move, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<Move, List<PastMoveStatValues>?, QQueryOperations>
      pastValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pastValues');
    });
  }

  QueryBuilder<Move, int?, QQueryOperations> powerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'power');
    });
  }

  QueryBuilder<Move, int?, QQueryOperations> ppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pp');
    });
  }

  QueryBuilder<Move, int?, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<Move, List<MoveStatChange>?, QQueryOperations>
      statChangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statChanges');
    });
  }

  QueryBuilder<Move, ApiResource?, QQueryOperations>
      superContestEffectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'superContestEffect');
    });
  }

  QueryBuilder<Move, NamedApiResource?, QQueryOperations> targetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target');
    });
  }

  QueryBuilder<Move, NamedApiResource?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveAilmentCollection on Isar {
  IsarCollection<MoveAilment> get moveAilments => this.collection();
}

const MoveAilmentSchema = CollectionSchema(
  name: r'MoveAilment',
  id: 825988790279802764,
  properties: {
    r'moves': PropertySchema(
      id: 0,
      name: r'moves',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 2,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    )
  },
  estimateSize: _moveAilmentEstimateSize,
  serialize: _moveAilmentSerialize,
  deserialize: _moveAilmentDeserialize,
  deserializeProp: _moveAilmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _moveAilmentGetId,
  getLinks: _moveAilmentGetLinks,
  attach: _moveAilmentAttach,
  version: '3.3.2',
);

int _moveAilmentEstimateSize(
  MoveAilment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.moves;
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

void _moveAilmentSerialize(
  MoveAilment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<ApiName>(
    offsets[2],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

MoveAilment _moveAilmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveAilment(
    id: id,
    moves: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[1]),
    names: reader.readObjectList<ApiName>(
      offsets[2],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _moveAilmentDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 2:
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

Id _moveAilmentGetId(MoveAilment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveAilmentGetLinks(MoveAilment object) {
  return [];
}

void _moveAilmentAttach(
    IsarCollection<dynamic> col, Id id, MoveAilment object) {}

extension MoveAilmentQueryWhereSort
    on QueryBuilder<MoveAilment, MoveAilment, QWhere> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveAilmentQueryWhere
    on QueryBuilder<MoveAilment, MoveAilment, QWhereClause> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterWhereClause> idBetween(
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

extension MoveAilmentQueryFilter
    on QueryBuilder<MoveAilment, MoveAilment, QFilterCondition> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      namesIsNotEmpty() {
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      namesLengthLessThan(
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
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

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition>
      namesLengthBetween(
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

extension MoveAilmentQueryObject
    on QueryBuilder<MoveAilment, MoveAilment, QFilterCondition> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> movesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension MoveAilmentQueryLinks
    on QueryBuilder<MoveAilment, MoveAilment, QFilterCondition> {}

extension MoveAilmentQuerySortBy
    on QueryBuilder<MoveAilment, MoveAilment, QSortBy> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveAilmentQuerySortThenBy
    on QueryBuilder<MoveAilment, MoveAilment, QSortThenBy> {
  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveAilment, MoveAilment, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveAilmentQueryWhereDistinct
    on QueryBuilder<MoveAilment, MoveAilment, QDistinct> {
  QueryBuilder<MoveAilment, MoveAilment, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveAilmentQueryProperty
    on QueryBuilder<MoveAilment, MoveAilment, QQueryProperty> {
  QueryBuilder<MoveAilment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveAilment, List<NamedApiResource>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<MoveAilment, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveAilment, List<ApiName>?, QQueryOperations> namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveBattleStyleCollection on Isar {
  IsarCollection<MoveBattleStyle> get moveBattleStyles => this.collection();
}

const MoveBattleStyleSchema = CollectionSchema(
  name: r'MoveBattleStyle',
  id: -3884046812043973955,
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
    )
  },
  estimateSize: _moveBattleStyleEstimateSize,
  serialize: _moveBattleStyleSerialize,
  deserialize: _moveBattleStyleDeserialize,
  deserializeProp: _moveBattleStyleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ApiName': ApiNameSchema,
    r'NamedApiResource': NamedApiResourceSchema
  },
  getId: _moveBattleStyleGetId,
  getLinks: _moveBattleStyleGetLinks,
  attach: _moveBattleStyleAttach,
  version: '3.3.2',
);

int _moveBattleStyleEstimateSize(
  MoveBattleStyle object,
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
  return bytesCount;
}

void _moveBattleStyleSerialize(
  MoveBattleStyle object,
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
}

MoveBattleStyle _moveBattleStyleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveBattleStyle(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    names: reader.readObjectList<ApiName>(
      offsets[1],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _moveBattleStyleDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moveBattleStyleGetId(MoveBattleStyle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveBattleStyleGetLinks(MoveBattleStyle object) {
  return [];
}

void _moveBattleStyleAttach(
    IsarCollection<dynamic> col, Id id, MoveBattleStyle object) {}

extension MoveBattleStyleQueryWhereSort
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QWhere> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveBattleStyleQueryWhere
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QWhereClause> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterWhereClause> idBetween(
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

extension MoveBattleStyleQueryFilter
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QFilterCondition> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesIsEmpty() {
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesIsNotEmpty() {
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesLengthLessThan(
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
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

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesLengthBetween(
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

extension MoveBattleStyleQueryObject
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QFilterCondition> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension MoveBattleStyleQueryLinks
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QFilterCondition> {}

extension MoveBattleStyleQuerySortBy
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QSortBy> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveBattleStyleQuerySortThenBy
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QSortThenBy> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveBattleStyleQueryWhereDistinct
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QDistinct> {
  QueryBuilder<MoveBattleStyle, MoveBattleStyle, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveBattleStyleQueryProperty
    on QueryBuilder<MoveBattleStyle, MoveBattleStyle, QQueryProperty> {
  QueryBuilder<MoveBattleStyle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveBattleStyle, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveBattleStyle, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveCategoryCollection on Isar {
  IsarCollection<MoveCategory> get moveCategorys => this.collection();
}

const MoveCategorySchema = CollectionSchema(
  name: r'MoveCategory',
  id: -5492006189155009268,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'moves': PropertySchema(
      id: 1,
      name: r'moves',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _moveCategoryEstimateSize,
  serialize: _moveCategorySerialize,
  deserialize: _moveCategoryDeserialize,
  deserializeProp: _moveCategoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'Description': DescriptionSchema
  },
  getId: _moveCategoryGetId,
  getLinks: _moveCategoryGetLinks,
  attach: _moveCategoryAttach,
  version: '3.3.2',
);

int _moveCategoryEstimateSize(
  MoveCategory object,
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
    final list = object.moves;
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
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _moveCategorySerialize(
  MoveCategory object,
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
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[2], object.name);
}

MoveCategory _moveCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveCategory(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    id: id,
    moves: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _moveCategoryDeserializeProp<P>(
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
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moveCategoryGetId(MoveCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveCategoryGetLinks(MoveCategory object) {
  return [];
}

void _moveCategoryAttach(
    IsarCollection<dynamic> col, Id id, MoveCategory object) {}

extension MoveCategoryQueryWhereSort
    on QueryBuilder<MoveCategory, MoveCategory, QWhere> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveCategoryQueryWhere
    on QueryBuilder<MoveCategory, MoveCategory, QWhereClause> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterWhereClause> idBetween(
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

extension MoveCategoryQueryFilter
    on QueryBuilder<MoveCategory, MoveCategory, QFilterCondition> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension MoveCategoryQueryObject
    on QueryBuilder<MoveCategory, MoveCategory, QFilterCondition> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterFilterCondition> movesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }
}

extension MoveCategoryQueryLinks
    on QueryBuilder<MoveCategory, MoveCategory, QFilterCondition> {}

extension MoveCategoryQuerySortBy
    on QueryBuilder<MoveCategory, MoveCategory, QSortBy> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveCategoryQuerySortThenBy
    on QueryBuilder<MoveCategory, MoveCategory, QSortThenBy> {
  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveCategory, MoveCategory, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveCategoryQueryWhereDistinct
    on QueryBuilder<MoveCategory, MoveCategory, QDistinct> {
  QueryBuilder<MoveCategory, MoveCategory, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveCategoryQueryProperty
    on QueryBuilder<MoveCategory, MoveCategory, QQueryProperty> {
  QueryBuilder<MoveCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveCategory, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<MoveCategory, List<NamedApiResource>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<MoveCategory, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveDamageClassCollection on Isar {
  IsarCollection<MoveDamageClass> get moveDamageClass => this.collection();
}

const MoveDamageClassSchema = CollectionSchema(
  name: r'MoveDamageClass',
  id: -4364479619224483366,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'moves': PropertySchema(
      id: 1,
      name: r'moves',
      type: IsarType.objectList,
      target: r'NamedApiResource',
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
    )
  },
  estimateSize: _moveDamageClassEstimateSize,
  serialize: _moveDamageClassSerialize,
  deserialize: _moveDamageClassDeserialize,
  deserializeProp: _moveDamageClassDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Description': DescriptionSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _moveDamageClassGetId,
  getLinks: _moveDamageClassGetLinks,
  attach: _moveDamageClassAttach,
  version: '3.3.2',
);

int _moveDamageClassEstimateSize(
  MoveDamageClass object,
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
    final list = object.moves;
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

void _moveDamageClassSerialize(
  MoveDamageClass object,
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
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

MoveDamageClass _moveDamageClassDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveDamageClass(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    id: id,
    moves: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _moveDamageClassDeserializeProp<P>(
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
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
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

Id _moveDamageClassGetId(MoveDamageClass object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveDamageClassGetLinks(MoveDamageClass object) {
  return [];
}

void _moveDamageClassAttach(
    IsarCollection<dynamic> col, Id id, MoveDamageClass object) {}

extension MoveDamageClassQueryWhereSort
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QWhere> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveDamageClassQueryWhere
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QWhereClause> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterWhereClause> idBetween(
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

extension MoveDamageClassQueryFilter
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QFilterCondition> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesIsEmpty() {
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesIsNotEmpty() {
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesLengthLessThan(
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
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

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesLengthBetween(
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

extension MoveDamageClassQueryObject
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QFilterCondition> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      movesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension MoveDamageClassQueryLinks
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QFilterCondition> {}

extension MoveDamageClassQuerySortBy
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QSortBy> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveDamageClassQuerySortThenBy
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QSortThenBy> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveDamageClass, MoveDamageClass, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveDamageClassQueryWhereDistinct
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QDistinct> {
  QueryBuilder<MoveDamageClass, MoveDamageClass, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveDamageClassQueryProperty
    on QueryBuilder<MoveDamageClass, MoveDamageClass, QQueryProperty> {
  QueryBuilder<MoveDamageClass, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveDamageClass, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<MoveDamageClass, List<NamedApiResource>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<MoveDamageClass, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveDamageClass, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveUrlCollection on Isar {
  IsarCollection<MoveUrl> get moveUrls => this.collection();
}

const MoveUrlSchema = CollectionSchema(
  name: r'MoveUrl',
  id: -8137232539921639972,
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
  estimateSize: _moveUrlEstimateSize,
  serialize: _moveUrlSerialize,
  deserialize: _moveUrlDeserialize,
  deserializeProp: _moveUrlDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moveUrlGetId,
  getLinks: _moveUrlGetLinks,
  attach: _moveUrlAttach,
  version: '3.3.2',
);

int _moveUrlEstimateSize(
  MoveUrl object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _moveUrlSerialize(
  MoveUrl object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.url);
}

MoveUrl _moveUrlDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveUrl(
    name: reader.readString(offsets[0]),
    url: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _moveUrlDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moveUrlGetId(MoveUrl object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveUrlGetLinks(MoveUrl object) {
  return [];
}

void _moveUrlAttach(IsarCollection<dynamic> col, Id id, MoveUrl object) {
  object.id = id;
}

extension MoveUrlQueryWhereSort on QueryBuilder<MoveUrl, MoveUrl, QWhere> {
  QueryBuilder<MoveUrl, MoveUrl, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveUrlQueryWhere on QueryBuilder<MoveUrl, MoveUrl, QWhereClause> {
  QueryBuilder<MoveUrl, MoveUrl, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterWhereClause> idBetween(
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

extension MoveUrlQueryFilter
    on QueryBuilder<MoveUrl, MoveUrl, QFilterCondition> {
  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameEqualTo(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameGreaterThan(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlEqualTo(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlGreaterThan(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlLessThan(
    String value, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlContains(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlMatches(
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

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension MoveUrlQueryObject
    on QueryBuilder<MoveUrl, MoveUrl, QFilterCondition> {}

extension MoveUrlQueryLinks
    on QueryBuilder<MoveUrl, MoveUrl, QFilterCondition> {}

extension MoveUrlQuerySortBy on QueryBuilder<MoveUrl, MoveUrl, QSortBy> {
  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension MoveUrlQuerySortThenBy
    on QueryBuilder<MoveUrl, MoveUrl, QSortThenBy> {
  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension MoveUrlQueryWhereDistinct
    on QueryBuilder<MoveUrl, MoveUrl, QDistinct> {
  QueryBuilder<MoveUrl, MoveUrl, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MoveUrl, MoveUrl, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension MoveUrlQueryProperty
    on QueryBuilder<MoveUrl, MoveUrl, QQueryProperty> {
  QueryBuilder<MoveUrl, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveUrl, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveUrl, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveLearnMethodCollection on Isar {
  IsarCollection<MoveLearnMethod> get moveLearnMethods => this.collection();
}

const MoveLearnMethodSchema = CollectionSchema(
  name: r'MoveLearnMethod',
  id: -3151809813965814818,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'names': PropertySchema(
      id: 2,
      name: r'names',
      type: IsarType.objectList,
      target: r'ApiName',
    ),
    r'versionGroups': PropertySchema(
      id: 3,
      name: r'versionGroups',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _moveLearnMethodEstimateSize,
  serialize: _moveLearnMethodSerialize,
  deserialize: _moveLearnMethodDeserialize,
  deserializeProp: _moveLearnMethodDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Description': DescriptionSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _moveLearnMethodGetId,
  getLinks: _moveLearnMethodGetLinks,
  attach: _moveLearnMethodAttach,
  version: '3.3.2',
);

int _moveLearnMethodEstimateSize(
  MoveLearnMethod object,
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
    final list = object.versionGroups;
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

void _moveLearnMethodSerialize(
  MoveLearnMethod object,
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
  writer.writeString(offsets[1], object.name);
  writer.writeObjectList<ApiName>(
    offsets[2],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroups,
  );
}

MoveLearnMethod _moveLearnMethodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveLearnMethod(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    id: id,
    name: reader.readStringOrNull(offsets[1]),
    names: reader.readObjectList<ApiName>(
      offsets[2],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
    versionGroups: reader.readObjectList<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _moveLearnMethodDeserializeProp<P>(
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
      return (reader.readObjectList<ApiName>(
        offset,
        ApiNameSchema.deserialize,
        allOffsets,
        ApiName(),
      )) as P;
    case 3:
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

Id _moveLearnMethodGetId(MoveLearnMethod object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveLearnMethodGetLinks(MoveLearnMethod object) {
  return [];
}

void _moveLearnMethodAttach(
    IsarCollection<dynamic> col, Id id, MoveLearnMethod object) {}

extension MoveLearnMethodQueryWhereSort
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QWhere> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveLearnMethodQueryWhere
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QWhereClause> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterWhereClause> idBetween(
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

extension MoveLearnMethodQueryFilter
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QFilterCondition> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesIsEmpty() {
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesIsNotEmpty() {
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesLengthLessThan(
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesLengthBetween(
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

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroups',
      ));
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'versionGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MoveLearnMethodQueryObject
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QFilterCondition> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterFilterCondition>
      versionGroupsElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroups');
    });
  }
}

extension MoveLearnMethodQueryLinks
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QFilterCondition> {}

extension MoveLearnMethodQuerySortBy
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QSortBy> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveLearnMethodQuerySortThenBy
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QSortThenBy> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveLearnMethodQueryWhereDistinct
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QDistinct> {
  QueryBuilder<MoveLearnMethod, MoveLearnMethod, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveLearnMethodQueryProperty
    on QueryBuilder<MoveLearnMethod, MoveLearnMethod, QQueryProperty> {
  QueryBuilder<MoveLearnMethod, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveLearnMethod, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<MoveLearnMethod, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveLearnMethod, List<ApiName>?, QQueryOperations>
      namesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'names');
    });
  }

  QueryBuilder<MoveLearnMethod, List<NamedApiResource>?, QQueryOperations>
      versionGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroups');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoveTargetCollection on Isar {
  IsarCollection<MoveTarget> get moveTargets => this.collection();
}

const MoveTargetSchema = CollectionSchema(
  name: r'MoveTarget',
  id: -4916585433491255891,
  properties: {
    r'descriptions': PropertySchema(
      id: 0,
      name: r'descriptions',
      type: IsarType.objectList,
      target: r'Description',
    ),
    r'moves': PropertySchema(
      id: 1,
      name: r'moves',
      type: IsarType.objectList,
      target: r'NamedApiResource',
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
    )
  },
  estimateSize: _moveTargetEstimateSize,
  serialize: _moveTargetSerialize,
  deserialize: _moveTargetDeserialize,
  deserializeProp: _moveTargetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Description': DescriptionSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema
  },
  getId: _moveTargetGetId,
  getLinks: _moveTargetGetLinks,
  attach: _moveTargetAttach,
  version: '3.3.2',
);

int _moveTargetEstimateSize(
  MoveTarget object,
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
    final list = object.moves;
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

void _moveTargetSerialize(
  MoveTarget object,
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
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.moves,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

MoveTarget _moveTargetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveTarget(
    descriptions: reader.readObjectList<Description>(
      offsets[0],
      DescriptionSchema.deserialize,
      allOffsets,
      Description(),
    ),
    id: id,
    moves: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    name: reader.readStringOrNull(offsets[2]),
    names: reader.readObjectList<ApiName>(
      offsets[3],
      ApiNameSchema.deserialize,
      allOffsets,
      ApiName(),
    ),
  );
  return object;
}

P _moveTargetDeserializeProp<P>(
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
      return (reader.readObjectList<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
        NamedApiResource(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
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

Id _moveTargetGetId(MoveTarget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moveTargetGetLinks(MoveTarget object) {
  return [];
}

void _moveTargetAttach(IsarCollection<dynamic> col, Id id, MoveTarget object) {}

extension MoveTargetQueryWhereSort
    on QueryBuilder<MoveTarget, MoveTarget, QWhere> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoveTargetQueryWhere
    on QueryBuilder<MoveTarget, MoveTarget, QWhereClause> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterWhereClause> idBetween(
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

extension MoveTargetQueryFilter
    on QueryBuilder<MoveTarget, MoveTarget, QFilterCondition> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      descriptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      descriptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptions',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> movesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> movesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moves',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      movesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> movesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      movesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      movesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      movesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      movesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'moves',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      namesLengthEqualTo(int length) {
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      namesIsNotEmpty() {
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      namesLengthLessThan(
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
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

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      namesLengthBetween(
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

extension MoveTargetQueryObject
    on QueryBuilder<MoveTarget, MoveTarget, QFilterCondition> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition>
      descriptionsElement(FilterQuery<Description> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'descriptions');
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> movesElement(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'moves');
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension MoveTargetQueryLinks
    on QueryBuilder<MoveTarget, MoveTarget, QFilterCondition> {}

extension MoveTargetQuerySortBy
    on QueryBuilder<MoveTarget, MoveTarget, QSortBy> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveTargetQuerySortThenBy
    on QueryBuilder<MoveTarget, MoveTarget, QSortThenBy> {
  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MoveTarget, MoveTarget, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MoveTargetQueryWhereDistinct
    on QueryBuilder<MoveTarget, MoveTarget, QDistinct> {
  QueryBuilder<MoveTarget, MoveTarget, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MoveTargetQueryProperty
    on QueryBuilder<MoveTarget, MoveTarget, QQueryProperty> {
  QueryBuilder<MoveTarget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MoveTarget, List<Description>?, QQueryOperations>
      descriptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptions');
    });
  }

  QueryBuilder<MoveTarget, List<NamedApiResource>?, QQueryOperations>
      movesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moves');
    });
  }

  QueryBuilder<MoveTarget, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MoveTarget, List<ApiName>?, QQueryOperations> namesProperty() {
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

const ContestComboSetsSchema = Schema(
  name: r'ContestComboSets',
  id: 419179625722553221,
  properties: {
    r'normal': PropertySchema(
      id: 0,
      name: r'normal',
      type: IsarType.object,
      target: r'ContestComboDetail',
    ),
    r'superCombo': PropertySchema(
      id: 1,
      name: r'superCombo',
      type: IsarType.object,
      target: r'ContestComboDetail',
    )
  },
  estimateSize: _contestComboSetsEstimateSize,
  serialize: _contestComboSetsSerialize,
  deserialize: _contestComboSetsDeserialize,
  deserializeProp: _contestComboSetsDeserializeProp,
);

int _contestComboSetsEstimateSize(
  ContestComboSets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.normal;
    if (value != null) {
      bytesCount += 3 +
          ContestComboDetailSchema.estimateSize(
              value, allOffsets[ContestComboDetail]!, allOffsets);
    }
  }
  {
    final value = object.superCombo;
    if (value != null) {
      bytesCount += 3 +
          ContestComboDetailSchema.estimateSize(
              value, allOffsets[ContestComboDetail]!, allOffsets);
    }
  }
  return bytesCount;
}

void _contestComboSetsSerialize(
  ContestComboSets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<ContestComboDetail>(
    offsets[0],
    allOffsets,
    ContestComboDetailSchema.serialize,
    object.normal,
  );
  writer.writeObject<ContestComboDetail>(
    offsets[1],
    allOffsets,
    ContestComboDetailSchema.serialize,
    object.superCombo,
  );
}

ContestComboSets _contestComboSetsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContestComboSets(
    normal: reader.readObjectOrNull<ContestComboDetail>(
      offsets[0],
      ContestComboDetailSchema.deserialize,
      allOffsets,
    ),
    superCombo: reader.readObjectOrNull<ContestComboDetail>(
      offsets[1],
      ContestComboDetailSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _contestComboSetsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<ContestComboDetail>(
        offset,
        ContestComboDetailSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<ContestComboDetail>(
        offset,
        ContestComboDetailSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ContestComboSetsQueryFilter
    on QueryBuilder<ContestComboSets, ContestComboSets, QFilterCondition> {
  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      normalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'normal',
      ));
    });
  }

  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      normalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'normal',
      ));
    });
  }

  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      superComboIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'superCombo',
      ));
    });
  }

  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      superComboIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'superCombo',
      ));
    });
  }
}

extension ContestComboSetsQueryObject
    on QueryBuilder<ContestComboSets, ContestComboSets, QFilterCondition> {
  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      normal(FilterQuery<ContestComboDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'normal');
    });
  }

  QueryBuilder<ContestComboSets, ContestComboSets, QAfterFilterCondition>
      superCombo(FilterQuery<ContestComboDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'superCombo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ContestComboDetailSchema = Schema(
  name: r'ContestComboDetail',
  id: -2644121212162815361,
  properties: {
    r'useAfter': PropertySchema(
      id: 0,
      name: r'useAfter',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'useBefore': PropertySchema(
      id: 1,
      name: r'useBefore',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _contestComboDetailEstimateSize,
  serialize: _contestComboDetailSerialize,
  deserialize: _contestComboDetailDeserialize,
  deserializeProp: _contestComboDetailDeserializeProp,
);

int _contestComboDetailEstimateSize(
  ContestComboDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.useAfter;
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
    final list = object.useBefore;
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

void _contestComboDetailSerialize(
  ContestComboDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.useAfter,
  );
  writer.writeObjectList<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.useBefore,
  );
}

ContestComboDetail _contestComboDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContestComboDetail(
    useAfter: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    useBefore: reader.readObjectList<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
  );
  return object;
}

P _contestComboDetailDeserializeProp<P>(
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

extension ContestComboDetailQueryFilter
    on QueryBuilder<ContestComboDetail, ContestComboDetail, QFilterCondition> {
  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'useAfter',
      ));
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'useAfter',
      ));
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useAfter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'useBefore',
      ));
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'useBefore',
      ));
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'useBefore',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ContestComboDetailQueryObject
    on QueryBuilder<ContestComboDetail, ContestComboDetail, QFilterCondition> {
  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useAfterElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'useAfter');
    });
  }

  QueryBuilder<ContestComboDetail, ContestComboDetail, QAfterFilterCondition>
      useBeforeElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'useBefore');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveFlavorTextSchema = Schema(
  name: r'MoveFlavorText',
  id: 5154356493278748593,
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
  estimateSize: _moveFlavorTextEstimateSize,
  serialize: _moveFlavorTextSerialize,
  deserialize: _moveFlavorTextDeserialize,
  deserializeProp: _moveFlavorTextDeserializeProp,
);

int _moveFlavorTextEstimateSize(
  MoveFlavorText object,
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

void _moveFlavorTextSerialize(
  MoveFlavorText object,
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

MoveFlavorText _moveFlavorTextDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveFlavorText(
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

P _moveFlavorTextDeserializeProp<P>(
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

extension MoveFlavorTextQueryFilter
    on QueryBuilder<MoveFlavorText, MoveFlavorText, QFilterCondition> {
  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
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

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flavorText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      flavorTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension MoveFlavorTextQueryObject
    on QueryBuilder<MoveFlavorText, MoveFlavorText, QFilterCondition> {
  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition> language(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'language');
    });
  }

  QueryBuilder<MoveFlavorText, MoveFlavorText, QAfterFilterCondition>
      versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveMetaDataSchema = Schema(
  name: r'MoveMetaData',
  id: -3544075723217370728,
  properties: {
    r'ailment': PropertySchema(
      id: 0,
      name: r'ailment',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'ailmentChance': PropertySchema(
      id: 1,
      name: r'ailmentChance',
      type: IsarType.long,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'critRate': PropertySchema(
      id: 3,
      name: r'critRate',
      type: IsarType.long,
    ),
    r'drain': PropertySchema(
      id: 4,
      name: r'drain',
      type: IsarType.long,
    ),
    r'flinchChance': PropertySchema(
      id: 5,
      name: r'flinchChance',
      type: IsarType.long,
    ),
    r'healing': PropertySchema(
      id: 6,
      name: r'healing',
      type: IsarType.long,
    ),
    r'maxHits': PropertySchema(
      id: 7,
      name: r'maxHits',
      type: IsarType.long,
    ),
    r'maxTurns': PropertySchema(
      id: 8,
      name: r'maxTurns',
      type: IsarType.long,
    ),
    r'minHits': PropertySchema(
      id: 9,
      name: r'minHits',
      type: IsarType.long,
    ),
    r'minTurns': PropertySchema(
      id: 10,
      name: r'minTurns',
      type: IsarType.long,
    ),
    r'statChance': PropertySchema(
      id: 11,
      name: r'statChance',
      type: IsarType.long,
    )
  },
  estimateSize: _moveMetaDataEstimateSize,
  serialize: _moveMetaDataSerialize,
  deserialize: _moveMetaDataDeserialize,
  deserializeProp: _moveMetaDataDeserializeProp,
);

int _moveMetaDataEstimateSize(
  MoveMetaData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ailment;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveMetaDataSerialize(
  MoveMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.ailment,
  );
  writer.writeLong(offsets[1], object.ailmentChance);
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.category,
  );
  writer.writeLong(offsets[3], object.critRate);
  writer.writeLong(offsets[4], object.drain);
  writer.writeLong(offsets[5], object.flinchChance);
  writer.writeLong(offsets[6], object.healing);
  writer.writeLong(offsets[7], object.maxHits);
  writer.writeLong(offsets[8], object.maxTurns);
  writer.writeLong(offsets[9], object.minHits);
  writer.writeLong(offsets[10], object.minTurns);
  writer.writeLong(offsets[11], object.statChance);
}

MoveMetaData _moveMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveMetaData(
    ailment: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    ailmentChance: reader.readLongOrNull(offsets[1]),
    category: reader.readObjectOrNull<NamedApiResource>(
      offsets[2],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    critRate: reader.readLongOrNull(offsets[3]),
    drain: reader.readLongOrNull(offsets[4]),
    flinchChance: reader.readLongOrNull(offsets[5]),
    healing: reader.readLongOrNull(offsets[6]),
    maxHits: reader.readLongOrNull(offsets[7]),
    maxTurns: reader.readLongOrNull(offsets[8]),
    minHits: reader.readLongOrNull(offsets[9]),
    minTurns: reader.readLongOrNull(offsets[10]),
    statChance: reader.readLongOrNull(offsets[11]),
  );
  return object;
}

P _moveMetaDataDeserializeProp<P>(
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
    case 2:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MoveMetaDataQueryFilter
    on QueryBuilder<MoveMetaData, MoveMetaData, QFilterCondition> {
  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ailment',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ailment',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ailmentChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ailmentChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ailmentChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ailmentChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ailmentChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      ailmentChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ailmentChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'critRate',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'critRate',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'critRate',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'critRate',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'critRate',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      critRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'critRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      drainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'drain',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      drainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'drain',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition> drainEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drain',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      drainGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drain',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition> drainLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drain',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition> drainBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flinchChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flinchChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flinchChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flinchChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flinchChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      flinchChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flinchChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'healing',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'healing',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healing',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healing',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healing',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      healingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxHits',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxHits',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxHitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxHits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxTurns',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxTurns',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      maxTurnsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxTurns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minHits',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minHits',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minHits',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minHitsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minHits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minTurns',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minTurns',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minTurns',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      minTurnsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minTurns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'statChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'statChance',
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statChance',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition>
      statChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MoveMetaDataQueryObject
    on QueryBuilder<MoveMetaData, MoveMetaData, QFilterCondition> {
  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition> ailment(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ailment');
    });
  }

  QueryBuilder<MoveMetaData, MoveMetaData, QAfterFilterCondition> category(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'category');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MoveStatChangeSchema = Schema(
  name: r'MoveStatChange',
  id: 4762347643824286466,
  properties: {
    r'change': PropertySchema(
      id: 0,
      name: r'change',
      type: IsarType.long,
    ),
    r'stat': PropertySchema(
      id: 1,
      name: r'stat',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _moveStatChangeEstimateSize,
  serialize: _moveStatChangeSerialize,
  deserialize: _moveStatChangeDeserialize,
  deserializeProp: _moveStatChangeDeserializeProp,
);

int _moveStatChangeEstimateSize(
  MoveStatChange object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.stat;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _moveStatChangeSerialize(
  MoveStatChange object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.change);
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.stat,
  );
}

MoveStatChange _moveStatChangeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MoveStatChange(
    change: reader.readLongOrNull(offsets[0]),
    stat: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _moveStatChangeDeserializeProp<P>(
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

extension MoveStatChangeQueryFilter
    on QueryBuilder<MoveStatChange, MoveStatChange, QFilterCondition> {
  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
      changeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'change',
      ));
    });
  }

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
      changeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'change',
      ));
    });
  }

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
      changeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'change',
        value: value,
      ));
    });
  }

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
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

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
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

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
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

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
      statIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stat',
      ));
    });
  }

  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition>
      statIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stat',
      ));
    });
  }
}

extension MoveStatChangeQueryObject
    on QueryBuilder<MoveStatChange, MoveStatChange, QFilterCondition> {
  QueryBuilder<MoveStatChange, MoveStatChange, QAfterFilterCondition> stat(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'stat');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PastMoveStatValuesSchema = Schema(
  name: r'PastMoveStatValues',
  id: -3150683059247418193,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.long,
    ),
    r'effectChance': PropertySchema(
      id: 1,
      name: r'effectChance',
      type: IsarType.long,
    ),
    r'effectEntries': PropertySchema(
      id: 2,
      name: r'effectEntries',
      type: IsarType.objectList,
      target: r'VerboseEffect',
    ),
    r'power': PropertySchema(
      id: 3,
      name: r'power',
      type: IsarType.long,
    ),
    r'pp': PropertySchema(
      id: 4,
      name: r'pp',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'versionGroup': PropertySchema(
      id: 6,
      name: r'versionGroup',
      type: IsarType.object,
      target: r'NamedApiResource',
    )
  },
  estimateSize: _pastMoveStatValuesEstimateSize,
  serialize: _pastMoveStatValuesSerialize,
  deserialize: _pastMoveStatValuesDeserialize,
  deserializeProp: _pastMoveStatValuesDeserializeProp,
);

int _pastMoveStatValuesEstimateSize(
  PastMoveStatValues object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
    final value = object.type;
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

void _pastMoveStatValuesSerialize(
  PastMoveStatValues object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accuracy);
  writer.writeLong(offsets[1], object.effectChance);
  writer.writeObjectList<VerboseEffect>(
    offsets[2],
    allOffsets,
    VerboseEffectSchema.serialize,
    object.effectEntries,
  );
  writer.writeLong(offsets[3], object.power);
  writer.writeLong(offsets[4], object.pp);
  writer.writeObject<NamedApiResource>(
    offsets[5],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.type,
  );
  writer.writeObject<NamedApiResource>(
    offsets[6],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

PastMoveStatValues _pastMoveStatValuesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PastMoveStatValues(
    accuracy: reader.readLongOrNull(offsets[0]),
    effectChance: reader.readLongOrNull(offsets[1]),
    effectEntries: reader.readObjectList<VerboseEffect>(
      offsets[2],
      VerboseEffectSchema.deserialize,
      allOffsets,
      VerboseEffect(),
    ),
    power: reader.readLongOrNull(offsets[3]),
    pp: reader.readLongOrNull(offsets[4]),
    type: reader.readObjectOrNull<NamedApiResource>(
      offsets[5],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    versionGroup: reader.readObjectOrNull<NamedApiResource>(
      offsets[6],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _pastMoveStatValuesDeserializeProp<P>(
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
    case 2:
      return (reader.readObjectList<VerboseEffect>(
        offset,
        VerboseEffectSchema.deserialize,
        allOffsets,
        VerboseEffect(),
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PastMoveStatValuesQueryFilter
    on QueryBuilder<PastMoveStatValues, PastMoveStatValues, QFilterCondition> {
  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accuracy',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accuracy',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracy',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      accuracyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectChance',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectChance',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectChance',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectChanceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectEntriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectEntriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectEntries',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
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

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'power',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'power',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'power',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      powerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'power',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pp',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pp',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pp',
        value: value,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      ppBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension PastMoveStatValuesQueryObject
    on QueryBuilder<PastMoveStatValues, PastMoveStatValues, QFilterCondition> {
  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      effectEntriesElement(FilterQuery<VerboseEffect> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'effectEntries');
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      type(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'type');
    });
  }

  QueryBuilder<PastMoveStatValues, PastMoveStatValues, QAfterFilterCondition>
      versionGroup(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      accuracy: (json['accuracy'] as num?)?.toInt(),
      effectChance: (json['effect_chance'] as num?)?.toInt(),
      pp: (json['pp'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toInt(),
      contestCombos: json['contest_combos'] == null
          ? null
          : ContestComboSets.fromJson(
              json['contest_combos'] as Map<String, dynamic>),
      contestType: json['contest_type'] == null
          ? null
          : NamedApiResource.fromJson(
              json['contest_type'] as Map<String, dynamic>),
      contestEffect: json['contest_effect'] == null
          ? null
          : ApiResource.fromJson(
              json['contest_effect'] as Map<String, dynamic>),
      damageClass: json['damage_class'] == null
          ? null
          : NamedApiResource.fromJson(
              json['damage_class'] as Map<String, dynamic>),
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => VerboseEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      effectChanges: (json['effect_changes'] as List<dynamic>?)
          ?.map((e) => AbilityEffectChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => MoveFlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: json['generation'] == null
          ? null
          : NamedApiResource.fromJson(
              json['generation'] as Map<String, dynamic>),
      machines: (json['machines'] as List<dynamic>?)
          ?.map((e) => MachineVersionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MoveMetaData.fromJson(json['meta'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      pastValues: (json['past_values'] as List<dynamic>?)
          ?.map((e) => PastMoveStatValues.fromJson(e as Map<String, dynamic>))
          .toList(),
      statChanges: (json['stat_changes'] as List<dynamic>?)
          ?.map((e) => MoveStatChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      superContestEffect: json['super_contest_effect'] == null
          ? null
          : ApiResource.fromJson(
              json['super_contest_effect'] as Map<String, dynamic>),
      target: json['target'] == null
          ? null
          : NamedApiResource.fromJson(json['target'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : NamedApiResource.fromJson(json['type'] as Map<String, dynamic>),
      learnedByPokemon: (json['learned_by_pokemon'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..isLoading = json['isLoading'] as bool?;

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accuracy': instance.accuracy,
      'effect_chance': instance.effectChance,
      'pp': instance.pp,
      'priority': instance.priority,
      'power': instance.power,
      'contest_combos': instance.contestCombos,
      'contest_type': instance.contestType,
      'contest_effect': instance.contestEffect,
      'damage_class': instance.damageClass,
      'effect_entries': instance.effectEntries,
      'effect_changes': instance.effectChanges,
      'flavor_text_entries': instance.flavorTextEntries,
      'generation': instance.generation,
      'machines': instance.machines,
      'meta': instance.meta,
      'names': instance.names,
      'past_values': instance.pastValues,
      'stat_changes': instance.statChanges,
      'super_contest_effect': instance.superContestEffect,
      'target': instance.target,
      'type': instance.type,
      'learned_by_pokemon': instance.learnedByPokemon,
      'isLoading': instance.isLoading,
    };

ContestComboSets _$ContestComboSetsFromJson(Map<String, dynamic> json) =>
    ContestComboSets(
      normal: json['normal'] == null
          ? null
          : ContestComboDetail.fromJson(json['normal'] as Map<String, dynamic>),
      superCombo: json['super'] == null
          ? null
          : ContestComboDetail.fromJson(json['super'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContestComboSetsToJson(ContestComboSets instance) =>
    <String, dynamic>{
      'normal': instance.normal,
      'super': instance.superCombo,
    };

ContestComboDetail _$ContestComboDetailFromJson(Map<String, dynamic> json) =>
    ContestComboDetail(
      useBefore: (json['use_before'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      useAfter: (json['use_after'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContestComboDetailToJson(ContestComboDetail instance) =>
    <String, dynamic>{
      'use_before': instance.useBefore,
      'use_after': instance.useAfter,
    };

MoveFlavorText _$MoveFlavorTextFromJson(Map<String, dynamic> json) =>
    MoveFlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : NamedApiResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveFlavorTextToJson(MoveFlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version_group': instance.versionGroup,
    };

MoveMetaData _$MoveMetaDataFromJson(Map<String, dynamic> json) => MoveMetaData(
      ailment: json['ailment'] == null
          ? null
          : NamedApiResource.fromJson(json['ailment'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : NamedApiResource.fromJson(json['category'] as Map<String, dynamic>),
      minHits: (json['min_hits'] as num?)?.toInt(),
      maxHits: (json['max_hits'] as num?)?.toInt(),
      minTurns: (json['min_turns'] as num?)?.toInt(),
      maxTurns: (json['max_turns'] as num?)?.toInt(),
      drain: (json['drain'] as num?)?.toInt(),
      healing: (json['healing'] as num?)?.toInt(),
      critRate: (json['crit_rate'] as num?)?.toInt(),
      ailmentChance: (json['ailment_chance'] as num?)?.toInt(),
      flinchChance: (json['flinch_chance'] as num?)?.toInt(),
      statChance: (json['stat_chance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoveMetaDataToJson(MoveMetaData instance) =>
    <String, dynamic>{
      'ailment': instance.ailment,
      'category': instance.category,
      'min_hits': instance.minHits,
      'max_hits': instance.maxHits,
      'min_turns': instance.minTurns,
      'max_turns': instance.maxTurns,
      'drain': instance.drain,
      'healing': instance.healing,
      'crit_rate': instance.critRate,
      'ailment_chance': instance.ailmentChance,
      'flinch_chance': instance.flinchChance,
      'stat_chance': instance.statChance,
    };

MoveStatChange _$MoveStatChangeFromJson(Map<String, dynamic> json) =>
    MoveStatChange(
      change: (json['change'] as num?)?.toInt(),
      stat: json['stat'] == null
          ? null
          : NamedApiResource.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveStatChangeToJson(MoveStatChange instance) =>
    <String, dynamic>{
      'change': instance.change,
      'stat': instance.stat,
    };

PastMoveStatValues _$PastMoveStatValuesFromJson(Map<String, dynamic> json) =>
    PastMoveStatValues(
      accuracy: (json['accuracy'] as num?)?.toInt(),
      effectChance: (json['effect_chance'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toInt(),
      pp: (json['pp'] as num?)?.toInt(),
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => VerboseEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] == null
          ? null
          : NamedApiResource.fromJson(json['type'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PastMoveStatValuesToJson(PastMoveStatValues instance) =>
    <String, dynamic>{
      'accuracy': instance.accuracy,
      'effect_chance': instance.effectChance,
      'power': instance.power,
      'pp': instance.pp,
      'effect_entries': instance.effectEntries,
      'type': instance.type,
      'version_group': instance.versionGroup,
    };

MoveAilment _$MoveAilmentFromJson(Map<String, dynamic> json) => MoveAilment(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveAilmentToJson(MoveAilment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'moves': instance.moves,
      'names': instance.names,
    };

MoveBattleStyle _$MoveBattleStyleFromJson(Map<String, dynamic> json) =>
    MoveBattleStyle(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveBattleStyleToJson(MoveBattleStyle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
    };

MoveCategory _$MoveCategoryFromJson(Map<String, dynamic> json) => MoveCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveCategoryToJson(MoveCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'moves': instance.moves,
      'descriptions': instance.descriptions,
    };

MoveDamageClass _$MoveDamageClassFromJson(Map<String, dynamic> json) =>
    MoveDamageClass(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveDamageClassToJson(MoveDamageClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'moves': instance.moves,
      'names': instance.names,
    };

MoveUrl _$MoveUrlFromJson(Map<String, dynamic> json) => MoveUrl(
      url: json['url'] as String,
      name: json['name'] as String,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$MoveUrlToJson(MoveUrl instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
    };

MoveLearnMethod _$MoveLearnMethodFromJson(Map<String, dynamic> json) =>
    MoveLearnMethod(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroups: (json['version_groups'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveLearnMethodToJson(MoveLearnMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'names': instance.names,
      'version_groups': instance.versionGroups,
    };

MoveTarget _$MoveTargetFromJson(Map<String, dynamic> json) => MoveTarget(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveTargetToJson(MoveTarget instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'moves': instance.moves,
      'names': instance.names,
    };
