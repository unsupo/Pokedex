import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/profiles/scope_store.dart';

/// Holds the scope the UI is showing for the active profile, and remembers
/// each profile's choice. Starts on manual National when a profile has never
/// chosen one, so catching works immediately without picking a game first.
/// Derived National and per-game scopes are opt-in via the selector.
class ScopeProvider with ChangeNotifier {
  final ProfileProvider _profiles;
  final ScopeStore _store;

  ScopeProvider(this._profiles, this._store) {
    _profiles.addListener(load);
  }

  Scope _current = const ManualNationalScope();

  /// Bumped by every choice and every profile change. A load that finishes
  /// after a newer one started, or after a choice, must not overwrite it.
  int _generation = 0;

  Scope get current => _current;

  /// Reads the active profile's stored scope. Also runs on every profile
  /// change, because the notifier fires for each change to the profile list.
  Future<void> load() async {
    final generation = ++_generation;
    final profileId = _profiles.activeProfileId;
    final stored = await _store.read(profileId);
    if (generation != _generation || profileId != _profiles.activeProfileId) {
      return;
    }
    _current = _parseOrDefault(stored);
    notifyListeners();
  }

  Future<void> setScope(Scope scope) async {
    _generation++;
    _current = scope;
    notifyListeners();
    await _store.write(_profiles.activeProfileId, scope.key);
  }

  static Scope _parseOrDefault(String? key) {
    if (key == null) return const ManualNationalScope();
    try {
      return Scope.parse(key);
    } on FormatException {
      return const ManualNationalScope();
    }
  }

  @override
  void dispose() {
    _profiles.removeListener(load);
    super.dispose();
  }
}
