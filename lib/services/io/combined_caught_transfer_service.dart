import '../../models/caught_pokemon.dart';
import '../../models/tcg_card.dart';
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
/// cards for a profile, in a single file. Orchestrates
/// [CombinedCaughtCsvCodec] the same way [CaughtPokemonTransferService] and
/// [CaughtTcgCardTransferService] each orchestrate their own single-type
/// codec - import is a merge for both sides, never a replace.
class CombinedCaughtTransferService {
  final CaughtPokemonRepository _pokemonRepository;
  final CaughtTcgCardRepository _cardRepository;

  CombinedCaughtTransferService(this._pokemonRepository, this._cardRepository);

  /// [pokemonScopeKey] limits the Pokemon side to one scope; null exports
  /// every scope. Cards have no scope dimension, so they are never filtered.
  ///
  /// [pokemonNames] is an id-to-name lookup (e.g. from the already-loaded
  /// Pokedex) used only to make the exported file readable by a human; it
  /// plays no part in what gets imported back.
  Future<CombinedExportResult> exportCaught(
    CsvTransport transport, {
    required int profileId,
    String? pokemonScopeKey,
    Map<int, String> pokemonNames = const {},
    String fileName = 'caught_pokedex_data.csv',
  }) async {
    final pokemonRows = (await _pokemonRepository.loadAll(profileId))
        .where((row) =>
            row.isCaught && (pokemonScopeKey == null || row.scopeKey == pokemonScopeKey))
        .map((row) => (
              kind: 'pokemon',
              scopeKey: row.scopeKey,
              pokemonId: row.pokemonId,
              cardId: null,
              isCaught: true,
            ))
        .toList();
    final cardRows = (await _cardRepository.loadAll(profileId))
        .where((row) => row.isCaught)
        .map((row) => (
              kind: 'card',
              scopeKey: null,
              pokemonId: null,
              cardId: row.cardId,
              isCaught: true,
            ))
        .toList();

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

  Future<CombinedImportResult> importCaught(
    CsvTransport transport, {
    required int profileId,
  }) async {
    final csv = await transport.load();
    if (csv == null) return const CombinedImportResult.cancelled();

    final rows = CombinedCaughtCsvCodec.decode(csv).where((row) => row.isCaught);
    final pokemonRows = [
      for (final row in rows)
        if (row.kind == 'pokemon')
          CaughtPokemon(
            profileId: profileId,
            scopeKey: row.scopeKey!,
            pokemonId: row.pokemonId!,
            isCaught: true,
          ),
    ];
    final cardRows = [
      for (final row in rows)
        if (row.kind == 'card')
          CaughtTcgCard(profileId: profileId, cardId: row.cardId!, isCaught: true),
    ];

    if (pokemonRows.isNotEmpty) await _pokemonRepository.saveAll(pokemonRows);
    if (cardRows.isNotEmpty) await _cardRepository.saveAll(cardRows);

    return CombinedImportResult(
      importedPokemonCount: pokemonRows.length,
      importedCardCount: cardRows.length,
    );
  }
}
