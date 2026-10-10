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
      final transport = InMemoryCsvTransport();

      final result = await CombinedCaughtTransferService(pokemon, cards)
          .exportCaught(transport, profileId: _ash);

      expect(result.exportedPokemonCount, 1);
      expect(result.exportedCardCount, 1);
      final rows = CombinedCaughtCsvCodec.decode(transport.storedCsv!);
      expect(rows.where((r) => r.kind == 'pokemon').map((r) => r.pokemonId), [25]);
      expect(rows.where((r) => r.kind == 'card').map((r) => r.cardId), ['swsh1-1']);
    });

    test('a scope filter limits the Pokemon side only; cards are unaffected', () async {
      final pokemon = InMemoryCaughtPokemonRepository([
        _pokemonRow(_ash, 'national', 25, true),
        _pokemonRow(_ash, 'vg:17', 1, true),
      ]);
      final cards = InMemoryCaughtTcgCardRepository([_cardRow(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();

      final result = await CombinedCaughtTransferService(pokemon, cards).exportCaught(
          transport,
          profileId: _ash,
          pokemonScopeKey: 'national');

      expect(result.exportedPokemonCount, 1);
      expect(result.exportedCardCount, 1);
    });

    test('includes the Pokemon name from the lookup, for a human reading the file', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final transport = InMemoryCsvTransport();

      await CombinedCaughtTransferService(pokemon, cards).exportCaught(transport,
          profileId: _ash, pokemonNames: const {25: 'Pikachu'});

      expect(transport.storedCsv, contains('Pikachu'));
    });

    test('a cancelled save leaves the transport untouched', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final transport = InMemoryCsvTransport()..cancelSave = true;

      final result = await CombinedCaughtTransferService(pokemon, cards)
          .exportCaught(transport, profileId: _ash);

      expect(result.saved, isFalse);
      expect(transport.storedCsv, isNull);
    });
  });

  group('CombinedCaughtTransferService import', () {
    test('routes rows to the matching repository and merges, not replaces', () async {
      final sourcePokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final sourceCards = InMemoryCaughtTcgCardRepository([_cardRow(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();
      await CombinedCaughtTransferService(sourcePokemon, sourceCards)
          .exportCaught(transport, profileId: _ash);

      final destPokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_misty, 'national', 99, true)]);
      final destCards = InMemoryCaughtTcgCardRepository([_cardRow(_misty, 'other-1', true)]);
      final result = await CombinedCaughtTransferService(destPokemon, destCards)
          .importCaught(transport, profileId: _misty);

      expect(result.importedPokemonCount, 1);
      expect(result.importedCardCount, 1);
      final pokemonIds = (await destPokemon.loadAll(_misty)).where((r) => r.isCaught).map((r) => r.pokemonId);
      final cardIds = (await destCards.loadAll(_misty)).where((r) => r.isCaught).map((r) => r.cardId);
      expect(pokemonIds, containsAll([25, 99]));
      expect(cardIds, containsAll(['swsh1-1', 'other-1']));
    });

    test('import into one profile never touches another profile', () async {
      final sourcePokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final sourceCards = InMemoryCaughtTcgCardRepository([_cardRow(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();
      await CombinedCaughtTransferService(sourcePokemon, sourceCards)
          .exportCaught(transport, profileId: _ash);

      final pokemon = InMemoryCaughtPokemonRepository([]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      await CombinedCaughtTransferService(pokemon, cards)
          .importCaught(transport, profileId: _misty);

      expect(await pokemon.loadAll(_ash), isEmpty);
      expect(await cards.loadAll(_ash), isEmpty);
    });

    test('importing the same export twice is a no-op', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, true)]);
      final cards = InMemoryCaughtTcgCardRepository([_cardRow(_ash, 'swsh1-1', true)]);
      final transport = InMemoryCsvTransport();
      final service = CombinedCaughtTransferService(pokemon, cards);
      await service.exportCaught(transport, profileId: _ash);

      await service.importCaught(transport, profileId: _ash);
      final first = (await pokemon.loadAll(_ash)).length + (await cards.loadAll(_ash)).length;
      await service.importCaught(transport, profileId: _ash);
      final second = (await pokemon.loadAll(_ash)).length + (await cards.loadAll(_ash)).length;

      expect(second, first);
    });

    test('a cancelled load is reported and touches neither repository', () async {
      final pokemon = InMemoryCaughtPokemonRepository([_pokemonRow(_ash, 'national', 25, false)]);
      final cards = InMemoryCaughtTcgCardRepository([]);
      final transport = InMemoryCsvTransport()..cancelLoad = true;

      final result = await CombinedCaughtTransferService(pokemon, cards)
          .importCaught(transport, profileId: _ash);

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

      final result = await CombinedCaughtTransferService(pokemon, cards)
          .importCaught(transport, profileId: _ash);

      expect(result.importedPokemonCount, 1);
      expect(result.importedCardCount, 0);
    });

    test('still imports a file written by the old cards-only export, as card rows', () async {
      final transport = InMemoryCsvTransport()
        ..storedCsv = CaughtTcgCardCsvCodec.encode([(cardId: 'swsh1-1', isCaught: true)]);
      final pokemon = InMemoryCaughtPokemonRepository([]);
      final cards = InMemoryCaughtTcgCardRepository([]);

      final result = await CombinedCaughtTransferService(pokemon, cards)
          .importCaught(transport, profileId: _ash);

      expect(result.importedPokemonCount, 0);
      expect(result.importedCardCount, 1);
    });
  });
}
