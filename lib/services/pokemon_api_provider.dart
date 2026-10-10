import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/pokeapi/utility.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/widgets/filter_section.dart';

import '../models/pokeapi/abilities.dart';
import '../models/pokeapi/evolution_chain.dart';
import '../models/pokeapi/items.dart';
import '../models/pokeapi/moves.dart';
import '../models/pokeapi/pokemon.dart';
import '../models/pokeapi/pokemon_details.dart';
import '../models/pokeapi/pokemon_species.dart';
import '../models/caught_pokemon.dart';
import '../models/scope.dart';
import '../utils/evolution_stage.dart';
import '../widgets/filter_modal.dart';
import 'game_catalog.dart';
import 'io/caught_pokemon_repository.dart';
import 'io/caught_pokemon_transfer_service.dart';
import 'io/csv_transport.dart';
import 'pokemon_service.dart';
import 'profile_provider.dart';
import 'scope_provider.dart';

class PokemonApiProvider with ChangeNotifier {
  final PokemonService _pokemonService;
  final LocalService _localService;
  final ProfileProvider _profiles;
  final ScopeProvider _scopes;
  final GameCatalog _catalog;

  PokemonApiProvider(this._pokemonService, this._localService, this._profiles,
      this._scopes, this._catalog)
      : _transferService = CaughtPokemonTransferService(
            LocalServiceCaughtPokemonRepository(_localService)) {
    _profiles.addListener(reloadCaughtForActiveProfile);
    _scopes.addListener(reloadCaughtForActiveProfile);
  }

  final CaughtPokemonTransferService _transferService;

  // Caught state for the current scope. See docs/epics/.../03-scope-model.md.
  List<CaughtPokemon> _allRows = [];
  // The active scope's own rows, keyed by Pokemon. Empty for derived National.
  Map<int, CaughtPokemon> _records = {};
  // Species in the current game's regional Pokedex. Null outside a game scope.
  Set<int>? _gameMembers;
  List<Game> _games = [];
  bool _gamesLoaded = false;
  String _lastSearchQuery = '';
  List<int> _lastStages = const [];
  bool _filterApplied = false;

  List<Game> get games => _games;

  /// False until the game list has loaded. See [CaughtInGames].
  bool get gamesLoaded => _gamesLoaded;

  final Map<int, Ability> _abilities = {};
  final Map<int, Move> _moves = {};
  final Map<int, Pokemon> _pokemon = {};
  final List<Pokemon> _filteredPokemon = [];

  Map<int, Ability> get allAbilities => _abilities;

  Map<int, Move> get allMoves => _moves;

  Map<int, Pokemon> get allPokemon => _pokemon;

  List<Pokemon> get filteredPokemon => _filteredPokemon;

  bool _isLoadingPokemon = false;

  bool get isLoadingPokemon => _isLoadingPokemon;

  final Map<int, Item> _items = {}; // Add a map to store items
  Map<int, Item> get allItems => _items; // Add a getter for items

  bool _isLoadingItems = false; // Add a loading state for items
  bool get isLoadingItems => _isLoadingItems;

  bool _isLoadingPokemonDetails = false;

  bool get isLoadingPokemonDetails => _isLoadingPokemonDetails;

  bool _isLoadingMoves = false;

  bool get isLoadingMoves => _isLoadingMoves;

  bool _isLoadingAbilities = false;

  bool get isLoadingAbilities => _isLoadingAbilities;

  String? _error;

  String? get error => _error;

  /// Exports the active profile's caught Pokemon. With [currentScopeOnly], only
  /// the scope on screen is written. Derived National has no rows of its own,
  /// so it exports everything, the same as all scopes.
  Future<ExportResult> exportCaughtPokemon(CsvTransport transport,
      {required bool currentScopeOnly}) {
    return _transferService.exportCaught(transport,
        profileId: _profiles.activeProfileId,
        scopeKey: resolvedExportScopeKey(currentScopeOnly));
  }

