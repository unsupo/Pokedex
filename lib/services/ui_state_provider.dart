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
}
