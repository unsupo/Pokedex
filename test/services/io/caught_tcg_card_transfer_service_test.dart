import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_csv_codec.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_repository.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_transfer_service.dart';

import '../../support/fakes.dart';

const _ash = 1;
const _misty = 2;

/// Holds rows in memory with the same upsert-by-(profile, cardId) semantics
/// as the Isar-backed repository.
class InMemoryCaughtTcgCardRepository implements CaughtTcgCardRepository {
  final List<CaughtTcgCard> _rows;

  InMemoryCaughtTcgCardRepository(List<CaughtTcgCard> initial)
      : _rows = List.of(initial);

  @override
  Future<List<CaughtTcgCard>> loadAll(int profileId) async =>
      _rows.where((r) => r.profileId == profileId).toList();

  @override
  Future<void> saveAll(List<CaughtTcgCard> rows) async {
    for (final row in rows) {
      _rows.removeWhere(
          (r) => r.profileId == row.profileId && r.cardId == row.cardId);
      _rows.add(row);
    }
  }
}

CaughtTcgCard _row(int profileId, String cardId, bool isCaught) =>
    CaughtTcgCard(profileId: profileId, cardId: cardId, isCaught: isCaught);

void main() {
  group('CaughtTcgCardTransferService closed loop', () {
    test('export then import into a fresh profile restores exactly the caught set',
        () async {
      final source = InMemoryCaughtTcgCardRepository([
        _row(_ash, 'swsh1-1', true),
        _row(_ash, 'base1-4', false),
        _row(_ash, 'xy7-54', true),
      ]);
      final transport = InMemoryCsvTransport();

      final exportResult = await CaughtTcgCardTransferService(source)
          .exportCaught(transport, profileId: _ash);
      expect(exportResult.exportedCount, 2);

      final destination = InMemoryCaughtTcgCardRepository([]);
      final importResult = await CaughtTcgCardTransferService(destination)
          .importCaught(transport, profileId: _misty);
      expect(importResult.importedCount, 2);

      final caughtIds = (await destination.loadAll(_misty))
          .where((r) => r.isCaught)
          .map((r) => r.cardId)
          .toSet();
      expect(caughtIds, {'swsh1-1', 'xy7-54'});
    });

    test('import merges into existing state instead of replacing it', () async {
      final source = InMemoryCaughtTcgCardRepository([_row(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();
      await CaughtTcgCardTransferService(source)
          .exportCaught(transport, profileId: _ash);

      final destination = InMemoryCaughtTcgCardRepository([
        _row(_misty, 'swsh1-1', false),
        _row(_misty, 'other-99', true),
      ]);
      await CaughtTcgCardTransferService(destination)
          .importCaught(transport, profileId: _misty);

      final byId = {
        for (final r in await destination.loadAll(_misty)) r.cardId: r.isCaught
      };
      expect(byId['swsh1-1'], isTrue); // brought in from the import
      expect(byId['other-99'], isTrue); // untouched, not mentioned in the file
    });

    test('importing the same export twice is a no-op', () async {
      final repo = InMemoryCaughtTcgCardRepository([
        _row(_ash, 'swsh1-1', true),
        _row(_ash, 'base1-4', false),
      ]);
      final transport = InMemoryCsvTransport();
      final service = CaughtTcgCardTransferService(repo);

      await service.exportCaught(transport, profileId: _ash);
      await service.importCaught(transport, profileId: _ash);
      final afterFirst = {
        for (final r in await repo.loadAll(_ash)) (r.cardId, r.isCaught)
      };

      await service.importCaught(transport, profileId: _ash);
      final afterSecond = {
        for (final r in await repo.loadAll(_ash)) (r.cardId, r.isCaught)
      };

      expect(afterSecond, afterFirst);
    });

    test('an all-uncaught profile exports a header-only CSV that imports to zero',
        () async {
      final source = InMemoryCaughtTcgCardRepository([_row(_ash, 'swsh1-1', false)]);
      final transport = InMemoryCsvTransport();

      final exportResult = await CaughtTcgCardTransferService(source)
          .exportCaught(transport, profileId: _ash);
      expect(exportResult.exportedCount, 0);

      final importResult = await CaughtTcgCardTransferService(source)
          .importCaught(transport, profileId: _ash);
      expect(importResult.importedCount, 0);
    });

    test('a cancelled save leaves the transport untouched', () async {
      final repo = InMemoryCaughtTcgCardRepository([_row(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final exportResult = await CaughtTcgCardTransferService(repo)
          .exportCaught(transport, profileId: _ash);

      expect(exportResult.saved, isFalse);
      expect(transport.storedCsv, isNull);
    });

    test('a cancelled load is reported and does not touch the repository', () async {
      final repo = InMemoryCaughtTcgCardRepository([_row(_ash, 'swsh1-1', false)]);
      final transport = InMemoryCsvTransport()..cancelLoad = true;

      final importResult = await CaughtTcgCardTransferService(repo)
          .importCaught(transport, profileId: _ash);

      expect(importResult.cancelled, isTrue);
      expect((await repo.loadAll(_ash)).single.isCaught, isFalse);
    });

    test('an isCaught=false row in the import does not downgrade existing caught state',
        () async {
      final csv = CaughtTcgCardCsvCodec.encode([
        (cardId: 'swsh1-1', isCaught: false),
        (cardId: 'base1-4', isCaught: true),
      ]);
      final transport = InMemoryCsvTransport()..storedCsv = csv;

      final destination = InMemoryCaughtTcgCardRepository([
        _row(_ash, 'swsh1-1', true), // already caught locally
        _row(_ash, 'base1-4', false),
      ]);
      final importResult = await CaughtTcgCardTransferService(destination)
          .importCaught(transport, profileId: _ash);

      expect(importResult.importedCount, 1);
      final byId = {
        for (final r in await destination.loadAll(_ash)) r.cardId: r.isCaught
      };
      expect(byId['swsh1-1'], isTrue);
      expect(byId['base1-4'], isTrue);
    });
  });

  group('CaughtTcgCardTransferService profile scoping', () {
    test('export writes only the chosen profile\'s caught cards', () async {
      final repo = InMemoryCaughtTcgCardRepository([
        _row(_ash, 'swsh1-1', true),
        _row(_misty, 'other-99', true),
      ]);
      final transport = InMemoryCsvTransport();

      final result = await CaughtTcgCardTransferService(repo)
          .exportCaught(transport, profileId: _ash);

      expect(result.exportedCount, 1);
      expect(
        CaughtTcgCardCsvCodec.decode(transport.storedCsv!).map((r) => r.cardId),
        ['swsh1-1'],
      );
    });

    test('import into one profile never changes another profile\'s rows', () async {
      final source = InMemoryCaughtTcgCardRepository([_row(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();
      await CaughtTcgCardTransferService(source)
          .exportCaught(transport, profileId: _ash);

      final repo = InMemoryCaughtTcgCardRepository([_row(_misty, 'swsh1-1', false)]);
      await CaughtTcgCardTransferService(repo)
          .importCaught(transport, profileId: _misty);

      final mistyRow = (await repo.loadAll(_misty)).single;
      final ashRows = await repo.loadAll(_ash);
      expect(mistyRow.isCaught, isTrue);
      expect(ashRows, isEmpty, reason: 'import must not create rows for Ash');
    });
  });
}
