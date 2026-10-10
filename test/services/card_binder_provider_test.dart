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

  group('CardBinderProvider.pocketFor', () {
    test('AC5: a Pokemon with nothing owned shows the empty state', () async {
      final provider = await buildProvider();

      expect(provider.pocketFor(1), isA<EmptyPocket>());
    });

    test('AC4: a Pokemon with an owned, unselected card shows the owned state',
        () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]),
      ];
      final provider = await buildProvider();

      expect(provider.pocketFor(1), isA<OwnedPocket>());
    });

    test('AC3: a Pokemon with a selected card shows that card', () async {
      final card =
          TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]);
      repository.caughtCardsByProfile[ash] = [card];
      await repository.setSelection(ash, 1, 'c-1');
      final provider = await buildProvider();

      final view = provider.pocketFor(1);
      expect(view, isA<SelectedPocket>());
      expect((view as SelectedPocket).card.id, 'c-1');
    });

    test(
        'AC6: un-catching the selected card falls back to owned when another '
        "card for this Pokemon is still owned", () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-2', name: 'Bulbasaur Card 2', nationalPokedexNumbers: [1]),
      ];
      await repository.setSelection(ash, 1, 'c-1'); // c-1 no longer owned
      final provider = await buildProvider();

      expect(provider.pocketFor(1), isA<OwnedPocket>());
    });

    test('AC14: a second profile never sees the first profile\'s cards or '
        'selections', () async {
      repository.caughtCardsByProfile[ash] = [
        TcgCard(id: 'c-1', name: 'Bulbasaur Card', nationalPokedexNumbers: [1]),
      ];
      await repository.setSelection(ash, 1, 'c-1');
      final provider = await buildProvider();
      await profiles.setActive(misty);
      await provider.load();

      expect(provider.pocketFor(1), isA<EmptyPocket>());
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

      expect(provider.ownedCardsFor(25).map((c) => c.id).toSet(), {'c-1', 'c-2'});
    });
  });

  group('CardBinderProvider.selectCard', () {
    test(
        'AC10: persists the selection and updates the pocket immediately, '
        "without waiting for a reload", () async {
      final provider = await buildProvider();
      final card = TcgCard(id: 'c-9', name: 'Mew', nationalPokedexNumbers: [151]);

      await provider.selectCard(151, card);

      expect(provider.pocketFor(151), isA<SelectedPocket>());
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
      expect(provider.pocketFor(121), isA<EmptyPocket>());

      await profiles.setActive(misty);
      await pumpEventQueue();

      expect(provider.pocketFor(121), isA<OwnedPocket>());
    });
  });
}
