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
import '../models/user_data.dart';
import '../widgets/filter_modal.dart';
import 'pokemon_service.dart';

class PokemonApiProvider with ChangeNotifier {
  final PokemonService _pokemonService;
  final LocalService _localService;

  PokemonApiProvider(this._pokemonService, this._localService);

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

  void importPokemon(List<Pokemon?> importedPokemon) {
    // Update the caught status in your provider
    for (final importedPoke in importedPokemon) {
      if (_pokemon.containsKey(importedPoke?.id)) {
        _pokemon[importedPoke?.id]!.isCaught = true;
      } else {
        // Handle cases where the imported pokemon is not in the current list
        if (kDebugMode) {
          print("Imported Pokemon with ID ${importedPoke?.id} not found.");
        }
      }
    }
    notifyListeners(); // Important: Notify listeners after import
  }

  Future<void> fetchData() async {
    _isLoadingPokemon = true;
    _error = null;
    await _fetchPokemonList();
    await _fetchUserData();
    notifyListeners();
    List<Future<void>> futures = [
      _fetchPokemonDetailsAndSpecies(),
      _fetchEvolutionChains(),
      _fetchMoves(),
      _fetchAbilities(),
      _fetchItems(),
    ];
    Future.wait(futures);
    Future.wait(futures);
    _isLoadingPokemonDetails = false;
    _isLoadingMoves = false;
    _isLoadingAbilities = false;
    _isLoadingItems = false;
    notifyListeners();
  }

  Future<void> _fetchItems() async {
    _isLoadingItems = true;
    notifyListeners();

    List<Item?> allItems = await _localService.getAllItems();
    for (Item? item in allItems) {
      _items[item!.id] = item;
    }

    Set<int> downloadedItemIds = allItems.map((i) => i!.id).toSet();
    if (allItems.isEmpty || allItems.length < 1500) {
      // Adjust the number as needed
      List<NamedApiResource?> itemUrls = await _pokemonService.getAllItemUrls();
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

    _isLoadingItems = false;
    notifyListeners();
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
    List<Pokemon> pokemons = await _pokemonService.getPokemonList();
    for (Pokemon pokemon in pokemons) {
      _pokemon[pokemon.id] = pokemon;
    }
    _filteredPokemon.addAll(_pokemon.values);
    _isLoadingPokemon = false;
    notifyListeners();
  }

  Future<void> _fetchUserData() async {
    List<UserData> allUserData = await _localService.getAllUserData();
    for (UserData userData in allUserData) {
      _pokemon[userData.id]?.userData = userData;
    }
    notifyListeners();
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
        notifyListeners();
      }
    }

    for (PokemonSpecies? species in allPokemonSpecies) {
      if (species != null) {
        speciesPokemonIds.add(species.id);
        _pokemon[species.id]?.species = species;
        notifyListeners();
      }
    }

    final List<Future> futures = [];
    final List<PokemonDetails?> newPokemonDetails = [];
    final List<PokemonSpecies?> newPokemonSpecies = [];

    bool shouldSaveUserData = false;
    final List<UserData> allUserData = [];

    for (final pokemon in _pokemon.values) {
      if (pokemon.userData == null) {
        UserData? userData = UserData(id: pokemon.id, isCaught: false);
        pokemon.userData = userData;
        allUserData.add(userData);
        shouldSaveUserData = true;
      }
      if (!detailedPokemonIds.contains(pokemon.id)) {
        futures.add(_fetchPokemonDetail(pokemon, newPokemonDetails));
      }
      if (!speciesPokemonIds.contains(pokemon.id) && pokemon.id < 10000) {
        // no species for pokemon id > 10k
        futures.add(_fetchPokemonSpecies(pokemon, newPokemonSpecies));
      }
    }

    if (shouldSaveUserData) {
      futures.add(_localService.saveAllUserData(allUserData));
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
    for (Pokemon pokemon in _pokemon.values) {
      pokemon.evolutionChain?.isLoading = false;
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
        if (id - 1 >= 0 && id - 1 < _pokemon.length) {
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

    _isLoadingMoves = false;
    notifyListeners();
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

    _isLoadingAbilities = false;
    notifyListeners();
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

  void filterPokemon(
    String? searchQuery,
    Map<Filters, dynamic> filters, {
    List<String>? selectedTypes,
    List<int>? selectedGeneration,
    CaughtStatus caughtStatus = CaughtStatus.all,
  }) {
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
      final matchesName =
          pokemon.toString().contains(searchQuery?.toLowerCase() ?? '');
      final matchesId = pokemon.id.toString() == searchQuery;

      // Filter by Types (considering empty selectedTypes)
      try {
        final bool matchesType = (selectedTypes ?? []).isEmpty ||
            pokemon.types.any((type) =>
                selectedTypes!.toString().toLowerCase().contains(type));
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

        // Filter by Generation (considering null selectedGeneration)
        final bool matchesGeneration = selectedGeneration == null ||
            selectedGeneration.contains(pokemon.generation);

        return (matchesName || matchesId) &&
            matchesType &&
            matchesAbility &&
            matchesMove &&
            matchesCaughtStatus &&
            matchesGeneration &&
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

  void isCaught(int pokemonId, bool isCaught) {
    Pokemon? pokemon = allPokemon[pokemonId];
    pokemon?.isCaught = isCaught;
    _localService.saveUserData(pokemon!.userData);
    notifyListeners();
  }

  void fetchPokemon(int pokemonId) {
    _pokemonService.getPokemonSpecies(pokemonId, force: true);
    notifyListeners();
  }
}
