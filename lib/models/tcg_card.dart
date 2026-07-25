import 'dart:core';

import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/models/user_data.dart';

part 'tcg_card.g.dart';

@collection
@JsonSerializable()
class TcgCard {
  final String? id;
  final Id? isarId = Isar.autoIncrement;
  final String? name;
  final String? supertype;
  final List<String>? subtypes;

  @ignore
  UserData? userData;
  // final String? level; // Changed to int
  // final String? hp; // Changed to int
  final List<String>? types;
  final List<String>? evolvesTo;
  // final List<String>? evolvesFrom;
  final List<String>? abilities; // Consider making a dedicated Ability class
  final List<String>? rules; // Consider making a dedicated Rule class
  final List<Attack>? attacks;
  final List<WeaknessResistance>? weaknesses;
  final List<WeaknessResistance>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost; // Changed to int
  final SetData? set;
  final String? number; // Changed to String
  final String? artist;
  final String? rarity; // Consider making this an Enum if possible
  final List<int>? nationalPokedexNumbers;
  final Legalities? legalities;
  final CardImages? images;
  final Tcgplayer? tcgplayer;
  final CardMarket? cardmarket; // Added CardMarket
  final String? flavorText;

  TcgCard({
    required this.id,
    this.name,
    this.supertype,
    this.subtypes,
    // this.level,
    // this.hp,
    this.types,
    this.evolvesTo,
    // this.evolvesFrom,
    this.abilities,
    this.rules,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.set,
    this.number,
    this.artist,
    this.rarity,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket, // Added to constructor
    this.flavorText,
  });

  factory TcgCard.fromJson(Map<String, dynamic> json) =>
      _$TcgCardFromJson(json);

  Map<String, dynamic> toJson() => _$TcgCardToJson(this);
}

// Persisted caught-status for a TCG card, keyed by the TCG API's own
// (globally unique, stable) string card id — e.g. "swsh1-1". This is
// intentionally a separate Isar collection from UserData, which is keyed by
// PokeAPI national dex ids (small ints). Reusing UserData/its id-space for
// TCG cards would collide with and corrupt caught-Pokemon state.
@collection
class CaughtTcgCard {
  final Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String cardId;

  late bool isCaught;

  CaughtTcgCard({
    required this.cardId,
    required this.isCaught,
  });
}

@embedded
@JsonSerializable()
class Attack {
  final String? name;
  final List<String>? cost;
  final int? convertedEnergyCost;
  final String? damage; // Kept as String for now
  final String? text;

  Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) => _$AttackFromJson(json);

  Map<String, dynamic> toJson() => _$AttackToJson(this);
}

@embedded
@JsonSerializable()
class WeaknessResistance {
  final String? type;
  final String? value;

  WeaknessResistance({
    this.type,
    this.value,
  });

  factory WeaknessResistance.fromJson(Map<String, dynamic> json) =>
      _$WeaknessResistanceFromJson(json);

  Map<String, dynamic> toJson() => _$WeaknessResistanceToJson(this);
}

@embedded
@JsonSerializable()
class SetData {
  final String? id;
  final String? name;
  final String? series;
  final int? printedTotal; // Changed to int
  final int? total; // Changed to int
  final Legalities? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final CardImages? images;

  SetData({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  factory SetData.fromJson(Map<String, dynamic> json) =>
      _$SetDataFromJson(json);

  Map<String, dynamic> toJson() => _$SetDataToJson(this);
}

@embedded
@JsonSerializable()
class Legalities {
  final String? unlimited;
  final String? standard;
  final String? expanded;

  Legalities({
    this.unlimited,
    this.standard,
    this.expanded,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) =>
      _$LegalitiesFromJson(json);

  Map<String, dynamic> toJson() => _$LegalitiesToJson(this);
}

@embedded
@JsonSerializable()
class CardImages {
  final String? small;
  final String? large;
  final String? symbol;
  final String? logo;

  CardImages({
    this.small,
    this.large,
    this.symbol,
    this.logo,
  });

  factory CardImages.fromJson(Map<String, dynamic> json) =>
      _$CardImagesFromJson(json);

  Map<String, dynamic> toJson() => _$CardImagesToJson(this);
}

@embedded
@JsonSerializable()
class Tcgplayer {
  final String? url;
  final String? updatedAt;
  final PriceData? prices;

  Tcgplayer({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) =>
      _$TcgplayerFromJson(json);

  Map<String, dynamic> toJson() => _$TcgplayerToJson(this);
}

@embedded // Added @embedded
@JsonSerializable()
class CardMarket {
  final String? url;
  final String? updatedAt;
  final PriceData? prices;

  CardMarket({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory CardMarket.fromJson(Map<String, dynamic> json) =>
      _$CardMarketFromJson(json);

  Map<String, dynamic> toJson() => _$CardMarketToJson(this);
}

@embedded
@JsonSerializable()
class PriceData {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;
  final double? averageSellPrice;
  final double? lowPrice;
  final double? trendPrice;
  final double? germanProLow;
  final double? suggestedPrice;
  final double? reverseHoloSell;
  final double? reverseHoloLow;
  final double? reverseHoloTrend;
  final double? lowPriceExPlus;
  final double? avg1;
  final double? avg7;
  final double? avg30;
  final double? reverseHoloAvg1;
  final double? reverseHoloAvg7;
  final double? reverseHoloAvg30;

  PriceData({
    this.averageSellPrice,
    this.lowPrice,
    this.trendPrice,
    this.germanProLow,
    this.suggestedPrice,
    this.reverseHoloSell,
    this.reverseHoloLow,
    this.reverseHoloTrend,
    this.lowPriceExPlus,
    this.avg1,
    this.avg7,
    this.avg30,
    this.reverseHoloAvg1,
    this.reverseHoloAvg7,
    this.reverseHoloAvg30,
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory PriceData.fromJson(Map<String, dynamic> json) =>
      _$PriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDataToJson(this);
}
