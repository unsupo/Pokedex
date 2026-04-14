// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berries.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBerryCollection on Isar {
  IsarCollection<Berry> get berrys => this.collection();
}

const BerrySchema = CollectionSchema(
  name: r'Berry',
  id: -3366959715448180568,
  properties: {
    r'firmness': PropertySchema(
      id: 0,
      name: r'firmness',
      type: IsarType.object,
      target: r'BerryFirmness',
    ),
    r'flavors': PropertySchema(
      id: 1,
      name: r'flavors',
      type: IsarType.objectList,
      target: r'BerryFlavorMap',
    ),
    r'growthTime': PropertySchema(
      id: 2,
      name: r'growthTime',
      type: IsarType.long,
    ),
    r'item': PropertySchema(
      id: 3,
      name: r'item',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'maxHarvest': PropertySchema(
      id: 4,
      name: r'maxHarvest',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'naturalGiftPower': PropertySchema(
      id: 6,
      name: r'naturalGiftPower',
      type: IsarType.long,
    ),
    r'naturalGiftType': PropertySchema(
      id: 7,
      name: r'naturalGiftType',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'size': PropertySchema(
      id: 8,
      name: r'size',
      type: IsarType.long,
    ),
    r'smoothness': PropertySchema(
      id: 9,
      name: r'smoothness',
      type: IsarType.long,
    ),
    r'soilDryness': PropertySchema(
      id: 10,
      name: r'soilDryness',
      type: IsarType.long,
    )
  },
  estimateSize: _berryEstimateSize,
  serialize: _berrySerialize,
  deserialize: _berryDeserialize,
  deserializeProp: _berryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'BerryFirmness': BerryFirmnessSchema,
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema,
    r'BerryFlavorMap': BerryFlavorMapSchema
  },
  getId: _berryGetId,
  getLinks: _berryGetLinks,
  attach: _berryAttach,
  version: '3.1.8',
);

int _berryEstimateSize(
  Berry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.firmness;
    if (value != null) {
      bytesCount += 3 +
          BerryFirmnessSchema.estimateSize(
              value, allOffsets[BerryFirmness]!, allOffsets);
    }
  }
  {
    final list = object.flavors;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[BerryFlavorMap]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              BerryFlavorMapSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.item;
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
    final value = object.naturalGiftType;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _berrySerialize(
  Berry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<BerryFirmness>(
    offsets[0],
    allOffsets,
    BerryFirmnessSchema.serialize,
    object.firmness,
  );
  writer.writeObjectList<BerryFlavorMap>(
    offsets[1],
    allOffsets,
    BerryFlavorMapSchema.serialize,
    object.flavors,
  );
  writer.writeLong(offsets[2], object.growthTime);
  writer.writeObject<NamedApiResource>(
    offsets[3],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.item,
  );
  writer.writeLong(offsets[4], object.maxHarvest);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.naturalGiftPower);
  writer.writeObject<NamedApiResource>(
    offsets[7],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.naturalGiftType,
  );
  writer.writeLong(offsets[8], object.size);
  writer.writeLong(offsets[9], object.smoothness);
  writer.writeLong(offsets[10], object.soilDryness);
}

Berry _berryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Berry(
    firmness: reader.readObjectOrNull<BerryFirmness>(
      offsets[0],
      BerryFirmnessSchema.deserialize,
      allOffsets,
    ),
    flavors: reader.readObjectList<BerryFlavorMap>(
      offsets[1],
      BerryFlavorMapSchema.deserialize,
      allOffsets,
      BerryFlavorMap(),
    ),
    growthTime: reader.readLongOrNull(offsets[2]),
    id: id,
    item: reader.readObjectOrNull<NamedApiResource>(
      offsets[3],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    maxHarvest: reader.readLongOrNull(offsets[4]),
    name: reader.readStringOrNull(offsets[5]),
    naturalGiftPower: reader.readLongOrNull(offsets[6]),
    naturalGiftType: reader.readObjectOrNull<NamedApiResource>(
      offsets[7],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    size: reader.readLongOrNull(offsets[8]),
    smoothness: reader.readLongOrNull(offsets[9]),
    soilDryness: reader.readLongOrNull(offsets[10]),
  );
  return object;
}

P _berryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<BerryFirmness>(
        offset,
        BerryFirmnessSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<BerryFlavorMap>(
        offset,
        BerryFlavorMapSchema.deserialize,
        allOffsets,
        BerryFlavorMap(),
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
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _berryGetId(Berry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _berryGetLinks(Berry object) {
  return [];
}

void _berryAttach(IsarCollection<dynamic> col, Id id, Berry object) {}

extension BerryQueryWhereSort on QueryBuilder<Berry, Berry, QWhere> {
  QueryBuilder<Berry, Berry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BerryQueryWhere on QueryBuilder<Berry, Berry, QWhereClause> {
  QueryBuilder<Berry, Berry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Berry, Berry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterWhereClause> idBetween(
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

extension BerryQueryFilter on QueryBuilder<Berry, Berry, QFilterCondition> {
  QueryBuilder<Berry, Berry, QAfterFilterCondition> firmnessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firmness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> firmnessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firmness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavors',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavors',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'flavors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'growthTime',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'growthTime',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'growthTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'growthTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'growthTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> growthTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'growthTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> itemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'item',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxHarvest',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxHarvest',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> maxHarvestBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxHarvest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftPowerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'naturalGiftPower',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition>
      naturalGiftPowerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'naturalGiftPower',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftPowerEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'naturalGiftPower',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftPowerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'naturalGiftPower',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftPowerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'naturalGiftPower',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftPowerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'naturalGiftPower',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'naturalGiftType',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'naturalGiftType',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> sizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smoothness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smoothness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smoothness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smoothness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smoothness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> smoothnessBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smoothness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soilDryness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soilDryness',
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilDryness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soilDryness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soilDryness',
        value: value,
      ));
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> soilDrynessBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soilDryness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BerryQueryObject on QueryBuilder<Berry, Berry, QFilterCondition> {
  QueryBuilder<Berry, Berry, QAfterFilterCondition> firmness(
      FilterQuery<BerryFirmness> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'firmness');
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> flavorsElement(
      FilterQuery<BerryFlavorMap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'flavors');
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> item(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'item');
    });
  }

  QueryBuilder<Berry, Berry, QAfterFilterCondition> naturalGiftType(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'naturalGiftType');
    });
  }
}

extension BerryQueryLinks on QueryBuilder<Berry, Berry, QFilterCondition> {}

extension BerryQuerySortBy on QueryBuilder<Berry, Berry, QSortBy> {
  QueryBuilder<Berry, Berry, QAfterSortBy> sortByGrowthTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'growthTime', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByGrowthTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'growthTime', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByMaxHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHarvest', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByMaxHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHarvest', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByNaturalGiftPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalGiftPower', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortByNaturalGiftPowerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalGiftPower', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySmoothness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smoothness', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySmoothnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smoothness', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySoilDryness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilDryness', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> sortBySoilDrynessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilDryness', Sort.desc);
    });
  }
}

