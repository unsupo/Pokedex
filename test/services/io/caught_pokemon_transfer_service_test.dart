import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/services/io/caught_pokemon_csv_codec.dart';
import 'package:pokedex_app/services/io/caught_pokemon_repository.dart';
import 'package:pokedex_app/services/io/caught_pokemon_transfer_service.dart';

import '../../support/fakes.dart';

const _ash = 1;
const _misty = 2;

/// Holds rows in memory with the same upsert-by-(profile, scope, pokemon)
/// semantics as the Isar-backed repository, so merge behaviour is real.
class InMemoryCaughtPokemonRepository implements CaughtPokemonRepository {
  final List<CaughtPokemon> _rows;

  InMemoryCaughtPokemonRepository(List<CaughtPokemon> initial)
      : _rows = List.of(initial);

  @override
  Future<List<CaughtPokemon>> loadAll(int profileId) async =>
      _rows.where((r) => r.profileId == profileId).toList();

  @override
  Future<void> saveAll(List<CaughtPokemon> rows) async {
    for (final row in rows) {
      _rows.removeWhere((r) =>
          r.profileId == row.profileId &&
          r.scopeKey == row.scopeKey &&
          r.pokemonId == row.pokemonId);
      _rows.add(row);
    }
  }

  List<CaughtPokemon> get all => List.unmodifiable(_rows);
}

CaughtPokemon _row(int profileId, int pokemonId, bool isCaught) => CaughtPokemon(
      profileId: profileId,
      pokemonId: pokemonId,
      isCaught: isCaught,
    );

