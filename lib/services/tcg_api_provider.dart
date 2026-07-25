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
      await loadCaughtStatus(tcgCards);
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

  // Populate each card's transient userData.isCaught from the persisted
  // CaughtTcgCard record (keyed by the card's own string id), so caught
  // status survives across app restarts. Public (rather than private) so it
  // can also be exercised directly in tests without a live TcgService/HTTP
  // call.
  @visibleForTesting
  Future<void> loadCaughtStatus(List<TcgCard> tcgCards) async {
    for (final tcgCard in tcgCards) {
      final cardId = tcgCard.id;
      if (cardId == null) continue;
      final caughtTcgCard = await _localService.getCaughtTcgCard(cardId);
      if (caughtTcgCard != null) {
        tcgCard.userData = UserData(id: 0, isCaught: caughtTcgCard.isCaught);
      }
    }
  }

  Future<void> setCaught(TcgCard tcgCard) async {
    final cardId = tcgCard.id;
    if (cardId == null) return;

    final newIsCaught = !(tcgCard.userData?.isCaught ?? false);
    if (tcgCard.userData != null) {
      tcgCard.userData!.isCaught = newIsCaught;
    } else {
      tcgCard.userData = UserData(id: 0, isCaught: newIsCaught);
    }
    notifyListeners();

    await _localService.saveCaughtTcgCard(
      CaughtTcgCard(cardId: cardId, isCaught: newIsCaught),
    );
  }
}
