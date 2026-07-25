import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';

part 'egg_groups.g.dart';

@collection
@JsonSerializable()
class EggGroup {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  @JsonKey(name: 'pokemon_species')
  final List<NamedApiResource>? pokemonSpecies;

  EggGroup({
    required this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  factory EggGroup.fromJson(Map<String, dynamic> json) =>
      _$EggGroupFromJson(json);
  Map<String, dynamic> toJson() => _$EggGroupToJson(this);
}