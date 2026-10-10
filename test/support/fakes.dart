import 'dart:async';

import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/services/io/csv_transport.dart';
import 'package:pokedex_app/services/profiles/active_profile_store.dart';
import 'package:pokedex_app/services/profiles/profile_repository.dart';
import 'package:pokedex_app/services/profiles/scope_store.dart';

/// In-memory [ProfileRepository]. Records which profiles were reset so tests
/// can assert that only the intended profile was touched.
class InMemoryProfileRepository implements ProfileRepository {
  InMemoryProfileRepository([List<String> names = const []]) {
    for (final name in names) {
      profiles.add(Profile(id: _nextId++, name: name));
    }
  }

  final List<Profile> profiles = [];
  final List<int> resetProfileIds = [];
  int _nextId = 1;

  @override
  Future<List<Profile>> loadProfiles() async => List.of(profiles);

  @override
  Future<Profile> addProfile(String name) async {
    final profile = Profile(id: _nextId++, name: name);
    profiles.add(profile);
    return profile;
  }

  @override
  Future<void> renameProfile(int profileId, String name) async {
    profiles.firstWhere((p) => p.id == profileId).name = name;
  }

  @override
  Future<void> resetProfile(int profileId) async {
    resetProfileIds.add(profileId);
  }
}

/// In-memory [ActiveProfileStore] that remembers the last value written.
class InMemoryActiveProfileStore implements ActiveProfileStore {
  InMemoryActiveProfileStore([this.stored]);

  int? stored;

  @override
  Future<int?> read() async => stored;

  @override
  Future<void> write(int profileId) async => stored = profileId;
}

/// Stands in for "the cloud" (or a local file, or Drive) behind [CsvTransport]
/// by holding the exported bytes in memory.
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

/// Polls until [condition] holds. Provider reloads run asynchronously against
/// a real database after a profile switch, so tests wait for the result rather
/// than assuming it has already landed.
Future<void> waitUntil(
  bool Function() condition, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) {
      throw TimeoutException('condition was not met within $timeout');
    }
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

/// In-memory [ScopeStore], keyed by profile id.
class InMemoryScopeStore implements ScopeStore {
  final Map<int, String> stored = {};

  @override
  Future<String?> read(int profileId) async => stored[profileId];

  @override
  Future<void> write(int profileId, String scopeKey) async =>
      stored[profileId] = scopeKey;
}
