import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/tcg_service.dart';

/// Repository interface abstraction for TCG Card data operations.
abstract class TcgCardRepository {
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId);
  Future<void> saveCaughtStatus(int profileId, String cardId, bool isCaught);
  Future<void> loadCaughtStatus(int profileId, List<TcgCard> cards);

  /// Write-through cache of full card data (image, name, ...), so it stays
  /// available even for a Pokemon whose Cards tab isn't opened this session -
  /// see the "Data model changes" section of docs/features/card-binder.md.
  Future<void> cacheCards(List<TcgCard> cards);

  /// Every card this profile currently owns, with cached display data joined
  /// in and [TcgCard.isCaught] set to true. A caught card id with no cached
  /// data yet (see the design doc) is simply omitted from this list.
  Future<List<TcgCard>> getCaughtCardsForProfile(int profileId);

  /// Fetches and caches display data for every caught card this profile
  /// owns that doesn't have any yet - see "Fifth round" in
  /// docs/features/card-binder.md. Without this, a caught card whose
  /// Pokemon's own Cards tab (the only other place [cacheCards] runs) is
  /// never revisited stays permanently invisible to the binder, not just
  /// imageless - [getCaughtCardsForProfile] joins against the cache, so an
  /// uncached caught card doesn't register as owned at all.
  Future<void> backfillUncachedCaughtCards(int profileId);

  /// Wipes cached card display data (see [LocalService.clearTcgCardCache])
  /// without touching which cards are actually caught - lets a stale cache
  /// (e.g. from before a parsing fix) be forced to re-fetch. See
  /// "Fifteenth round" in docs/features/card-binder.md.
  Future<void> clearCache();
}

/// Default implementation of [TcgCardRepository] that coordinates fetching from
/// [TcgService] and persisting/reading local cached state with [LocalService].
class DefaultTcgCardRepository implements TcgCardRepository {
  final TcgService _tcgService;
  final LocalService _localService;

  DefaultTcgCardRepository(this._tcgService, this._localService);

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async {
    // Cache-first - see the doc comment on
    // LocalService.getCachedTcgCardsByPokemonId for why this didn't
    // already happen. A cache hit of *any* cards means this Pokemon's
    // been fetched before; an empty cache is ambiguous (never fetched, vs
    // genuinely zero cards) and always falls through to a real fetch -
    // deliberately not distinguished further, since a Pokemon with
    // genuinely no cards is rare and the cost is just one extra fetch per
    // *that* Pokemon, not a correctness issue.
    final cached =
        await _localService.getCachedTcgCardsByPokemonId(nationalDexId);
    if (cached.isNotEmpty) return cached;

    final fetched = await _tcgService.getCardsByNationalDexId(nationalDexId);
    if (fetched.isNotEmpty) {
      await cacheCards(fetched);
    }
    return fetched;
  }

  @override
  Future<void> saveCaughtStatus(
      int profileId, String cardId, bool isCaught) async {
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

  @override
  Future<void> cacheCards(List<TcgCard> cards) =>
      _localService.saveAllTcgCards(cards);

  @override
  Future<List<TcgCard>> getCaughtCardsForProfile(int profileId) async {
    final caughtRows =
        await _localService.getCaughtTcgCardsForProfile(profileId);
    final caughtIds = caughtRows
        .where((row) => row.isCaught)
        .map((row) => row.cardId)
        .toList();
    if (caughtIds.isEmpty) return [];

    final cards = await _localService.getCachedTcgCardsByIds(caughtIds);
    for (final card in cards) {
      card.isCaught = true;
    }
    return cards;
  }

  @override
  Future<void> backfillUncachedCaughtCards(int profileId) async {
    final caughtRows =
        await _localService.getCaughtTcgCardsForProfile(profileId);
    final caughtIds = caughtRows
        .where((row) => row.isCaught)
        .map((row) => row.cardId)
        .toSet();
    if (caughtIds.isEmpty) return;

    final cachedIds =
        (await _localService.getCachedTcgCardsByIds(caughtIds.toList()))
            .map((card) => card.id)
            .whereType<String>()
            .toSet();
    final missingIds = caughtIds.difference(cachedIds);
    if (missingIds.isEmpty) return;

    // Each id fetched independently and failures tolerated individually -
    // one bad/retired card id (a 404, a flaky response) must not block the
    // rest of an otherwise-healthy backfill. See "Fifth round" in
    // docs/features/card-binder.md.
    final fetched = await Future.wait(missingIds.map((id) async {
      try {
        return await _tcgService.getCard(id);
      } catch (_) {
        return null;
      }
    }));
    final toCache = fetched.whereType<TcgCard>().toList();
    if (toCache.isNotEmpty) {
      await cacheCards(toCache);
    }
  }

  @override
  Future<void> clearCache() => _localService.clearTcgCardCache();
}
