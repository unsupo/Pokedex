import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/user_data.dart';
import 'package:pokedex_app/services/io/caught_pokemon_csv_codec.dart';
import 'package:pokedex_app/services/io/caught_pokemon_repository.dart';
import 'package:pokedex_app/services/io/caught_pokemon_transfer_service.dart';
import 'package:pokedex_app/services/io/csv_transport.dart';

/// Holds state in memory instead of Isar, so these tests exercise real
/// merge/business logic without touching a database or the filesystem.
class InMemoryCaughtPokemonRepository implements CaughtPokemonRepository {
  List<UserData> _data;

  InMemoryCaughtPokemonRepository(List<UserData> initial) : _data = List.of(initial);

  @override
  Future<List<UserData>> loadAll() async => List.of(_data);

  @override
  Future<void> saveAll(List<UserData> data) async => _data = List.of(data);
}

/// Stands in for "the cloud" (or a local file, or Drive, or anything else
/// behind [CsvTransport]) by holding the exported bytes in memory. Since the
/// codec and the service are both transport-agnostic, this fake is enough to
/// prove a real round trip without touching file_picker or a device.
class InMemoryCsvTransport implements CsvTransport {
  String? storedCsv;
  bool cancelSave = false;
  bool cancelLoad = false;

  @override
  Future<bool> save(String suggestedFileName, String csvContent) async {
    if (cancelSave) return false;
    storedCsv = csvContent;
    return true;
  }

  @override
  Future<String?> load() async => cancelLoad ? null : storedCsv;
}

void main() {
  group('CaughtPokemonTransferService closed loop', () {
    test(
        'export then import on a fresh repository restores exactly the caught set',
        () async {
      final sourceRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: true),
        UserData(id: 4, isCaught: false),
        UserData(id: 25, isCaught: true),
        UserData(id: 150, isCaught: true),
      ]);
      final transport = InMemoryCsvTransport();

      final exportResult =
          await CaughtPokemonTransferService(sourceRepo).exportCaught(transport);
      expect(exportResult.exportedCount, 3); // only the caught ones

      // A different install/device that hasn't caught anything yet.
      final destinationRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: false),
        UserData(id: 4, isCaught: false),
        UserData(id: 25, isCaught: false),
        UserData(id: 150, isCaught: false),
      ]);
      final importResult =
          await CaughtPokemonTransferService(destinationRepo).importCaught(transport);
      expect(importResult.importedCount, 3);

      final restored = await destinationRepo.loadAll();
      final caughtIds =
          restored.where((u) => u.isCaught).map((u) => u.id).toSet();
      expect(caughtIds, {1, 25, 150});
    });

    test('import merges into existing state instead of replacing it', () async {
      final sourceRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: true),
      ]);
      final transport = InMemoryCsvTransport();
      await CaughtPokemonTransferService(sourceRepo).exportCaught(transport);

      // Destination already has its own, unrelated caught pokemon.
      final destinationRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: false),
        UserData(id: 99, isCaught: true),
      ]);
      await CaughtPokemonTransferService(destinationRepo).importCaught(transport);

      final restored = await destinationRepo.loadAll();
      final byId = {for (final u in restored) u.id: u.isCaught};
      expect(byId[1], isTrue); // brought in from the import
      expect(byId[99], isTrue); // untouched, not mentioned in the file
    });

    test('round trip is idempotent: importing the same export twice is a no-op',
        () async {
      final repo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: true),
        UserData(id: 2, isCaught: false),
      ]);
      final transport = InMemoryCsvTransport();
      final service = CaughtPokemonTransferService(repo);

      await service.exportCaught(transport);
      await service.importCaught(transport);
      final afterFirstImport = await repo.loadAll();

      await service.importCaught(transport);
      final afterSecondImport = await repo.loadAll();

      expect(
        afterSecondImport.map((u) => (u.id, u.isCaught)).toSet(),
        afterFirstImport.map((u) => (u.id, u.isCaught)).toSet(),
      );
    });

    test('export of an all-uncaught repository writes a header-only CSV that imports to zero',
        () async {
      final sourceRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: false),
      ]);
      final transport = InMemoryCsvTransport();
      final exportResult =
          await CaughtPokemonTransferService(sourceRepo).exportCaught(transport);
      expect(exportResult.exportedCount, 0);

      final destinationRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: false),
      ]);
      final importResult =
          await CaughtPokemonTransferService(destinationRepo).importCaught(transport);
      expect(importResult.importedCount, 0);
    });

    test('a cancelled save leaves the repository and transport untouched', () async {
      final repo = InMemoryCaughtPokemonRepository([UserData(id: 1, isCaught: true)]);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final exportResult =
          await CaughtPokemonTransferService(repo).exportCaught(transport);

      expect(exportResult.saved, isFalse);
      expect(transport.storedCsv, isNull);
    });

    test('a cancelled load is reported and does not touch the repository', () async {
      final repo = InMemoryCaughtPokemonRepository([UserData(id: 1, isCaught: false)]);
      final transport = InMemoryCsvTransport()..cancelLoad = true;

      final importResult =
          await CaughtPokemonTransferService(repo).importCaught(transport);

      expect(importResult.cancelled, isTrue);
      final unchanged = await repo.loadAll();
      expect(unchanged.single.isCaught, isFalse);
    });

    test(
        'a hand-crafted isCaught,false row in the import does not downgrade existing caught state',
        () async {
      // Simulates a hand-edited export file: id 1 is explicitly marked
      // uncaught, alongside a legitimately caught id 25.
      final csv = CaughtPokemonCsvCodec.encode([
        UserData(id: 1, isCaught: false),
        UserData(id: 25, isCaught: true),
      ]);
      final transport = InMemoryCsvTransport()..storedCsv = csv;

      final destinationRepo = InMemoryCaughtPokemonRepository([
        UserData(id: 1, isCaught: true), // already caught locally
        UserData(id: 25, isCaught: false),
      ]);
      final importResult =
          await CaughtPokemonTransferService(destinationRepo).importCaught(transport);

      // Only the isCaught:true row counts as imported.
      expect(importResult.importedCount, 1);

      final restored = await destinationRepo.loadAll();
      final byId = {for (final u in restored) u.id: u.isCaught};
      expect(byId[1], isTrue); // not downgraded by the false row
      expect(byId[25], isTrue); // brought in from the import
    });
  });
}
