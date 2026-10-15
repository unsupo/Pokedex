import 'package:flutter/material.dart';
import 'package:pokedex_app/models/scope.dart';
import 'package:pokedex_app/services/pokemon_api_provider.dart';
import 'package:pokedex_app/services/scope_provider.dart';
import 'package:pokedex_app/widgets/scope/scope_selector.dart';
import 'package:provider/provider.dart';

/// The connected scope selector: builds its options from the providers.
/// Loads the game list once, on first build.
class ScopeSelectorBar extends StatefulWidget {
  const ScopeSelectorBar({super.key});

  @override
  State<ScopeSelectorBar> createState() => _ScopeSelectorBarState();
}

class _ScopeSelectorBarState extends State<ScopeSelectorBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<PokemonApiProvider>().loadGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ScopeProvider, PokemonApiProvider>(
      builder: (context, scopes, pokemon, _) {
        const derived = DerivedNationalScope();
        const manual = ManualNationalScope();
        final options = [
          _option(pokemon, derived, 'National (all games)'),
          _option(pokemon, manual, 'National (manual)'),
          for (final game in pokemon.games)
            _option(pokemon, GameScope(game.versionGroupId), game.name),
        ];
        return ScopeSelector(
          current: scopes.current,
          options: options,
          onSelected: scopes.setScope,
        );
      },
    );
  }

  ScopeOption _option(PokemonApiProvider pokemon, Scope scope, String label) =>
      ScopeOption(
        scope: scope,
        label: label,
        caught: pokemon.caughtCountFor(scope),
        total: pokemon.totalCountFor(scope),
      );
}
