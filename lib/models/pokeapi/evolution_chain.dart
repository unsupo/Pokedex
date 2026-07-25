import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';

import 'pokemon_details.dart';

part 'evolution_chain.g.dart';

@collection
@JsonSerializable()
class EvolutionChain {
  final Id id;
  final ChainLink chain;
  @JsonKey(name: 'baby_trigger_item')
  final NamedApiResource? babyTriggerItem;
  @ignore
  bool? _isLoading = true;
  @ignore
  bool get isLoading => _isLoading ?? true;
  set isLoading (bool isLoading) => _isLoading = isLoading;

  EvolutionChain({
    required this.id,
    required this.chain,
    this.babyTriggerItem,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    return EvolutionChain(
      id: json['id'],
      chain: ChainLink.fromJson(json['chain'] as Map<String, dynamic>),
      babyTriggerItem: json['baby_trigger_item'] == null ? null : NamedApiResource.fromJson(json['baby_trigger_item'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);

  @ignore
  List<int> get allPokemonIds {
    Set<int> pokemonIds = {}; // Use a Set to avoid duplicates

    void extractIds(ChainLink chainLink) {
      // Extract ID from species URL
      final speciesUrl = chainLink.species?.url;
      if (speciesUrl != null) {
        final parts = speciesUrl.split('/');
        if (parts.isNotEmpty) {
          final id = int.tryParse(parts[parts.length - 2]);
          if (id != null) {
            pokemonIds.add(id);
          }
        }
      }

      // Recursively traverse evolvesTo
      if (chainLink.evolvesTo != null) {
        for (final link in chainLink.evolvesTo!) {
          extractIds(link);
        }
      }
    }

    extractIds(chain);
    return pokemonIds.toList();
  }
}
@embedded
@JsonSerializable()
class ChainLink {
  @JsonKey(name: 'is_baby')
  final bool? isBaby;
  final Species? species;
  @JsonKey(name: 'evolves_to')
  final List<ChainLink>? evolvesTo;
  @JsonKey(name: 'evolution_details')
  final List<EvolutionDetail>? evolutionDetails;

  ChainLink({
    this.isBaby,
    this.species,
    this.evolvesTo,
    this.evolutionDetails,
  });

  factory ChainLink.fromJson(Map<String, dynamic> json) =>
      _$ChainLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ChainLinkToJson(this);
}

@embedded
@JsonSerializable()
class EvolutionDetail {
  final Species? item;
  final Species? trigger;
  @JsonKey(name: 'gender')
  final int? gender;
  @JsonKey(name: 'held_item')
  final Species? heldItem;
  @JsonKey(name: 'known_move')
  final Species? knownMove;
  @JsonKey(name: 'known_move_type')
  final Species? knownMoveType;
  @JsonKey(name: 'location')
  final Species? location;
  @JsonKey(name: 'min_level')
  final int? minLevel;
  @JsonKey(name: 'min_happiness')
  final int? minHappiness;
  @JsonKey(name: 'min_beauty')
  final int? minBeauty;
  @JsonKey(name: 'min_affection')
  final int? minAffection;
  @JsonKey(name: 'needs_overworld_rain')
  final bool? needsOverworldRain;
  @JsonKey(name: 'party_species')
  final Species? partySpecies;
  @JsonKey(name: 'party_type')
  final Species? partyType;
  @JsonKey(name: 'relative_physical_stats')
  final int? relativePhysicalStats;
  @JsonKey(name: 'time_of_day')
  final String? timeOfDay;
  @JsonKey(name: 'trade_species')
  final Species? tradeSpecies;
  @JsonKey(name: 'turn_upside_down')
  final bool? turnUpsideDown;

  EvolutionDetail({
    this.item,
    this.trigger,
    this.gender,
    this.heldItem,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minLevel,
    this.minHappiness,
    this.minBeauty,
    this.minAffection,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.turnUpsideDown,
  });

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailToJson(this);
}