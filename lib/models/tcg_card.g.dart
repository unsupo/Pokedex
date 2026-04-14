// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tcg_card.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTcgCardCollection on Isar {
  IsarCollection<TcgCard> get tcgCards => this.collection();
}

const TcgCardSchema = CollectionSchema(
  name: r'TcgCard',
  id: -6660351169357255681,
  properties: {
    r'abilities': PropertySchema(
      id: 0,
      name: r'abilities',
      type: IsarType.stringList,
    ),
    r'artist': PropertySchema(
      id: 1,
      name: r'artist',
      type: IsarType.string,
    ),
    r'attacks': PropertySchema(
      id: 2,
      name: r'attacks',
      type: IsarType.objectList,
      target: r'Attack',
    ),
    r'cardmarket': PropertySchema(
      id: 3,
      name: r'cardmarket',
      type: IsarType.object,
      target: r'CardMarket',
    ),
    r'convertedRetreatCost': PropertySchema(
      id: 4,
      name: r'convertedRetreatCost',
      type: IsarType.long,
    ),
    r'evolvesTo': PropertySchema(
      id: 5,
      name: r'evolvesTo',
      type: IsarType.stringList,
    ),
    r'flavorText': PropertySchema(
      id: 6,
      name: r'flavorText',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 7,
      name: r'id',
      type: IsarType.string,
    ),
    r'images': PropertySchema(
      id: 8,
      name: r'images',
      type: IsarType.object,
      target: r'CardImages',
    ),
    r'legalities': PropertySchema(
      id: 9,
      name: r'legalities',
      type: IsarType.object,
      target: r'Legalities',
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'nationalPokedexNumbers': PropertySchema(
      id: 11,
      name: r'nationalPokedexNumbers',
      type: IsarType.longList,
    ),
    r'number': PropertySchema(
      id: 12,
      name: r'number',
      type: IsarType.string,
    ),
    r'rarity': PropertySchema(
      id: 13,
      name: r'rarity',
      type: IsarType.string,
    ),
    r'resistances': PropertySchema(
      id: 14,
      name: r'resistances',
      type: IsarType.objectList,
      target: r'WeaknessResistance',
    ),
    r'retreatCost': PropertySchema(
      id: 15,
      name: r'retreatCost',
      type: IsarType.stringList,
    ),
    r'rules': PropertySchema(
      id: 16,
      name: r'rules',
      type: IsarType.stringList,
    ),
    r'set': PropertySchema(
      id: 17,
      name: r'set',
      type: IsarType.object,
      target: r'SetData',
    ),
    r'subtypes': PropertySchema(
      id: 18,
      name: r'subtypes',
      type: IsarType.stringList,
    ),
    r'supertype': PropertySchema(
      id: 19,
      name: r'supertype',
      type: IsarType.string,
    ),
    r'tcgplayer': PropertySchema(
      id: 20,
      name: r'tcgplayer',
      type: IsarType.object,
      target: r'Tcgplayer',
    ),
    r'types': PropertySchema(
      id: 21,
      name: r'types',
      type: IsarType.stringList,
    ),
    r'weaknesses': PropertySchema(
      id: 22,
      name: r'weaknesses',
      type: IsarType.objectList,
      target: r'WeaknessResistance',
    )
  },
  estimateSize: _tcgCardEstimateSize,
  serialize: _tcgCardSerialize,
  deserialize: _tcgCardDeserialize,
  deserializeProp: _tcgCardDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Attack': AttackSchema,
    r'WeaknessResistance': WeaknessResistanceSchema,
    r'SetData': SetDataSchema,
    r'Legalities': LegalitiesSchema,
    r'CardImages': CardImagesSchema,
    r'Tcgplayer': TcgplayerSchema,
    r'PriceData': PriceDataSchema,
    r'CardMarket': CardMarketSchema
  },
  getId: _tcgCardGetId,
  getLinks: _tcgCardGetLinks,
  attach: _tcgCardAttach,
  version: '3.1.8',
);

int _tcgCardEstimateSize(
  TcgCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.abilities;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.artist;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.attacks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Attack]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += AttackSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.cardmarket;
    if (value != null) {
      bytesCount += 3 +
          CardMarketSchema.estimateSize(
              value, allOffsets[CardMarket]!, allOffsets);
    }
  }
  {
    final list = object.evolvesTo;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.flavorText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.images;
    if (value != null) {
      bytesCount += 3 +
          CardImagesSchema.estimateSize(
              value, allOffsets[CardImages]!, allOffsets);
    }
  }
  {
    final value = object.legalities;
    if (value != null) {
      bytesCount += 3 +
          LegalitiesSchema.estimateSize(
              value, allOffsets[Legalities]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nationalPokedexNumbers;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.number;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rarity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.resistances;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WeaknessResistance]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WeaknessResistanceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.retreatCost;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.rules;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.set;
    if (value != null) {
      bytesCount += 3 +
          SetDataSchema.estimateSize(value, allOffsets[SetData]!, allOffsets);
    }
  }
  {
    final list = object.subtypes;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.supertype;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tcgplayer;
    if (value != null) {
      bytesCount += 3 +
          TcgplayerSchema.estimateSize(
              value, allOffsets[Tcgplayer]!, allOffsets);
    }
  }
  {
    final list = object.types;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.weaknesses;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WeaknessResistance]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WeaknessResistanceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _tcgCardSerialize(
  TcgCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.abilities);
  writer.writeString(offsets[1], object.artist);
  writer.writeObjectList<Attack>(
    offsets[2],
    allOffsets,
    AttackSchema.serialize,
    object.attacks,
  );
  writer.writeObject<CardMarket>(
    offsets[3],
    allOffsets,
    CardMarketSchema.serialize,
    object.cardmarket,
  );
  writer.writeLong(offsets[4], object.convertedRetreatCost);
  writer.writeStringList(offsets[5], object.evolvesTo);
  writer.writeString(offsets[6], object.flavorText);
  writer.writeString(offsets[7], object.id);
  writer.writeObject<CardImages>(
    offsets[8],
    allOffsets,
    CardImagesSchema.serialize,
    object.images,
  );
  writer.writeObject<Legalities>(
    offsets[9],
    allOffsets,
    LegalitiesSchema.serialize,
    object.legalities,
  );
  writer.writeString(offsets[10], object.name);
  writer.writeLongList(offsets[11], object.nationalPokedexNumbers);
  writer.writeString(offsets[12], object.number);
  writer.writeString(offsets[13], object.rarity);
  writer.writeObjectList<WeaknessResistance>(
    offsets[14],
    allOffsets,
    WeaknessResistanceSchema.serialize,
    object.resistances,
  );
  writer.writeStringList(offsets[15], object.retreatCost);
  writer.writeStringList(offsets[16], object.rules);
  writer.writeObject<SetData>(
    offsets[17],
    allOffsets,
    SetDataSchema.serialize,
    object.set,
  );
  writer.writeStringList(offsets[18], object.subtypes);
  writer.writeString(offsets[19], object.supertype);
  writer.writeObject<Tcgplayer>(
    offsets[20],
    allOffsets,
    TcgplayerSchema.serialize,
    object.tcgplayer,
  );
  writer.writeStringList(offsets[21], object.types);
  writer.writeObjectList<WeaknessResistance>(
    offsets[22],
    allOffsets,
    WeaknessResistanceSchema.serialize,
    object.weaknesses,
  );
}

