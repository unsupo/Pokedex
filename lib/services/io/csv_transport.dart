/// A destination/source for CSV content, deliberately abstracted away from
/// *where* the bytes actually go.
///
/// The concrete implementation used in the app ([FilePickerCsvTransport])
/// delegates to the OS's native save/open file dialog. On Android, iOS, and
/// desktop that dialog already lists Google Drive, Dropbox, iCloud, and any
/// other storage provider the user has installed as a destination — so
/// "export to Google Drive" is just "the user picked Drive in the system
/// picker" rather than a bespoke Drive integration. Tests use an in-memory
/// fake instead of touching a real picker/filesystem.
abstract class CsvTransport {
  /// Persists [csvContent] under [suggestedFileName]. Returns `false` if the
  /// user cancelled (e.g. dismissed the save dialog) rather than throwing,
  /// since cancellation is an expected, non-exceptional outcome.
  Future<bool> save(String suggestedFileName, String csvContent);

  /// Retrieves CSV content, or `null` if the user cancelled (e.g. dismissed
  /// the open dialog without picking a file).
  Future<String?> load();
}
