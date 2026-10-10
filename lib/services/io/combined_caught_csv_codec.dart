import 'package:csv/csv.dart';

import 'caught_pokemon_csv_codec.dart';
import 'caught_tcg_card_csv_codec.dart';

/// One CSV line, tagged by [kind] so one file can hold both caught Pokemon
/// and caught TCG cards. Exactly one of (`scopeKey`+`pokemonId`) or
/// `cardId` is set, matching [kind].
typedef CombinedCaughtRow = ({
  String kind, // 'pokemon' or 'card'
  String? scopeKey,
  int? pokemonId,
  String? cardId,
  bool isCaught,
});

const _pokemonKind = 'pokemon';
const _cardKind = 'card';

/// Pure CSV serialization for the combined export (one file, both caught
/// Pokemon and caught TCG cards).
///
/// `decode` is smart about older, single-type files: it sniffs the header
/// and, when it doesn't recognize the combined `kind` column, delegates to
/// whichever single-type codec matches ([CaughtPokemonCsvCodec], which
/// itself already reads the oldest pre-profile format, or
/// [CaughtTcgCardCsvCodec]). That's what lets "Import Caught Data" read
/// every file this app has ever exported, not just the current format.
class CombinedCaughtCsvCodec {
  static const _kindColumn = 'kind';
  static const _scopeKeyColumn = 'scopekey';
  static const _pokemonIdColumn = 'pokemonid';
  static const _cardIdColumn = 'cardid';
  static const _isCaughtColumn = 'iscaught';

  /// [pokemonNames] is purely cosmetic: it makes an exported file readable
  /// outside the app (e.g. opened in a spreadsheet) without needing a
  /// Pokedex lookup. It is never read back by [decode] - pokemonId remains
  /// the only identity the import path trusts.
  static String encode(List<CombinedCaughtRow> rows, {Map<int, String> pokemonNames = const {}}) {
    final table = <List<Object>>[
      ['kind', 'scopeKey', 'pokemonId', 'cardId', 'isCaught', 'pokemonName'],
      for (final row in rows)
        [
          row.kind,
          row.scopeKey ?? '',
          row.pokemonId ?? '',
          row.cardId ?? '',
          row.isCaught,
          row.pokemonId == null ? '' : (pokemonNames[row.pokemonId] ?? ''),
        ],
    ];
    return const ListToCsvConverter().convert(table, eol: '\n');
  }

  static List<CombinedCaughtRow> decode(String csvContent) {
    final table = const CsvToListConverter(eol: '\n')
        .convert(csvContent, shouldParseNumbers: false)
        .where((row) => row.any((cell) => cell.toString().trim().isNotEmpty))
        .toList();

    if (table.isEmpty) {
      throw const FormatException('CSV has no header row.');
    }

    final header =
        table.first.map((cell) => cell.toString().trim().toLowerCase()).toList();

    if (header.contains(_kindColumn)) {
      return _decodeCombined(table, header);
    }
    if (header.contains(_pokemonIdColumn) ||
        (header.contains('id') && !header.contains(_cardIdColumn))) {
      // The current scopeKey/pokemonId format, or the oldest pre-profile
      // id/isCaught format - CaughtPokemonCsvCodec already reads both.
      return [
        for (final row in CaughtPokemonCsvCodec.decode(csvContent))
          (
            kind: _pokemonKind,
            scopeKey: row.scopeKey,
            pokemonId: row.pokemonId,
            cardId: null,
            isCaught: row.isCaught,
          ),
      ];
    }
    if (header.contains(_cardIdColumn)) {
      return [
        for (final row in CaughtTcgCardCsvCodec.decode(csvContent))
          (
            kind: _cardKind,
            scopeKey: null,
            pokemonId: null,
            cardId: row.cardId,
            isCaught: row.isCaught,
          ),
      ];
    }

    throw FormatException(
        'Unrecognized CSV columns (expected "kind", or an older caught-Pokemon/caught-card '
        'format), got: ${table.first}');
  }

  static List<CombinedCaughtRow> _decodeCombined(
      List<List<dynamic>> table, List<String> header) {
    final kindIndex = header.indexOf(_kindColumn);
    final scopeIndex = header.indexOf(_scopeKeyColumn);
    final pokemonIndex = header.indexOf(_pokemonIdColumn);
    final cardIndex = header.indexOf(_cardIdColumn);
    final isCaughtIndex = header.indexOf(_isCaughtColumn);

    if (scopeIndex == -1 || pokemonIndex == -1 || cardIndex == -1 || isCaughtIndex == -1) {
      throw FormatException(
          'Expected "kind", "scopeKey", "pokemonId", "cardId" and "isCaught" columns, '
          'got: ${table.first}');
    }

    final width = header.length;
    return [
      for (final row in table.skip(1)) ...[
        if (row.length < width)
          throw FormatException(
              'A row has ${row.length} cells but the header has $width: $row'),
        _combinedRow(row, kindIndex, scopeIndex, pokemonIndex, cardIndex, isCaughtIndex),
      ],
    ];
  }

  static CombinedCaughtRow _combinedRow(List<dynamic> row, int kindIndex, int scopeIndex,
      int pokemonIndex, int cardIndex, int isCaughtIndex) {
    final kind = row[kindIndex].toString().trim().toLowerCase();
    final isCaught = row[isCaughtIndex].toString().trim().toLowerCase() == 'true';
    final scopeText = row[scopeIndex].toString().trim();
    final pokemonText = row[pokemonIndex].toString().trim();
    final cardText = row[cardIndex].toString().trim();

    if (kind == _pokemonKind) {
      if (scopeText.isEmpty || pokemonText.isEmpty) {
        throw FormatException('A pokemon row is missing scopeKey or pokemonId: $row');
      }
      return (
        kind: _pokemonKind,
        scopeKey: scopeText,
        pokemonId: int.parse(pokemonText),
        cardId: null,
        isCaught: isCaught,
      );
    }
    if (kind == _cardKind) {
      if (cardText.isEmpty) {
        throw FormatException('A card row is missing cardId: $row');
      }
      return (kind: _cardKind, scopeKey: null, pokemonId: null, cardId: cardText, isCaught: isCaught);
    }
    throw FormatException('Unknown kind "$kind" in row: $row');
  }
}
