import 'package:isar_community/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'utility.dart';

part 'items.g.dart';

@collection
@JsonSerializable()
class Item {
  final Id id;
  final String? name;
  final int? cost;
  @JsonKey(name: 'fling_power')
  final int? flingPower;
  @JsonKey(name: 'fling_effect')
  final NamedApiResource? flingEffect;
  final List<NamedApiResource>? attributes;
  final NamedApiResource? category;
  @JsonKey(name: 'effect_entries')
  final List<VerboseEffect>? effectEntries;
  @JsonKey(name: 'flavor_text_entries')
  final List<VersionGroupFlavorText>? flavorTextEntries;
  @JsonKey(name: 'game_indices')
  final List<GenerationGameIndex>? gameIndices;
  final List<ApiName>? names;
  final ItemSprites? sprites;
  @JsonKey(name: 'held_by_pokemon')
  final List<ItemHolderPokemon>? heldByPokemon;
  @JsonKey(name: 'baby_trigger_for')
  final ApiResource? babyTriggerFor;
  final List<MachineVersionDetail>? machines;

  Item({
    required this.id,
    this.name,
    this.cost,
    this.flingPower,
    this.flingEffect,
    this.attributes,
    this.category,
    this.effectEntries,
    this.flavorTextEntries,
    this.gameIndices,
    this.names,
    this.sprites,
    this.heldByPokemon,
    this.babyTriggerFor,
    this.machines,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@embedded
@JsonSerializable()
class ItemSprites {
  @JsonKey(name: 'default')
  final String? defaultSprite;

  ItemSprites({
    this.defaultSprite,
  });

  factory ItemSprites.fromJson(Map<String, dynamic> json) =>
      _$ItemSpritesFromJson(json);
  Map<String, dynamic> toJson() => _$ItemSpritesToJson(this);
}

@embedded
@JsonSerializable()
class ItemHolderPokemon {
  final NamedApiResource? pokemon;
  @JsonKey(name: 'version_details')
  final List<ItemHolderPokemonVersionDetail>? versionDetails;

  ItemHolderPokemon({
    this.pokemon,
    this.versionDetails,
  });

  factory ItemHolderPokemon.fromJson(Map<String, dynamic> json) =>
      _$ItemHolderPokemonFromJson(json);
  Map<String, dynamic> toJson() => _$ItemHolderPokemonToJson(this);
}

@embedded
@JsonSerializable()
class ItemHolderPokemonVersionDetail {
  final int? rarity;
  final NamedApiResource? version;

  ItemHolderPokemonVersionDetail({
    this.rarity,
    this.version,
  });

  factory ItemHolderPokemonVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemHolderPokemonVersionDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ItemHolderPokemonVersionDetailToJson(this);
}

@collection
@JsonSerializable()
class ItemAttribute {
  final Id id;
  final String? name;
  final List<NamedApiResource>? items;
  final List<ApiName>? names;
  final List<Description>? descriptions;

  ItemAttribute({
    required this.id,
    this.name,
    this.items,
    this.names,
    this.descriptions,
  });

  factory ItemAttribute.fromJson(Map<String, dynamic> json) =>
      _$ItemAttributeFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAttributeToJson(this);
}

@collection
@JsonSerializable()
class ItemCategory {
  final Id id;
  final String? name;
  final List<NamedApiResource>? items;
  final List<ApiName>? names;
  final NamedApiResource? pocket;

  ItemCategory({required this.id,
    this.name,
    this.items,
    this.names,
    this.pocket,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ItemCategoryToJson(this);
}

@collection
@JsonSerializable()
class ItemFlingEffect {
  final Id id;
  final String? name;
  @JsonKey(name: 'effect_entries')
  final List<Effect>? effectEntries;
  final List<NamedApiResource>? items;

  ItemFlingEffect({
    required this.id,
    this.name,
    this.effectEntries,
    this.items,
  });

  factory ItemFlingEffect.fromJson(Map<String, dynamic> json) =>
      _$ItemFlingEffectFromJson(json);
  Map<String, dynamic> toJson() => _$ItemFlingEffectToJson(this);
}

@collection
@JsonSerializable()
class ItemPocket {
  final Id id;
  final String? name;
  final List<NamedApiResource>? categories;
  final List<ApiName>? names;

  ItemPocket({
    required this.id,
    this.name,
    this.categories,
    this.names,
  });

  factory ItemPocket.fromJson(Map<String, dynamic> json) =>
      _$ItemPocketFromJson(json);
  Map<String, dynamic> toJson() => _$ItemPocketToJson(this);
}