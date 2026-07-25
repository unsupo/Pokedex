import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'abilities.dart';
import 'utility.dart';

part 'moves.g.dart';

@collection
@JsonSerializable()
class Move {
  final Id id;
  final String? name;
  final int? accuracy;
  @JsonKey(name: 'effect_chance')
  final int? effectChance;
  final int? pp;
  final int? priority;
  final int? power;
  @JsonKey(name: 'contest_combos')
  final ContestComboSets? contestCombos;
  @JsonKey(name: 'contest_type')
  final NamedApiResource? contestType;
  @JsonKey(name: 'contest_effect')
  final ApiResource? contestEffect;
  @JsonKey(name: 'damage_class')
  final NamedApiResource? damageClass;
  @JsonKey(name: 'effect_entries')
  final List<VerboseEffect>? effectEntries;
  @JsonKey(name: 'effect_changes')
  final List<AbilityEffectChange>? effectChanges;
  @JsonKey(name: 'flavor_text_entries')
  final List<MoveFlavorText>? flavorTextEntries;
  final NamedApiResource? generation;
  final List<MachineVersionDetail>? machines;
  final MoveMetaData? meta;
  final List<ApiName>? names;
  @JsonKey(name: 'past_values')
  final List<PastMoveStatValues>? pastValues;
  @JsonKey(name: 'stat_changes')
  final List<MoveStatChange>? statChanges;
  @JsonKey(name: 'super_contest_effect')
  final ApiResource? superContestEffect;
  final NamedApiResource? target;
  final NamedApiResource? type;
  @JsonKey(name: 'learned_by_pokemon')
  final List<NamedApiResource>? learnedByPokemon;
  @ignore
  bool? isLoading;

  Move({
    required this.id,
    this.name,
    this.accuracy,
    this.effectChance,
    this.pp,
    this.priority,
    this.power,
    this.contestCombos,
    this.contestType,
    this.contestEffect,
    this.damageClass,
    this.effectEntries,
    this.effectChanges,
    this.flavorTextEntries,
    this.generation,
    this.machines,
    this.meta,
    this.names,
    this.pastValues,
    this.statChanges,
    this.superContestEffect,
    this.target,
    this.type,
    this.learnedByPokemon,
  });

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@embedded
@JsonSerializable()
class ContestComboSets {
  final ContestComboDetail? normal;
  @JsonKey(name: 'super')
  final ContestComboDetail? superCombo;

  ContestComboSets({
    this.normal,
    this.superCombo,
  });

  factory ContestComboSets.fromJson(Map<String, dynamic> json) =>
      _$ContestComboSetsFromJson(json);
  Map<String, dynamic> toJson() => _$ContestComboSetsToJson(this);
}

@embedded
@JsonSerializable()
class ContestComboDetail {
  @JsonKey(name: 'use_before')
  final List<NamedApiResource>? useBefore;
  @JsonKey(name: 'use_after')
  final List<NamedApiResource>? useAfter;

  ContestComboDetail({
    this.useBefore,
    this.useAfter,
  });

