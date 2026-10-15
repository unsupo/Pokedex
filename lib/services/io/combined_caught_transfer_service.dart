import '../../models/caught_pokemon.dart';
import '../../models/tcg_card.dart';
import '../profiles/profile_repository.dart';
import 'caught_pokemon_repository.dart';
import 'caught_tcg_card_repository.dart';
import 'combined_caught_csv_codec.dart';
import 'csv_transport.dart';

class CombinedExportResult {
  final bool saved;
  final int exportedPokemonCount;
  final int exportedCardCount;

  const CombinedExportResult({
    required this.saved,
    required this.exportedPokemonCount,
    required this.exportedCardCount,
  });
}

class CombinedImportResult {
  final bool cancelled;
  final int importedPokemonCount;
  final int importedCardCount;

  const CombinedImportResult.cancelled()
      : cancelled = true,
        importedPokemonCount = 0,
        importedCardCount = 0;

  const CombinedImportResult({
    required this.importedPokemonCount,
    required this.importedCardCount,
  }) : cancelled = false;
}

/// One export, one import, covering both caught Pokemon and caught TCG
/// cards for **every** profile, in a single file - a full local backup, not
/// a per-profile one (see decision: a profile-scoped export only ever
/// backs up part of the data, which is the bug this shape fixes). Orchestrates
/// [CombinedCaughtCsvCodec] the same way [CaughtPokemonTransferService] and
/// [CaughtTcgCardTransferService] each orchestrate their own single-type
/// codec - import is a merge for both sides, never a replace.
class CombinedCaughtTransferService {
  final CaughtPokemonRepository _pokemonRepository;
  final CaughtTcgCardRepository _cardRepository;
  final ProfileRepository _profileRepository;

  CombinedCaughtTransferService(
      this._pokemonRepository, this._cardRepository, this._profileRepository);

  /// Every profile's caught Pokemon (every scope - a backup has no reason to
  /// leave part of a profile out) and caught cards, tagged by profile name so
  /// [importCaught] can route each row back to the right profile.
  ///
  /// [pokemonNames] is an id-to-name lookup (e.g. from the already-loaded
  /// Pokedex) used only to make the exported file readable by a human; it
  /// plays no part in what gets imported back.
  Future<CombinedExportResult> exportCaught(
    CsvTransport transport, {
    Map<int, String> pokemonNames = const {},
    String fileName = 'caught_pokedex_data.csv',
  }) async {
    final profiles = await _profileRepository.loadProfiles();
    final pokemonRows = <CombinedCaughtRow>[];
    final cardRows = <CombinedCaughtRow>[];
    for (final profile in profiles) {
      pokemonRows.addAll((await _pokemonRepository.loadAll(profile.id))
          .where((row) => row.isCaught)
          .map((row) => (
                kind: 'pokemon',
                scopeKey: row.scopeKey,
                pokemonId: row.pokemonId,
                cardId: null,
                isCaught: true,
                profileName: profile.name,
              )));
      cardRows.addAll((await _cardRepository.loadAll(profile.id))
          .where((row) => row.isCaught)
          .map((row) => (
                kind: 'card',
                scopeKey: null,
                pokemonId: null,
                cardId: row.cardId,
                isCaught: true,
                profileName: profile.name,
              )));
    }

    final saved = await transport.save(
        fileName,
        CombinedCaughtCsvCodec.encode([...pokemonRows, ...cardRows],
            pokemonNames: pokemonNames));
    return CombinedExportResult(
      saved: saved,
      exportedPokemonCount: pokemonRows.length,
      exportedCardCount: cardRows.length,
    );
  }

  /// Routes each row to the profile named in [CombinedCaughtRow.profileName],
  /// creating that profile (via [ProfileRepository.addProfile], which does
  /// not switch the active profile - unlike [ProfileProvider.createProfile])
  /// if no profile with that name exists yet. A row with no profile name (a
  /// file written before per-row profile info existed) goes to
  /// [fallbackProfileId] instead - the same, single-profile behavior this
  /// method had before all-profiles export existed.
  Future<CombinedImportResult> importCaught(
    CsvTransport transport, {
    required int fallbackProfileId,
  }) async {
    final csv = await transport.load();
    if (csv == null) return const CombinedImportResult.cancelled();

    final rows = CombinedCaughtCsvCodec.decode(csv).where((row) => row.isCaught);

    final profileIdByName = {
      for (final profile in await _profileRepository.loadProfiles()) profile.name: profile.id,
    };
    Future<int> resolveProfileId(String? name) async {
      if (name == null) return fallbackProfileId;
      final existing = profileIdByName[name];
      if (existing != null) return existing;
      final created = await _profileRepository.addProfile(name);
      profileIdByName[name] = created.id; // repeated rows for a new profile create it once
      return created.id;
    }

    final pokemonRows = <CaughtPokemon>[];
    final cardRows = <CaughtTcgCard>[];
    for (final row in rows) {
      final profileId = await resolveProfileId(row.profileName);
      if (row.kind == 'pokemon') {
        pokemonRows.add(CaughtPokemon(
          profileId: profileId,
          scopeKey: row.scopeKey!,
          pokemonId: row.pokemonId!,
          isCaught: true,
        ));
      } else if (row.kind == 'card') {
        cardRows.add(CaughtTcgCard(profileId: profileId, cardId: row.cardId!, isCaught: true));
      }
    }

    if (pokemonRows.isNotEmpty) await _pokemonRepository.saveAll(pokemonRows);
    if (cardRows.isNotEmpty) await _cardRepository.saveAll(cardRows);

    return CombinedImportResult(
      importedPokemonCount: pokemonRows.length,
      importedCardCount: cardRows.length,
    );
  }
}
