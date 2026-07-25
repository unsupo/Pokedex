import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'pokeathlonstat.g.dart';

@collection
@JsonSerializable()
class PokeathlonStat {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  @JsonKey(name: 'affecting_natures')
  final NaturePokeathlonStatAffectSets? affectingNatures;

  PokeathlonStat({
    required this.id,
    this.name,
    this.names,
    this.affectingNatures,
  });

  factory PokeathlonStat.fromJson(Map<String, dynamic> json) =>
      _$PokeathlonStatFromJson(json);
  Map<String, dynamic> toJson() => _$PokeathlonStatToJson(this);
}

@embedded
@JsonSerializable()
class NaturePokeathlonStatAffectSets {
  final List<NaturePokeathlonStatAffect>? increase;
  final List<NaturePokeathlonStatAffect>? decrease;

  NaturePokeathlonStatAffectSets({
    this.increase,
    this.decrease,
  });

  factory NaturePokeathlonStatAffectSets.fromJson(Map<String, dynamic> json) =>
      _$NaturePokeathlonStatAffectSetsFromJson(json);
  Map<String, dynamic> toJson() => _$NaturePokeathlonStatAffectSetsToJson(this);
}

@embedded
@JsonSerializable()
class NaturePokeathlonStatAffect {
  @JsonKey(name: 'max_change')
  final int? maxChange;
  final NamedApiResource? nature;

  NaturePokeathlonStatAffect({
    this.maxChange,
    this.nature,
  });

  factory NaturePokeathlonStatAffect.fromJson(Map<String, dynamic> json) =>
      _$NaturePokeathlonStatAffectFromJson(json);
  Map<String, dynamic> toJson() => _$NaturePokeathlonStatAffectToJson(this);
}