  factory ContestComboDetail.fromJson(Map<String, dynamic> json) =>
      _$ContestComboDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ContestComboDetailToJson(this);
}

@embedded
@JsonSerializable()
class MoveFlavorText {
  @JsonKey(name: 'flavor_text')
  final String? flavorText;
  final NamedApiResource? language;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  MoveFlavorText({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  factory MoveFlavorText.fromJson(Map<String, dynamic> json) =>
      _$MoveFlavorTextFromJson(json);
  Map<String, dynamic> toJson() => _$MoveFlavorTextToJson(this);
}

@embedded
@JsonSerializable()
class MoveMetaData {
  final NamedApiResource? ailment;
  final NamedApiResource? category;
  @JsonKey(name: 'min_hits')
  final int? minHits;
  @JsonKey(name: 'max_hits')
  final int? maxHits;
  @JsonKey(name: 'min_turns')
  final int? minTurns;
  @JsonKey(name: 'max_turns')
  final int? maxTurns;
  final int? drain;
  final int? healing;
  @JsonKey(name: 'crit_rate')
  final int? critRate;
  @JsonKey(name: 'ailment_chance')
  final int? ailmentChance;
  @JsonKey(name: 'flinch_chance')
  final int? flinchChance;
  @JsonKey(name: 'stat_chance')
  final int? statChance;

  MoveMetaData({
    this.ailment,
    this.category,
    this.minHits,
    this.maxHits,
    this.minTurns,
    this.maxTurns,
    this.drain,
    this.healing,
    this.critRate,
    this.ailmentChance,
    this.flinchChance,
    this.statChance,
  });

  factory MoveMetaData.fromJson(Map<String, dynamic> json) =>
      _$MoveMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MoveMetaDataToJson(this);
}

@embedded
@JsonSerializable()
class MoveStatChange {
  final int? change;
  final NamedApiResource? stat;

  MoveStatChange({
    this.change,
    this.stat,
  });

  factory MoveStatChange.fromJson(Map<String, dynamic> json) =>
      _$MoveStatChangeFromJson(json);
  Map<String, dynamic> toJson() => _$MoveStatChangeToJson(this);
}

@embedded
@JsonSerializable()
class PastMoveStatValues {
  final int? accuracy;
  @JsonKey(name: 'effect_chance')
  final int? effectChance;
  final int? power;
  final int? pp;
  @JsonKey(name: 'effect_entries')
  final List<VerboseEffect>? effectEntries;
  final NamedApiResource? type;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  PastMoveStatValues({
    this.accuracy,
    this.effectChance,
    this.power,
    this.pp,
    this.effectEntries,
    this.type,
    this.versionGroup,
  });

  factory PastMoveStatValues.fromJson(Map<String, dynamic> json) =>
      _$PastMoveStatValuesFromJson(json);
  Map<String, dynamic> toJson() => _$PastMoveStatValuesToJson(this);
}

@collection
@JsonSerializable()
class MoveAilment {
  final Id id;
  final String? name;
  final List<NamedApiResource>? moves;
  final List<ApiName>? names;

  MoveAilment({
    required this.id,
    this.name,
    this.moves,
    this.names,
  });

  factory MoveAilment.fromJson(Map<String, dynamic> json) =>
      _$MoveAilmentFromJson(json);
  Map<String, dynamic> toJson() => _$MoveAilmentToJson(this);
}

@collection
@JsonSerializable()
class MoveBattleStyle {
  final Id id;
  final String? name;
  final List<ApiName>? names;

  MoveBattleStyle({
    required this.id,
    this.name,
    this.names,
  });

  factory MoveBattleStyle.fromJson(Map<String, dynamic> json) =>
      _$MoveBattleStyleFromJson(json);
  Map<String, dynamic> toJson() => _$MoveBattleStyleToJson(this);
}

@collection
@JsonSerializable()
class MoveCategory {
  final Id id;
  final String? name;
  final List<NamedApiResource>? moves;
  final List<Description>? descriptions;

  MoveCategory({
    required this.id,
    this.name,
    this.moves,
    this.descriptions,
  });

  factory MoveCategory.fromJson(Map<String, dynamic> json) =>
      _$MoveCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$MoveCategoryToJson(this);
}

@collection
@JsonSerializable()
class MoveDamageClass {
  final Id id;
  final String? name;
  final List<Description>? descriptions;
  final List<NamedApiResource>? moves;
  final List<ApiName>? names;

  MoveDamageClass({
    required this.id,
    this.name,
    this.descriptions,
    this.moves,
    this.names,
  });

  factory MoveDamageClass.fromJson(Map<String, dynamic> json) =>
      _$MoveDamageClassFromJson(json);
  Map<String, dynamic> toJson() => _$MoveDamageClassToJson(this);
}

@collection
@JsonSerializable()
class MoveUrl {
  Id id = Isar.autoIncrement;
  final String url;
  final String name;

  MoveUrl({
    required this.url,
    required this.name,
  });

  @ignore
  get moveId {
    var s = url.split('/');
    return int.parse(s[s.length - 2]);
  }

  factory MoveUrl.fromJson(Map<String, dynamic> json){
    return MoveUrl(
      url: json['url'] as String,
      name: json['name'] as String,
    );
  }
}

@collection
@JsonSerializable()
class MoveLearnMethod {
  final Id id;
  final String? name;
  final List<Description>? descriptions;final List<ApiName>? names;
  @JsonKey(name: 'version_groups')
  final List<NamedApiResource>? versionGroups;

  MoveLearnMethod({
    required this.id,
    this.name,
    this.descriptions,
    this.names,
    this.versionGroups,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) =>
      _$MoveLearnMethodFromJson(json);
  Map<String, dynamic> toJson() => _$MoveLearnMethodToJson(this);
}

@collection
@JsonSerializable()
class MoveTarget {
  final Id id;
  final String? name;
  final List<Description>? descriptions;
  final List<NamedApiResource>? moves;
  final List<ApiName>? names;

  MoveTarget({
    required this.id,
    this.name,
    this.descriptions,
    this.moves,
    this.names,
  });

  factory MoveTarget.fromJson(Map<String, dynamic> json) =>
      _$MoveTargetFromJson(json);
  Map<String, dynamic> toJson() => _$MoveTargetToJson(this);
}