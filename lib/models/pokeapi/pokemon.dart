
import 'package:flutter/cupertino.dart';
import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/models/pokeapi/evolution_chain.dart';
import 'package:pokedex_app/models/pokeapi/pokemon_species.dart';
import 'package:pokedex_app/models/user_data.dart';

import 'pokemon_details.dart';

part 'pokemon.g.dart';

@collection
@JsonSerializable()
class Pokemon with ChangeNotifier {
  final Id id;
  final String name;
  final String url;
  @ignore
  PokemonDetails? details;
  @ignore
  UserData? userData;
  @ignore
  EvolutionChain? evolutionChain;
  @ignore
  PokemonSpecies? species;

  Pokemon({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final String url = json['url'];
    final rawId = json['id'];
    // PokeAPI's list endpoint (GET /pokemon) returns only {name, url}, with
    // no 'id' key. When that's the shape we're given, derive the id from
    // the trailing path segment of the url instead, mirroring the manual
    // parsing already used in PokemonService.getPokemonList().
    final int id;
    if (rawId is int) {
      id = rawId;
    } else {
      final segments = url.split('/');
      id = int.parse(segments[segments.length - 2]);
    }
    return Pokemon(
      id: id,
      name: json['name'],
      url: url,
    );
  }

  // Add this toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'details': details?.toJson()
    };
  }

  // TODO add details to toString, but this could slow down search?
  @override
  String toString() {
    return '$id $name';
  }

  @ignore
  String get imageUrl {
    return details?.sprites?.other
        ?.officialArtwork!.frontDefault ??
        '';
  }
  @ignore
  bool get isCaught {
    return userData?.isCaught ?? false;
  }
  set isCaught(bool isCaught) {
    userData?.isCaught = isCaught;
  }

  // TODO make this come from the api
  @ignore
  get generation {
    if (id <= 151) {
      return 1;
    } else if (id <= 251) {
      return 2;
    } else if (id <= 386) {
      return 3;
    } else if (id <= 493) {
      return 4;
    } else if (id <= 649) {
      return 5;
    } else if (id <= 721) {
      return 6;
    } else if (id <= 809) {
      return 7;
    } else if (id <= 905) {
      return 8;
    } else if (id <= 1010) {
      return 9;
    } else {
      return 0; // Unknown generation
    }
  }

  @ignore
  get types => details?.types?.map((t)=>t.type?.name);

  @ignore
  bool get isDefault => details?.isDefault ?? true;

  @ignore
  bool get hasEvolutions => species?.evolvesFromSpecies != null || evolutionChain!.allPokemonIds.isNotEmpty && evolutionChain!.allPokemonIds.length > 1 || !evolutionChain!.allPokemonIds.contains(id);

  @ignore
  bool get isLoadingDetails => details == null;
}