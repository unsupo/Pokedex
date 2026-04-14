import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'growth_rates.g.dart';

@collection
@JsonSerializable()
class GrowthRate {
  final Id id;
  final String? name;
  final String? formula;
  final List<Description>? descriptions;
  final List<GrowthRateExperienceLevel>? levels;
  @JsonKey(name: 'pokemon_species')
  final List<NamedApiResource>? pokemonSpecies;

  GrowthRate({
    required this.id,
    this.name,
    this.formula,
    this.descriptions,
    this.levels,
    this.pokemonSpecies,
  });

  factory GrowthRate.fromJson(Map<String, dynamic> json) =>
      _$GrowthRateFromJson(json);
  Map<String, dynamic> toJson() => _$GrowthRateToJson(this);
}

@embedded
@JsonSerializable()
class GrowthRateExperienceLevel {
  final int? level;
  final int? experience;

  GrowthRateExperienceLevel({
    this.level,
    this.experience,
  });

  factory GrowthRateExperienceLevel.fromJson(Map<String, dynamic> json) =>
      _$GrowthRateExperienceLevelFromJson(json);
  Map<String, dynamic> toJson() => _$GrowthRateExperienceLevelToJson(this);
}