TcgCard _tcgCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TcgCard(
    abilities: reader.readStringList(offsets[0]),
    artist: reader.readStringOrNull(offsets[1]),
    attacks: reader.readObjectList<Attack>(
      offsets[2],
      AttackSchema.deserialize,
      allOffsets,
      Attack(),
    ),
    cardmarket: reader.readObjectOrNull<CardMarket>(
      offsets[3],
      CardMarketSchema.deserialize,
      allOffsets,
    ),
    convertedRetreatCost: reader.readLongOrNull(offsets[4]),
    evolvesTo: reader.readStringList(offsets[5]),
    flavorText: reader.readStringOrNull(offsets[6]),
    id: reader.readStringOrNull(offsets[7]),
    images: reader.readObjectOrNull<CardImages>(
      offsets[8],
      CardImagesSchema.deserialize,
      allOffsets,
    ),
    legalities: reader.readObjectOrNull<Legalities>(
      offsets[9],
      LegalitiesSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[10]),
    nationalPokedexNumbers: reader.readLongList(offsets[11]),
    number: reader.readStringOrNull(offsets[12]),
    rarity: reader.readStringOrNull(offsets[13]),
    resistances: reader.readObjectList<WeaknessResistance>(
      offsets[14],
      WeaknessResistanceSchema.deserialize,
      allOffsets,
      WeaknessResistance(),
    ),
    retreatCost: reader.readStringList(offsets[15]),
    rules: reader.readStringList(offsets[16]),
    set: reader.readObjectOrNull<SetData>(
      offsets[17],
      SetDataSchema.deserialize,
      allOffsets,
    ),
    subtypes: reader.readStringList(offsets[18]),
    supertype: reader.readStringOrNull(offsets[19]),
    tcgplayer: reader.readObjectOrNull<Tcgplayer>(
      offsets[20],
      TcgplayerSchema.deserialize,
      allOffsets,
    ),
    types: reader.readStringList(offsets[21]),
    weaknesses: reader.readObjectList<WeaknessResistance>(
      offsets[22],
      WeaknessResistanceSchema.deserialize,
      allOffsets,
      WeaknessResistance(),
    ),
  );
  return object;
}

