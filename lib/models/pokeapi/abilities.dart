import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'abilities.g.dart';

@collection
@JsonSerializable()
class Ability {
  final Id id;
  final String? name;
  @JsonKey(name: 'is_main_series')
  final bool? isMainSeries;
  final NamedApiResource? generation;
  final List<ApiName>? names;
  @JsonKey(name: 'effect_entries')
  final List<VerboseEffect>? effectEntries;
  @JsonKey(name: 'effect_changes')
  final List<AbilityEffectChange>? effectChanges;
  @JsonKey(name: 'flavor_text_entries')
  final List<AbilityFlavorText>? flavorTextEntries;
  final List<AbilityPokemon>? pokemon;

  Ability({
    required this.id,
    this.name,
    this.isMainSeries,
    this.generation,
    this.names,
    this.effectEntries,
    this.effectChanges,
    this.flavorTextEntries,
    this.pokemon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@embedded
@JsonSerializable()
class AbilityEffectChange {
  @JsonKey(name: 'effect_entries')
  final List<Effect>? effectEntries;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  AbilityEffectChange({
    this.effectEntries,
    this.versionGroup,
  });

  factory AbilityEffectChange.fromJson(Map<String, dynamic> json) =>
      _$AbilityEffectChangeFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityEffectChangeToJson(this);
}

@embedded
@JsonSerializable()
class AbilityFlavorText {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;
  final NamedApiResource? language;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  AbilityFlavorText({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  factory AbilityFlavorText.fromJson(Map<String, dynamic> json) =>
      _$AbilityFlavorTextFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityFlavorTextToJson(this);
}

@embedded
@JsonSerializable()
class AbilityPokemon {
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;
  final NamedApiResource? pokemon;

  AbilityPokemon({
    this.isHidden,
    this.slot,
    this.pokemon,
  });

  factory AbilityPokemon.fromJson(Map<String, dynamic> json) =>
      _$AbilityPokemonFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityPokemonToJson(this);
}