import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'games.g.dart';

@collection
@JsonSerializable()
class Generation {
  final Id id;
  final String? name;
  final List<NamedApiResource>? abilities;
  final List<ApiName>? names;
  @JsonKey(name: 'main_region')
  final NamedApiResource? mainRegion;
  final List<NamedApiResource>? moves;
  @JsonKey(name: 'pokemon_species')
  final List<NamedApiResource>? pokemonSpecies;
  final List<NamedApiResource>? types;
  @JsonKey(name: 'version_groups')
  final List<NamedApiResource>? versionGroups;

  Generation({
    required this.id,
    this.name,
    this.abilities,
    this.names,
    this.mainRegion,
    this.moves,
    this.pokemonSpecies,
    this.types,
    this.versionGroups,
  });

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);
  Map<String, dynamic> toJson() => _$GenerationToJson(this);
}

@collection
@JsonSerializable()
class Pokedex {
  final Id id;
  final String? name;
  @JsonKey(name: 'is_main_series')
  final bool? isMainSeries;
  final List<Description>? descriptions;
  final List<ApiName>? names;
  @JsonKey(name: 'pokemon_entries')
  final List<PokemonEntry>? pokemonEntries;
  final NamedApiResource? region;
  @JsonKey(name: 'version_groups')
  final List<NamedApiResource>? versionGroups;

  Pokedex({
    required this.id,
    this.name,
    this.isMainSeries,
    this.descriptions,
    this.names,
    this.pokemonEntries,
    this.region,
    this.versionGroups,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => _$PokedexFromJson(json);
  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}

@embedded
@JsonSerializable()
class PokemonEntry {
  @JsonKey(name: 'entry_number')
  final int? entryNumber;
  @JsonKey(name: 'pokemon_species')
  final NamedApiResource? pokemonSpecies;

  PokemonEntry({
    this.entryNumber,
    this.pokemonSpecies,
  });

  factory PokemonEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntryFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEntryToJson(this);
}

@collection
@JsonSerializable()
class Version {
  final Id id;
  final String? name;
  final List<ApiName>? names;
  @JsonKey(name: 'version_group')
  final NamedApiResource? versionGroup;

  Version({
    required this.id,
    this.name,
    this.names,
    this.versionGroup,
  });

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

@collection
@JsonSerializable()
class VersionGroup {
  final Id id;
  final String? name;
  final int? order;
  final NamedApiResource? generation;
  @JsonKey(name: 'move_learn_methods')
  final List<NamedApiResource>? moveLearnMethods;
  final List<NamedApiResource>? pokedexes;
  final List<NamedApiResource>? regions;
  final List<NamedApiResource>? versions;

  VersionGroup({
    required this.id,
    this.name,
    this.order,
    this.generation,
    this.moveLearnMethods,
    this.pokedexes,
    this.regions,
    this.versions,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupFromJson(json);
  Map<String, dynamic> toJson() => _$VersionGroupToJson(this);
}