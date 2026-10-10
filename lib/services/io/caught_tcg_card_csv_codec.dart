import 'package:csv/csv.dart';

/// One CSV line: which card, and whether it is caught.
typedef CaughtTcgCardRow = ({String cardId, bool isCaught});

/// Pure, source-agnostic serialization of caught-TCG-card state to/from CSV.
/// Mirrors [CaughtPokemonCsvCodec], minus the scope column -- cards have no
/// per-game scope (decision D6 in
/// docs/epics/profiles-and-per-game-tracking/00-decisions.md).
///
/// Deliberately knows nothing about where the CSV comes from or goes to -
/// that's [CsvTransport]'s job. Keeping this pure is what makes the
/// export/import round trip testable without any platform I/O.
class CaughtTcgCardCsvCodec {
  static const _cardIdColumn = 'cardid';
  static const _isCaughtColumn = 'iscaught';

  static String encode(List<CaughtTcgCardRow> rows) {
    final table = <List<Object>>[
      ['cardId', 'isCaught'],
      for (final row in rows) [row.cardId, row.isCaught],
    ];
    return const ListToCsvConverter().convert(table, eol: '\n');
  }

  static List<CaughtTcgCardRow> decode(String csvContent) {
    final table = const CsvToListConverter(eol: '\n')
        .convert(csvContent, shouldParseNumbers: false)
        .where((row) => row.any((cell) => cell.toString().trim().isNotEmpty))
        .toList();

    if (table.isEmpty) {
      throw const FormatException('CSV has no header row.');
    }

    final header =
        table.first.map((cell) => cell.toString().trim().toLowerCase()).toList();
    final cardIdIndex = header.indexOf(_cardIdColumn);
    final isCaughtIndex = header.indexOf(_isCaughtColumn);

    if (cardIdIndex == -1 || isCaughtIndex == -1) {
      throw FormatException(
          'Expected a CSV with "cardId" and "isCaught" columns, got: ${table.first}');
    }

    final width = header.length;
    return [
      for (final row in table.skip(1)) ...[
        if (row.length < width)
          throw FormatException(
              'A row has ${row.length} cells but the header has $width: $row'),
        (
          cardId: _requiredText(row[cardIdIndex], 'cardId'),
          isCaught:
              row[isCaughtIndex].toString().trim().toLowerCase() == 'true',
        ),
      ],
    ];
  }

  static String _requiredText(Object cell, String column) {
    final text = cell.toString().trim();
    if (text.isEmpty) {
      throw FormatException('A row has an empty $column.');
    }
    return text;
  }
}
