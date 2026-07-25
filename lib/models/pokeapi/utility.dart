import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'utility.g.dart';

@embedded
@JsonSerializable()
class ApiResource {
  final String? url;

  ApiResource({
    this.url,
  });

  factory ApiResource.fromJson(Map<String, dynamic> json) =>
      _$ApiResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResourceToJson(this);

  @ignore
  get id{
    var s = url?.split('/');
    return int.parse(s![s.length - 2]);
  }
}

@embedded
@JsonSerializable()
class Description {
  final String? description;
  final NamedApiResource? language;

  Description({
    this.description,
    this.language,
  });

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@embedded
@JsonSerializable()
class Effect {
  final String? effect;
  final NamedApiResource? language;

  Effect({
    this.effect,
    this.language,
  });

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);
  Map<String, dynamic> toJson() => _$EffectToJson(this);
}

@embedded
@JsonSerializable()
class Encounter {
  @JsonKey(name: 'min_level')
  final int? minLevel;
  @JsonKey(name: 'max_level')
  final int? maxLevel;
  @JsonKey(name: 'condition_values')
  final List<NamedApiResource>? conditionValues;
  final int? chance;
  final NamedApiResource? method;

  Encounter({
    this.minLevel,
    this.maxLevel,
    this.conditionValues,
    this.chance,
    this.method,
  });

  factory Encounter.fromJson(Map<String, dynamic> json) =>
      _$EncounterFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterToJson(this);
}

@embedded
@JsonSerializable()
class FlavorText {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;
  final NamedApiResource? language;
  final NamedApiResource? version;

  FlavorText({
    this.flavorText,
    this.language,
    this.version,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);
  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);
}

@embedded
@JsonSerializable()
class GenerationGameIndex {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final NamedApiResource? generation;

  GenerationGameIndex({
    this.gameIndex,
    this.generation,
  });

  factory GenerationGameIndex.fromJson(Map<String, dynamic> json) =>
      _$GenerationGameIndexFromJson(json);
  Map<String, dynamic> toJson() => _$GenerationGameIndexToJson(this);
}

@embedded
@JsonSerializable()
class MachineVersionDetail {
  final ApiResource? machine;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  MachineVersionDetail({
    this.machine,
    this.versionGroup,
  });

  factory MachineVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$MachineVersionDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MachineVersionDetailToJson(this);
}

@embedded
@JsonSerializable()
class ApiName {
  final String? name;
  final NamedApiResource? language;

  ApiName({
    this.name,
    this.language,
  });

  factory ApiName.fromJson(Map<String, dynamic> json) => _$ApiNameFromJson(json);
  Map<String, dynamic> toJson() => _$ApiNameToJson(this);
}

@embedded
@JsonSerializable()
class NamedApiResource {
  final String? name;
  final String? url;

  NamedApiResource({
    this.name,
    this.url,
  });

  factory NamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$NamedApiResourceFromJson(json);
  Map<String, dynamic> toJson() => _$NamedApiResourceToJson(this);

  @ignore
  get id{
    var s = url?.split('/');
    return int.parse(s![s.length - 2]);
  }
}

@collection
@JsonSerializable()
class Language {
  final Id id;
  final String? name;
  final bool? official;
  final String? iso639;
  final String? iso3166;
  final List<ApiName>? names;

  Language({
    required this.id,
    this.name,
    this.official,
    this.iso639,
    this.iso3166,
    this.names,
  });

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@embedded
@JsonSerializable()
class VerboseEffect {
  final String? effect;
  @JsonKey(name: 'short_effect')
  final String? shortEffect;
  final NamedApiResource? language;

  VerboseEffect({
    this.effect,
    this.shortEffect,
    this.language,
  });

  factory VerboseEffect.fromJson(Map<String, dynamic> json) =>
      _$VerboseEffectFromJson(json);
  Map<String, dynamic> toJson() => _$VerboseEffectToJson(this);
}

@embedded
@JsonSerializable()
class VersionEncounterDetail {
  final NamedApiResource? version;
  @JsonKey(name: 'max_chance')
  final int? maxChance;
  @JsonKey(name: 'encounter_details')
  final List<Encounter>? encounterDetails;

  VersionEncounterDetail({
    this.version,
    this.maxChance,
    this.encounterDetails,
  });

  factory VersionEncounterDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionEncounterDetailFromJson(json);
  Map<String, dynamic> toJson() => _$VersionEncounterDetailToJson(this);
}

@embedded
@JsonSerializable()
class VersionGameIndex {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final NamedApiResource? version;

  VersionGameIndex({
    this.gameIndex,
    this.version,
  });

  factory VersionGameIndex.fromJson(Map<String, dynamic> json) =>
      _$VersionGameIndexFromJson(json);
  Map<String, dynamic> toJson() => _$VersionGameIndexToJson(this);
}

@embedded
@JsonSerializable()
class VersionGroupFlavorText {
  final String? text;
  final NamedApiResource? language;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  VersionGroupFlavorText({
    this.text,
    this.language,
    this.versionGroup,
  });

  factory VersionGroupFlavorText.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupFlavorTextFromJson(json);
  Map<String, dynamic> toJson() => _$VersionGroupFlavorTextToJson(this);
}