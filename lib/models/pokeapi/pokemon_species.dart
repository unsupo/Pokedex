import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_details.dart';

part 'pokemon_species.g.dart';

@collection
@JsonSerializable()
class PokemonSpecies {
  Id id;
  @JsonKey(name: 'base_happiness')
  int? baseHappiness;
  @JsonKey(name: 'capture_rate')
  int? captureRate;
  @JsonKey(name: 'color')
  Species? color;
  @JsonKey(name: 'egg_groups')
  List<Species>? eggGroups;
  @JsonKey(name: 'evolution_chain')
  @ignore
  EvolutionChainUrl? evolutionChain;
  @JsonKey(name: 'evolves_from_species')
  Species? evolvesFromSpecies;
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorText>? flavorTextEntries;
  @JsonKey(name: 'form_descriptions')
  List<FormDescription>? formDescriptions;
  @JsonKey(name: 'forms_switchable')
  bool? formsSwitchable;
  @JsonKey(name: 'gender_rate')
  int? genderRate;
  @JsonKey(name: 'genera')
  List<Genus>? genera;
  @JsonKey(name: 'generation')
  Species? generation;
  @JsonKey(name: 'growth_rate')
  Species? growthRate;
  @JsonKey(name: 'habitat')
  Species? habitat;
  @JsonKey(name: 'has_gender_differences')
  bool? hasGenderDifferences;
  @JsonKey(name: 'hatch_counter')
  int? hatchCounter;
  @JsonKey(name: 'is_baby')
  bool? isBaby;
  @JsonKey(name: 'is_legendary')
  bool? isLegendary;
  @JsonKey(name: 'is_mythical')
  bool? isMythical;
  String? name;
  List<Name>? names;
  int? order;
  @JsonKey(name: 'pal_park_encounters')
  List<PalParkEncounter>? palParkEncounters;
  @JsonKey(name: 'pokedex_numbers')
  List<PokedexNumber>? pokedexNumbers;
  @JsonKey(name: 'shape')
  Species? shape;
  List<Species>? varieties;

  PokemonSpecies({
    required this.id,
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    this.hasGenderDifferences,
    this.hatchCounter,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesToJson(this);

}
@embedded
@JsonSerializable()
class FormDescription {
  final String? description;
  final Species? language;

  FormDescription({
    this.description,
    this.language,
  });

  factory FormDescription.fromJson(Map<String, dynamic> json) =>
      _$FormDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$FormDescriptionToJson(this);
}
@collection
@JsonSerializable()
class EvolutionChainUrl {
  Id id = Isar.autoIncrement;
  final String url;

  EvolutionChainUrl({
    required this.url,
  });

  @ignore
  get pokemonId {
    var s = url.split('/');
    return int.parse(s[s.length - 2]);
  }

  factory EvolutionChainUrl.fromJson(Map<String, dynamic> json){
    return EvolutionChainUrl(
      url: json['url'] as String,
    );
  }
}

@embedded
@JsonSerializable()
class FlavorText {
  @JsonKey(name: 'flavor_text')
  String? flavorText;
  @JsonKey(name: 'language')
  Species? language;
  @JsonKey(name: 'version')
  Species? version;

  FlavorText({
    this.flavorText,
    this.language,
    this.version,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);
}

@embedded
@JsonSerializable()
class Genus {
  @JsonKey(name: 'genus')
  String? genus;
  @JsonKey(name: 'language')
  Species? language;

  Genus({
    this.genus,
    this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  Map<String, dynamic> toJson() => _$GenusToJson(this);
}

@embedded
@JsonSerializable()
class Name {
  @JsonKey(name: 'language')
  Species? language;
  @JsonKey(name: 'name')
  String? name;

  Name({
    this.language,
    this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@embedded
@JsonSerializable()
class PalParkEncounter {
  @JsonKey(name: 'area')
  Species? area;
  @JsonKey(name: 'base_score')
  int? baseScore;
  @JsonKey(name: 'rate')
  int? rate;

  PalParkEncounter({
    this.area,
    this.baseScore,
    this.rate,
  });

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      _$PalParkEncounterFromJson(json);

  Map<String, dynamic> toJson() => _$PalParkEncounterToJson(this);
}

@embedded
@JsonSerializable()
class PokedexNumber {
  @JsonKey(name: 'entry_number')
  int? entryNumber;
  @JsonKey(name: 'pokedex')
  Species? pokedex;

  PokedexNumber({
    this.entryNumber,
    this.pokedex,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) =>
      _$PokedexNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexNumberToJson(this);
}