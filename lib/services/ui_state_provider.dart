import 'package:flutter/foundation.dart';
import 'package:pokedex_app/services/local/local_service.dart';


class UiStateProvider with ChangeNotifier {
  // ignore: unused_field
  final LocalService _localService;
  int tabIndex = 0;

  UiStateProvider(this._localService);

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  /// The most recently viewed Pokemon's id, set when its details screen is
  /// opened. Used to re-center the Pokedex list when returning Home (see
  /// docs/features/home-recenter.md). Session-only, like [tabIndex] - not
  /// persisted across an app restart.
  int? lastViewedPokemonId;

  void setLastViewedPokemonId(int pokemonId) {
    lastViewedPokemonId = pokemonId;
    notifyListeners();
  }
}
