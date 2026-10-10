import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:pokedex_app/services/local/isar_local_service.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/game_catalog.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/local_service_profile_repository.dart';

import '../support/fakes.dart';
import '../support/isar_test_harness.dart';

/// Only the Pokemon list is served. Every other PokeAPI call throws, which
/// the provider's per-category error guard absorbs, so these tests stay offline.
class _ListOnlyPokemonService implements PokemonService {
  @override
  Future<List<Pokemon>> getPokemonList() async => [
        Pokemon(id: 25, name: 'pikachu', url: 'https://pokeapi.co/api/v2/pokemon/25/'),
        Pokemon(id: 4, name: 'charmander', url: 'https://pokeapi.co/api/v2/pokemon/4/'),
      ];

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} is not exercised here');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;
  late LocalService localService;

  setUpAll(() async {
    await initIsarCoreForTest();
    tempDir = await Directory.systemTemp.createTemp('pokemon_profile_');
    PathProviderPlatform.instance = FakePathProviderPlatform(tempDir.path);
    localService = await IsarService.create();
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  late ProfileProvider profiles;
  late PokemonApiProvider provider;
  late int ash;
  late int misty;

  setUp(() async {
    profiles = ProfileProvider(
      LocalServiceProfileRepository(localService),
      InMemoryActiveProfileStore(),
    );
    await profiles.load();
    final stamp = DateTime.now().microsecondsSinceEpoch;
    ash = (await profiles.createProfile('pp-ash-$stamp')).id;
    misty = (await profiles.createProfile('pp-misty-$stamp')).id;
    await profiles.setActive(ash);

    // Every profile writes to its own National, so each needs the manual scope.
    // A new profile starts on derived National, where writes are refused.
    final scopes = ScopeProvider(profiles, InMemoryScopeStore());
    await scopes.load();
    for (final id in [ash, misty]) {
      await profiles.setActive(id);
      await scopes.setScope(const ManualNationalScope());
    }
    await profiles.setActive(ash);
    final service = _ListOnlyPokemonService();
    provider = PokemonApiProvider(
        service, localService, profiles, scopes, GameCatalog(service));
    await provider.fetchData();
  });

  group('caught state follows the active profile', () {
    test('a Pokemon caught under one profile shows as uncaught after switching',
        () async {
      await provider.setCaught(25, true);
      expect(provider.allPokemon[25]!.isCaught, isTrue);

      await profiles.setActive(misty);

      await waitUntil(() => !provider.allPokemon[25]!.isCaught);
    });

    test('switching back restores the first profile\'s caught state', () async {
      await provider.setCaught(25, true);

      await profiles.setActive(misty);
      await profiles.setActive(ash);

      await waitUntil(() => provider.allPokemon[25]!.isCaught);
    });

    test('marking a Pokemon caught in the second profile leaves the first alone',
        () async {
      await provider.setCaught(25, true);

      await profiles.setActive(misty);
      await provider.setCaught(4, true);
      await profiles.setActive(ash);

      await waitUntil(() => provider.allPokemon[25]!.isCaught);
      expect(provider.allPokemon[4]!.isCaught, isFalse);
    });
  });

  group('a toggle during a profile switch', () {
    test('is saved to the profile that is active when it is tapped', () async {
      // Ash already has Charmander caught, so the provider holds Ash's record
      // for it. That is the record a stale toggle would reuse.
      await provider.setCaught(4, true);
      await profiles.setActive(misty); // starts the reload, not yet finished

      await provider.setCaught(4, true); // tapped while Misty is loading

      final misty4 = (await localService.getCaughtPokemonForProfile(misty))
          .where((r) => r.pokemonId == 4);
      expect(misty4.single.isCaught, isTrue,
          reason: 'the toggle belongs to Misty, the active profile');
      final ash4 = (await localService.getCaughtPokemonForProfile(ash))
          .where((r) => r.pokemonId == 4);
      expect(ash4.single.isCaught, isTrue, reason: 'Ash keeps her own catch');
    });
  });

  group('disposal', () {
    test('a reload still in flight when the provider is disposed does not notify',
        () async {
      final reload = provider.reloadCaughtForActiveProfile();
      provider.dispose();

      await expectLater(reload, completes);
    });
  });

  group('resetting a profile', () {
    test('clears the active profile\'s caught indicators without a restart',
        () async {
      await provider.setCaught(25, true);
      expect(provider.allPokemon[25]!.isCaught, isTrue);

      await profiles.resetProfile(ash);

      await waitUntil(() => !provider.allPokemon[25]!.isCaught);
    });

    test('leaves the other profile\'s caught indicators alone', () async {
      await profiles.setActive(misty);
      await provider.setCaught(4, true);
      await profiles.setActive(ash);
      await provider.setCaught(25, true);

      await profiles.resetProfile(ash);

      await waitUntil(() => !provider.allPokemon[25]!.isCaught);
      await profiles.setActive(misty);
      await waitUntil(() => provider.allPokemon[4]!.isCaught);
    });
  });

  group('CSV export and import use the active profile', () {
    test('export contains only the active profile\'s caught Pokemon', () async {
      await provider.setCaught(25, true);
      await profiles.setActive(misty);
      await provider.setCaught(4, true);
      await profiles.setActive(ash);

      final transport = InMemoryCsvTransport();
      final result = await provider.exportCaughtPokemon(transport, currentScopeOnly: false);

      expect(result.exportedCount, 1);
      expect(transport.storedCsv, contains('national,25,true'));
      expect(transport.storedCsv, isNot(contains('4,true')));
    });

    test('import affects only the active profile', () async {
      await provider.setCaught(25, true);
      final exportTransport = InMemoryCsvTransport();
      await provider.exportCaughtPokemon(exportTransport, currentScopeOnly: false);

      await profiles.setActive(misty);
      await provider.importCaughtPokemon(exportTransport);

      expect(provider.allPokemon[25]!.isCaught, isTrue);
      await profiles.setActive(ash);
      await waitUntil(() => provider.allPokemon[25]!.isCaught);
      expect(provider.allPokemon[4]!.isCaught, isFalse);
    });
  });
}
