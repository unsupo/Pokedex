import 'dart:core';

import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tcg_card.g.dart';

@collection
@JsonSerializable()
class TcgCard {
  // Unique + replace:true so caching the same card id twice (e.g. once from
  // a live fetch, once more from a later one) upserts instead of creating a
  // duplicate row - see the isarId note just below, and the regression test
  // in test/services/local/card_binder_persistence_test.dart.
  @Index(unique: true, replace: true)
  final String? id;

  // Not final: Isar must be able to assign the stored id when it reads a row
  // back, or a later put would insert a duplicate instead of updating - the
  // same upsert footgun already hit and fixed for CaughtTcgCard.isarId.
  //
  // @JsonKey excluded: making this non-final (above) turned it from an
  // optional `Id?` into a required `Id` as far as json_serializable is
  // concerned, so the generated fromJson started doing a hard
  // `(json['isarId'] as num).toInt()` cast. The real PokemonTCG API response
  // never has an "isarId" key, so that cast threw `type 'Null' is not a
  // subtype of type 'num'` for every single card, on every fetch - silently
  // caught per-card in pokemon_tcg_api_service.dart, so it surfaced as an
  // empty card list (blank Cards tab, empty binder) rather than a visible
  // error. isarId is a local Isar primary key, never part of the API's JSON
  // shape, so it must never round-trip through fromJson/toJson at all - see
  // docs/features/tcg-card-json-parsing-regression.md.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id isarId = Isar.autoIncrement;
  final String? name;
  final String? supertype;
  final List<String>? subtypes;

  /// Transient: this profile's caught status, filled in by TcgApiProvider.
  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isCaught = false;
  // final String? level; // Changed to int
  // final String? hp; // Changed to int
  final List<String>? types;
  final List<String>? evolvesTo;
  // final List<String>? evolvesFrom;
  final List<CardAbility>?
      abilities; // Consider making a dedicated Ability class
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

// Persisted caught-status for a TCG card, per profile. Keyed by the profile
// plus the TCG API's own (globally unique, stable) string card id, e.g.
// "swsh1-1". Kept separate from CaughtPokemon, which is keyed by PokeAPI
// national dex ids (small ints), so card ids cannot collide with Pokemon data.
@collection
class CaughtTcgCard {
  // Not final: Isar must be able to assign the stored id when it reads a row
  // back, or a later put would insert a duplicate instead of updating.
  Id isarId = Isar.autoIncrement;

  @Index(
    composite: [CompositeIndex('cardId')],
    unique: true,
    replace: true,
  )
  late int profileId;

  late String cardId;

  late bool isCaught;

  CaughtTcgCard({
    required this.profileId,
    required this.cardId,
    required this.isCaught,
  });
}

@embedded
@JsonSerializable()
class CardAbility {
  final String? name;
  final String? text;
  final String? type;

  CardAbility({
    this.name,
    this.text,
    this.type,
  });

  factory CardAbility.fromJson(Map<String, dynamic> json) =>
      _$CardAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$CardAbilityToJson(this);
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
  final TcgplayerPrices? prices;

  Tcgplayer({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) =>
      _$TcgplayerFromJson(json);

  Map<String, dynamic> toJson() => _$TcgplayerToJson(this);
}

/// TCGPlayer's `prices` object is keyed by print variant (`"holofoil"`,
/// `"normal"`, `"reverseHolofoil"`, ...) - not a single flat price object
/// the way Cardmarket's is (see [CardMarket]/[PriceData]). Confirmed
/// against a real response (`GET /v2/cards/base1-4`):
/// ```json
/// "tcgplayer": {"prices": {"holofoil": {"low": 499.99, "market": 928.06, ...}}}
/// ```
/// Isar's embedded-object model needs a fixed schema, so this can't just
/// be a `Map<String, PriceData>` - every variant TCGPlayer actually uses
/// across pokemontcg.io's card data gets its own optional field instead.
/// Before this, [Tcgplayer.prices] was typed as a single [PriceData], so
/// `PriceData.fromJson` read top-level keys (`low`, `mid`, `market`, ...)
/// that don't exist at that level - every field silently parsed to null,
/// so a card's USD price was *never* actually available, and
/// `estimatedCardPrice` (utils/tcg_price_util.dart) always fell through to
/// Cardmarket's EUR price instead - reported live: "it still doesn't show
/// it in dollars." See "Fifteenth round" in docs/features/card-binder.md.
@embedded
@JsonSerializable()
class TcgplayerPrices {
  final PriceData? normal;
  final PriceData? holofoil;
  final PriceData? reverseHolofoil;
  @JsonKey(name: '1stEditionNormal')
  final PriceData? firstEditionNormal;
  @JsonKey(name: '1stEditionHolofoil')
  final PriceData? firstEditionHolofoil;
  final PriceData? unlimited;
  final PriceData? unlimitedHolofoil;

  TcgplayerPrices({
    this.normal,
    this.holofoil,
    this.reverseHolofoil,
    this.firstEditionNormal,
    this.firstEditionHolofoil,
    this.unlimited,
    this.unlimitedHolofoil,
  });

  factory TcgplayerPrices.fromJson(Map<String, dynamic> json) =>
      _$TcgplayerPricesFromJson(json);

  Map<String, dynamic> toJson() => _$TcgplayerPricesToJson(this);
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
