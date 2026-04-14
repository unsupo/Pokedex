import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/models/user_data.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_service.dart';

class TcgApiProvider with ChangeNotifier {
  final TcgService _tcgService;
  final LocalService _localService;

  TcgApiProvider(this._tcgService, this._localService);

  final Map<int, List<TcgCard>> _pokemon = {};

  Map<int, List<TcgCard>> get allPokemon => _pokemon;

  final Map<int, bool> _loadingPokemon = {};

  Map<int, bool> get loadingPokemon => _loadingPokemon;

  String? _error;

  String? get error => _error;

  Future<List<TcgCard>?> getPokemonCards(int id) async {
    if (_pokemon.containsKey(id)) {
      return _pokemon[id]; // Return cached data if available
    }

    _loadingPokemon[id] = true;
    notifyListeners();

    try {
      final tcgCards = await _tcgService.getCardsByNationalDexId(id);
      _pokemon[id] = tcgCards; // Update _pokemon only after successful fetch
      return tcgCards;
    } catch (error) {
      _error = "Error fetching TCG cards: $error";
      if (kDebugMode) {
        print(_error);
      } // Log the error
      return null; // Or handle the error appropriately
    } finally {
      _loadingPokemon[id] = false;
      notifyListeners();
    }
  }

  void setCaught(TcgCard tcgCard) {
    if(tcgCard.userData != null){
      tcgCard.userData!.isCaught = !tcgCard.userData!.isCaught;
    }else {
      tcgCard.userData = UserData(id: tcgCard.isarId!, isCaught: true);
    }
    notifyListeners();
  }
}
