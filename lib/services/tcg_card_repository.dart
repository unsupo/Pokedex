import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_service.dart';

/// Repository interface abstraction for TCG Card data operations.
abstract class TcgCardRepository {
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId);
  Future<void> saveCaughtStatus(int profileId, String cardId, bool isCaught);
  Future<void> loadCaughtStatus(int profileId, List<TcgCard> cards);
}

/// Default implementation of [TcgCardRepository] that coordinates fetching from
/// [TcgService] and persisting/reading local cached state with [LocalService].
class DefaultTcgCardRepository implements TcgCardRepository {
  final TcgService _tcgService;
  final LocalService _localService;

  DefaultTcgCardRepository(this._tcgService, this._localService);

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) =>
      _tcgService.getCardsByNationalDexId(nationalDexId);

  @override
  Future<void> saveCaughtStatus(int profileId, String cardId, bool isCaught) async {
    await _localService.saveCaughtTcgCard(
      CaughtTcgCard(profileId: profileId, cardId: cardId, isCaught: isCaught),
    );
  }

  @override
  Future<void> loadCaughtStatus(int profileId, List<TcgCard> cards) async {
    await Future.wait(cards.map((tcgCard) async {
      final cardId = tcgCard.id;
      if (cardId == null) return;
      final caught = await _localService.getCaughtTcgCard(profileId, cardId);
      tcgCard.isCaught = caught?.isCaught ?? false;
    }));
  }
}