extension BerryQuerySortThenBy on QueryBuilder<Berry, Berry, QSortThenBy> {
  QueryBuilder<Berry, Berry, QAfterSortBy> thenByGrowthTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'growthTime', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByGrowthTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'growthTime', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByMaxHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHarvest', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByMaxHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHarvest', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByNaturalGiftPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalGiftPower', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenByNaturalGiftPowerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalGiftPower', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySmoothness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smoothness', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySmoothnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smoothness', Sort.desc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySoilDryness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilDryness', Sort.asc);
    });
  }

  QueryBuilder<Berry, Berry, QAfterSortBy> thenBySoilDrynessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilDryness', Sort.desc);
    });
  }
}

extension BerryQueryWhereDistinct on QueryBuilder<Berry, Berry, QDistinct> {
  QueryBuilder<Berry, Berry, QDistinct> distinctByGrowthTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'growthTime');
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctByMaxHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxHarvest');
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctByNaturalGiftPower() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'naturalGiftPower');
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size');
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctBySmoothness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smoothness');
    });
  }

  QueryBuilder<Berry, Berry, QDistinct> distinctBySoilDryness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soilDryness');
    });
  }
}

extension BerryQueryProperty on QueryBuilder<Berry, Berry, QQueryProperty> {
  QueryBuilder<Berry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Berry, BerryFirmness?, QQueryOperations> firmnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firmness');
    });
  }

  QueryBuilder<Berry, List<BerryFlavorMap>?, QQueryOperations>
      flavorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flavors');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> growthTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'growthTime');
    });
  }

  QueryBuilder<Berry, NamedApiResource?, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> maxHarvestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxHarvest');
    });
  }

  QueryBuilder<Berry, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> naturalGiftPowerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naturalGiftPower');
    });
  }

  QueryBuilder<Berry, NamedApiResource?, QQueryOperations>
      naturalGiftTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naturalGiftType');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> smoothnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smoothness');
    });
  }

  QueryBuilder<Berry, int?, QQueryOperations> soilDrynessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soilDryness');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBerryFlavorCollection on Isar {
  IsarCollection<BerryFlavor> get berryFlavors => this.collection();
}

