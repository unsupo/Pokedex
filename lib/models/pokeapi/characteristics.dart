import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'characteristics.g.dart';

@collection
@JsonSerializable()
class Characteristic {
  final Id id;
  @JsonKey(name: 'gene_modulo')
  final int? geneModulo;
  @JsonKey(name: 'possible_values')
  final List<int>? possibleValues;
  @JsonKey(name: 'highest_stat')
  final NamedApiResource? highestStat;
  final List<Description>? descriptions;

  Characteristic({
    required this.id,
    this.geneModulo,
    this.possibleValues,
    this.highestStat,
    this.descriptions
  });

  factory Characteristic.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicFromJson(json);
  Map<String, dynamic> toJson() => _$CharacteristicToJson(this);
}