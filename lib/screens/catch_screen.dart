import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:provider/provider.dart';

import '../models/pokeapi/pokemon_details.dart';
import '../services/pokemon_api_provider.dart'; // Adjust path as needed
import '../utils/capture_util.dart';

class PokemonCatchScreen extends StatefulWidget {
  final int pokemonId;
  const PokemonCatchScreen({super.key, required this.pokemonId});

  @override
  State<PokemonCatchScreen> createState() => _PokemonCatchScreenState();
}

class _PokemonCatchScreenState extends State<PokemonCatchScreen> {
  double _hpSliderValue = 1.0;
  int _selectedLevel = 1;
  String? _selectedStatus = 'Normal';
  String _selectedBall = 'Poke Ball';
  double _catchProbability = 0.0;
  bool _calculatedWithRealData = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final pokemon =
          context.read<PokemonApiProvider>().allPokemon[widget.pokemonId];
      if (pokemon != null) {
        _calculateProbability(pokemon);
      }
    });
  }

  /// The Pokémon's real max HP (from its base stats), not a fixed guess —
  /// the catch-probability formula is HP-sensitive, so assuming every
  /// Pokémon has 100 max HP would make the "fixed" formula still wrong.
  /// Falls back to 100 only while stats haven't loaded yet.
  int _maxHpFor(Pokemon pokemon) {
    final hpStat = pokemon.details?.stats?.firstWhere(
      (s) => s.stat?.name == 'hp',
      orElse: () => StatInfo(),
    );
    return hpStat?.baseStat ?? 100;
  }

  /// Maps the UI's ball dropdown selection to the ball catch-rate multiplier
  /// used by [CaptureCalculator] (consistent across all generations).
  double _ballBonusFor(String ball) {
    switch (ball) {
      case 'Ultra Ball':
        return 2.0;
      case 'Great Ball':
        return 1.5;
      case 'Poke Ball':
      default:
        return 1.0;
    }
  }

  /// Maps the UI's status selection to the statusBonus value expected by
  /// [CaptureCalculator]. Gen I/II branches treat statusBonus purely as a
  /// lookup flag (2.0 => sleep/frozen, 1.5 => paralyzed/burned/poisoned),
  /// while Gen III+ branches use it as the real catch-rate multiplier (2.5
  /// for sleep/frozen, 1.5 for the others) - see capture_util.dart.
  double _statusBonusFor(int generation) {
    final bool isAsleepOrFrozen =
        _selectedStatus == 'Sleep' || _selectedStatus == 'Frozen';
    final bool isParalyzedBurnedOrPoisoned = _selectedStatus == 'Paralyzed' ||
        _selectedStatus == 'Burned' ||
        _selectedStatus == 'Poisoned';

    if (generation <= 2) {
      if (isAsleepOrFrozen) return 2.0;
      if (isParalyzedBurnedOrPoisoned) return 1.5;
      return 1.0;
    }

    if (isAsleepOrFrozen) return 2.5;
    if (isParalyzedBurnedOrPoisoned) return 1.5;
    return 1.0;
  }

  double calculateCatchProbability(Pokemon pokemon) {
    final int? catchRate = pokemon.species?.captureRate;
    if (catchRate == null) {
      return -1; // Loading state
    }

    if (_selectedBall == 'Master Ball') {
      // Not reachable via the current ball dropdown, kept defensively.
      return 100;
    }

    // Pokemon.generation (lib/models/pokeapi/pokemon.dart) is derived from
    // the national dex id and returns 0 for ids outside the currently-known
    // generation 1-9 ranges. CaptureCalculator only supports generations
    // 1-9, so fall back to the most recent generation's formula in that case.
    int generation = pokemon.generation;
    if (generation < 1 || generation > 9) {
      generation = 9;
    }

    int maxHp = _maxHpFor(pokemon);
    int currentHp = (_hpSliderValue * maxHp).round();

    try {
      double probability = CaptureCalculator.calculateCaptureProbability(
        generation: generation,
        maxHp: maxHp,
        currentHp: currentHp,
        captureRate: catchRate,
        ballBonus: _ballBonusFor(_selectedBall),
        statusBonus: _statusBonusFor(generation),
        // Gen I only. `level`/`opponentStatusBonus` are not actually read by
        // the current CaptureCalculator Gen I formula (they exist for a
        // not-yet-implemented Ditto-transform edge case), so these are safe
        // placeholders required only to satisfy the API.
        level: generation == 1 ? _selectedLevel : null,
        opponentStatusBonus: generation == 1 ? 1.0 : null,
        // Gen 9 only - this screen has no dedicated UI for these yet, so use
        // conservative/neutral defaults (8 badges, no Catching Charm, no
        // Catching Power boost, no Pokédex completion bonus).
        numBadges: generation == 9 ? 8 : null,
        hasCatchingCharm: generation == 9 ? false : null,
        catchingPowerLevel: generation == 9 ? 0 : null,
        pokedexEntries: generation == 9 ? 0 : null,
      );
      return probability * 100;
    } on ArgumentError catch (e) {
      debugPrint('CaptureCalculator error: $e');
      return -1;
    }
  }

  void _calculateProbability(Pokemon pokemon) {
    if (mounted) {
      setState(() {
        _catchProbability = calculateCatchProbability(pokemon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pokemon =
        context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId];
    if (pokemon == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    // The initial calculation (in initState) can run before species/details
    // data (needed for captureRate and the real max-HP stat) has finished
    // loading in the background, leaving _catchProbability stuck. Once both
    // have arrived, recompute exactly once so the displayed number catches
    // up without re-triggering on every subsequent rebuild.
    if (!_calculatedWithRealData &&
        pokemon.species?.captureRate != null &&
        pokemon.details?.stats != null) {
      _calculatedWithRealData = true;
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _calculateProbability(pokemon));
    }

    // Determine if the button should be disabled and change color
    bool isButtonDisabled =
        _selectedStatus == 'Paralyzed' || _selectedStatus == 'Sleep';

    return Scaffold(
      appBar: AppBar(
        title: Text('Catch ${pokemon.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // HP Bar
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _hpSliderValue,
                    minHeight: 15,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _hpSliderValue > 0.5
                          ? Colors.green
                          : _hpSliderValue > 0.25
                          ? Colors.yellow
                          : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'HP: ${(_hpSliderValue * 100).toStringAsFixed(0)}%', // Display HP percentage without decimals
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            // Interactive Slider
            Slider(
              value: _hpSliderValue,
              onChanged: (value) {
                // Prevent slider from reaching 0
                if (value > 0) {
                  setState(() {
                    _hpSliderValue = value;
                    _calculateProbability(pokemon);
                  });
                }
              },
              min: 0.01, // Set the minimum to just above 0
              max: 1.0,
              activeColor: _hpSliderValue > 0.5
                  ? Colors.green
                  : _hpSliderValue > 0.25
                  ? Colors.yellow
                  : Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'Normal';
                      _calculateProbability(pokemon);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _selectedStatus == 'Normal' ? null : Colors.grey,
                  ),
                  child: const Text('Normal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'Paralyzed';
                      _calculateProbability(pokemon);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _selectedStatus == 'Paralyzed' ? null : Colors.grey,
                  ),
                  child: const Text('Paralyzed'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'Sleep';
                      _calculateProbability(pokemon);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    _selectedStatus == 'Sleep' ? null : Colors.grey,
                  ),
                  child: const Text('Sleep'),
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Ball Type',
              ),
              value: _selectedBall,
              onChanged: (newValue) {
                setState(() {
                  _selectedBall = newValue!;
                  _calculateProbability(pokemon);
                });
              },
              items: <String>[
                'Poke Ball',
                'Great Ball',
                'Ultra Ball'
              ] //, 'Master Ball' not relevant
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text(
              'Catch Probability: ${(_catchProbability).toStringAsFixed(2)}%',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: isButtonDisabled
                  ? null
                  : () {
                if (Random().nextDouble() * 100 < _catchProbability) {
                  // Success
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Success!"),
                      content: Text("You caught ${pokemon.name}!"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Failure
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Failure!"),
                      content: Text("${pokemon.name} escaped!"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isButtonDisabled ? Colors.grey : null,
              ),
              child: const Text('Attempt Catch'),
            ),
          ],
        ),
      ),
    );
  }
}