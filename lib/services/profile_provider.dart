import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/profile.dart';
import 'package:pokedex_app/services/profiles/active_profile_store.dart';
import 'package:pokedex_app/services/profiles/profile_repository.dart';

/// Owns the list of profiles and which one is active. Other providers listen
/// to this and reload their caught state when [activeProfileId] changes.
class ProfileProvider with ChangeNotifier {
  static const int maxNameLength = 30;

  final ProfileRepository _repository;
  final ActiveProfileStore _activeStore;

  ProfileProvider(this._repository, this._activeStore);

  final List<Profile> _profiles = [];
  int? _activeProfileId;

  List<Profile> get profiles => List.unmodifiable(_profiles);

  /// Throws [StateError] until [load] has completed.
  int get activeProfileId {
    final id = _activeProfileId;
    if (id == null) {
      throw StateError('ProfileProvider.load() has not completed');
    }
    return id;
  }

  Profile get activeProfile =>
      _profiles.firstWhere((p) => p.id == activeProfileId);

  /// Loads the profiles and restores the stored active one. Falls back to the
  /// first profile when nothing is stored or the stored id no longer exists.
  Future<void> load() async {
    _profiles
      ..clear()
      ..addAll(await _repository.loadProfiles());
    if (_profiles.isEmpty) {
      throw StateError('No profiles exist; the migration should create one');
    }

    final stored = await _activeStore.read();
    final isKnown = _profiles.any((p) => p.id == stored);
    _activeProfileId = isKnown ? stored : _profiles.first.id;
    if (!isKnown) {
      await _activeStore.write(_activeProfileId!);
    }
    notifyListeners();
  }

  Future<void> setActive(int profileId) async {
    if (!_profiles.any((p) => p.id == profileId)) {
      throw ArgumentError.value(profileId, 'profileId', 'no such profile');
    }
    _activeProfileId = profileId;
    await _activeStore.write(profileId);
    notifyListeners();
  }

  /// Creates a profile and switches to it.
  Future<Profile> createProfile(String name) async {
    final cleaned = _validatedName(name);
    final created = await _repository.addProfile(cleaned);
    _profiles.add(created);
    await setActive(created.id);
    return created;
  }

  Future<void> renameProfile(int profileId, String name) async {
    final cleaned = _validatedName(name);
    await _repository.renameProfile(profileId, cleaned);
    final index = _profiles.indexWhere((p) => p.id == profileId);
    if (index != -1) {
      _profiles[index].name = cleaned;
    }
    notifyListeners();
  }

  /// Clears the profile's caught Pokemon and cards. The active profile does
  /// not change, and the profile itself is kept.
  Future<void> resetProfile(int profileId) async {
    await _repository.resetProfile(profileId);
    notifyListeners();
  }

  /// Shared by the provider and the UI, so both enforce one rule. Returns null
  /// when [name] is acceptable.
  static String? nameError(String name) {
    final cleaned = name.trim();
    if (cleaned.isEmpty) return 'Name cannot be empty';
    if (cleaned.length > maxNameLength) {
      return 'Name must be $maxNameLength characters or fewer';
    }
    return null;
  }

  String _validatedName(String name) {
    final error = nameError(name);
    if (error != null) {
      throw ArgumentError.value(name, 'name', error);
    }
    return name.trim();
  }
}