  /// The scope-key filter an export should use, or null for every scope.
  /// Shared with [HamburgerMenu]'s combined Pokemon+cards export, so the
  /// "what does 'current scope' mean" rule lives in one place.
  String? resolvedExportScopeKey(bool currentScopeOnly) {
    final scope = _scopes.current;
    return currentScopeOnly && scope.isStored ? scope.key : null;
  }

  /// Imports into the active profile only, then reloads its caught state.
  Future<ImportResult> importCaughtPokemon(CsvTransport transport) async {
    final result = await _transferService.importCaught(transport,
        profileId: _profiles.activeProfileId);
    if (!result.cancelled && result.importedCount > 0) {
      await reloadCaughtForActiveProfile();
    }
    return result;
  }

  /// Recomputes caught state for the active profile and scope, then refreshes
  /// the visible list. Runs on profile and scope changes, and after a write.
  /// If either changed while the read was in flight, the result is dropped.
  Future<void> reloadCaughtForActiveProfile() {
    final reload = _reloadCaught();
    _reloading = reload;
    return reload;
  }

  /// The reload in flight, if any. A write waits for it, so it never acts on
  /// the previous profile's records.
  Future<void>? _reloading;

  Future<void> _reloadCaught() async {
    final profileId = _profiles.activeProfileId;
    final scope = _scopes.current;
    final rows = await _localService.getCaughtPokemonForProfile(profileId);
    final members = scope is GameScope ? await _membersOf(scope) : null;
    if (_disposed ||
        profileId != _profiles.activeProfileId ||
        scope != _scopes.current) {
      return;
    }

    _allRows = rows;
    _gameMembers = members;
    _records = {
      if (scope.isStored)
        for (final row in rows)
          if (row.scopeKey == scope.key) row.pokemonId: row,
    };
    final caught = _caughtIdsFor(scope);
    for (final pokemon in _pokemon.values) {
      pokemon.isCaught = caught.contains(pokemon.id);
    }
    _refreshVisibleList();
  }

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    _profiles.removeListener(reloadCaughtForActiveProfile);
    _scopes.removeListener(reloadCaughtForActiveProfile);
    super.dispose();
  }

  /// Loads the game list once, for the scope selector and game membership.
  Future<void> loadGames() async {
    if (_games.isNotEmpty) return;
    _games = await _catalog.loadGames();
    _gamesLoaded = true;
    notifyListeners();
  }

  Future<Set<int>> _membersOf(GameScope scope) async {
    try {
      await loadGames();
    } catch (error) {
      _error = 'Error loading games: $error';
      notifyListeners();
    }
    return _cachedMembersOf(scope) ?? {};
  }

  Set<int>? _cachedMembersOf(GameScope scope) {
    for (final game in _games) {
      if (game.versionGroupId == scope.versionGroupId) return game.memberIds;
    }
    return null;
  }

  /// Ids caught in [scope]. Derived National is the union across all rows.
  Set<int> _caughtIdsFor(Scope scope) {
    final caught = <int>{};
    for (final row in _allRows) {
      if (!row.isCaught) continue;
      if (scope is DerivedNationalScope || row.scopeKey == scope.key) {
        caught.add(row.pokemonId);
      }
    }
    return caught..retainWhere(_pokemon.containsKey);
  }

  /// Whether the current scope shows this Pokemon. National shows everything;
  /// a game shows only its regional Pokedex.
  bool isVisibleInScope(int pokemonId) {
    if (_scopes.current is GameScope) {
      return _gameMembers?.contains(pokemonId) ?? false;
    }
    return true;
  }

  /// Caught count for the selector. Derived National counts a Pokemon once
  /// however many games it is caught in.
  int caughtCountFor(Scope scope) => _caughtIdsFor(scope).length;

  int totalCountFor(Scope scope) {
    if (scope is GameScope) {
      return (_cachedMembersOf(scope) ?? {}).where(_pokemon.containsKey).length;
    }
    return _pokemon.length;
  }

  /// Games where the Pokemon is caught, for the details screen.
  List<String> caughtInGameNames(int pokemonId) {
    final caughtIn = {
      for (final row in _allRows)
        if (row.isCaught && row.pokemonId == pokemonId) row.scopeKey,
    };
    return [
      for (final game in _games)
        if (caughtIn.contains(GameScope(game.versionGroupId).key)) game.name,
    ];
  }

  void _refreshVisibleList() {
    if (_filterApplied) {
      filterPokemon(_lastSearchQuery, _currentFilters, stages: _lastStages);
      return;
    }
    _filteredPokemon
      ..clear()
      ..addAll(_pokemon.values.where((p) => isVisibleInScope(p.id)));
    notifyListeners();
  }

  /// Runs one of the bulk-sync _fetchX() methods below, catching anything it
  /// throws so a transient failure in ONE category (e.g. a DNS hiccup while
  /// fetching the move list) can't propagate out of fetchData()'s
  /// Future.wait([...]) as an unhandled exception and take the *entire*
  /// startup batch down with it - each category degrades independently
  /// instead. This is the single place that guards against that failure
  /// mode; individual _fetchX() methods don't each need their own top-level
  /// try/catch for it (they still use try/finally where they need to
  /// guarantee their own state - like isLoading flags - gets reset even on
  /// failure).
  Future<void> _guardedFetch(String label, Future<void> Function() fetch) async {
    try {
      await fetch();
    } catch (error) {
      _error = 'Error fetching $label: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> fetchData() async {
    _isLoadingPokemon = true;
    _error = null;
    await _guardedFetch('Pokemon list', _fetchPokemonList);
    await reloadCaughtForActiveProfile();
    notifyListeners();
    List<Future<void>> futures = [
      _guardedFetch('Pokemon details and species', _fetchPokemonDetailsAndSpecies),
      _guardedFetch('evolution chains', _fetchEvolutionChains),
      _guardedFetch('moves', _fetchMoves),
      _guardedFetch('abilities', _fetchAbilities),
      _guardedFetch('items', _fetchItems),
    ];
    await Future.wait(futures);
    _isLoadingPokemonDetails = false;
    _isLoadingMoves = false;
    _isLoadingAbilities = false;
    _isLoadingItems = false;
    notifyListeners();
  }

  Future<void> _fetchItems() async {
    _isLoadingItems = true;
    notifyListeners();

    // Error handling for the network fetch below is centralized in
    // fetchData()'s _guardedFetch() wrapper; this only needs try/finally to
    // guarantee _isLoadingItems is reset even if that fetch throws.
    try {
      List<Item?> allItems = await _localService.getAllItems();
      for (Item? item in allItems) {
        _items[item!.id] = item;
      }

      Set<int> downloadedItemIds = allItems.map((i) => i!.id).toSet();
      if (allItems.isEmpty || allItems.length < 1500) {
        // Adjust the number as needed
        List<NamedApiResource?> itemUrls =
            await _pokemonService.getAllItemUrls();
        final List<Item?> newItems = [];

        final List<Future> futures = [];
        for (NamedApiResource? itemUrl in itemUrls) {
          if (!downloadedItemIds.contains(itemUrl?.id)) {
            _items[itemUrl?.id] = Item(id: itemUrl?.id, name: itemUrl?.name);
            notifyListeners();
            futures.add(_fetchItem(itemUrl?.id, newItems));
          }
        }

        await Future.wait(futures);
        await _localService.saveAllItems(newItems);
      }
    } finally {
      _isLoadingItems = false;
      notifyListeners();
    }
  }

  Future<void> _fetchItem(int itemId, List<Item?> newItems) async {
    try {
      final item = await _pokemonService.getItem(itemId);
      newItems.add(item);
      _items[itemId] = item;
      notifyListeners();
    } catch (error) {
      _error = 'Error fetching item $itemId: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> _fetchPokemonList() async {
    // Error handling for the fetch itself is centralized in fetchData()'s
    // _guardedFetch() wrapper; this only needs try/finally to guarantee
    // _isLoadingPokemon is reset even if the fetch above throws.
    try {
      List<Pokemon> pokemons = await _pokemonService.getPokemonList();
      for (Pokemon pokemon in pokemons) {
        _pokemon[pokemon.id] = pokemon;
      }
      _filteredPokemon.addAll(_pokemon.values);
    } finally {
      _isLoadingPokemon = false;
      notifyListeners();
    }
  }

  Future<void> _fetchPokemonDetailsAndSpecies() async {
    _isLoadingPokemonDetails = true;

    final List<PokemonDetails?> allPokemonDetails =
        await _localService.getAllPokemonDetails();
    final List<PokemonSpecies?> allPokemonSpecies =
        await _localService.getAllPokemonSpecies();

    final Set<int> detailedPokemonIds = {};
    final Set<int> speciesPokemonIds = {};

    for (PokemonDetails? details in allPokemonDetails) {
      if (details != null) {
        detailedPokemonIds.add(details.id);
        _pokemon[details.id]?.details = details;
      }
    }
    notifyListeners();

    for (PokemonSpecies? species in allPokemonSpecies) {
      if (species != null) {
        speciesPokemonIds.add(species.id);
        _pokemon[species.id]?.species = species;
      }
    }
    notifyListeners();

    final List<Future> futures = [];
    final List<PokemonDetails?> newPokemonDetails = [];
    final List<PokemonSpecies?> newPokemonSpecies = [];

    for (final pokemon in _pokemon.values) {
      if (!detailedPokemonIds.contains(pokemon.id)) {
        futures.add(_fetchPokemonDetail(pokemon, newPokemonDetails));
      }
      if (!speciesPokemonIds.contains(pokemon.id) && pokemon.id < 10000) {
        // no species for pokemon id > 10k
        futures.add(_fetchPokemonSpecies(pokemon, newPokemonSpecies));
      }
    }

    await Future.wait(futures);
    if (newPokemonDetails.isNotEmpty) {
      await _localService.saveAllPokemonDetails(newPokemonDetails);
    }
    if (newPokemonSpecies.isNotEmpty) {
      await _localService.saveAllPokemonSpecies(
          newPokemonSpecies); // TODO save species for pokemon over 10k id
    }
  }

  Future<void> _fetchPokemonDetail(
      Pokemon pokemon, List<PokemonDetails?> newPokemonDetails) async {
    try {
      final pokemonDetails =
          await _pokemonService.getPokemonDetails(pokemon.id);
      pokemon.details = pokemonDetails;
      newPokemonDetails.add(pokemonDetails);
      notifyListeners();
    } catch (error) {
      _error =
          'Error fetching details for ${pokemon.name}: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> _fetchPokemonSpecies(
      Pokemon pokemon, List<PokemonSpecies?> newPokemonSpecies) async {
    try {
      final pokemonSpecies =
          await _pokemonService.getPokemonSpecies(pokemon.id);
      pokemon.species = pokemonSpecies;
      newPokemonSpecies.add(pokemonSpecies);
      notifyListeners();
    } catch (error) {
      _error =
          'Error fetching species for ${pokemon.name}: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> _fetchEvolutionChains() async {
    final List<EvolutionChain?> evolutionChains =
        await _localService.getAllEvolutionChains();
    final Set<int> evolutionPokemonIds = {};
    final Set<int> processedChainIds = {};

    for (EvolutionChain? evolutionChain in evolutionChains) {
      if (evolutionChain != null) {
        processedChainIds.add(evolutionChain.id);
        for (int id in evolutionChain.allPokemonIds) {
          evolutionPokemonIds.add(id);
          evolutionChain.isLoading = false;
          _pokemon[id]?.evolutionChain = evolutionChain;
        }
      }
    }
    notifyListeners();

    final List<Future> futures = [];
    final List<EvolutionChain?> newEvolutionChains = [];

    for (final pokemon in _pokemon.values) {
      if (!evolutionPokemonIds.contains(pokemon.id)) {
        EvolutionChain evolutionChain =
            EvolutionChain(id: 1, chain: ChainLink());
        evolutionChain.isLoading = true;
        pokemon.evolutionChain = evolutionChain;
      }
    }

    try {
      List<EvolutionChainUrl?> evolutionChainUrls =
          await _pokemonService.getAllEvolutionChainUrls();

      for (EvolutionChainUrl? url in evolutionChainUrls) {
        if (processedChainIds.contains(url?.pokemonId)) {
          continue;
        }
        futures.add(_fetchEvolutionChain(url, newEvolutionChains));
      }

      await Future.wait(futures);
      if (newEvolutionChains.isNotEmpty) {
        await _localService.saveAllEvolutionChains(newEvolutionChains);
      }
    } catch (error) {
      // Same class of bug fixed in _fetchPokemonList(): this ran inside
      // fetchData()'s Future.wait([...]) with no try/catch, so a transient
      // failure here (e.g. a DNS hiccup) was an unhandled exception that
      // could take the whole startup batch down instead of just leaving
      // evolution chains unpopulated for this session.
      _error = 'Error fetching evolution chains: ${error.toString()}';
    } finally {
      // Always clear the placeholder isLoading flag, even on failure -
      // otherwise affected Pokemon would show a permanent loading spinner
      // for their evolution chain section for the rest of this session.
      for (Pokemon pokemon in _pokemon.values) {
        pokemon.evolutionChain?.isLoading = false;
      }
    }
  }

  Future<void> _fetchEvolutionChain(
      EvolutionChainUrl? url, List<EvolutionChain?> newEvolutionChains) async {
    try {
      final evolutionChain =
          await _pokemonService.getEvolutionChain(url?.pokemonId, batch: true);
      newEvolutionChains.add(evolutionChain);
      evolutionChain?.isLoading = false;
      for (int id in evolutionChain?.allPokemonIds ?? []) {
        if (_pokemon.containsKey(id)) {
          _pokemon[id]?.evolutionChain = evolutionChain;
        }
      }
      notifyListeners();
    } catch (error) {
      _error =
          'Error fetching evolution chain for ${url?.pokemonId}: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> _fetchMoves() async {
    _isLoadingMoves = true;
    notifyListeners();

    // Error handling for the network fetch below is centralized in
    // fetchData()'s _guardedFetch() wrapper; this only needs try/finally to
    // guarantee _isLoadingMoves is reset even if that fetch throws.
    try {
      List<Move?> allMoves = await _localService.getAllMoves();
      for (Move? move in allMoves) {
        _moves[move!.id] = move;
      }

      Set<int> downloadedMoveIds = allMoves.map((m) => m!.id).toSet();
      if (allMoves.isEmpty || allMoves.length < 900) {
        List<MoveUrl?> moveUrls = await _pokemonService.getAllMoveUrls();
        final List<Move?> newMoves = [];

        final List<Future> futures = [];
        for (MoveUrl? moveUrl in moveUrls) {
          if (!downloadedMoveIds.contains(moveUrl?.moveId)) {
            _moves[moveUrl?.moveId] =
                Move(id: moveUrl?.moveId, name: moveUrl?.name);
            notifyListeners();
            futures.add(_fetchMove(moveUrl?.moveId, newMoves));
          }
        }

        await Future.wait(futures);
        await _localService.saveAllMoves(newMoves);
      }
    } finally {
      _isLoadingMoves = false;
      notifyListeners();
    }
  }

  Future<void> _fetchMove(int moveId, List<Move?> newMoves) async {
    try {
      final move = await _pokemonService.getMove(moveId);
      newMoves.add(move);
      _moves[moveId] = move;
      notifyListeners();
    } catch (error) {
      _error = 'Error fetching move $moveId: ${error.toString()}';
      notifyListeners();
    }
  }

  Future<void> _fetchAbilities() async {
    _isLoadingAbilities = true;
    notifyListeners();

    // Error handling for the network fetch below is centralized in
    // fetchData()'s _guardedFetch() wrapper; this only needs try/finally to
    // guarantee _isLoadingAbilities is reset even if that fetch throws.
    try {
      List<Ability?> allAbilities = await _localService.getAllAbilities();
      // Assuming _abilities is a Map<int, Ability>
      for (Ability? ability in allAbilities) {
        _abilities[ability!.id] = ability;
      }

      notifyListeners();

      Set<int> downloadedAbilityIds = allAbilities.map((a) => a!.id).toSet();
      if (allAbilities.isEmpty || allAbilities.length < 350) {
        List<NamedApiResource?> abilityUrls =
            await _pokemonService.getAllAbilityUrls();
        final List<Ability?> newAbilities = [];

        final List<Future> futures = [];
        for (NamedApiResource? abilityUrl in abilityUrls) {
          if (!downloadedAbilityIds.contains(abilityUrl?.id)) {
            _abilities[abilityUrl?.id] =
                Ability(id: abilityUrl?.id, name: abilityUrl?.name);
            notifyListeners();
            futures.add(_fetchAbility(abilityUrl?.id, newAbilities));
          }
        }

        await Future.wait(futures);
        await _localService.saveAllAbilities(newAbilities);
      }
    } finally {
      _isLoadingAbilities = false;
      notifyListeners();
    }
  }

  Future<void> _fetchAbility(int abilityId, List<Ability?> newAbilities) async {
    try {
      final ability = await _pokemonService.getAbility(abilityId);
      newAbilities.add(ability);
      _abilities[abilityId] = ability;
      notifyListeners();
    } catch (error) {
      _error = 'Error fetching ability $abilityId: ${error.toString()}';
      notifyListeners();
    }
  }

  Map<Filters, dynamic> _currentFilters = {};

  Map<Filters, dynamic> get currentFilters => _currentFilters;

  void updateFilters(Map<Filters, dynamic> newFilters) {
    _currentFilters = Map.from(newFilters); // Important: Create a copy
    notifyListeners();
  }

  void clearFilters() {
    _currentFilters = {};
    notifyListeners();
  }

  /// Filters the visible Pokemon list by [searchQuery] (a fuzzy, case-
  /// insensitive substring matched against name/id/type/move/ability - see
  /// [_matchesFuzzyTerm]) and [filters] (the filter-modal selections),
  /// further narrowed by [stages] (from `stage:` search tokens, ORed
  /// together; empty matches every stage). See
  /// docs/features/search-fuzzy-and-stage.md.
  void filterPokemon(
    String? searchQuery,
    Map<Filters, dynamic> filters, {
    List<int> stages = const [],
  }) {
    _lastSearchQuery = searchQuery ?? '';
    _lastStages = stages;
    _filterApplied = true;
    updateFilters(filters);
    // Extract the values from the map
    List<String>? selectedTypes = filters[Filters.Types] as List<String>?;
    List<int>? selectedGeneration =
        (filters[Filters.Generations] as List?)?.cast<int>();
    CaughtStatus caughtStatus =
        filters[Filters.Caught] as CaughtStatus? ?? CaughtStatus.all;
    List<String>? selectedAbilities =
        filters[Filters.Abilities] as List<String>?;
    List<String>? selectedMoves = filters[Filters.Moves] as List<String>?;

    _filteredPokemon.clear();
    _filteredPokemon.addAll(_pokemon.values.where((pokemon) {
      if(pokemon.details == null){
        return false;
      }
      if (!isVisibleInScope(pokemon.id)) {
        return false;
      }
      // Filter by the search bar's fuzzy term: matches if it's a substring
      // of name/id, a type, a move, or an ability (see search-fuzzy-and-stage.md).
      final bool matchesSearch =
          _matchesFuzzyTerm(pokemon, searchQuery?.toLowerCase() ?? '');

      // Filter by Types (considering empty selectedTypes)
      try {
        final bool matchesType = (selectedTypes ?? []).isEmpty ||
            pokemon.types.any((type) => selectedTypes!
                .map((t) => t.toLowerCase())
                .contains(type));
        // Filter by Abilities (considering empty selectedAbilities)
        final bool matchesAbility = (selectedAbilities ?? []).isEmpty ||
            pokemon.details == null ||
            pokemon.details!.abilities!.any((ability) =>
                selectedAbilities!.contains(ability.ability?.name));

        // Filter by Moves (considering empty selectedMoves)
        final bool matchesMove = (selectedMoves ?? []).isEmpty ||
            pokemon.details == null ||
            pokemon.details!.moves!
                .any((move) => selectedMoves!.contains(move.move?.name));

        // Filter by Caught Status
        final bool matchesCaughtStatus = caughtStatus == CaughtStatus.all ||
            (caughtStatus == CaughtStatus.caughtOnly && pokemon.isCaught) ||
            (caughtStatus == CaughtStatus.notCaughtOnly && !pokemon.isCaught);

        // Filter by Generation (considering empty selectedGeneration)
        final bool matchesGeneration = (selectedGeneration ?? []).isEmpty ||
            selectedGeneration!.contains(pokemon.generation);

        // Filter by evolution stage (from `stage:` search tokens).
        final bool matchesStage = _matchesStage(pokemon, stages);

        return matchesSearch &&
            matchesType &&
            matchesAbility &&
            matchesMove &&
            matchesCaughtStatus &&
            matchesGeneration &&
            matchesStage &&
            pokemon.isDefault;
      } catch (e) {
        debugPrint(e.toString());
        return false;
      }
    }).toList());
    notifyListeners();
  }

  get filteredPokemonCount {
    return _filteredPokemon.length;
  }

  void clearData() {
    _pokemon.clear();
    notifyListeners();
  }

  /// Marks a Pokemon caught or uncaught in the current scope. Derived National
  /// has no single place to write, so it is ignored here, and the UI explains
  /// why (see [canToggleCaught]).
  Future<void> setCaught(int pokemonId, bool isCaught) async {
    final pendingReload = _reloading;
    if (pendingReload != null) await pendingReload;

    final pokemon = _pokemon[pokemonId];
    final scope = _scopes.current;
    if (pokemon == null || !scope.isStored) return;

    final record = _records[pokemonId] ??
        CaughtPokemon(
          profileId: _profiles.activeProfileId,
          scopeKey: scope.key,
          pokemonId: pokemonId,
          isCaught: false,
        );
    record.isCaught = isCaught;
    _records[pokemonId] = record;
    // Keep the all-rows view in step now, not after the reload, so the
    // details screen's game names and the counts agree with the flag.
    _allRows = [
      for (final row in _allRows)
        if (!(row.scopeKey == scope.key && row.pokemonId == pokemonId)) row,
      record,
    ];
    pokemon.isCaught = isCaught;
    notifyListeners();

    await _localService.saveAllCaughtPokemon([record]);
    await reloadCaughtForActiveProfile(); // refreshes derived National and counts
  }

  bool get canToggleCaught => _scopes.current.isStored;

  bool get currentScopeIsDerived => _scopes.current is DerivedNationalScope;

  void fetchPokemon(int pokemonId) {
    _pokemonService.getPokemonSpecies(pokemonId, force: true);
    notifyListeners();
  }

  /// Call when a specific Pokemon is actively being viewed (its details
  /// screen is open) so its own details/species/evolution-chain/moves jump
  /// the background bulk-sync queue instead of waiting behind it - see the
  /// `priority` parameter on PokemonService's methods. Safe to call
  /// repeatedly; each piece only fetches if it isn't already loaded.
  Future<void> ensurePriorityDataLoaded(int pokemonId) async {
    final pokemon = _pokemon[pokemonId];
    if (pokemon == null) return;

    final futures = <Future>[];

    if (pokemon.details == null) {
      futures.add(_pokemonService
          .getPokemonDetails(pokemonId, priority: true)
          .then((details) {
        pokemon.details = details;
        notifyListeners();
      }).catchError((_) {}));
    }

    if (pokemon.species == null && pokemonId < 10000) {
      futures.add(_pokemonService
          .getPokemonSpecies(pokemonId, priority: true)
          .then((species) {
        pokemon.species = species;
        notifyListeners();
      }).catchError((_) {}));
    }

    if (pokemon.evolutionChain == null ||
        (pokemon.evolutionChain?.isLoading ?? true)) {
      futures.add(_pokemonService
          .getEvolutionChain(pokemonId, batch: true, priority: true)
          .then((chain) {
        if (chain == null) return;
        chain.isLoading = false;
        for (final id in chain.allPokemonIds) {
          _pokemon[id]?.evolutionChain = chain;
        }
        notifyListeners();
      }).catchError((_) {}));
    }

    // Wait for details to know which moves this Pokemon actually needs,
    // rather than guessing - if details were already loaded above (or from
    // an earlier call), this resolves immediately.
    await Future.wait(futures);

    final neededMoveIds = (pokemon.details?.moves ?? [])
        .map((m) => m.move?.id)
        .whereType<int>()
        .where((id) => !_moves.containsKey(id))
        .toSet();
    if (neededMoveIds.isEmpty) return;

    await Future.wait(neededMoveIds.map((id) => _pokemonService
        .getMove(id, priority: true)
        .then((move) {
      _moves[id] = move;
      notifyListeners();
    }).catchError((_) {})));
  }
}

/// Whether [pokemon] matches every space-separated word of [fuzzyTerm]
/// (already lowercased), each checked against name/id, types, move names,
/// and ability names (any one field matching is enough for that word - see
/// [_matchesFuzzyWord]). An empty term matches everything. This replaces the
/// old name/id-only `matchesName`/`matchesId` pair - see
/// docs/features/search-fuzzy-and-stage.md.
bool _matchesFuzzyTerm(Pokemon pokemon, String fuzzyTerm) {
  if (fuzzyTerm.isEmpty) return true;
  return fuzzyTerm
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .every((word) => _matchesFuzzyWord(pokemon, word));
}

bool _matchesFuzzyWord(Pokemon pokemon, String word) {
  if (pokemon.toString().toLowerCase().contains(word)) return true;

  final types = pokemon.types;
  if (types != null &&
      types.any((type) => type != null && type.toLowerCase().contains(word))) {
    return true;
  }

  final abilities = pokemon.details?.abilities;
  if (abilities != null &&
      abilities.any(
          (ability) => (ability.ability?.name ?? '').toLowerCase().contains(word))) {
    return true;
  }

  final moves = pokemon.details?.moves;
  if (moves != null &&
      moves.any((move) => (move.move?.name ?? '').toLowerCase().contains(word))) {
    return true;
  }

  return false;
}

/// Whether [pokemon] is at one of [stages] (1-based evolution-chain depth,
/// from `stage:` search tokens, ORed together). Empty matches every stage.
/// Degrades to "doesn't match" - rather than throwing - while the evolution
/// chain is still loading or the Pokemon's id can't be found in it.
bool _matchesStage(Pokemon pokemon, List<int> stages) {
  if (stages.isEmpty) return true;
  final chain = pokemon.evolutionChain;
  if (chain == null) return false;
  final stage = stageOfPokemonInChain(chain, pokemon.id);
  return stage != null && stages.contains(stage);
}