void main() {
  group('CaughtPokemonTransferService closed loop', () {
    test(
        'export then import into a fresh profile restores exactly the caught set',
        () async {
      final source = InMemoryCaughtPokemonRepository([
        _row(_ash, 1, true),
        _row(_ash, 4, false),
        _row(_ash, 25, true),
        _row(_ash, 150, true),
      ]);
      final transport = InMemoryCsvTransport();

      final exportResult = await CaughtPokemonTransferService(source)
          .exportCaught(transport, profileId: _ash);
      expect(exportResult.exportedCount, 3);

      final destination = InMemoryCaughtPokemonRepository([
        _row(_misty, 1, false),
      ]);
      final importResult = await CaughtPokemonTransferService(destination)
          .importCaught(transport, profileId: _misty);
      expect(importResult.importedCount, 3);

      final caughtIds = (await destination.loadAll(_misty))
          .where((r) => r.isCaught)
          .map((r) => r.pokemonId)
          .toSet();
      expect(caughtIds, {1, 25, 150});
    });

    test('import merges into existing state instead of replacing it', () async {
      final source = InMemoryCaughtPokemonRepository([_row(_ash, 1, true)]);
      final transport = InMemoryCsvTransport();
      await CaughtPokemonTransferService(source)
          .exportCaught(transport, profileId: _ash);

      final destination = InMemoryCaughtPokemonRepository([
        _row(_misty, 1, false),
        _row(_misty, 99, true),
      ]);
      await CaughtPokemonTransferService(destination)
          .importCaught(transport, profileId: _misty);

      final byId = {
        for (final r in await destination.loadAll(_misty)) r.pokemonId: r.isCaught
      };
      expect(byId[1], isTrue); // brought in from the import
      expect(byId[99], isTrue); // untouched, not mentioned in the file
    });

    test('importing the same export twice is a no-op', () async {
      final repo = InMemoryCaughtPokemonRepository([
        _row(_ash, 1, true),
        _row(_ash, 2, false),
      ]);
      final transport = InMemoryCsvTransport();
      final service = CaughtPokemonTransferService(repo);

      await service.exportCaught(transport, profileId: _ash);
      await service.importCaught(transport, profileId: _ash);
      final afterFirst = {
        for (final r in await repo.loadAll(_ash)) (r.pokemonId, r.isCaught)
      };

      await service.importCaught(transport, profileId: _ash);
      final afterSecond = {
        for (final r in await repo.loadAll(_ash)) (r.pokemonId, r.isCaught)
      };

      expect(afterSecond, afterFirst);
    });

    test('an all-uncaught profile exports a header-only CSV that imports to zero',
        () async {
      final source = InMemoryCaughtPokemonRepository([_row(_ash, 1, false)]);
      final transport = InMemoryCsvTransport();

      final exportResult = await CaughtPokemonTransferService(source)
          .exportCaught(transport, profileId: _ash);
      expect(exportResult.exportedCount, 0);

      final importResult = await CaughtPokemonTransferService(source)
          .importCaught(transport, profileId: _ash);
      expect(importResult.importedCount, 0);
    });

    test('a cancelled save leaves the transport untouched', () async {
      final repo = InMemoryCaughtPokemonRepository([_row(_ash, 1, true)]);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final exportResult = await CaughtPokemonTransferService(repo)
          .exportCaught(transport, profileId: _ash);

      expect(exportResult.saved, isFalse);
      expect(transport.storedCsv, isNull);
    });

    test('a cancelled load is reported and does not touch the repository',
        () async {
      final repo = InMemoryCaughtPokemonRepository([_row(_ash, 1, false)]);
      final transport = InMemoryCsvTransport()..cancelLoad = true;

      final importResult = await CaughtPokemonTransferService(repo)
          .importCaught(transport, profileId: _ash);

      expect(importResult.cancelled, isTrue);
      expect((await repo.loadAll(_ash)).single.isCaught, isFalse);
    });

    test(
        'an isCaught=false row in the import does not downgrade existing caught state',
        () async {
      // A hand-edited file: id 1 explicitly marked uncaught, id 25 caught.
      final csv = CaughtPokemonCsvCodec.encode([
        (scopeKey: 'national', pokemonId: 1, isCaught: false),
        (scopeKey: 'national', pokemonId: 25, isCaught: true),
      ]);
      final transport = InMemoryCsvTransport()..storedCsv = csv;

      final destination = InMemoryCaughtPokemonRepository([
        _row(_ash, 1, true), // already caught locally
        _row(_ash, 25, false),
      ]);
      final importResult = await CaughtPokemonTransferService(destination)
          .importCaught(transport, profileId: _ash);

      expect(importResult.importedCount, 1);
      final byId = {
        for (final r in await destination.loadAll(_ash)) r.pokemonId: r.isCaught
      };
      expect(byId[1], isTrue);
      expect(byId[25], isTrue);
    });
  });

  group('CaughtPokemonTransferService profile scoping', () {
    test('export writes only the chosen profile\'s caught Pokemon', () async {
      final repo = InMemoryCaughtPokemonRepository([
        _row(_ash, 25, true),
        _row(_misty, 7, true),
      ]);
      final transport = InMemoryCsvTransport();

      final result = await CaughtPokemonTransferService(repo)
          .exportCaught(transport, profileId: _ash);

      expect(result.exportedCount, 1);
      expect(
        CaughtPokemonCsvCodec.decode(transport.storedCsv!).map((r) => r.pokemonId),
        [25],
      );
    });

    test('export limited to one scope writes only that scope', () async {
      final repo = InMemoryCaughtPokemonRepository([
        CaughtPokemon(profileId: _ash, scopeKey: 'national', pokemonId: 25, isCaught: true),
        CaughtPokemon(profileId: _ash, scopeKey: 'vg:1', pokemonId: 1, isCaught: true),
      ]);
      final transport = InMemoryCsvTransport();

      final result = await CaughtPokemonTransferService(repo).exportCaught(
          transport,
          profileId: _ash,
          scopeKey: 'vg:1');

      expect(result.exportedCount, 1);
      expect(CaughtPokemonCsvCodec.decode(transport.storedCsv!).single.pokemonId, 1);
    });

    test('export with no scope limit writes every scope', () async {
      final repo = InMemoryCaughtPokemonRepository([
        CaughtPokemon(profileId: _ash, scopeKey: 'national', pokemonId: 25, isCaught: true),
        CaughtPokemon(profileId: _ash, scopeKey: 'vg:1', pokemonId: 1, isCaught: true),
      ]);

      final result = await CaughtPokemonTransferService(repo)
          .exportCaught(InMemoryCsvTransport(), profileId: _ash);

      expect(result.exportedCount, 2);
    });

    test('import into one profile never changes another profile\'s rows',
        () async {
      final source = InMemoryCaughtPokemonRepository([_row(_ash, 25, true)]);
      final transport = InMemoryCsvTransport();
      await CaughtPokemonTransferService(source)
          .exportCaught(transport, profileId: _ash);

      final repo = InMemoryCaughtPokemonRepository([_row(_misty, 25, false)]);
      await CaughtPokemonTransferService(repo)
          .importCaught(transport, profileId: _misty);

      final mistyRow = (await repo.loadAll(_misty)).single;
      final ashRows = await repo.loadAll(_ash);
      expect(mistyRow.isCaught, isTrue);
      expect(ashRows, isEmpty, reason: 'import must not create rows for Ash');
    });

    test('a legacy id,isCaught file imports into the national scope', () async {
      final transport = InMemoryCsvTransport()
        ..storedCsv = 'id,isCaught\n25,true\n';
      final repo = InMemoryCaughtPokemonRepository([]);

      await CaughtPokemonTransferService(repo)
          .importCaught(transport, profileId: _ash);

      final row = (await repo.loadAll(_ash)).single;
      expect(row.scopeKey, nationalScopeKey);
      expect(row.pokemonId, 25);
      expect(row.isCaught, isTrue);
    });
  });
}
