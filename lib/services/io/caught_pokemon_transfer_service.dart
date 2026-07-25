import 'caught_pokemon_csv_codec.dart';
import 'caught_pokemon_repository.dart';
import 'csv_transport.dart';

class ExportResult {
  final bool saved;
  final int exportedCount;

  const ExportResult({required this.saved, required this.exportedCount});
}

class ImportResult {
  final bool cancelled;
  final int importedCount;

  const ImportResult.cancelled()
      : cancelled = true,
        importedCount = 0;

  const ImportResult({required this.importedCount})
      : cancelled = false;
}

/// Orchestrates export/import of caught-pokemon state, independent of both
/// where the CSV is stored ([CsvTransport]) and where the app's caught data
/// lives ([CaughtPokemonRepository]).
///
/// Import is a merge, not a replace: only ids present in the imported file
/// are updated, so importing a friend's caught-pokemon export adds to your
/// collection instead of wiping ids you didn't share.
class CaughtPokemonTransferService {
  final CaughtPokemonRepository _repository;

  CaughtPokemonTransferService(this._repository);

  Future<ExportResult> exportCaught(
    CsvTransport transport, {
    String fileName = 'caught_pokemon.csv',
  }) async {
    final caught =
        (await _repository.loadAll()).where((u) => u.isCaught).toList();
    final saved = await transport.save(fileName, CaughtPokemonCsvCodec.encode(caught));
    return ExportResult(saved: saved, exportedCount: caught.length);
  }

  Future<ImportResult> importCaught(CsvTransport transport) async {
    final csv = await transport.load();
    if (csv == null) return const ImportResult.cancelled();

    final imported = CaughtPokemonCsvCodec.decode(csv);
    final caughtImported = imported.where((entry) => entry.isCaught).toList();
    final existingById = {
      for (final entry in await _repository.loadAll()) entry.id: entry,
    };
    for (final entry in caughtImported) {
      existingById[entry.id] = entry;
    }

    await _repository.saveAll(existingById.values.toList());
    return ImportResult(importedCount: caughtImported.length);
  }
}
