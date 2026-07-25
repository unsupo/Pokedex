import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'stat.g.dart';

@collection
@JsonSerializable()
class Stat {
  final Id id;
  final String? name;
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  @JsonKey(name: 'is_battle_only')
  final bool? isBattleOnly;
  @JsonKey(name: 'affecting_moves')
  final MoveStatAffectSets? affectingMoves;
  @JsonKey(name: 'affecting_natures')
  final NatureStatAffectSets? affectingNatures;
  final List<ApiResource>? characteristics;
  @JsonKey(name: 'move_damage_class')
  final NamedApiResource? moveDamageClass;
  final List<ApiName>? names;

  Stat({
    required this.id,
    this.name,
    this.gameIndex,
    this.isBattleOnly,
    this.affectingMoves,
    this.affectingNatures,
    this.characteristics,
    this.moveDamageClass,
    this.names,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@embedded
@JsonSerializable()
class MoveStatAffectSets {
  final List<MoveStatAffect>? increase;
  final List<MoveStatAffect>? decrease;

  MoveStatAffectSets({
    this.increase,
    this.decrease,
  });

  factory MoveStatAffectSets.fromJson(Map<String, dynamic> json) =>
      _$MoveStatAffectSetsFromJson(json);
  Map<String, dynamic> toJson() => _$MoveStatAffectSetsToJson(this);
}

@embedded
@JsonSerializable()
class MoveStatAffect {
  final int? change;
  final NamedApiResource? move;

  MoveStatAffect({
    this.change,
    this.move,
  });

  factory MoveStatAffect.fromJson(Map<String, dynamic> json) =>
      _$MoveStatAffectFromJson(json);
  Map<String, dynamic> toJson() => _$MoveStatAffectToJson(this);
}

@embedded
@JsonSerializable()
class NatureStatAffectSets {
  final List<NamedApiResource>? increase;
  final List<NamedApiResource>? decrease;

  NatureStatAffectSets({
    this.increase,
    this.decrease,
  });

  factory NatureStatAffectSets.fromJson(Map<String, dynamic> json) =>
      _$NatureStatAffectSetsFromJson(json);
  Map<String, dynamic> toJson() => _$NatureStatAffectSetsToJson(this);
}