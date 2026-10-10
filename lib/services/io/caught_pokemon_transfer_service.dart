import '../../models/caught_pokemon.dart';
import 'caught_pokemon_csv_codec.dart';
import 'caught_pokemon_repository.dart';
import 'csv_transport.dart';
import 'transfer_result.dart';

export 'transfer_result.dart';

/// Orchestrates export/import of one profile's caught-pokemon state,
/// independent of both where the CSV is stored ([CsvTransport]) and where the
/// app's caught data lives ([CaughtPokemonRepository]).
///
/// Import is a merge, not a replace: only rows present in the imported file are
/// written, so importing a friend's export adds to your collection instead of
/// wiping rows they didn't share. Rows from the file are always written to the
/// profile passed in, never to another profile.
class CaughtPokemonTransferService {
  final CaughtPokemonRepository _repository;

  CaughtPokemonTransferService(this._repository);

  /// Exports the profile's caught rows. A non-null [scopeKey] limits the file
  /// to that scope; null writes every scope.
  Future<ExportResult> exportCaught(
    CsvTransport transport, {
    required int profileId,
    String? scopeKey,
    String fileName = 'caught_pokemon.csv',
  }) async {
    final caught = (await _repository.loadAll(profileId))
        .where((row) => row.isCaught && (scopeKey == null || row.scopeKey == scopeKey))
        .map((row) => (
              scopeKey: row.scopeKey,
              pokemonId: row.pokemonId,
              isCaught: row.isCaught,
            ))
        .toList();
    final saved =
        await transport.save(fileName, CaughtPokemonCsvCodec.encode(caught));
    return ExportResult(saved: saved, exportedCount: caught.length);
  }

  Future<ImportResult> importCaught(
    CsvTransport transport, {
    required int profileId,
  }) async {
    final csv = await transport.load();
    if (csv == null) return const ImportResult.cancelled();

    final caughtRows = CaughtPokemonCsvCodec.decode(csv)
        .where((row) => row.isCaught)
        .map((row) => CaughtPokemon(
              profileId: profileId,
              scopeKey: row.scopeKey,
              pokemonId: row.pokemonId,
              isCaught: true,
            ))
        .toList();

    await _repository.saveAll(caughtRows);
    return ImportResult(importedCount: caughtRows.length);
  }
}
