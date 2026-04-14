// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machines.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMachineCollection on Isar {
  IsarCollection<Machine> get machines => this.collection();
}

const MachineSchema = CollectionSchema(
  name: r'Machine',
  id: 628152646586716197,
  properties: {
    r'item': PropertySchema(
      id: 0,
      name: r'item',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'move': PropertySchema(
      id: 1,
      name: r'move',
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
  estimateSize: _machineEstimateSize,
  serialize: _machineSerialize,
  deserialize: _machineDeserialize,
  deserializeProp: _machineDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NamedApiResource': NamedApiResourceSchema},
  getId: _machineGetId,
  getLinks: _machineGetLinks,
  attach: _machineAttach,
  version: '3.1.8',
);

int _machineEstimateSize(
  Machine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.item;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  {
    final value = object.move;
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

void _machineSerialize(
  Machine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.item,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.move,
  );
  writer.writeObject<NamedApiResource>(
    offsets[2],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.versionGroup,
  );
}

Machine _machineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Machine(
    id: id,
    item: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    move: reader.readObjectOrNull<NamedApiResource>(
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

P _machineDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _machineGetId(Machine object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _machineGetLinks(Machine object) {
  return [];
}

void _machineAttach(IsarCollection<dynamic> col, Id id, Machine object) {}

extension MachineQueryWhereSort on QueryBuilder<Machine, Machine, QWhere> {
  QueryBuilder<Machine, Machine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MachineQueryWhere on QueryBuilder<Machine, Machine, QWhereClause> {
  QueryBuilder<Machine, Machine, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Machine, Machine, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Machine, Machine, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Machine, Machine, QAfterWhereClause> idBetween(
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

extension MachineQueryFilter
    on QueryBuilder<Machine, Machine, QFilterCondition> {
  QueryBuilder<Machine, Machine, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Machine, Machine, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Machine, Machine, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Machine, Machine, QAfterFilterCondition> itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> moveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> moveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'move',
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> versionGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'versionGroup',
      ));
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition>
      versionGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'versionGroup',
      ));
    });
  }
}

extension MachineQueryObject
    on QueryBuilder<Machine, Machine, QFilterCondition> {
  QueryBuilder<Machine, Machine, QAfterFilterCondition> item(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> move(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'move');
    });
  }

  QueryBuilder<Machine, Machine, QAfterFilterCondition> versionGroup(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'versionGroup');
    });
  }
}

extension MachineQueryLinks
    on QueryBuilder<Machine, Machine, QFilterCondition> {}

extension MachineQuerySortBy on QueryBuilder<Machine, Machine, QSortBy> {}

extension MachineQuerySortThenBy
    on QueryBuilder<Machine, Machine, QSortThenBy> {
  QueryBuilder<Machine, Machine, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Machine, Machine, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension MachineQueryWhereDistinct
    on QueryBuilder<Machine, Machine, QDistinct> {}

extension MachineQueryProperty
    on QueryBuilder<Machine, Machine, QQueryProperty> {
  QueryBuilder<Machine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Machine, NamedApiResource?, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<Machine, NamedApiResource?, QQueryOperations> moveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'move');
    });
  }

  QueryBuilder<Machine, NamedApiResource?, QQueryOperations>
      versionGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionGroup');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Machine _$MachineFromJson(Map<String, dynamic> json) => Machine(
      id: (json['id'] as num).toInt(),
      item: json['item'] == null
          ? null
          : NamedApiResource.fromJson(json['item'] as Map<String, dynamic>),
      move: json['move'] == null
          ? null
          : NamedApiResource.fromJson(json['move'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedApiResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MachineToJson(Machine instance) => <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'move': instance.move,
      'version_group': instance.versionGroup,
    };
