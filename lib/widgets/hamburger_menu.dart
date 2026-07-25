import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/io/file_picker_csv_transport.dart';
import '../services/pokemon_api_provider.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  Future<void> _exportCaughtPokemon(
      PokemonApiProvider pokemonProvider, BuildContext context) async {
    try {
      final result = await pokemonProvider
          .exportCaughtPokemon(const FilePickerCsvTransport());
      if (!context.mounted) return;
      Navigator.pop(context); // Close the drawer
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.saved
            ? 'Exported ${result.exportedCount} caught Pokemon.'
            : 'Export cancelled.'),
      ));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error exporting: $e')),
      );
    }
  }

  Future<void> _importCaughtPokemon(
      PokemonApiProvider pokemonProvider, BuildContext context) async {
    try {
      final result = await pokemonProvider
          .importCaughtPokemon(const FilePickerCsvTransport());
      if (!context.mounted) return;
      Navigator.pop(context); // Close the drawer
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.cancelled
            ? 'Import cancelled.'
            : 'Imported ${result.importedCount} caught Pokemon.'),
      ));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error importing: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Options'),
          ),
          ListTile(
            title: const Text('Export Caught Pokemon'),
            onTap: () {
              final pokemonProvider =
                  Provider.of<PokemonApiProvider>(context, listen: false);
              _exportCaughtPokemon(pokemonProvider, context);
            },
          ),
          ListTile(
            title: const Text('Import Caught Pokemon'),
            onTap: () {
              final pokemonProvider =
                  Provider.of<PokemonApiProvider>(context, listen: false);
              _importCaughtPokemon(pokemonProvider, context);
            },
          ),
        ],
      ),
    );
  }
}