P _tcgCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<Attack>(
        offset,
        AttackSchema.deserialize,
        allOffsets,
        Attack(),
      )) as P;
    case 3:
      return (reader.readObjectOrNull<CardMarket>(
        offset,
        CardMarketSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readObjectOrNull<CardImages>(
        offset,
        CardImagesSchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readObjectOrNull<Legalities>(
        offset,
        LegalitiesSchema.deserialize,
        allOffsets,
      )) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongList(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readObjectList<WeaknessResistance>(
        offset,
        WeaknessResistanceSchema.deserialize,
        allOffsets,
        WeaknessResistance(),
      )) as P;
    case 15:
      return (reader.readStringList(offset)) as P;
    case 16:
      return (reader.readStringList(offset)) as P;
    case 17:
      return (reader.readObjectOrNull<SetData>(
        offset,
        SetDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 18:
      return (reader.readStringList(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readObjectOrNull<Tcgplayer>(
        offset,
        TcgplayerSchema.deserialize,
        allOffsets,
      )) as P;
    case 21:
      return (reader.readStringList(offset)) as P;
    case 22:
      return (reader.readObjectList<WeaknessResistance>(
        offset,
        WeaknessResistanceSchema.deserialize,
        allOffsets,
        WeaknessResistance(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tcgCardGetId(TcgCard object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tcgCardGetLinks(TcgCard object) {
  return [];
}

void _tcgCardAttach(IsarCollection<dynamic> col, Id id, TcgCard object) {}

extension TcgCardQueryWhereSort on QueryBuilder<TcgCard, TcgCard, QWhere> {
  QueryBuilder<TcgCard, TcgCard, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TcgCardQueryWhere on QueryBuilder<TcgCard, TcgCard, QWhereClause> {
  QueryBuilder<TcgCard, TcgCard, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<TcgCard, TcgCard, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterWhereClause> isarIdBetween(
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
}

extension TcgCardQueryFilter
    on QueryBuilder<TcgCard, TcgCard, QFilterCondition> {
  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abilities',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abilities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abilities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abilities',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abilities',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      abilitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> abilitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'artist',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'artist',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'artist',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'artist',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'artist',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attacks',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attacks',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      attacksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attacks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> cardmarketIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardmarket',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> cardmarketIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardmarket',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'convertedRetreatCost',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'convertedRetreatCost',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedRetreatCost',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convertedRetreatCost',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convertedRetreatCost',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      convertedRetreatCostBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convertedRetreatCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evolvesTo',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evolvesTo',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evolvesTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'evolvesTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'evolvesTo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evolvesTo',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'evolvesTo',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      evolvesToLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> evolvesToLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'evolvesTo',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flavorText',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextEqualTo(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextGreaterThan(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextLessThan(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextBetween(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextStartsWith(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextEndsWith(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flavorText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextMatches(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> flavorTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flavorText',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> imagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> imagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> legalitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'legalities',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> legalitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'legalities',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameContains(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationalPokedexNumbers',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationalPokedexNumbers',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalPokedexNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalPokedexNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalPokedexNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalPokedexNumbers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      nationalPokedexNumbersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nationalPokedexNumbers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'number',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'number',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'number',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> numberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'number',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rarity',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rarity',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rarity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rarityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> resistancesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resistances',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> resistancesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resistances',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      resistancesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> resistancesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      resistancesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      resistancesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      resistancesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      resistancesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'resistances',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> retreatCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'retreatCost',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> retreatCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'retreatCost',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retreatCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'retreatCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'retreatCost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retreatCost',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'retreatCost',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> retreatCostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      retreatCostLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'retreatCost',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rules',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rules',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rules',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rules',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rules',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rules',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      rulesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rules',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> rulesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'rules',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> setIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'set',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> setIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'set',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtypes',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtypes',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      subtypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      subtypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      subtypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtypes',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      subtypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtypes',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      subtypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> subtypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supertype',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supertype',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supertype',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supertype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supertype',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supertype',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> supertypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supertype',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> tcgplayerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tcgplayer',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> tcgplayerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tcgplayer',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'types',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'types',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'types',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'types',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'types',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      typesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'types',
        value: '',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> typesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'types',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weaknesses',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weaknesses',
      ));
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      weaknessesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition>
      weaknessesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weaknesses',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TcgCardQueryObject
    on QueryBuilder<TcgCard, TcgCard, QFilterCondition> {
  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> attacksElement(
      FilterQuery<Attack> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'attacks');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> cardmarket(
      FilterQuery<CardMarket> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'cardmarket');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> images(
      FilterQuery<CardImages> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'images');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> legalities(
      FilterQuery<Legalities> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'legalities');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> resistancesElement(
      FilterQuery<WeaknessResistance> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'resistances');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> set(
      FilterQuery<SetData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'set');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> tcgplayer(
      FilterQuery<Tcgplayer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tcgplayer');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterFilterCondition> weaknessesElement(
      FilterQuery<WeaknessResistance> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weaknesses');
    });
  }
}

extension TcgCardQueryLinks
    on QueryBuilder<TcgCard, TcgCard, QFilterCondition> {}

extension TcgCardQuerySortBy on QueryBuilder<TcgCard, TcgCard, QSortBy> {
  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByConvertedRetreatCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedRetreatCost', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy>
      sortByConvertedRetreatCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedRetreatCost', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByFlavorText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flavorText', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByFlavorTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flavorText', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortBySupertype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supertype', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> sortBySupertypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supertype', Sort.desc);
    });
  }
}

extension TcgCardQuerySortThenBy
    on QueryBuilder<TcgCard, TcgCard, QSortThenBy> {
  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByConvertedRetreatCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedRetreatCost', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy>
      thenByConvertedRetreatCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedRetreatCost', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByFlavorText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flavorText', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByFlavorTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flavorText', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenBySupertype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supertype', Sort.asc);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QAfterSortBy> thenBySupertypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supertype', Sort.desc);
    });
  }
}

extension TcgCardQueryWhereDistinct
    on QueryBuilder<TcgCard, TcgCard, QDistinct> {
  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByAbilities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abilities');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByArtist(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByConvertedRetreatCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convertedRetreatCost');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByEvolvesTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evolvesTo');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByFlavorText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flavorText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByNationalPokedexNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalPokedexNumbers');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByRarity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rarity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByRetreatCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retreatCost');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByRules() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rules');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctBySubtypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtypes');
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctBySupertype(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supertype', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TcgCard, TcgCard, QDistinct> distinctByTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'types');
    });
  }
}

extension TcgCardQueryProperty
    on QueryBuilder<TcgCard, TcgCard, QQueryProperty> {
  QueryBuilder<TcgCard, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> abilitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abilities');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<TcgCard, List<Attack>?, QQueryOperations> attacksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attacks');
    });
  }

  QueryBuilder<TcgCard, CardMarket?, QQueryOperations> cardmarketProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardmarket');
    });
  }

  QueryBuilder<TcgCard, int?, QQueryOperations> convertedRetreatCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convertedRetreatCost');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> evolvesToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evolvesTo');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> flavorTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flavorText');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TcgCard, CardImages?, QQueryOperations> imagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'images');
    });
  }

  QueryBuilder<TcgCard, Legalities?, QQueryOperations> legalitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'legalities');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TcgCard, List<int>?, QQueryOperations>
      nationalPokedexNumbersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalPokedexNumbers');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> rarityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rarity');
    });
  }

  QueryBuilder<TcgCard, List<WeaknessResistance>?, QQueryOperations>
      resistancesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resistances');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> retreatCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retreatCost');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> rulesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rules');
    });
  }

  QueryBuilder<TcgCard, SetData?, QQueryOperations> setProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'set');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> subtypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtypes');
    });
  }

  QueryBuilder<TcgCard, String?, QQueryOperations> supertypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supertype');
    });
  }

  QueryBuilder<TcgCard, Tcgplayer?, QQueryOperations> tcgplayerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tcgplayer');
    });
  }

  QueryBuilder<TcgCard, List<String>?, QQueryOperations> typesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'types');
    });
  }

  QueryBuilder<TcgCard, List<WeaknessResistance>?, QQueryOperations>
      weaknessesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weaknesses');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AttackSchema = Schema(
  name: r'Attack',
  id: 5329734663086653281,
  properties: {
    r'convertedEnergyCost': PropertySchema(
      id: 0,
      name: r'convertedEnergyCost',
      type: IsarType.long,
    ),
    r'cost': PropertySchema(
      id: 1,
      name: r'cost',
      type: IsarType.stringList,
    ),
    r'damage': PropertySchema(
      id: 2,
      name: r'damage',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 4,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _attackEstimateSize,
  serialize: _attackSerialize,
  deserialize: _attackDeserialize,
  deserializeProp: _attackDeserializeProp,
);

int _attackEstimateSize(
  Attack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.cost;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.damage;
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
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _attackSerialize(
  Attack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.convertedEnergyCost);
  writer.writeStringList(offsets[1], object.cost);
  writer.writeString(offsets[2], object.damage);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.text);
}

