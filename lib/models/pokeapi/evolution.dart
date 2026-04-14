import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'evolution.g.dart';

@collection
@JsonSerializable()
class EvolutionTrigger {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  @JsonKey(name: 'pokemon_species')
  final List<NamedApiResource>? pokemonSpecies;

  EvolutionTrigger({
    required this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  factory EvolutionTrigger.fromJson(Map<String, dynamic> json) =>
      _$EvolutionTriggerFromJson(json);
  Map<String, dynamic> toJson() => _$EvolutionTriggerToJson(this);
}