const BerryFlavorSchema = CollectionSchema(
  name: r'BerryFlavor',
  id: 6426271607598788012,
  properties: {
    r'berries': PropertySchema(
      id: 0,
      name: r'berries',
      type: IsarType.objectList,
      target: r'FlavorBerryMap',
    ),
    r'contestType': PropertySchema(
      id: 1,
      name: r'contestType',
      type: IsarType.object,
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
  estimateSize: _berryFlavorEstimateSize,
  serialize: _berryFlavorSerialize,
  deserialize: _berryFlavorDeserialize,
  deserializeProp: _berryFlavorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'NamedApiResource': NamedApiResourceSchema,
    r'ApiName': ApiNameSchema,
    r'FlavorBerryMap': FlavorBerryMapSchema
  },
  getId: _berryFlavorGetId,
  getLinks: _berryFlavorGetLinks,
  attach: _berryFlavorAttach,
  version: '3.1.8',
);

int _berryFlavorEstimateSize(
  BerryFlavor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.berries;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FlavorBerryMap]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FlavorBerryMapSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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

void _berryFlavorSerialize(
  BerryFlavor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FlavorBerryMap>(
    offsets[0],
    allOffsets,
    FlavorBerryMapSchema.serialize,
    object.berries,
  );
  writer.writeObject<NamedApiResource>(
    offsets[1],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.contestType,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

BerryFlavor _berryFlavorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BerryFlavor(
    berries: reader.readObjectList<FlavorBerryMap>(
      offsets[0],
      FlavorBerryMapSchema.deserialize,
      allOffsets,
      FlavorBerryMap(),
    ),
    contestType: reader.readObjectOrNull<NamedApiResource>(
      offsets[1],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    id: id,
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

P _berryFlavorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FlavorBerryMap>(
        offset,
        FlavorBerryMapSchema.deserialize,
        allOffsets,
        FlavorBerryMap(),
      )) as P;
    case 1:
      return (reader.readObjectOrNull<NamedApiResource>(
        offset,
        NamedApiResourceSchema.deserialize,
        allOffsets,
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

Id _berryFlavorGetId(BerryFlavor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _berryFlavorGetLinks(BerryFlavor object) {
  return [];
}

void _berryFlavorAttach(
    IsarCollection<dynamic> col, Id id, BerryFlavor object) {}

extension BerryFlavorQueryWhereSort
    on QueryBuilder<BerryFlavor, BerryFlavor, QWhere> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BerryFlavorQueryWhere
    on QueryBuilder<BerryFlavor, BerryFlavor, QWhereClause> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterWhereClause> idBetween(
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

extension BerryFlavorQueryFilter
    on QueryBuilder<BerryFlavor, BerryFlavor, QFilterCondition> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'berries',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'berries',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      berriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      contestTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contestType',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      contestTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contestType',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameContains(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> namesIsEmpty() {
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
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

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition>
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

extension BerryFlavorQueryObject
    on QueryBuilder<BerryFlavor, BerryFlavor, QFilterCondition> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> berriesElement(
      FilterQuery<FlavorBerryMap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'berries');
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> contestType(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'contestType');
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterFilterCondition> namesElement(
      FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

extension BerryFlavorQueryLinks
    on QueryBuilder<BerryFlavor, BerryFlavor, QFilterCondition> {}

extension BerryFlavorQuerySortBy
    on QueryBuilder<BerryFlavor, BerryFlavor, QSortBy> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BerryFlavorQuerySortThenBy
    on QueryBuilder<BerryFlavor, BerryFlavor, QSortThenBy> {
  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BerryFlavor, BerryFlavor, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension BerryFlavorQueryWhereDistinct
    on QueryBuilder<BerryFlavor, BerryFlavor, QDistinct> {
  QueryBuilder<BerryFlavor, BerryFlavor, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension BerryFlavorQueryProperty
    on QueryBuilder<BerryFlavor, BerryFlavor, QQueryProperty> {
  QueryBuilder<BerryFlavor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BerryFlavor, List<FlavorBerryMap>?, QQueryOperations>
      berriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'berries');
    });
  }

  QueryBuilder<BerryFlavor, NamedApiResource?, QQueryOperations>
      contestTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contestType');
    });
  }

  QueryBuilder<BerryFlavor, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BerryFlavor, List<ApiName>?, QQueryOperations> namesProperty() {
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

const BerryFlavorMapSchema = Schema(
  name: r'BerryFlavorMap',
  id: -4176556093747296209,
  properties: {
    r'flavor': PropertySchema(
      id: 0,
      name: r'flavor',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'potency': PropertySchema(
      id: 1,
      name: r'potency',
      type: IsarType.long,
    )
  },
  estimateSize: _berryFlavorMapEstimateSize,
  serialize: _berryFlavorMapSerialize,
  deserialize: _berryFlavorMapDeserialize,
  deserializeProp: _berryFlavorMapDeserializeProp,
);

int _berryFlavorMapEstimateSize(
  BerryFlavorMap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.flavor;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _berryFlavorMapSerialize(
  BerryFlavorMap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.flavor,
  );
  writer.writeLong(offsets[1], object.potency);
}

BerryFlavorMap _berryFlavorMapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BerryFlavorMap(
    flavor: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    potency: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _berryFlavorMapDeserializeProp<P>(
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

extension BerryFlavorMapQueryFilter
    on QueryBuilder<BerryFlavorMap, BerryFlavorMap, QFilterCondition> {
  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      flavorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavor',
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      flavorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavor',
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'potency',
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'potency',
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition>
      potencyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'potency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BerryFlavorMapQueryObject
    on QueryBuilder<BerryFlavorMap, BerryFlavorMap, QFilterCondition> {
  QueryBuilder<BerryFlavorMap, BerryFlavorMap, QAfterFilterCondition> flavor(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'flavor');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BerryFirmnessSchema = Schema(
  name: r'BerryFirmness',
  id: -2150135555052892649,
  properties: {
    r'berries': PropertySchema(
      id: 0,
      name: r'berries',
      type: IsarType.objectList,
      target: r'NamedApiResource',
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
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
  estimateSize: _berryFirmnessEstimateSize,
  serialize: _berryFirmnessSerialize,
  deserialize: _berryFirmnessDeserialize,
  deserializeProp: _berryFirmnessDeserializeProp,
);

int _berryFirmnessEstimateSize(
  BerryFirmness object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.berries;
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

void _berryFirmnessSerialize(
  BerryFirmness object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.berries,
  );
  writer.writeLong(offsets[1], object.id);
  writer.writeString(offsets[2], object.name);
  writer.writeObjectList<ApiName>(
    offsets[3],
    allOffsets,
    ApiNameSchema.serialize,
    object.names,
  );
}

BerryFirmness _berryFirmnessDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BerryFirmness(
    berries: reader.readObjectList<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
      NamedApiResource(),
    ),
    id: reader.readLongOrNull(offsets[1]),
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

P _berryFirmnessDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
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

extension BerryFirmnessQueryFilter
    on QueryBuilder<BerryFirmness, BerryFirmness, QFilterCondition> {
  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'berries',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'berries',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'berries',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      namesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      namesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'names',
      ));
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
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

extension BerryFirmnessQueryObject
    on QueryBuilder<BerryFirmness, BerryFirmness, QFilterCondition> {
  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      berriesElement(FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'berries');
    });
  }

  QueryBuilder<BerryFirmness, BerryFirmness, QAfterFilterCondition>
      namesElement(FilterQuery<ApiName> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'names');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FlavorBerryMapSchema = Schema(
  name: r'FlavorBerryMap',
  id: 5980091204116437866,
  properties: {
    r'berry': PropertySchema(
      id: 0,
      name: r'berry',
      type: IsarType.object,
      target: r'NamedApiResource',
    ),
    r'potency': PropertySchema(
      id: 1,
      name: r'potency',
      type: IsarType.long,
    )
  },
  estimateSize: _flavorBerryMapEstimateSize,
  serialize: _flavorBerryMapSerialize,
  deserialize: _flavorBerryMapDeserialize,
  deserializeProp: _flavorBerryMapDeserializeProp,
);

int _flavorBerryMapEstimateSize(
  FlavorBerryMap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.berry;
    if (value != null) {
      bytesCount += 3 +
          NamedApiResourceSchema.estimateSize(
              value, allOffsets[NamedApiResource]!, allOffsets);
    }
  }
  return bytesCount;
}

void _flavorBerryMapSerialize(
  FlavorBerryMap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<NamedApiResource>(
    offsets[0],
    allOffsets,
    NamedApiResourceSchema.serialize,
    object.berry,
  );
  writer.writeLong(offsets[1], object.potency);
}

FlavorBerryMap _flavorBerryMapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FlavorBerryMap(
    berry: reader.readObjectOrNull<NamedApiResource>(
      offsets[0],
      NamedApiResourceSchema.deserialize,
      allOffsets,
    ),
    potency: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _flavorBerryMapDeserializeProp<P>(
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

extension FlavorBerryMapQueryFilter
    on QueryBuilder<FlavorBerryMap, FlavorBerryMap, QFilterCondition> {
  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      berryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'berry',
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      berryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'berry',
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'potency',
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'potency',
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'potency',
        value: value,
      ));
    });
  }

  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition>
      potencyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'potency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FlavorBerryMapQueryObject
    on QueryBuilder<FlavorBerryMap, FlavorBerryMap, QFilterCondition> {
  QueryBuilder<FlavorBerryMap, FlavorBerryMap, QAfterFilterCondition> berry(
      FilterQuery<NamedApiResource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'berry');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berry _$BerryFromJson(Map<String, dynamic> json) => Berry(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      growthTime: (json['growth_time'] as num?)?.toInt(),
      maxHarvest: (json['max_harvest'] as num?)?.toInt(),
      naturalGiftPower: (json['natural_gift_power'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      smoothness: (json['smoothness'] as num?)?.toInt(),
      soilDryness: (json['soil_dryness'] as num?)?.toInt(),
      firmness: json['firmness'] == null
          ? null
          : BerryFirmness.fromJson(json['firmness'] as Map<String, dynamic>),
      flavors: (json['flavors'] as List<dynamic>?)
          ?.map((e) => BerryFlavorMap.fromJson(e as Map<String, dynamic>))
          .toList(),
      item: json['item'] == null
          ? null
          : NamedApiResource.fromJson(json['item'] as Map<String, dynamic>),
      naturalGiftType: json['natural_gift_type'] == null
          ? null
          : NamedApiResource.fromJson(
              json['natural_gift_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BerryToJson(Berry instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'growth_time': instance.growthTime,
      'max_harvest': instance.maxHarvest,
      'natural_gift_power': instance.naturalGiftPower,
      'size': instance.size,
      'smoothness': instance.smoothness,
      'soil_dryness': instance.soilDryness,
      'firmness': instance.firmness,
      'flavors': instance.flavors,
      'item': instance.item,
      'natural_gift_type': instance.naturalGiftType,
    };

BerryFlavorMap _$BerryFlavorMapFromJson(Map<String, dynamic> json) =>
    BerryFlavorMap(
      potency: (json['potency'] as num?)?.toInt(),
      flavor: json['flavor'] == null
          ? null
          : NamedApiResource.fromJson(json['flavor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BerryFlavorMapToJson(BerryFlavorMap instance) =>
    <String, dynamic>{
      'potency': instance.potency,
      'flavor': instance.flavor,
    };

BerryFirmness _$BerryFirmnessFromJson(Map<String, dynamic> json) =>
    BerryFirmness(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      berries: (json['berries'] as List<dynamic>?)
          ?.map((e) => NamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BerryFirmnessToJson(BerryFirmness instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'berries': instance.berries,
      'names': instance.names,
    };

BerryFlavor _$BerryFlavorFromJson(Map<String, dynamic> json) => BerryFlavor(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      contestType: json['contest_type'] == null
          ? null
          : NamedApiResource.fromJson(
              json['contest_type'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>?)
          ?.map((e) => ApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      berries: (json['berries'] as List<dynamic>?)
          ?.map((e) => FlavorBerryMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BerryFlavorToJson(BerryFlavor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contest_type': instance.contestType,
      'names': instance.names,
      'berries': instance.berries,
    };

FlavorBerryMap _$FlavorBerryMapFromJson(Map<String, dynamic> json) =>
    FlavorBerryMap(
      potency: (json['potency'] as num?)?.toInt(),
      berry: json['berry'] == null
          ? null
          : NamedApiResource.fromJson(json['berry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorBerryMapToJson(FlavorBerryMap instance) =>
    <String, dynamic>{
      'potency': instance.potency,
      'berry': instance.berry,
    };
