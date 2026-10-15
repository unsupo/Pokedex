import '../../models/tcg_card.dart';
import 'caught_tcg_card_csv_codec.dart';
import 'caught_tcg_card_repository.dart';
import 'csv_transport.dart';
import 'transfer_result.dart';

export 'transfer_result.dart';

/// Orchestrates export/import of one profile's caught-TCG-card state.
/// Mirrors [CaughtPokemonTransferService] exactly; see that class's doc
/// comment for the import-is-a-merge rationale, which applies here
/// unchanged.
class CaughtTcgCardTransferService {
  final CaughtTcgCardRepository _repository;

  CaughtTcgCardTransferService(this._repository);

  Future<ExportResult> exportCaught(
    CsvTransport transport, {
    required int profileId,
    String fileName = 'caught_tcg_cards.csv',
  }) async {
    final caught = (await _repository.loadAll(profileId))
        .where((row) => row.isCaught)
        .map((row) => (cardId: row.cardId, isCaught: row.isCaught))
        .toList();
    final saved =
        await transport.save(fileName, CaughtTcgCardCsvCodec.encode(caught));
    return ExportResult(saved: saved, exportedCount: caught.length);
  }

  Future<ImportResult> importCaught(
    CsvTransport transport, {
    required int profileId,
  }) async {
    final csv = await transport.load();
    if (csv == null) return const ImportResult.cancelled();

    final caughtRows = CaughtTcgCardCsvCodec.decode(csv)
        .where((row) => row.isCaught)
        .map((row) => CaughtTcgCard(
              profileId: profileId,
              cardId: row.cardId,
              isCaught: true,
            ))
        .toList();

    await _repository.saveAll(caughtRows);
    return ImportResult(importedCount: caughtRows.length);
  }
}
