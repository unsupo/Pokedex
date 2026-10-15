/// Shared by every CSV export/import feature (caught Pokemon, caught TCG
/// cards, ...) so each one doesn't define its own copy of the same two
/// value types.

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
