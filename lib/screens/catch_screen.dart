import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokeapi/pokemon.dart';
import 'package:provider/provider.dart';

import '../models/pokeapi/pokemon_details.dart';
import '../services/pokemon_api_provider.dart'; // Adjust path as needed

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
  double _maxHP = 100;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Pokemon pokemon =
      context.read<PokemonApiProvider>().allPokemon[widget.pokemonId]!;
      _calculateProbability(pokemon.species?.captureRate);
    });
  }

  double calculateCatchProbability(int? catchRate) {
    if (catchRate == null) {
      return -1; // Loading state
    }

    // 1. HP Factor using HP percentage
    double hpFactor = (3 - 2 * _hpSliderValue) / 3;
    double baseCatchRate = hpFactor * catchRate;

    // 2. Ball Modifier
    double ballModifier = 1;
    switch (_selectedBall) {
      case 'Ultra Ball':
        ballModifier = 2.0;
        break;
      case 'Great Ball':
        ballModifier = 1.5;
        break;
      case 'Master Ball':
        return 100; // Master Ball always catches
    }

    // 3. Status Modifier
    double statusModifier = 1.0;
    switch (_selectedStatus) {
      case 'Sleep':
      case 'Frozen':
        statusModifier = 2.5;
        break;
      case 'Paralyzed':
      case 'Poisoned':
      case 'Burned':
        statusModifier = 1.5;
        break;
    }

    // 4. Compute "a" (catch chance factor)
    double a = baseCatchRate * ballModifier * statusModifier;

    // 5. Auto-catch if a >= 255
    if (a >= 255) {
      return 100;
    }

    // 6. Compute shake probability factor (b)
    double b = (1048560 / sqrt(sqrt(16711680 / a)));

    // 7. Compute final probability
    double probability = pow((b / 65536), 4) * 100;

    return probability;
  }

  void _calculateProbability(catchRate) {
    if (mounted) {
      setState(() {
        _catchProbability = calculateCatchProbability(catchRate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon =
    context.watch<PokemonApiProvider>().allPokemon[widget.pokemonId]!;

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
                    _calculateProbability(pokemon.species?.captureRate);
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
                      _calculateProbability(pokemon.species?.captureRate);
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
                      _calculateProbability(pokemon.species?.captureRate);
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
                      _calculateProbability(pokemon.species?.captureRate);
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
                  _calculateProbability(pokemon.species?.captureRate);
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