Attack _attackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Attack(
    convertedEnergyCost: reader.readLongOrNull(offsets[0]),
    cost: reader.readStringList(offsets[1]),
    damage: reader.readStringOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
    text: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _attackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AttackQueryFilter on QueryBuilder<Attack, Attack, QFilterCondition> {
  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'convertedEnergyCost',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'convertedEnergyCost',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedEnergyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convertedEnergyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convertedEnergyCost',
        value: value,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition>
      convertedEnergyCostBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convertedEnergyCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cost',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cost',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cost',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> costLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cost',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'damage',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'damage',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'damage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'damage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'damage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'damage',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> damageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'damage',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textEqualTo(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textGreaterThan(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textLessThan(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textBetween(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textStartsWith(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textEndsWith(
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

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<Attack, Attack, QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension AttackQueryObject on QueryBuilder<Attack, Attack, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WeaknessResistanceSchema = Schema(
  name: r'WeaknessResistance',
  id: 4496678657215778343,
  properties: {
    r'type': PropertySchema(
      id: 0,
      name: r'type',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _weaknessResistanceEstimateSize,
  serialize: _weaknessResistanceSerialize,
  deserialize: _weaknessResistanceDeserialize,
  deserializeProp: _weaknessResistanceDeserializeProp,
);

int _weaknessResistanceEstimateSize(
  WeaknessResistance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weaknessResistanceSerialize(
  WeaknessResistance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.type);
  writer.writeString(offsets[1], object.value);
}

WeaknessResistance _weaknessResistanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeaknessResistance(
    type: reader.readStringOrNull(offsets[0]),
    value: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _weaknessResistanceDeserializeProp<P>(
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

extension WeaknessResistanceQueryFilter
    on QueryBuilder<WeaknessResistance, WeaknessResistance, QFilterCondition> {
  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<WeaknessResistance, WeaknessResistance, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension WeaknessResistanceQueryObject
    on QueryBuilder<WeaknessResistance, WeaknessResistance, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SetDataSchema = Schema(
  name: r'SetData',
  id: -5535110362859644738,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'images': PropertySchema(
      id: 1,
      name: r'images',
      type: IsarType.object,
      target: r'CardImages',
    ),
    r'legalities': PropertySchema(
      id: 2,
      name: r'legalities',
      type: IsarType.object,
      target: r'Legalities',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'printedTotal': PropertySchema(
      id: 4,
      name: r'printedTotal',
      type: IsarType.long,
    ),
    r'ptcgoCode': PropertySchema(
      id: 5,
      name: r'ptcgoCode',
      type: IsarType.string,
    ),
    r'releaseDate': PropertySchema(
      id: 6,
      name: r'releaseDate',
      type: IsarType.string,
    ),
    r'series': PropertySchema(
      id: 7,
      name: r'series',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 8,
      name: r'total',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.string,
    )
  },
  estimateSize: _setDataEstimateSize,
  serialize: _setDataSerialize,
  deserialize: _setDataDeserialize,
  deserializeProp: _setDataDeserializeProp,
);

int _setDataEstimateSize(
  SetData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.images;
    if (value != null) {
      bytesCount += 3 +
          CardImagesSchema.estimateSize(
              value, allOffsets[CardImages]!, allOffsets);
    }
  }
  {
    final value = object.legalities;
    if (value != null) {
      bytesCount += 3 +
          LegalitiesSchema.estimateSize(
              value, allOffsets[Legalities]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ptcgoCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.releaseDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.series;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updatedAt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _setDataSerialize(
  SetData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeObject<CardImages>(
    offsets[1],
    allOffsets,
    CardImagesSchema.serialize,
    object.images,
  );
  writer.writeObject<Legalities>(
    offsets[2],
    allOffsets,
    LegalitiesSchema.serialize,
    object.legalities,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.printedTotal);
  writer.writeString(offsets[5], object.ptcgoCode);
  writer.writeString(offsets[6], object.releaseDate);
  writer.writeString(offsets[7], object.series);
  writer.writeLong(offsets[8], object.total);
  writer.writeString(offsets[9], object.updatedAt);
}

SetData _setDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SetData(
    id: reader.readStringOrNull(offsets[0]),
    images: reader.readObjectOrNull<CardImages>(
      offsets[1],
      CardImagesSchema.deserialize,
      allOffsets,
    ),
    legalities: reader.readObjectOrNull<Legalities>(
      offsets[2],
      LegalitiesSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[3]),
    printedTotal: reader.readLongOrNull(offsets[4]),
    ptcgoCode: reader.readStringOrNull(offsets[5]),
    releaseDate: reader.readStringOrNull(offsets[6]),
    series: reader.readStringOrNull(offsets[7]),
    total: reader.readLongOrNull(offsets[8]),
    updatedAt: reader.readStringOrNull(offsets[9]),
  );
  return object;
}

P _setDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<CardImages>(
        offset,
        CardImagesSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Legalities>(
        offset,
        LegalitiesSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SetDataQueryFilter
    on QueryBuilder<SetData, SetData, QFilterCondition> {
  QueryBuilder<SetData, SetData, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> imagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> imagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'images',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> legalitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'legalities',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> legalitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'legalities',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameContains(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> printedTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'printedTotal',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition>
      printedTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'printedTotal',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> printedTotalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'printedTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> printedTotalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'printedTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> printedTotalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'printedTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> printedTotalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'printedTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ptcgoCode',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ptcgoCode',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ptcgoCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ptcgoCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ptcgoCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ptcgoCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> ptcgoCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ptcgoCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'releaseDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'releaseDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> releaseDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition>
      releaseDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'releaseDate',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'series',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'series',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'series',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'series',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'series',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'series',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> seriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'series',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> totalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedAt',
        value: '',
      ));
    });
  }
}

extension SetDataQueryObject
    on QueryBuilder<SetData, SetData, QFilterCondition> {
  QueryBuilder<SetData, SetData, QAfterFilterCondition> images(
      FilterQuery<CardImages> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'images');
    });
  }

  QueryBuilder<SetData, SetData, QAfterFilterCondition> legalities(
      FilterQuery<Legalities> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'legalities');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LegalitiesSchema = Schema(
  name: r'Legalities',
  id: -6106696083963205229,
  properties: {
    r'expanded': PropertySchema(
      id: 0,
      name: r'expanded',
      type: IsarType.string,
    ),
    r'standard': PropertySchema(
      id: 1,
      name: r'standard',
      type: IsarType.string,
    ),
    r'unlimited': PropertySchema(
      id: 2,
      name: r'unlimited',
      type: IsarType.string,
    )
  },
  estimateSize: _legalitiesEstimateSize,
  serialize: _legalitiesSerialize,
  deserialize: _legalitiesDeserialize,
  deserializeProp: _legalitiesDeserializeProp,
);

int _legalitiesEstimateSize(
  Legalities object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.expanded;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.standard;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlimited;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _legalitiesSerialize(
  Legalities object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.expanded);
  writer.writeString(offsets[1], object.standard);
  writer.writeString(offsets[2], object.unlimited);
}

Legalities _legalitiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Legalities(
    expanded: reader.readStringOrNull(offsets[0]),
    standard: reader.readStringOrNull(offsets[1]),
    unlimited: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _legalitiesDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LegalitiesQueryFilter
    on QueryBuilder<Legalities, Legalities, QFilterCondition> {
  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expanded',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      expandedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expanded',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      expandedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expanded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      expandedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expanded',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> expandedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expanded',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      expandedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expanded',
        value: '',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      expandedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expanded',
        value: '',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'standard',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      standardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'standard',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      standardGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'standard',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      standardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'standard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> standardMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'standard',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      standardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'standard',
        value: '',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      standardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'standard',
        value: '',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlimited',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlimited',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlimited',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlimited',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition> unlimitedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlimited',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlimited',
        value: '',
      ));
    });
  }

  QueryBuilder<Legalities, Legalities, QAfterFilterCondition>
      unlimitedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlimited',
        value: '',
      ));
    });
  }
}

