import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/card_binder_provider.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/utils/binder/binder_pocket.dart';

import '../support/fakes.dart';

void main() {
  late InMemoryBinderRepository repository;
  late ProfileProvider profiles;
  late int ash;
  late int misty;

  // Profiles/repository are ready (so a test can seed data into them) before
  // any test body runs; building the CardBinderProvider itself is a separate
  // step below, so a test can seed data first and only then load it.
  setUp(() async {
    repository = InMemoryBinderRepository();
    final profileRepository = InMemoryProfileRepository();
    profiles = ProfileProvider(profileRepository, InMemoryActiveProfileStore());
    ash = (await profileRepository.addProfile('Ash')).id;
    misty = (await profileRepository.addProfile('Misty')).id;
    await profiles.load();
    await profiles.setActive(ash);
  });

  Future<CardBinderProvider> buildProvider() async {
    final provider = CardBinderProvider(repository, profiles);
    await provider.load();
    return provider;
  }

  group('CardBinderProvider.load', () {
    test(
        'AC28: backfills uncached caught cards before reading them - see '
        'tcg_card_repository_test.dart for the actual fetch/cache behavior',
        () async {
      await buildProvider();

      expect(repository.backfillCallCount, 1);
    });

    test('backfills again on every reload, not just the first', () async {
      final provider = await buildProvider();

      await provider.load();

      expect(repository.backfillCallCount, 2);
    });
  });

  group('CardBinderProvider.pocketFor', () {
    test('AC5: a Pokemon with nothing owned shows the empty state', () async {
      final provider = await buildProvider();

      expect(provider.pocketFor(1, pokemonCaught: false), isA<EmptyPocket>());
    });

    test(
        'AC25/AC28 (Seventh round catch-up): an owned card with no selection '
        'ever recorded gets auto-selected and persisted during load, rather '
        "than staying on the owned-indicator state", () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]),
      ];
      final provider = await buildProvider();

      final view = provider.pocketFor(1, pokemonCaught: false);
      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card.id, 'c-1');
      final persisted = await repository.getSelectionsForProfile(ash);
      expect(persisted.single.selectedCardId, 'c-1');
    });

    test(
        'the catch-up picks the highest-priced of several owned-but-never-'
        'selected cards for the same Pokemon', () async {
      final cheap = TcgCard(
          id: 'c-cheap',
          name: 'Bulbasaur (common)',
          nationalPokedexNumbers: [1],
          tcgplayer: Tcgplayer(
              prices: TcgplayerPrices(holofoil: PriceData(market: 1))));
      final pricey = TcgCard(
          id: 'c-pricey',
          name: 'Bulbasaur (rare)',
          nationalPokedexNumbers: [1],
          tcgplayer: Tcgplayer(
              prices: TcgplayerPrices(holofoil: PriceData(market: 500))));
      repository.caughtCardsByProfile[ash] = [cheap, pricey];
      final provider = await buildProvider();

      final view = provider.pocketFor(1, pokemonCaught: false);
      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card.id, 'c-pricey');
    });

    test('AC3: a Pokemon with a selected card shows that card', () async {
      final card = TcgCard(
          id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]);
      repository.caughtCardsByProfile[ash] = [card];
      await repository.setSelection(ash, 1, 'c-1');
      final provider = await buildProvider();

      final view = provider.pocketFor(1, pokemonCaught: false);
      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card.id, 'c-1');
    });

    test(
        'AC6: un-catching the selected card falls back to owned when another '
        "card for this Pokemon is still owned - also confirms the Seventh-"
        'round catch-up never overrides an existing (even now-invalid) '
        'selection row, since one is already recorded for this Pokemon',
        () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(
            id: 'c-2', name: 'Bulbasaur Card 2', nationalPokedexNumbers: [1]),
      ];
      await repository.setSelection(ash, 1, 'c-1'); // c-1 no longer owned
      final provider = await buildProvider();

      expect(provider.pocketFor(1, pokemonCaught: false), isA<OwnedPocket>());
    });

    test(
        'AC14: a second profile never sees the first profile\'s cards or '
        'selections', () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]),
      ];
      await repository.setSelection(ash, 1, 'c-1');
      final provider = await buildProvider();
      await profiles.setActive(misty);
      await provider.load();

      expect(provider.pocketFor(1, pokemonCaught: false), isA<EmptyPocket>());
    });

    test(
        'AC39 (Ninth round): a caught Pokemon with no TCG card at all shows '
        'the owned-indicator state, not the + state', () async {
      final provider = await buildProvider();

      expect(provider.pocketFor(1, pokemonCaught: true), isA<OwnedPocket>());
    });

    test(
        'AC39: an explicit selection still wins over pokemonCaught, same as '
        'it already wins over owned-but-uncached', () async {
      final card =
          TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [
        1,
      ]);
      repository.caughtCardsByProfile[ash] = [card];
      await repository.setSelection(ash, 1, 'c-1');
      final provider = await buildProvider();

      final view = provider.pocketFor(1, pokemonCaught: true);
      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card.id, 'c-1');
    });
  });

  group('CardBinderProvider.ownedCardsFor', () {
    test('returns every owned card for one Pokemon, not other Pokemon\'s',
        () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-1', name: 'Pikachu V', nationalPokedexNumbers: [25]),
        TcgCard(id: 'c-2', name: 'Pikachu VMAX', nationalPokedexNumbers: [25]),
        TcgCard(id: 'c-3', name: 'Bulbasaur', nationalPokedexNumbers: [1]),
      ];
      final provider = await buildProvider();

      expect(
          provider.ownedCardsFor(25).map((c) => c.id).toSet(), {'c-1', 'c-2'});
    });
  });

  group('CardBinderProvider.selectCard', () {
    test(
        'AC10: persists the selection and updates the pocket immediately, '
        "without waiting for a reload", () async {
      final provider = await buildProvider();
      final card =
          TcgCard(id: 'c-9', name: 'Mew', nationalPokedexNumbers: [151]);

      await provider.selectCard(151, card);

      expect(
          provider.pocketFor(151, pokemonCaught: false), isA<SelectedPocket>());
      final persisted = await repository.getSelectionsForProfile(ash);
      expect(persisted.single.selectedCardId, 'c-9');
    });

    test('a selection notifies listeners', () async {
      final provider = await buildProvider();
      var notified = false;
      provider.addListener(() => notified = true);

      await provider.selectCard(151, TcgCard(id: 'c-9', name: 'Mew'));

      expect(notified, isTrue);
    });
  });

  group('CardBinderProvider profile switching', () {
    test('switching the active profile reloads to that profile\'s own data',
        () async {
      repository.caughtCardsByProfile[misty] = [
        TcgCard(id: 'm-1', name: 'Starmie', nationalPokedexNumbers: [121]),
      ];
      final provider = await buildProvider();
      expect(provider.pocketFor(121, pokemonCaught: false), isA<EmptyPocket>());

      await profiles.setActive(misty);
      await pumpEventQueue();

      // SelectedPocket, not OwnedPocket, per the Seventh-round catch-up -
      // misty's m-1 has never had a selection recorded, so it gets one
      // automatically as part of this reload.
      expect(
          provider.pocketFor(121, pokemonCaught: false), isA<SelectedPocket>());
    });
  });
}
