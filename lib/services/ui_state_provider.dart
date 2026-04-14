import 'package:flutter/foundation.dart';
import 'package:pokedex_app/services/local/local_service.dart';


class UiStateProvider with ChangeNotifier {
  final LocalService _localService;
  int tabIndex = 0;
  bool showMainImage = true;

  UiStateProvider(this._localService);

  void setTabIndex(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void setShowMainImage(bool showMainImage) {
    this.showMainImage = showMainImage;
    notifyListeners();
  }
}
