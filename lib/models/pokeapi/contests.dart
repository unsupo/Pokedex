import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'contests.g.dart';

@collection
@JsonSerializable()
class ContestType {
  final Id id;
  final String? name;
  @JsonKey(name: 'berry_flavor')
  final NamedApiResource? berryFlavor;
  final List<ContestName>? names;

  ContestType({
    required this.id,
    this.name,
    this.berryFlavor,
    this.names,
  });

  factory ContestType.fromJson(Map<String, dynamic> json) =>
      _$ContestTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ContestTypeToJson(this);
}

@embedded
@JsonSerializable()
class ContestName {
  final String? name;
  final String? color;
  final NamedApiResource? language;

  ContestName({
    this.name,
    this.color,
    this.language,
  });

  factory ContestName.fromJson(Map<String, dynamic> json) =>
      _$ContestNameFromJson(json);
  Map<String, dynamic> toJson() => _$ContestNameToJson(this);
}