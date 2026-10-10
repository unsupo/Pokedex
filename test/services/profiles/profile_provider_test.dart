import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/profile_provider.dart';

import '../../support/fakes.dart';

void main() {
  late InMemoryProfileRepository repository;
  late InMemoryActiveProfileStore store;
  late ProfileProvider provider;

  ProfileProvider build({int? storedActiveId}) {
    store = InMemoryActiveProfileStore(storedActiveId);
    return ProfileProvider(repository, store);
  }

  setUp(() {
    repository = InMemoryProfileRepository(['Ash', 'Misty']);
  });

  group('load', () {
    test('restores the stored active profile', () async {
      provider = build(storedActiveId: 2);

      await provider.load();

      expect(provider.activeProfileId, 2);
      expect(provider.activeProfile.name, 'Misty');
    });

    test('falls back to the first profile when the stored id no longer exists',
        () async {
      provider = build(storedActiveId: 99);

      await provider.load();

      expect(provider.activeProfileId, 1);
      expect(store.stored, 1, reason: 'the fallback is persisted');
    });

    test('picks the first profile when nothing is stored yet', () async {
      provider = build();

      await provider.load();

      expect(provider.activeProfileId, 1);
      expect(store.stored, 1);
    });

    test('throws when the repository has no profiles at all', () async {
      repository = InMemoryProfileRepository();
      provider = build();

      expect(provider.load(), throwsStateError);
    });

    test('reading the active profile before load throws a clear error', () {
      provider = build();

      expect(() => provider.activeProfileId, throwsStateError);
    });
  });

  group('setActive', () {
    setUp(() async {
      provider = build(storedActiveId: 1);
      await provider.load();
    });

    test('switches the active profile, persists it and notifies listeners',
        () async {
      var notified = 0;
      provider.addListener(() => notified++);

      await provider.setActive(2);

      expect(provider.activeProfileId, 2);
      expect(store.stored, 2);
      expect(notified, 1);
    });

    test('rejects an id that is not one of the profiles', () async {
      expect(provider.setActive(42), throwsArgumentError);
      expect(provider.activeProfileId, 1);
    });
  });

  group('createProfile', () {
    setUp(() async {
      provider = build(storedActiveId: 1);
      await provider.load();
    });

    test('adds the profile, makes it active and persists the choice', () async {
      final created = await provider.createProfile('Brock');

      expect(provider.profiles.map((p) => p.name), ['Ash', 'Misty', 'Brock']);
      expect(provider.activeProfileId, created.id);
      expect(store.stored, created.id);
    });

    test('trims surrounding whitespace from the name', () async {
      final created = await provider.createProfile('  Gary  ');

      expect(created.name, 'Gary');
    });

    test('rejects a blank name', () async {
      expect(provider.createProfile('   '), throwsArgumentError);
      expect(provider.profiles, hasLength(2));
    });

    test('rejects a name longer than the maximum length', () async {
      final tooLong = 'x' * (ProfileProvider.maxNameLength + 1);

      expect(provider.createProfile(tooLong), throwsArgumentError);
      expect(provider.profiles, hasLength(2));
    });

    test('accepts a name exactly at the maximum length', () async {
      final atLimit = 'x' * ProfileProvider.maxNameLength;

      final created = await provider.createProfile(atLimit);

      expect(created.name, atLimit);
    });
  });

  group('renameProfile', () {
    setUp(() async {
      provider = build(storedActiveId: 1);
      await provider.load();
    });

    test('changes the name shown for that profile only', () async {
      await provider.renameProfile(2, 'Misty R');

      expect(provider.profiles.map((p) => p.name), ['Ash', 'Misty R']);
    });

    test('rejects a blank name and leaves the profile unchanged', () async {
      expect(provider.renameProfile(2, ''), throwsArgumentError);
      expect(provider.profiles.last.name, 'Misty');
    });
  });

  group('resetProfile', () {
    setUp(() async {
      provider = build(storedActiveId: 1);
      await provider.load();
    });

    test('asks the repository to reset only the given profile', () async {
      await provider.resetProfile(2);

      expect(repository.resetProfileIds, [2]);
    });

    test('does not change which profile is active', () async {
      await provider.resetProfile(2);

      expect(provider.activeProfileId, 1);
    });
  });
}
