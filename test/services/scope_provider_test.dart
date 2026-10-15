import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/services/profiles/scope_store.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';

import '../support/fakes.dart';

void main() {
  late InMemoryProfileRepository repository;
  late InMemoryScopeStore scopeStore;
  late ProfileProvider profiles;
  late ScopeProvider scopes;

  setUp(() async {
    repository = InMemoryProfileRepository(['Ash', 'Misty']);
    profiles = ProfileProvider(repository, InMemoryActiveProfileStore(1));
    await profiles.load();
    scopeStore = InMemoryScopeStore();
    scopes = ScopeProvider(profiles, scopeStore);
    await scopes.load();
  });

  test('a profile with no stored choice starts on manual National, so '
      'catching works immediately', () {
    expect(scopes.current, const ManualNationalScope());
  });

  test('setScope changes the current scope and persists it for the active profile',
      () async {
    var notified = 0;
    scopes.addListener(() => notified++);

    await scopes.setScope(const GameScope(17));

    expect(scopes.current, const GameScope(17));
    expect(scopeStore.stored[1], 'vg:17');
    expect(notified, 1);
  });

  test('each profile remembers its own scope when switching back and forth',
      () async {
    await scopes.setScope(const GameScope(17));

    await profiles.setActive(2);
    await waitUntil(() => scopes.current == const ManualNationalScope());
    await scopes.setScope(const DerivedNationalScope());

    await profiles.setActive(1);
    await waitUntil(() => scopes.current == const GameScope(17));
    expect(scopeStore.stored[2], 'derived');
  });

  test('a stored key that no longer parses falls back to manual National, '
      'not the read-only derived view', () async {
    scopeStore.stored[1] = 'pokemon-go';
    await scopes.load();

    expect(scopes.current, const ManualNationalScope());
  });

  test('a choice made while a load is still reading storage is not overwritten',
      () async {
    final store = _SlowScopeStore();
    final slow = ScopeProvider(profiles, store);

    final loading = slow.load(); // the read is still pending
    await slow.setScope(const GameScope(17));
    store.finishRead(null); // the stale read comes back with nothing stored
    await loading;

    expect(slow.current, const GameScope(17));
  });
}

/// A store whose reads wait until the test completes them, to force an
/// overlap between a load and a write.
class _SlowScopeStore implements ScopeStore {
  final Map<int, String> stored = {};
  Completer<String?>? _pendingRead;

  @override
  Future<String?> read(int profileId) {
    _pendingRead = Completer<String?>();
    return _pendingRead!.future;
  }

  void finishRead(String? value) => _pendingRead!.complete(value);

  @override
  Future<void> write(int profileId, String scopeKey) async =>
      stored[profileId] = scopeKey;
}
