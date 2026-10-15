import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'csv_transport.dart';

/// Delegates to the OS's native save/open file dialog — Storage Access
/// Framework on Android, UIDocumentPickerViewController on iOS, native
/// dialogs on desktop. Whatever cloud-storage apps the user has installed
/// (Google Drive, Dropbox, iCloud, ...) show up there as destinations, so
/// this class doesn't need any provider-specific integration to support
/// them.
class FilePickerCsvTransport implements CsvTransport {
  const FilePickerCsvTransport();

  @override
  Future<bool> save(String suggestedFileName, String csvContent) async {
    final savedPath = await FilePicker.saveFile(
      dialogTitle: 'Save caught Pokédex data as CSV',
      fileName: suggestedFileName,
      type: FileType.custom,
      allowedExtensions: ['csv'],
      bytes: Uint8List.fromList(utf8.encode(csvContent)),
    );
    return savedPath != null;
  }

  @override
  Future<String?> load() async {
    final result = await FilePicker.pickFiles(
      dialogTitle: 'Import caught Pokédex data CSV',
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );
    final file = result?.files.singleOrNull;
    if (file == null) return null;

    if (file.bytes != null) return utf8.decode(file.bytes!);
    if (file.path != null) return File(file.path!).readAsString();
    return null;
  }
}
