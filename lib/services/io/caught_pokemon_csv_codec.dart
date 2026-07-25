import 'package:csv/csv.dart';

import '../../models/user_data.dart';

/// Pure, source-agnostic serialization of caught-pokemon state to/from CSV.
///
/// Deliberately knows nothing about where the CSV comes from or goes to
/// (local disk, a share sheet, a cloud provider) — that's [CsvTransport]'s
/// job. Keeping this pure is what makes the export/import round trip
/// testable without any platform I/O.
class CaughtPokemonCsvCodec {
  static const _idColumn = 'id';
  static const _isCaughtColumn = 'iscaught';

  static String encode(List<UserData> entries) {
    final rows = <List<Object>>[
      ['id', 'isCaught'],
      for (final entry in entries) [entry.id, entry.isCaught],
    ];
    return const ListToCsvConverter().convert(rows, eol: '\n');
  }

  static List<UserData> decode(String csvContent) {
    final rows = const CsvToListConverter(eol: '\n')
        .convert(csvContent, shouldParseNumbers: false)
        .where((row) => row.any((cell) => cell.toString().trim().isNotEmpty))
        .toList();

    if (rows.isEmpty) {
      throw const FormatException('CSV has no header row.');
    }

    final header =
        rows.first.map((cell) => cell.toString().trim().toLowerCase()).toList();
    final idIndex = header.indexOf(_idColumn);
    final isCaughtIndex = header.indexOf(_isCaughtColumn);
    if (idIndex == -1 || isCaughtIndex == -1) {
      throw FormatException(
          'Expected a CSV with "id" and "isCaught" columns, got: ${rows.first}');
    }

    return [
      for (final row in rows.skip(1))
        UserData(
          id: int.parse(row[idIndex].toString().trim()),
          isCaught: row[isCaughtIndex].toString().trim().toLowerCase() == 'true',
        ),
    ];
  }
}
