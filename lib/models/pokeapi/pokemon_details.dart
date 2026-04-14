import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details.g.dart';

@collection
@JsonSerializable()
class PokemonDetails {
  final Id id;
  final String? name;
  @JsonKey(name: 'base_experience')
  final int? baseExperience; // Can be null
  final int? height;
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  final int? order;
  final int? weight;
  final List<AbilityName>? abilities;
  final List<Species>? forms;
  @JsonKey(name: 'game_indices')
  final List<GameIndex>? gameIndices;
  @JsonKey(name: 'held_items')
  final List<HeldItem>? heldItems;
  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  final List<MoveName>? moves;
  final Species? species;
  final Sprites? sprites;
  final List<StatInfo>? stats;
  final List<PokemonType>? types;

  PokemonDetails({
    required this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.locationAreaEncounters,
    this.moves,
    this.species,
    this.sprites,
    this.stats,
    this.types,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);

  @override
  String toString() {
    return '''
PokemonDetails {
  id: $id,
  baseExperience: $baseExperience,
  height: $height,
  isDefault: $isDefault,
  order: $order,
  weight: $weight,
  abilities: ${abilities?.map((a) => '${a.ability?.name} ${a.isHidden??false?'hidden':''}').toList()},
  forms: ${forms?.map((f) => f.name).toList()},
  gameIndices: ${gameIndices?.map((gi) => gi..toString()).toList()},
  heldItems: ${heldItems?.map((hi) => hi.item?.name).toList()},
  locationAreaEncounters: $locationAreaEncounters,
  moves: ${moves?.map((m) => m.move?.name).toList()},
  species: ${species?.name},
  stats: ${stats?.map((s) => s.toString()).toList()},
  types: ${types?.map((t) => t.type?.name).toList()},
}
    ''';
  }
}

@embedded
@JsonSerializable()
class AbilityName {
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;
  final Species? ability;

  AbilityName({
    this.isHidden,
    this.slot,
    this.ability,
  });

  factory AbilityName.fromJson(Map<String, dynamic> json) =>
      _$AbilityNameFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityNameToJson(this);

  @override
  String toString() {
    return '${ability?.name} (${isHidden??false?'hidden':''})';
  }
}

@embedded
@JsonSerializable()
class Species {
  final String? name;
  final String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);

  @ignore
  get id{
    var s = url?.split('/');
    return int.parse(s![s.length - 2]);
  }
}

@embedded
@JsonSerializable()
class GameIndex {
  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final Species? version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);
  Map<String, dynamic> toJson() => _$GameIndexToJson(this);
}

@embedded
@JsonSerializable()
class HeldItem {
  final Species? item;
  @JsonKey(name: 'version_details')
  final List<VersionDetail>? versionDetails;

  HeldItem({
    this.item,
    this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) =>
      _$HeldItemFromJson(json);
  Map<String, dynamic> toJson() => _$HeldItemToJson(this);
}

@embedded
@JsonSerializable()
class VersionDetail {
  final int? rarity;
  final Species? version;

  VersionDetail({
    this.rarity,
    this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);
  Map<String, dynamic> toJson() => _$VersionDetailToJson(this);
}

@embedded
@JsonSerializable()
class MoveName {
  final Species? move;
  @JsonKey(name: 'version_group_details')
  final List<VersionGroupDetail>? versionGroupDetails;

  MoveName({
    this.move,
    this.versionGroupDetails,
  });

  factory MoveName.fromJson(Map<String, dynamic> json) => _$MoveNameFromJson(json);
  Map<String, dynamic> toJson() => _$MoveNameToJson(this);
}

@embedded
@JsonSerializable()
class VersionGroupDetail {
  @JsonKey(name: 'level_learned_at')
  final int? levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  final Species? moveLearnMethod;
  @JsonKey(name: 'version_group')
  final Species? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailFromJson(json);
  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);
}

@embedded
@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  final OtherSprite? other;
  final Versions? versions;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}
@embedded
@JsonSerializable()
class OtherSprite {
  @JsonKey(name: 'dream_world')
  final DreamWorld? dreamWorld;
  final Home? home;
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  OtherSprite({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  factory OtherSprite.fromJson(Map<String, dynamic> json) =>
      _$OtherSpriteFromJson(json);
  Map<String, dynamic> toJson() => _$OtherSpriteToJson(this);
}
@embedded
@JsonSerializable()
class DreamWorld {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);
  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}
@embedded
@JsonSerializable()
class Home {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}
@embedded
@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);
  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

@embedded
@JsonSerializable()
class StatInfo {
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;
  final Species? stat;

