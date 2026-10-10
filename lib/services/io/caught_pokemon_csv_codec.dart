import 'package:csv/csv.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';

/// One CSV line: which scope, which Pokemon, and whether it is caught.
typedef CaughtPokemonRow = ({String scopeKey, int pokemonId, bool isCaught});

/// Pure, source-agnostic serialization of caught-pokemon state to/from CSV.
///
/// Deliberately knows nothing about where the CSV comes from or goes to
/// (local disk, a share sheet, a cloud provider) -- that's [CsvTransport]'s
/// job. Keeping this pure is what makes the export/import round trip
/// testable without any platform I/O.
///
/// Format: `scopeKey,pokemonId,isCaught`. The older `id,isCaught` format
/// (before profiles) is still read, as the national scope.
class CaughtPokemonCsvCodec {
  static const _scopeKeyColumn = 'scopekey';
  static const _pokemonIdColumn = 'pokemonid';
  static const _legacyIdColumn = 'id';
  static const _isCaughtColumn = 'iscaught';

  static String encode(List<CaughtPokemonRow> rows) {
    final table = <List<Object>>[
      ['scopeKey', 'pokemonId', 'isCaught'],
      for (final row in rows) [row.scopeKey, row.pokemonId, row.isCaught],
    ];
    return const ListToCsvConverter().convert(table, eol: '\n');
  }

  static List<CaughtPokemonRow> decode(String csvContent) {
    final table = const CsvToListConverter(eol: '\n')
        .convert(csvContent, shouldParseNumbers: false)
        .where((row) => row.any((cell) => cell.toString().trim().isNotEmpty))
        .toList();

    if (table.isEmpty) {
      throw const FormatException('CSV has no header row.');
    }

    final header =
        table.first.map((cell) => cell.toString().trim().toLowerCase()).toList();
    final isCaughtIndex = header.indexOf(_isCaughtColumn);
    final scopeIndex = header.indexOf(_scopeKeyColumn);
    final pokemonIndex = header.indexOf(_pokemonIdColumn);
    final legacyIdIndex = header.indexOf(_legacyIdColumn);

    if (isCaughtIndex == -1 ||
        (pokemonIndex == -1 && legacyIdIndex == -1) ||
        (pokemonIndex != -1 && scopeIndex == -1)) {
      throw FormatException(
          'Expected a CSV with "scopeKey", "pokemonId" and "isCaught" columns '
          '(or the legacy "id" and "isCaught"), got: ${table.first}');
    }

    final legacy = pokemonIndex == -1;
    final width = header.length;
    return [
      for (final row in table.skip(1)) ...[
        if (row.length < width)
          throw FormatException(
              'A row has ${row.length} cells but the header has $width: $row'),
        (
          scopeKey: legacy
              ? nationalScopeKey
              : _requiredText(row[scopeIndex], 'scopeKey'),
          pokemonId: int.parse(
              row[legacy ? legacyIdIndex : pokemonIndex].toString().trim()),
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
