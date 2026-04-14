import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'locations.g.dart';

@collection
@JsonSerializable()
class Location {
  final Id id;
  final String? name;
  final NamedApiResource? region;
  final List<ApiName>? names;
  @JsonKey(name: 'game_indices')
  final List<GenerationGameIndex>? gameIndices;
  final List<NamedApiResource>? areas;

  Location({
    required this.id,
    this.name,
    this.region,
    this.names,
    this.gameIndices,
    this.areas,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@collection
@JsonSerializable()
class LocationArea {
  final Id id;
  final String? name;
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  @JsonKey(name: 'encounter_method_rates')
  final List<EncounterMethodRate>? encounterMethodRates;
  final NamedApiResource? location;
  final List<ApiName>? names;
  @JsonKey(name: 'pokemon_encounters')
  final List<PokemonEncounter>? pokemonEncounters;

  LocationArea({
    required this.id,
    this.name,
    this.gameIndex,
    this.encounterMethodRates,
    this.location,
    this.names,
    this.pokemonEncounters,
  });

  factory LocationArea.fromJson(Map<String, dynamic> json) =>
      _$LocationAreaFromJson(json);
  Map<String, dynamic> toJson() => _$LocationAreaToJson(this);
}

@embedded
@JsonSerializable()
class EncounterMethodRate {
  @JsonKey(name: 'encounter_method')
  final NamedApiResource? encounterMethod;
  @JsonKey(name: 'version_details')
  final List<EncounterVersionDetails>? versionDetails;

  EncounterMethodRate({
    this.encounterMethod,
    this.versionDetails,
  });

  factory EncounterMethodRate.fromJson(Map<String, dynamic> json) =>
      _$EncounterMethodRateFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterMethodRateToJson(this);
}

@embedded
@JsonSerializable()
class EncounterVersionDetails {
  final int? rate;
  final NamedApiResource? version;

  EncounterVersionDetails({
    this.rate,
    this.version,
  });

  factory EncounterVersionDetails.fromJson(Map<String, dynamic> json) =>
      _$EncounterVersionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$EncounterVersionDetailsToJson(this);
}

@embedded
@JsonSerializable()
class PokemonEncounter {
  @JsonKey(name: 'pokemon')
  final NamedApiResource? pokemon;
  @JsonKey(name: 'version_details')
  final List<VersionEncounterDetail>? versionDetails;

  PokemonEncounter({
    this.pokemon,
    this.versionDetails,
  });

  factory PokemonEncounter.fromJson(Map<String, dynamic> json) =>
      _$PokemonEncounterFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEncounterToJson(this);
}

@collection
@JsonSerializable()
class PalParkArea {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  @JsonKey(name: 'pokemon_encounters')
  final List<PalParkEncounterSpecies>? pokemonEncounters;

  PalParkArea({
    required this.id,
    this.name,
    this.names,
    this.pokemonEncounters,
  });

  factory PalParkArea.fromJson(Map<String, dynamic> json) =>
      _$PalParkAreaFromJson(json);
  Map<String, dynamic> toJson() => _$PalParkAreaToJson(this);
}

@embedded
@JsonSerializable()
class PalParkEncounterSpecies {
  @JsonKey(name: 'base_score')
  final int? baseScore;
  final int? rate;
  @JsonKey(name: 'pokemon_species')
  final NamedApiResource? pokemonSpecies;

  PalParkEncounterSpecies({
    this.baseScore,
    this.rate,
    this.pokemonSpecies,
  });

  factory PalParkEncounterSpecies.fromJson(Map<String, dynamic> json) =>
      _$PalParkEncounterSpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$PalParkEncounterSpeciesToJson(this);
}

@collection
@JsonSerializable()
class Region {
  final Id id;
  final String? name;
  final List<NamedApiResource>? locations;
  @JsonKey(name: 'main_generation')
  final NamedApiResource? mainGeneration;
  final List<ApiName>? names;
  final List<NamedApiResource>? pokedexes;
  @JsonKey(name: 'version_groups')
  final List<NamedApiResource>? versionGroups;

  Region({
    required this.id,
    this.name,
    this.locations,
    this.mainGeneration,
    this.names,
    this.pokedexes,
    this.versionGroups,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}