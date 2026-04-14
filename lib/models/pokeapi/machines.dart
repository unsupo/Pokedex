import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'machines.g.dart';

@collection
@JsonSerializable()
class Machine {
  final Id id;
  final NamedApiResource? item;
  final NamedApiResource? move;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  Machine({
    required this.id,
    this.item,
    this.move,
    this.versionGroup,
  });

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
  Map<String, dynamic> toJson() => _$MachineToJson(this);
}