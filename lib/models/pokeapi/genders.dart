import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'genders.g.dart';

@collection
@JsonSerializable()
class Gender {
  final Id id;
  final String? name;
  @JsonKey(name: 'pokemon_species_details')
  final List<PokemonSpeciesGender>? pokemonSpeciesDetails;
  @JsonKey(name: 'required_for_evolution')
  final List<NamedApiResource>? requiredForEvolution;

  Gender({
    required this.id,
    this.name,
    this.pokemonSpeciesDetails,
    this.requiredForEvolution,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
  Map<String, dynamic> toJson() => _$GenderToJson(this);
}

@embedded
@JsonSerializable()
class PokemonSpeciesGender {
  final int? rate;
  @JsonKey(name: 'pokemon_species')
  final NamedApiResource? pokemonSpecies;

  PokemonSpeciesGender({
    this.rate,
    this.pokemonSpecies,
  });

  factory PokemonSpeciesGender.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesGenderFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpeciesGenderToJson(this);
}