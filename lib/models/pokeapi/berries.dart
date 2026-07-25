import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'berries.g.dart';

@collection
@JsonSerializable()
class Berry {
  final Id id;
  final String? name;
  @JsonKey(name: 'growth_time')
  final int? growthTime;
  @JsonKey(name: 'max_harvest')
  final int? maxHarvest;
  @JsonKey(name: 'natural_gift_power')
  final int? naturalGiftPower;
  final int? size;
  final int? smoothness;
  @JsonKey(name: 'soil_dryness')
  final int? soilDryness;
  final BerryFirmness? firmness;
  final List<BerryFlavorMap>? flavors;
  final NamedApiResource? item;
  @JsonKey(name: 'natural_gift_type')
  final NamedApiResource? naturalGiftType;

  Berry({
    required this.id,
    this.name,
    this.growthTime,
    this.maxHarvest,
    this.naturalGiftPower,
    this.size,
    this.smoothness,
    this.soilDryness,
    this.firmness,
    this.flavors,
    this.item,
    this.naturalGiftType,
  });

  factory Berry.fromJson(Map<String, dynamic> json) => _$BerryFromJson(json);
  Map<String, dynamic> toJson() => _$BerryToJson(this);
}

@embedded
@JsonSerializable()
class BerryFlavorMap {
  final int? potency;
  final NamedApiResource? flavor;

  BerryFlavorMap({
    this.potency,
    this.flavor,
  });

  factory BerryFlavorMap.fromJson(Map<String, dynamic> json) =>
      _$BerryFlavorMapFromJson(json);
  Map<String, dynamic> toJson() => _$BerryFlavorMapToJson(this);
}

@embedded
@JsonSerializable()
class BerryFirmness {
  final int? id;
  final String? name;
  final List<NamedApiResource>? berries;
  final List<ApiName>? names;

  BerryFirmness({
    this.id,
    this.name,
    this.berries,
    this.names,
  });

  factory BerryFirmness.fromJson(Map<String, dynamic> json) =>
      _$BerryFirmnessFromJson(json);
  Map<String, dynamic> toJson() => _$BerryFirmnessToJson(this);
}

@collection
@JsonSerializable()
class BerryFlavor {
  final Id id;
  final String? name;
  @JsonKey(name: 'contest_type')
  final NamedApiResource? contestType;
  final List<ApiName>? names;
  final List<FlavorBerryMap>? berries;

  BerryFlavor({
    required this.id,
    this.name,
    this.contestType,
    this.names,
    this.berries
  });

  factory BerryFlavor.fromJson(Map<String, dynamic> json) =>
      _$BerryFlavorFromJson(json);
  Map<String, dynamic> toJson() => _$BerryFlavorToJson(this);
}

@embedded
@JsonSerializable()
class FlavorBerryMap {
  final int? potency;
  final NamedApiResource? berry;

  FlavorBerryMap({
    this.potency,
    this.berry,
  });

  factory FlavorBerryMap.fromJson(Map<String, dynamic> json) =>
      _$FlavorBerryMapFromJson(json);
  Map<String, dynamic> toJson() => _$FlavorBerryMapToJson(this);
}