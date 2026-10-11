import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/tcg_card.dart';
import 'package:pokedex_app/services/binder_repository.dart';
import 'package:pokedex_app/services/profile_provider.dart';
import 'package:pokedex_app/utils/binder/binder_pocket.dart';

/// Owns the active profile's binder data: which cards it owns (with display
/// data), and which one it has chosen to show per Pokemon. See
/// docs/features/card-binder.md.
///
/// Deliberately does not hold the Pokemon list itself (dex order, names,
/// sprites) - [CardBinderScreen] reads that from [PokemonApiProvider], same
/// as every other screen. This provider's one job is the binder-specific
/// display-selection layer on top of it.
class CardBinderProvider with ChangeNotifier {
  final BinderRepository _repository;
  final ProfileProvider _profiles;

  CardBinderProvider(this._repository, this._profiles) {
    _profiles.addListener(_onActiveProfileChanged);
  }

  bool _loaded = false;
  Map<String, TcgCard> _cachedCardsById = {};
  Map<int, Set<String>> _ownedCardIdsByPokemon = {};
  Set<String> _allOwnedCardIds = {};
  Map<int, String> _selectedCardIdByPokemon = {};

  bool get isLoaded => _loaded;

  /// Loads (or reloads) the active profile's caught cards and selections.
  Future<void> load() async {
    final profileId = _profiles.activeProfileId;
    // Self-healing backfill (see "Fifth round" in
    // docs/features/card-binder.md): fetches/caches display data for any
    // caught card that doesn't have it yet, so a Pokemon whose own Cards
    // tab was never (re)opened still shows correctly here. Cheap once
    // nothing's missing - two local reads, no network - so running it on
    // every load (not just the first) is fine.
    await _repository.backfillUncachedCaughtCards(profileId);
    final caughtCards = await _repository.getCaughtCardsForProfile(profileId);
    final allOwnedIds = await _repository.getCaughtCardIdsForProfile(profileId);
    final selections = await _repository.getSelectionsForProfile(profileId);

    final cachedCardsById = <String, TcgCard>{};
    final ownedByPokemon = <int, Set<String>>{};
    for (final card in caughtCards) {
      final cardId = card.id;
      if (cardId == null) continue;
      cachedCardsById[cardId] = card;
      for (final pokemonId in card.nationalPokedexNumbers ?? const <int>[]) {
        ownedByPokemon.putIfAbsent(pokemonId, () => {}).add(cardId);
      }
    }

    _cachedCardsById = cachedCardsById;
    _ownedCardIdsByPokemon = ownedByPokemon;
    _allOwnedCardIds = allOwnedIds;
    final selectedByPokemon = {
      for (final selection in selections)
        selection.pokemonId: selection.selectedCardId,
    };

    // One-time catch-up for data caught before "catching your first card
    // auto-displays it" existed ("Fourth round", then "Seventh round" -
    // both in docs/features/card-binder.md): any Pokemon that's owned but
    // has no selection recorded at all gets its highest-priced owned+
    // cached card selected now, in bulk - rather than leaving every one of
    // them stuck on the dimmed owned-indicator forever, which is exactly
    // what a profile with pre-existing caught cards saw after the backfill
    // above finally made their ownership visible, live on the user's own
    // phone. Persisted (not just computed for this render), so it behaves
    // exactly like any other selection from here on, changeable via the
    // cycle picker same as always.
    final toBackfillSelect = <int, TcgCard>{};
    for (final entry in ownedByPokemon.entries) {
      if (selectedByPokemon.containsKey(entry.key)) continue;
      final best = highestPricedOwnedCard(entry.value, cachedCardsById);
      if (best?.id != null) toBackfillSelect[entry.key] = best!;
    }
    if (toBackfillSelect.isNotEmpty) {
      await Future.wait(toBackfillSelect.entries.map((entry) =>
          _repository.setSelection(profileId, entry.key, entry.value.id!)));
      for (final entry in toBackfillSelect.entries) {
        selectedByPokemon[entry.key] = entry.value.id!;
      }
    }

    _selectedCardIdByPokemon = selectedByPokemon;
    _loaded = true;
    notifyListeners();
  }

  void _onActiveProfileChanged() {
    unawaited(load());
  }

  /// What to render for [pokemonId]'s pocket - see [computeBinderPocketView].
  /// [pokemonCaught] is that Pokemon's own Pokédex-level caught status -
  /// this provider deliberately doesn't hold the Pokemon list itself (see
  /// the class doc), so the caller (`CardBinderScreen`, which already reads
  /// `PokemonApiProvider`) supplies it.
  BinderPocketView pocketFor(int pokemonId, {required bool pokemonCaught}) {
    return computeBinderPocketView(
      ownedCardIdsForPokemon:
          _ownedCardIdsByPokemon[pokemonId] ?? const <String>{},
      allOwnedCardIds: _allOwnedCardIds,
      cachedCardsById: _cachedCardsById,
      selectedCardId: _selectedCardIdByPokemon[pokemonId],
      pokemonCaught: pokemonCaught,
    );
  }

  /// Every owned, cached card for [pokemonId] - the cycle picker's contents.
  List<TcgCard> ownedCardsFor(int pokemonId) {
    final ids = _ownedCardIdsByPokemon[pokemonId] ?? const <String>{};
    return [
      for (final id in ids)
        if (_cachedCardsById[id] case final card?) card,
    ];
  }

  /// Sets [card] as [pokemonId]'s displayed card, persists it, and updates
  /// the pocket immediately (AC9/AC10) without waiting for a full reload.
  Future<void> selectCard(int pokemonId, TcgCard card) async {
    final cardId = card.id;
    if (cardId == null) return;

    await _repository.setSelection(
        _profiles.activeProfileId, pokemonId, cardId);

    _selectedCardIdByPokemon[pokemonId] = cardId;
    _cachedCardsById[cardId] = card;
    _allOwnedCardIds.add(cardId);
    for (final pokemon in card.nationalPokedexNumbers ?? const <int>[]) {
      _ownedCardIdsByPokemon.putIfAbsent(pokemon, () => {}).add(cardId);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _profiles.removeListener(_onActiveProfileChanged);
    super.dispose();
  }
}
