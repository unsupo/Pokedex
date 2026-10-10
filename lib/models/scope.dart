import 'package:pokedex_app/models/caught_pokemon.dart';

/// Which set of caught records the UI is showing. See
/// docs/epics/profiles-and-per-game-tracking/03-scope-model.md.
///
/// Sealed so that `switch` over the kinds is checked for exhaustiveness.
sealed class Scope {
  const Scope();

  /// Stable string used for storage and for the [CaughtPokemon.scopeKey] column.
  String get key;

  /// Whether this scope has rows of its own. Derived National does not.
  bool get isStored;

  /// Reads a key written by [key]. Throws [FormatException] on an unknown key.
  static Scope parse(String key) {
    if (key == const DerivedNationalScope().key) return const DerivedNationalScope();
    if (key == nationalScopeKey) return const ManualNationalScope();
    if (key.startsWith('vg:')) {
      final id = int.tryParse(key.substring(3));
      if (id != null) return GameScope(id);
    }
    throw FormatException('Unknown scope key: $key');
  }
}

/// Caught in any game, plus manual National marks. Computed, never stored.
/// Read-only: it has no single place to write to (decision D5).
final class DerivedNationalScope extends Scope {
  const DerivedNationalScope();

  @override
  String get key => 'derived';

  @override
  bool get isStored => false;

  @override
  bool operator ==(Object other) => other is DerivedNationalScope;

  @override
  int get hashCode => key.hashCode;
}

/// The profile's own National checkbox, ignoring games.
final class ManualNationalScope extends Scope {
  const ManualNationalScope();

  @override
  String get key => nationalScopeKey;

  @override
  bool get isStored => true;

  @override
  bool operator ==(Object other) => other is ManualNationalScope;

  @override
  int get hashCode => key.hashCode;
}

/// One PokeAPI version group, such as Red/Blue or Scarlet/Violet.
final class GameScope extends Scope {
  const GameScope(this.versionGroupId);

  final int versionGroupId;

  @override
  String get key => 'vg:$versionGroupId';

  @override
  bool get isStored => true;

  @override
  bool operator ==(Object other) =>
      other is GameScope && other.versionGroupId == versionGroupId;

  @override
  int get hashCode => versionGroupId.hashCode;
}