extension LegalitiesQueryObject
    on QueryBuilder<Legalities, Legalities, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CardImagesSchema = Schema(
  name: r'CardImages',
  id: 9158348269540457082,
  properties: {
    r'large': PropertySchema(
      id: 0,
      name: r'large',
      type: IsarType.string,
    ),
    r'logo': PropertySchema(
      id: 1,
      name: r'logo',
      type: IsarType.string,
    ),
    r'small': PropertySchema(
      id: 2,
      name: r'small',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 3,
      name: r'symbol',
      type: IsarType.string,
    )
  },
  estimateSize: _cardImagesEstimateSize,
  serialize: _cardImagesSerialize,
  deserialize: _cardImagesDeserialize,
  deserializeProp: _cardImagesDeserializeProp,
);

int _cardImagesEstimateSize(
  CardImages object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.large;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.small;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.symbol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cardImagesSerialize(
  CardImages object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.large);
  writer.writeString(offsets[1], object.logo);
  writer.writeString(offsets[2], object.small);
  writer.writeString(offsets[3], object.symbol);
}

CardImages _cardImagesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CardImages(
    large: reader.readStringOrNull(offsets[0]),
    logo: reader.readStringOrNull(offsets[1]),
    small: reader.readStringOrNull(offsets[2]),
    symbol: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _cardImagesDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CardImagesQueryFilter
    on QueryBuilder<CardImages, CardImages, QFilterCondition> {
  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'large',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'large',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> largeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition>
      largeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'small',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'small',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'small',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'small',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'small',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> smallIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'small',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition>
      smallIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'small',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition>
      symbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition> symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<CardImages, CardImages, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }
}

