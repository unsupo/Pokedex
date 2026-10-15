import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/local_service.dart';

/// The minimal read/write capability [CaughtTcgCardTransferService] needs.
/// Mirrors [CaughtPokemonRepository].
abstract class CaughtTcgCardRepository {
  /// Every row for one profile.
  Future<List<CaughtTcgCard>> loadAll(int profileId);

  /// Upserts rows by (profileId, cardId).
  Future<void> saveAll(List<CaughtTcgCard> rows);
}

class LocalServiceCaughtTcgCardRepository implements CaughtTcgCardRepository {
  final LocalService _localService;

  LocalServiceCaughtTcgCardRepository(this._localService);

  @override
  Future<List<CaughtTcgCard>> loadAll(int profileId) =>
      _localService.getCaughtTcgCardsForProfile(profileId);

  @override
  Future<void> saveAll(List<CaughtTcgCard> rows) =>
      _localService.saveAllCaughtTcgCards(rows);
}
