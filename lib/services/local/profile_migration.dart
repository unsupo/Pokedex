import 'package:isar_community/isar.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/models/user_data.dart';

/// Name of the profile created on a fresh install, or for an upgrade with no
/// profile yet.
const String defaultProfileName = 'Trainer 1';

/// Brings caught data up to the profile schema. Safe to run on every launch:
/// once the data is migrated there is nothing left to do.
///
/// - Ensures at least one profile exists, creating [defaultProfileName] if not.
/// - Copies legacy [UserData] rows into [CaughtPokemon] for the first profile,
///   national scope, then removes the legacy rows so they can't be counted twice.
/// - Attributes [CaughtTcgCard] rows with no profile to that profile.
///
/// Runs in one write transaction, so an interrupted run leaves either the old
/// state or the new one, never a mix.
/// Returns how many legacy [UserData] rows were moved. Zero means there was
/// nothing to upgrade, so the app can skip the backup notice.
Future<int> migrateCaughtDataToProfiles(Isar isar) {
  return isar.writeTxn(() async {
    var profiles = await isar.profiles.where(sort: Sort.asc).findAll();
    if (profiles.isEmpty) {
      final created = Profile(name: defaultProfileName);
      created.id = await isar.profiles.put(created);
      profiles = [created];
    }
    final profileId = profiles.first.id;

    final legacyPokemon = await isar.userDatas.where().findAll();
    final moved = legacyPokemon.length;
    if (legacyPokemon.isNotEmpty) {
      await isar.caughtPokemons.putAll([
        for (final row in legacyPokemon)
          CaughtPokemon(
            profileId: profileId,
            pokemonId: row.id,
            isCaught: row.isCaught,
          ),
      ]);
      await isar.userDatas.clear();
    }

    // Real profile ids start at 1. Rows from before profileId existed read back
    // as Isar.minId (a missing int column is not 0), so "below 1" catches both.
    final unownedCards =
        await isar.caughtTcgCards.filter().profileIdLessThan(1).findAll();
    if (unownedCards.isNotEmpty) {
      for (final card in unownedCards) {
        card.profileId = profileId;
      }
      await isar.caughtTcgCards.putAll(unownedCards);
    }
    return moved;
  });
}