extension CardImagesQueryObject
    on QueryBuilder<CardImages, CardImages, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TcgplayerSchema = Schema(
  name: r'Tcgplayer',
  id: 4023666489979737885,
  properties: {
    r'prices': PropertySchema(
      id: 0,
      name: r'prices',
      type: IsarType.object,
      target: r'PriceData',
    ),
    r'updatedAt': PropertySchema(
      id: 1,
      name: r'updatedAt',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 2,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _tcgplayerEstimateSize,
  serialize: _tcgplayerSerialize,
  deserialize: _tcgplayerDeserialize,
  deserializeProp: _tcgplayerDeserializeProp,
);

int _tcgplayerEstimateSize(
  Tcgplayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.prices;
    if (value != null) {
      bytesCount += 3 +
          PriceDataSchema.estimateSize(
              value, allOffsets[PriceData]!, allOffsets);
    }
  }
  {
    final value = object.updatedAt;
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

void _tcgplayerSerialize(
  Tcgplayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<PriceData>(
    offsets[0],
    allOffsets,
    PriceDataSchema.serialize,
    object.prices,
  );
  writer.writeString(offsets[1], object.updatedAt);
  writer.writeString(offsets[2], object.url);
}

Tcgplayer _tcgplayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tcgplayer(
    prices: reader.readObjectOrNull<PriceData>(
      offsets[0],
      PriceDataSchema.deserialize,
      allOffsets,
    ),
    updatedAt: reader.readStringOrNull(offsets[1]),
    url: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _tcgplayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<PriceData>(
        offset,
        PriceDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TcgplayerQueryFilter
    on QueryBuilder<Tcgplayer, Tcgplayer, QFilterCondition> {
  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> pricesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prices',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> pricesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prices',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition>
      updatedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition>
      updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlEqualTo(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlGreaterThan(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlLessThan(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlBetween(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlContains(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlMatches(
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

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension TcgplayerQueryObject
    on QueryBuilder<Tcgplayer, Tcgplayer, QFilterCondition> {
  QueryBuilder<Tcgplayer, Tcgplayer, QAfterFilterCondition> prices(
      FilterQuery<PriceData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'prices');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CardMarketSchema = Schema(
  name: r'CardMarket',
  id: -488754564422203368,
  properties: {
    r'prices': PropertySchema(
      id: 0,
      name: r'prices',
      type: IsarType.object,
      target: r'PriceData',
    ),
    r'updatedAt': PropertySchema(
      id: 1,
      name: r'updatedAt',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 2,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _cardMarketEstimateSize,
  serialize: _cardMarketSerialize,
  deserialize: _cardMarketDeserialize,
  deserializeProp: _cardMarketDeserializeProp,
);

int _cardMarketEstimateSize(
  CardMarket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.prices;
    if (value != null) {
      bytesCount += 3 +
          PriceDataSchema.estimateSize(
              value, allOffsets[PriceData]!, allOffsets);
    }
  }
  {
    final value = object.updatedAt;
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

void _cardMarketSerialize(
  CardMarket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<PriceData>(
    offsets[0],
    allOffsets,
    PriceDataSchema.serialize,
    object.prices,
  );
  writer.writeString(offsets[1], object.updatedAt);
  writer.writeString(offsets[2], object.url);
}

CardMarket _cardMarketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CardMarket(
    prices: reader.readObjectOrNull<PriceData>(
      offsets[0],
      PriceDataSchema.deserialize,
      allOffsets,
    ),
    updatedAt: reader.readStringOrNull(offsets[1]),
    url: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _cardMarketDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<PriceData>(
        offset,
        PriceDataSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CardMarketQueryFilter
    on QueryBuilder<CardMarket, CardMarket, QFilterCondition> {
  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> pricesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prices',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      pricesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prices',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedAt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> updatedAtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedAt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition>
      updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedAt',
        value: '',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlEqualTo(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlGreaterThan(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlLessThan(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlBetween(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlStartsWith(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlEndsWith(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlContains(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlMatches(
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

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension CardMarketQueryObject
    on QueryBuilder<CardMarket, CardMarket, QFilterCondition> {
  QueryBuilder<CardMarket, CardMarket, QAfterFilterCondition> prices(
      FilterQuery<PriceData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'prices');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PriceDataSchema = Schema(
  name: r'PriceData',
  id: -6528670624351564071,
  properties: {
    r'averageSellPrice': PropertySchema(
      id: 0,
      name: r'averageSellPrice',
      type: IsarType.double,
    ),
    r'avg1': PropertySchema(
      id: 1,
      name: r'avg1',
      type: IsarType.double,
    ),
    r'avg30': PropertySchema(
      id: 2,
      name: r'avg30',
      type: IsarType.double,
    ),
    r'avg7': PropertySchema(
      id: 3,
      name: r'avg7',
      type: IsarType.double,
    ),
    r'directLow': PropertySchema(
      id: 4,
      name: r'directLow',
      type: IsarType.double,
    ),
    r'germanProLow': PropertySchema(
      id: 5,
      name: r'germanProLow',
      type: IsarType.double,
    ),
    r'high': PropertySchema(
      id: 6,
      name: r'high',
      type: IsarType.double,
    ),
    r'low': PropertySchema(
      id: 7,
      name: r'low',
      type: IsarType.double,
    ),
    r'lowPrice': PropertySchema(
      id: 8,
      name: r'lowPrice',
      type: IsarType.double,
    ),
    r'lowPriceExPlus': PropertySchema(
      id: 9,
      name: r'lowPriceExPlus',
      type: IsarType.double,
    ),
    r'market': PropertySchema(
      id: 10,
      name: r'market',
      type: IsarType.double,
    ),
    r'mid': PropertySchema(
      id: 11,
      name: r'mid',
      type: IsarType.double,
    ),
    r'reverseHoloAvg1': PropertySchema(
      id: 12,
      name: r'reverseHoloAvg1',
      type: IsarType.double,
    ),
    r'reverseHoloAvg30': PropertySchema(
      id: 13,
      name: r'reverseHoloAvg30',
      type: IsarType.double,
    ),
    r'reverseHoloAvg7': PropertySchema(
      id: 14,
      name: r'reverseHoloAvg7',
      type: IsarType.double,
    ),
    r'reverseHoloLow': PropertySchema(
      id: 15,
      name: r'reverseHoloLow',
      type: IsarType.double,
    ),
    r'reverseHoloSell': PropertySchema(
      id: 16,
      name: r'reverseHoloSell',
      type: IsarType.double,
    ),
    r'reverseHoloTrend': PropertySchema(
      id: 17,
      name: r'reverseHoloTrend',
      type: IsarType.double,
    ),
    r'suggestedPrice': PropertySchema(
      id: 18,
      name: r'suggestedPrice',
      type: IsarType.double,
    ),
    r'trendPrice': PropertySchema(
      id: 19,
      name: r'trendPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _priceDataEstimateSize,
  serialize: _priceDataSerialize,
  deserialize: _priceDataDeserialize,
  deserializeProp: _priceDataDeserializeProp,
);

int _priceDataEstimateSize(
  PriceData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _priceDataSerialize(
  PriceData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageSellPrice);
  writer.writeDouble(offsets[1], object.avg1);
  writer.writeDouble(offsets[2], object.avg30);
  writer.writeDouble(offsets[3], object.avg7);
  writer.writeDouble(offsets[4], object.directLow);
  writer.writeDouble(offsets[5], object.germanProLow);
  writer.writeDouble(offsets[6], object.high);
  writer.writeDouble(offsets[7], object.low);
  writer.writeDouble(offsets[8], object.lowPrice);
  writer.writeDouble(offsets[9], object.lowPriceExPlus);
  writer.writeDouble(offsets[10], object.market);
  writer.writeDouble(offsets[11], object.mid);
  writer.writeDouble(offsets[12], object.reverseHoloAvg1);
  writer.writeDouble(offsets[13], object.reverseHoloAvg30);
  writer.writeDouble(offsets[14], object.reverseHoloAvg7);
  writer.writeDouble(offsets[15], object.reverseHoloLow);
  writer.writeDouble(offsets[16], object.reverseHoloSell);
  writer.writeDouble(offsets[17], object.reverseHoloTrend);
  writer.writeDouble(offsets[18], object.suggestedPrice);
  writer.writeDouble(offsets[19], object.trendPrice);
}

PriceData _priceDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PriceData(
    averageSellPrice: reader.readDoubleOrNull(offsets[0]),
    avg1: reader.readDoubleOrNull(offsets[1]),
    avg30: reader.readDoubleOrNull(offsets[2]),
    avg7: reader.readDoubleOrNull(offsets[3]),
    directLow: reader.readDoubleOrNull(offsets[4]),
    germanProLow: reader.readDoubleOrNull(offsets[5]),
    high: reader.readDoubleOrNull(offsets[6]),
    low: reader.readDoubleOrNull(offsets[7]),
    lowPrice: reader.readDoubleOrNull(offsets[8]),
    lowPriceExPlus: reader.readDoubleOrNull(offsets[9]),
    market: reader.readDoubleOrNull(offsets[10]),
    mid: reader.readDoubleOrNull(offsets[11]),
    reverseHoloAvg1: reader.readDoubleOrNull(offsets[12]),
    reverseHoloAvg30: reader.readDoubleOrNull(offsets[13]),
    reverseHoloAvg7: reader.readDoubleOrNull(offsets[14]),
    reverseHoloLow: reader.readDoubleOrNull(offsets[15]),
    reverseHoloSell: reader.readDoubleOrNull(offsets[16]),
    reverseHoloTrend: reader.readDoubleOrNull(offsets[17]),
    suggestedPrice: reader.readDoubleOrNull(offsets[18]),
    trendPrice: reader.readDoubleOrNull(offsets[19]),
  );
  return object;
}

P _priceDataDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PriceDataQueryFilter
    on QueryBuilder<PriceData, PriceData, QFilterCondition> {
  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageSellPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageSellPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageSellPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      averageSellPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageSellPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avg1',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avg1',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avg1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avg30',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avg30',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg30Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avg30',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avg7',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avg7',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> avg7Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avg7',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> directLowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      directLowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> directLowEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      directLowGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'directLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> directLowLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'directLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> directLowBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'directLow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      germanProLowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'germanProLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      germanProLowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'germanProLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> germanProLowEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'germanProLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      germanProLowGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'germanProLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      germanProLowLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'germanProLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> germanProLowBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'germanProLow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'high',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'high',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'high',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'high',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'high',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> highBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'high',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'low',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'low',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'low',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'low',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'low',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'low',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lowPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lowPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> lowPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lowPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowPriceExPlus',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowPriceExPlus',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowPriceExPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lowPriceExPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lowPriceExPlus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      lowPriceExPlusBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lowPriceExPlus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'market',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'market',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'market',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'market',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'market',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> marketBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'market',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mid',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mid',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> midBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloAvg1',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloAvg1',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloAvg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloAvg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloAvg1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloAvg1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloAvg30',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloAvg30',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloAvg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloAvg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloAvg30',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg30Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloAvg30',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloAvg7',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloAvg7',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloAvg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloAvg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloAvg7',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloAvg7Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloAvg7',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloLow',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloLow',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloLowBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloLow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloSell',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloSell',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloSell',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloSell',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloSell',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloSellBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloSell',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reverseHoloTrend',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reverseHoloTrend',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reverseHoloTrend',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reverseHoloTrend',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reverseHoloTrend',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      reverseHoloTrendBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reverseHoloTrend',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'suggestedPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'suggestedPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'suggestedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      suggestedPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'suggestedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> trendPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trendPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      trendPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trendPrice',
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> trendPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trendPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition>
      trendPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trendPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> trendPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trendPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PriceData, PriceData, QAfterFilterCondition> trendPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trendPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PriceDataQueryObject
    on QueryBuilder<PriceData, PriceData, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TcgCard _$TcgCardFromJson(Map<String, dynamic> json) => TcgCard(
      id: json['id'] as String?,
      name: json['name'] as String?,
      supertype: json['supertype'] as String?,
      subtypes: (json['subtypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      evolvesTo: (json['evolvesTo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rules:
          (json['rules'] as List<dynamic>?)?.map((e) => e as String).toList(),
      attacks: (json['attacks'] as List<dynamic>?)
          ?.map((e) => Attack.fromJson(e as Map<String, dynamic>))
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>?)
          ?.map((e) => WeaknessResistance.fromJson(e as Map<String, dynamic>))
          .toList(),
      resistances: (json['resistances'] as List<dynamic>?)
          ?.map((e) => WeaknessResistance.fromJson(e as Map<String, dynamic>))
          .toList(),
      retreatCost: (json['retreatCost'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      convertedRetreatCost: (json['convertedRetreatCost'] as num?)?.toInt(),
      set: json['set'] == null
          ? null
          : SetData.fromJson(json['set'] as Map<String, dynamic>),
      number: json['number'] as String?,
      artist: json['artist'] as String?,
      rarity: json['rarity'] as String?,
      nationalPokedexNumbers: (json['nationalPokedexNumbers'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      legalities: json['legalities'] == null
          ? null
          : Legalities.fromJson(json['legalities'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : CardImages.fromJson(json['images'] as Map<String, dynamic>),
      tcgplayer: json['tcgplayer'] == null
          ? null
          : Tcgplayer.fromJson(json['tcgplayer'] as Map<String, dynamic>),
      cardmarket: json['cardmarket'] == null
          ? null
          : CardMarket.fromJson(json['cardmarket'] as Map<String, dynamic>),
      flavorText: json['flavorText'] as String?,
    )..userData = json['userData'] == null
        ? null
        : UserData.fromJson(json['userData'] as Map<String, dynamic>);

Map<String, dynamic> _$TcgCardToJson(TcgCard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'supertype': instance.supertype,
      'subtypes': instance.subtypes,
      'userData': instance.userData,
      'types': instance.types,
      'evolvesTo': instance.evolvesTo,
      'abilities': instance.abilities,
      'rules': instance.rules,
      'attacks': instance.attacks,
      'weaknesses': instance.weaknesses,
      'resistances': instance.resistances,
      'retreatCost': instance.retreatCost,
      'convertedRetreatCost': instance.convertedRetreatCost,
      'set': instance.set,
      'number': instance.number,
      'artist': instance.artist,
      'rarity': instance.rarity,
      'nationalPokedexNumbers': instance.nationalPokedexNumbers,
      'legalities': instance.legalities,
      'images': instance.images,
      'tcgplayer': instance.tcgplayer,
      'cardmarket': instance.cardmarket,
      'flavorText': instance.flavorText,
    };

Attack _$AttackFromJson(Map<String, dynamic> json) => Attack(
      name: json['name'] as String?,
      cost: (json['cost'] as List<dynamic>?)?.map((e) => e as String).toList(),
      convertedEnergyCost: (json['convertedEnergyCost'] as num?)?.toInt(),
      damage: json['damage'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$AttackToJson(Attack instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
      'convertedEnergyCost': instance.convertedEnergyCost,
      'damage': instance.damage,
      'text': instance.text,
    };

WeaknessResistance _$WeaknessResistanceFromJson(Map<String, dynamic> json) =>
    WeaknessResistance(
      type: json['type'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$WeaknessResistanceToJson(WeaknessResistance instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

SetData _$SetDataFromJson(Map<String, dynamic> json) => SetData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      series: json['series'] as String?,
      printedTotal: (json['printedTotal'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      legalities: json['legalities'] == null
          ? null
          : Legalities.fromJson(json['legalities'] as Map<String, dynamic>),
      ptcgoCode: json['ptcgoCode'] as String?,
      releaseDate: json['releaseDate'] as String?,
      updatedAt: json['updatedAt'] as String?,
      images: json['images'] == null
          ? null
          : CardImages.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetDataToJson(SetData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'series': instance.series,
      'printedTotal': instance.printedTotal,
      'total': instance.total,
      'legalities': instance.legalities,
      'ptcgoCode': instance.ptcgoCode,
      'releaseDate': instance.releaseDate,
      'updatedAt': instance.updatedAt,
      'images': instance.images,
    };

Legalities _$LegalitiesFromJson(Map<String, dynamic> json) => Legalities(
      unlimited: json['unlimited'] as String?,
      standard: json['standard'] as String?,
      expanded: json['expanded'] as String?,
    );

Map<String, dynamic> _$LegalitiesToJson(Legalities instance) =>
    <String, dynamic>{
      'unlimited': instance.unlimited,
      'standard': instance.standard,
      'expanded': instance.expanded,
    };

CardImages _$CardImagesFromJson(Map<String, dynamic> json) => CardImages(
      small: json['small'] as String?,
      large: json['large'] as String?,
      symbol: json['symbol'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$CardImagesToJson(CardImages instance) =>
    <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
      'symbol': instance.symbol,
      'logo': instance.logo,
    };

Tcgplayer _$TcgplayerFromJson(Map<String, dynamic> json) => Tcgplayer(
      url: json['url'] as String?,
      updatedAt: json['updatedAt'] as String?,
      prices: json['prices'] == null
          ? null
          : PriceData.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TcgplayerToJson(Tcgplayer instance) => <String, dynamic>{
      'url': instance.url,
      'updatedAt': instance.updatedAt,
      'prices': instance.prices,
    };

CardMarket _$CardMarketFromJson(Map<String, dynamic> json) => CardMarket(
      url: json['url'] as String?,
      updatedAt: json['updatedAt'] as String?,
      prices: json['prices'] == null
          ? null
          : PriceData.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardMarketToJson(CardMarket instance) =>
    <String, dynamic>{
      'url': instance.url,
      'updatedAt': instance.updatedAt,
      'prices': instance.prices,
    };

PriceData _$PriceDataFromJson(Map<String, dynamic> json) => PriceData(
      averageSellPrice: (json['averageSellPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      trendPrice: (json['trendPrice'] as num?)?.toDouble(),
      germanProLow: (json['germanProLow'] as num?)?.toDouble(),
      suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
      reverseHoloSell: (json['reverseHoloSell'] as num?)?.toDouble(),
      reverseHoloLow: (json['reverseHoloLow'] as num?)?.toDouble(),
      reverseHoloTrend: (json['reverseHoloTrend'] as num?)?.toDouble(),
      lowPriceExPlus: (json['lowPriceExPlus'] as num?)?.toDouble(),
      avg1: (json['avg1'] as num?)?.toDouble(),
      avg7: (json['avg7'] as num?)?.toDouble(),
      avg30: (json['avg30'] as num?)?.toDouble(),
      reverseHoloAvg1: (json['reverseHoloAvg1'] as num?)?.toDouble(),
      reverseHoloAvg7: (json['reverseHoloAvg7'] as num?)?.toDouble(),
      reverseHoloAvg30: (json['reverseHoloAvg30'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      mid: (json['mid'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      market: (json['market'] as num?)?.toDouble(),
      directLow: (json['directLow'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceDataToJson(PriceData instance) => <String, dynamic>{
      'low': instance.low,
      'mid': instance.mid,
      'high': instance.high,
      'market': instance.market,
      'directLow': instance.directLow,
      'averageSellPrice': instance.averageSellPrice,
      'lowPrice': instance.lowPrice,
      'trendPrice': instance.trendPrice,
      'germanProLow': instance.germanProLow,
      'suggestedPrice': instance.suggestedPrice,
      'reverseHoloSell': instance.reverseHoloSell,
      'reverseHoloLow': instance.reverseHoloLow,
      'reverseHoloTrend': instance.reverseHoloTrend,
      'lowPriceExPlus': instance.lowPriceExPlus,
      'avg1': instance.avg1,
      'avg7': instance.avg7,
      'avg30': instance.avg30,
      'reverseHoloAvg1': instance.reverseHoloAvg1,
      'reverseHoloAvg7': instance.reverseHoloAvg7,
      'reverseHoloAvg30': instance.reverseHoloAvg30,
    };
