import 'package:flutter/foundation.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/utils/pokemon_sort.dart';


class UiStateProvider with ChangeNotifier {
  // ignore: unused_field
  final LocalService _localService;
  int tabIndex = 0;

  // Session-only, like tabIndex above -- see docs/features/list-sorting.md.
  PokemonSort sort = PokemonSort.dexAscending;

  UiStateProvider(this._localService);

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void setSort(PokemonSort newSort) {
    sort = newSort;
    notifyListeners();
  }
}
