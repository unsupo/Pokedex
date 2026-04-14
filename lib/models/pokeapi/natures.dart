import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'natures.g.dart';

@collection
@JsonSerializable()
class Nature {
  final Id id;
  final String? name;
  @JsonKey(name: 'decreased_stat')
  final NamedApiResource? decreasedStat;
  @JsonKey(name: 'increased_stat')
  final NamedApiResource? increasedStat;
  @JsonKey(name: 'hates_flavor')
  final NamedApiResource? hatesFlavor;
  @JsonKey(name: 'likes_flavor')
  final NamedApiResource? likesFlavor;
  @JsonKey(name: 'pokeathlon_stat_changes')
  final List<NatureStatChange>? pokeathlonStatChanges;
  @JsonKey(name: 'move_battle_style_preferences')
  final List<MoveBattleStylePreference>? moveBattleStylePreferences;
  final List<ApiName>? names;

  Nature({
    required this.id,
    this.name,
    this.decreasedStat,
    this.increasedStat,
    this.hatesFlavor,
    this.likesFlavor,
    this.pokeathlonStatChanges,
    this.moveBattleStylePreferences,
    this.names,
  });

  factory Nature.fromJson(Map<String, dynamic> json) => _$NatureFromJson(json);
  Map<String, dynamic> toJson() => _$NatureToJson(this);
}

@embedded
@JsonSerializable()
class NatureStatChange {
  @JsonKey(name: 'max_change')
  final int? maxChange;
  @JsonKey(name: 'pokeathlon_stat')
  final NamedApiResource? pokeathlonStat;

  NatureStatChange({
    this.maxChange,
    this.pokeathlonStat,
  });

  factory NatureStatChange.fromJson(Map<String, dynamic> json) =>
      _$NatureStatChangeFromJson(json);
  Map<String, dynamic> toJson() => _$NatureStatChangeToJson(this);
}

@embedded
@JsonSerializable()
class MoveBattleStylePreference {
  @JsonKey(name: 'low_hp_preference')
  final double? lowHpPreference;
  @JsonKey(name: 'high_hp_preference')
  final double? highHpPreference;
  @JsonKey(name: 'move_battle_style')
  final NamedApiResource? moveBattleStyle;

  MoveBattleStylePreference({
    this.lowHpPreference,
    this.highHpPreference,
    this.moveBattleStyle,
  });

  factory MoveBattleStylePreference.fromJson(Map<String, dynamic> json) =>
      _$MoveBattleStylePreferenceFromJson(json);
  Map<String, dynamic> toJson() => _$MoveBattleStylePreferenceToJson(this);
}