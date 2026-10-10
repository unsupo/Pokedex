import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_repository.dart';
import 'package:pokedex_app/services/io/caught_tcg_card_transfer_service.dart';
import 'package:pokedex_app/services/io/csv_transport.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/services/tcg_card_repository.dart';
import 'package:pokedex_app/services/tcg_service.dart';

class TcgApiProvider with ChangeNotifier {
  final TcgCardRepository _tcgRepository;
  final ProfileProvider _profiles;
  final CaughtTcgCardTransferService _transferService;

  TcgApiProvider(
      TcgService tcgService, LocalService localService, ProfileProvider profiles)
      : this.withRepository(
          DefaultTcgCardRepository(tcgService, localService),
          profiles,
          CaughtTcgCardTransferService(
              LocalServiceCaughtTcgCardRepository(localService)),
        );

  TcgApiProvider.withRepository(
      this._tcgRepository, this._profiles, this._transferService) {
    _profiles.addListener(reloadLoadedCaughtStatus);
  }

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
      final tcgCards = await _tcgRepository.getCardsByNationalDexId(id);
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

  /// Sets each card's transient [TcgCard.isCaught] from the active profile's
  /// persisted record, so caught status survives restarts and is per profile.
  /// Public so tests can exercise it without a live TcgService/HTTP call.
  @visibleForTesting
  Future<void> loadCaughtStatus(List<TcgCard> tcgCards) async {
    await _tcgRepository.loadCaughtStatus(_profiles.activeProfileId, tcgCards);
  }

  Future<void> setCaught(TcgCard tcgCard) async {
    final cardId = tcgCard.id;
    if (cardId == null) return;

    tcgCard.isCaught = !tcgCard.isCaught;
    notifyListeners();

    await _tcgRepository.saveCaughtStatus(
        _profiles.activeProfileId, cardId, tcgCard.isCaught);
  }

  /// Exports the active profile's caught TCG cards only.
  Future<ExportResult> exportCaughtCards(CsvTransport transport) {
    return _transferService.exportCaught(transport,
        profileId: _profiles.activeProfileId);
  }

  /// Imports into the active profile only, then reloads already-loaded
  /// cards' caught status so the UI reflects the import immediately.
  Future<ImportResult> importCaughtCards(CsvTransport transport) async {
    final result = await _transferService.importCaught(transport,
        profileId: _profiles.activeProfileId);
    if (!result.cancelled && result.importedCount > 0) {
      await reloadLoadedCaughtStatus();
    }
    return result;
  }

  /// Switching profile re-reads caught status for every card already loaded.
  Future<void> reloadLoadedCaughtStatus() async {
    await Future.wait(_pokemon.values.map(loadCaughtStatus));
    notifyListeners();
  }

  @override
  void dispose() {
    _profiles.removeListener(reloadLoadedCaughtStatus);
    super.dispose();
  }
}
