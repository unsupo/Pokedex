import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/caught_pokemon.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/io/caught_pokemon_csv_codec.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_csv_codec.dart';
import 'package:pokedex_app/services/io/combined_caught_csv_codec.dart';
import 'package:pokedex_app/services/io/combined_caught_transfer_service.dart';

import '../../support/fakes.dart';
import 'caught_pokemon_transfer_service_test.dart' show InMemoryCaughtPokemonRepository;
import 'caught_tcg_card_transfer_service_test.dart' show InMemoryCaughtTcgCardRepository;

const _ash = 1;
const _misty = 2;

CaughtPokemon _pokemonRow(int profileId, String scopeKey, int pokemonId, bool isCaught) =>
    CaughtPokemon(profileId: profileId, scopeKey: scopeKey, pokemonId: pokemonId, isCaught: isCaught);

CaughtTcgCard _cardRow(int profileId, String cardId, bool isCaught) =>
    CaughtTcgCard(profileId: profileId, cardId: cardId, isCaught: isCaught);

void main() {
  group('CombinedCaughtTransferService export', () {
    test('writes caught Pokemon and caught cards into one file', () async {
      final pokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_ash, 'national', 4, false),
      ]);
      final cards = InMemoryCaughtTcgCardRepository([
        _cardRow(_ash, 'swsh1-1', true),
      ]);
      final profiles = InMemoryProfileRepository(['Ash']);
      final transport = InMemoryCsvTransport();

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .exportCaught(transport);

      expect(result.exportedPokemonCount, 1);
      expect(result.exportedCardCount, 1);
      final rows = CombinedCaughtCsvCodec.decode(transport.storedCsv!);
      expect(rows.where((r) => r.kind == 'pokemon').map((r) => r.pokemonId), [25]);
      expect(rows.where((r) => r.kind == 'card').map((r) => r.cardId), ['swsh1-1']);
    });

    test('covers every profile, not just one - the bug this shape fixes', () async {
      final pokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_misty, 'national', 7, true),
      ]);
      final cards = InMemoryCaughtTcgCardRepository([
        _cardRow(_ash, 'swsh1-1', true),
        _cardRow(_misty, 'base1-4', true),
      ]);
      final profiles = InMemoryProfileRepository(['Ash', 'Misty']);
      final transport = InMemoryCsvTransport();

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .exportCaught(transport);

      expect(result.exportedPokemonCount, 2);
      expect(result.exportedCardCount, 2);
      final rows = CombinedCaughtCsvCodec.decode(transport.storedCsv!);
      expect(rows.map((r) => r.profileName), containsAll(['Ash', 'Misty']));
    });

    test('exports every scope for a profile, not just one - a backup has no "current scope"',
        () async {
      final pokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_ash, 'vg:17', 1, true),
      ]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);
      final transport = InMemoryCsvTransport();

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .exportCaught(transport);

      expect(result.exportedPokemonCount, 2);
    });

    test('includes the Pokemon name from the lookup, for a human reading the file', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);
      final transport = InMemoryCsvTransport();

      await CombinedCaughtTransferService(pokemon, cards, profiles)
          .exportCaught(transport, pokemonNames: const {25: 'Pikachu'});

      expect(transport.storedCsv, contains('Pikachu'));
    });

    test('a cancelled save leaves the transport untouched', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .exportCaught(transport);

      expect(result.saved, isFalse);
      expect(transport.storedCsv, isNull);
    });
  });

  group('CombinedCaughtTransferService import', () {
    test('routes each row to the profile named on it, merging rather than replacing', () async {
      final sourcePokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_misty, 'national', 7, true),
      ]);
      final sourceCards = InMemoryCaughtTcgCardRepository([_cardRow(_ash, 'swsh1-1', true)]);
      final sourceProfiles = InMemoryProfileRepository(['Ash', 'Misty']);
      final transport = InMemoryCsvTransport();
      await CombinedCaughtTransferService(sourcePokemon, sourceCards, sourceProfiles)
          .exportCaught(transport);

      // Destination already has its own data for both profiles (same names,
      // same ids, as if re-importing into the same app).
      final destPokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 99, true)]);
      final destCards = InMemoryCaughtTcgCardRepository([_cardRow(_misty, 'other-1', true)]);
      final destProfiles = InMemoryProfileRepository(['Ash', 'Misty']);
      final result =
          await CombinedCaughtTransferService(destPokemon, destCards, destProfiles)
              .importCaught(transport, fallbackProfileId: _ash);

      expect(result.importedPokemonCount, 2);
      expect(result.importedCardCount, 1);
      final ashPokemon = (await destPokemon.loadAll(_ash)).map((r) => r.pokemonId);
      final mistyPokemon = (await destPokemon.loadAll(_misty)).map((r) => r.pokemonId);
      expect(ashPokemon, containsAll([25, 99]));
      expect(mistyPokemon, contains(7));
      final mistyCards = (await destCards.loadAll(_misty)).map((r) => r.cardId);
      expect(mistyCards, containsAll(['other-1'])); // Ash's card wasn't misrouted to Misty
    });

    test('creates a missing profile by name rather than dropping its rows', () async {
      final sourcePokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_misty, 'national', 7, true)]);
      final sourceCards = InMemoryCaughtTcgCardRepository([]);
      final sourceProfiles = InMemoryProfileRepository(['Ash', 'Misty']);
      final transport = InMemoryCsvTransport();
      await CombinedCaughtTransferService(sourcePokemon, sourceCards, sourceProfiles)
          .exportCaught(transport);

      // Destination (e.g. a fresh install) has never heard of "Misty".
      final destPokemon = InMemoryCaughtPokemonRepository([]);
      final destCards = InMemoryCaughtTcgCardRepository([]);
      final destProfiles = InMemoryProfileRepository(['Ash']);
      final result =
          await CombinedCaughtTransferService(destPokemon, destCards, destProfiles)
              .importCaught(transport, fallbackProfileId: _ash);

      expect(result.importedPokemonCount, 1);
      final createdMisty = destProfiles.profiles.firstWhere((p) => p.name == 'Misty');
      expect((await destPokemon.loadAll(createdMisty.id)).single.pokemonId, 7);
      // And it genuinely created a profile, not just routed into Ash's data:
      expect(await destPokemon.loadAll(_ash), isEmpty);
    });

    test('a row with no profile name (a pre-profile-export file) goes to the fallback', () async {
      final transport = InMemoryCsvTransport()
        ..storedCsv = CaughtPokemonCsvCodec.encode([
          (scopeKey: 'national', pokemonId: 25, isCaught: true),
        ]);
      final pokemon = InMemoryCaughtPokemonRepository([]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .importCaught(transport, fallbackProfileId: _ash);

      expect(result.importedPokemonCount, 1);
      expect((await pokemon.loadAll(_ash)).single.pokemonId, 25);
    });

    test('importing the same multi-profile export twice is a no-op', () async {
      final pokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_misty, 'national', 7, true),
      ]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash', 'Misty']);
      final transport = InMemoryCsvTransport();
      final service = CombinedCaughtTransferService(pokemon, cards, profiles);
      await service.exportCaught(transport);

      await service.importCaught(transport, fallbackProfileId: _ash);
      final first =
          (await pokemon.loadAll(_ash)).length + (await pokemon.loadAll(_misty)).length;
      await service.importCaught(transport, fallbackProfileId: _ash);
      final second =
          (await pokemon.loadAll(_ash)).length + (await pokemon.loadAll(_misty)).length;

      expect(second, first);
    });

    test('a cancelled load is reported and touches no repository', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, false)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);
      final transport = InMemoryCsvTransport()..cancelLoad = true;

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .importCaught(transport, fallbackProfileId: _ash);

      expect(result.cancelled, isTrue);
      expect((await pokemon.loadAll(_ash)).single.isCaught, isFalse);
    });

    test('still imports a file written by the old Pokemon-only export, as pokemon rows',
        () async {
      final transport = InMemoryCsvTransport()
        ..storedCsv = CaughtPokemonCsvCodec.encode([
          (scopeKey: 'national', pokemonId: 25, isCaught: true),
        ]);
      final pokemon = InMemoryCaughtPokemonRepository([]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .importCaught(transport, fallbackProfileId: _ash);

      expect(result.importedPokemonCount, 1);
      expect(result.importedCardCount, 0);
    });

    test('still imports a file written by the old cards-only export, as card rows', () async {
      final transport = InMemoryCsvTransport()
        ..storedCsv = CaughtTcgCardCsvCodec.encode([(cardId: 'swsh1-1', isCaught: true)]);
      final pokemon = InMemoryCaughtPokemonRepository([]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final profiles = InMemoryProfileRepository(['Ash']);

      final result = await CombinedCaughtTransferService(pokemon, cards, profiles)
          .importCaught(transport, fallbackProfileId: _ash);

      expect(result.importedPokemonCount, 0);
      expect(result.importedCardCount, 1);
    });
  });
}
