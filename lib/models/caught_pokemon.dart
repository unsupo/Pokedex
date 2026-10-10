import 'package:isar_community/isar.dart';

part 'caught_pokemon.g.dart';

/// Scope key for a profile's own National checkbox. Phase 2 adds `vg:<id>`
/// keys for per-game tracking. See docs/epics/profiles-and-per-game-tracking.
const String nationalScopeKey = 'national';

/// Whether one profile has caught one Pokemon in one scope.
///
/// Replaces the legacy [UserData] collection, whose primary key was the dex id
/// and so could not hold a profile. The legacy rows are read once by
/// `migrateCaughtDataToProfiles` and then removed.
@collection
class CaughtPokemon {
  Id isarId = Isar.autoIncrement;

  @Index(
    composite: [CompositeIndex('scopeKey'), CompositeIndex('pokemonId')],
    unique: true,
    replace: true,
  )
  late int profileId;

  late String scopeKey;
  late int pokemonId;
  late bool isCaught;

  CaughtPokemon({
    required this.profileId,
    required this.pokemonId,
    required this.isCaught,
    this.scopeKey = nationalScopeKey,
  });
}