  StatInfo({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory StatInfo.fromJson(Map<String, dynamic> json) => _$StatInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StatInfoToJson(this);


  @override
  String toString() {
    return '${stat?.name}: $baseStat ${effort != 0 ? 'EV-${stat?.name}: $effort':''}';
  }
}

@embedded
@JsonSerializable()
class PokemonType {
  final int? slot;
  final Species? type;

  PokemonType({
    this.slot,
    this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
@embedded
@JsonSerializable()
class Versions {
  @JsonKey(name: 'generation-i')
  final GenerationDetails? generationI;
  @JsonKey(name: 'generation-ii')
  final GenerationDetails? generationIi;
  @JsonKey(name: 'generation-iii')
  final GenerationDetails? generationIii;
  @JsonKey(name: 'generation-iv')
  final GenerationDetails? generationIv;
  @JsonKey(name: 'generation-v')
  final GenerationDetails? generationV;
  @JsonKey(name: 'generation-vi')
  final GenerationDetails? generationVi;
  @JsonKey(name: 'generation-vii')
  final GenerationDetails? generationVii;
  @JsonKey(name: 'generation-viii')
  final GenerationDetails? generationViii;

  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
  Map<String, dynamic> toJson() => _$VersionsToJson(this);
}

@embedded
@JsonSerializable()
class GenerationDetails {
  @JsonKey(name: 'red-blue')
  final RedBlue? redBlue;
  final RedBlue? yellow;
  final Gold? gold;
  final Gold? silver;
  final Gold? crystal;
  @JsonKey(name: 'rubysapphire')
  final RubySapphire? rubySapphire;
  final RubySapphire? emerald;
  @JsonKey(name: 'firered-leafgreen')
  final FireRedLeafGreen? fireRedLeafGreen;
  @JsonKey(name: 'diamond-pearl')
  final DiamondPearl? diamondPearl;
  final DiamondPearl? platinum;
  @JsonKey(name: 'heartgold-soulsilver')
  final HeartGoldSoulSilver? heartGoldSoulSilver;
  @JsonKey(name: 'black-white')
  final BlackWhite? blackWhite;
  @JsonKey(name: 'x-y')
  final Xy? xy;
  @JsonKey(name: 'omegaruby-alphasapphire')
  final OmegarubyAlphasapphire? omegaRubyAlphaSapphire;
  final Icons? icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  final Icons? ultraSunUltraMoon;
  final Animated? animated;

  GenerationDetails({
    this.redBlue,
    this.yellow,
    this.gold,
    this.silver,
    this.crystal,
    this.rubySapphire,
    this.emerald,
    this.fireRedLeafGreen,
    this.diamondPearl,
    this.platinum,
    this.heartGoldSoulSilver,
    this.blackWhite,
    this.xy,
    this.omegaRubyAlphaSapphire,
    this.icons,
    this.ultraSunUltraMoon,
    this.animated,
  });

  factory GenerationDetails.fromJson(Map<String, dynamic> json) =>
      _$GenerationDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$GenerationDetailsToJson(this);
}

@embedded
@JsonSerializable()
class RedBlue {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_gray')
  final String? backGray;
  @JsonKey(name: 'back_transparent')
  final String? backTransparent;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_gray')
  final String? frontGray;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) =>
      _$RedBlueFromJson(json);
  Map<String, dynamic> toJson() => _$RedBlueToJson(this);
}

@embedded
@JsonSerializable()
class Gold {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_transparent')
  final String? backTransparent;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_transparent')
  final String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);
  Map<String, dynamic> toJson() => _$GoldToJson(this);
}

@embedded
@JsonSerializable()
class RubySapphire {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  RubySapphire({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory RubySapphire.fromJson(Map<String, dynamic> json) =>
      _$RubySapphireFromJson(json);
  Map<String, dynamic> toJson() => _$RubySapphireToJson(this);
}
@embedded
@JsonSerializable()
class FireRedLeafGreen {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;

  FireRedLeafGreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireRedLeafGreen.fromJson(Map<String, dynamic> json) =>
      _$FireRedLeafGreenFromJson(json);
  Map<String, dynamic> toJson() => _$FireRedLeafGreenToJson(this);
}
@embedded
@JsonSerializable()
class DiamondPearl {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  DiamondPearl({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory DiamondPearl.fromJson(Map<String, dynamic> json) =>
      _$DiamondPearlFromJson(json);
  Map<String, dynamic> toJson() => _$DiamondPearlToJson(this);
}

@embedded
@JsonSerializable()
class HeartGoldSoulSilver {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  HeartGoldSoulSilver({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HeartGoldSoulSilver.fromJson(Map<String, dynamic> json) =>
      _$HeartGoldSoulSilverFromJson(json);
  Map<String, dynamic> toJson() => _$HeartGoldSoulSilverToJson(this);
}
@embedded
@JsonSerializable()
class BlackWhite {
  final Animated? animated;
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  BlackWhite({
    this.animated,
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory BlackWhite.fromJson(Map<String, dynamic> json) =>
      _$BlackWhiteFromJson(json);
  Map<String, dynamic> toJson() => _$BlackWhiteToJson(this);
}
@embedded
@JsonSerializable()
class Animated {
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Animated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Animated.fromJson(Map<String, dynamic> json) =>
      _$AnimatedFromJson(json);
  Map<String, dynamic> toJson() => _$AnimatedToJson(this);
}
@embedded
@JsonSerializable()
class Xy {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  Xy({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Xy.fromJson(Map<String, dynamic> json) => _$XyFromJson(json);
  Map<String, dynamic> toJson() => _$XyToJson(this);
}
@embedded
@JsonSerializable()
class OmegarubyAlphasapphire {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;

  OmegarubyAlphasapphire({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory OmegarubyAlphasapphire.fromJson(Map<String, dynamic> json) =>
      _$OmegarubyAlphasapphireFromJson(json);
  Map<String, dynamic> toJson() => _$OmegarubyAlphasapphireToJson(this);
}
@embedded
@JsonSerializable()
class Icons {
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_female')
  final String? frontFemale;

  Icons({
    this.frontDefault,
    this.frontFemale,
  });

  factory Icons.fromJson(Map<String, dynamic> json) => _$IconsFromJson(json);
  Map<String, dynamic> toJson() => _$IconsToJson(this);
}