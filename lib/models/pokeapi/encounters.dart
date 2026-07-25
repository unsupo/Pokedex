import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'encounters.g.dart';

@collection
@JsonSerializable()
class EncounterMethod {
  final Id id;
  final String? name;
  final int? order;
  final List<ApiName>? names;

  EncounterMethod({
    required this.id,
    this.name,
    this.order,
    this.names,
  });

  factory EncounterMethod.fromJson(Map<String, dynamic> json) =>
      _$EncounterMethodFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterMethodToJson(this);
}

@collection
@JsonSerializable()
class EncounterCondition {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  final List<NamedApiResource>? values;

  EncounterCondition({
    required this.id,
    this.name,
    this.names,
    this.values,
  });

  factory EncounterCondition.fromJson(Map<String, dynamic> json) =>
      _$EncounterConditionFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterConditionToJson(this);
}

@collection
@JsonSerializable()
class EncounterConditionValue {
  final Id id;
  final String? name;
  final NamedApiResource? condition;
  final List<ApiName>? names;

  EncounterConditionValue({
    required this.id,
    this.name,
    this.condition,
    this.names,
  });

  factory EncounterConditionValue.fromJson(Map<String, dynamic> json) =>
      _$EncounterConditionValueFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterConditionValueToJson(this);
}