import 'package:pokedex_app/models/binder_card_selection.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_card_repository.dart';

/// The narrow read/write capability [CardBinderProvider] needs: a profile's
/// caught TCG cards (with display data joined in), its binder pocket
/// selections, and setting one. Kept separate from the ~40-method
/// [LocalService] so tests can fake it without implementing every unrelated
/// resource - mirrors [CaughtPokemonRepository]/[CaughtTcgCardRepository].
abstract class BinderRepository {
  /// Every card this profile owns, with cached display data joined in.
  Future<List<TcgCard>> getCaughtCardsForProfile(int profileId);

  /// Every card id this profile owns, including one whose [TcgCard] display
  /// data isn't cached yet - used only to tell "no longer owned" apart from
  /// "owned but not cached yet" when resolving a pocket's selection (see
  /// docs/features/card-binder.md).
  Future<Set<String>> getCaughtCardIdsForProfile(int profileId);

  Future<List<BinderCardSelection>> getSelectionsForProfile(int profileId);

  /// Upserts by (profileId, pokemonId).
  Future<void> setSelection(int profileId, int pokemonId, String cardId);
}

/// Adapter from [BinderRepository] onto [LocalService] (for the binder
/// selections) and [TcgCardRepository] (for the joined caught-card data) -
/// the same Adapter pattern as [LocalServiceCaughtPokemonRepository].
class LocalServiceBinderRepository implements BinderRepository {
  final LocalService _localService;
  final TcgCardRepository _tcgCardRepository;

  LocalServiceBinderRepository(this._localService, this._tcgCardRepository);

  @override
  Future<List<TcgCard>> getCaughtCardsForProfile(int profileId) =>
      _tcgCardRepository.getCaughtCardsForProfile(profileId);

  @override
  Future<Set<String>> getCaughtCardIdsForProfile(int profileId) async {
    final rows = await _localService.getCaughtTcgCardsForProfile(profileId);
    return rows.where((row) => row.isCaught).map((row) => row.cardId).toSet();
  }

  @override
  Future<List<BinderCardSelection>> getSelectionsForProfile(int profileId) =>
      _localService.getBinderSelectionsForProfile(profileId);

  @override
  Future<void> setSelection(int profileId, int pokemonId, String cardId) =>
      _localService.saveBinderSelection(BinderCardSelection(
        profileId: profileId,
        pokemonId: pokemonId,
        selectedCardId: cardId,
      ));
}
