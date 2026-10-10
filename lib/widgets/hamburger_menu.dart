import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/io/caught_pokemon_repository.dart';
import '../services/io/caught_tcg_card_repository.dart';
import '../services/io/combined_caught_transfer_service.dart';
import '../services/io/file_picker_csv_transport.dart';
import '../services/local/local_service.dart';
import '../services/pokemon_api_provider.dart';
import '../services/profile_provider.dart';
import '../services/tcg_api_provider.dart';
import 'export/export_scope_dialog.dart';

/// One export, one import. Each covers caught Pokemon and caught TCG cards
/// together, in a single file (see [CombinedCaughtTransferService]) -
/// nothing in the UI asks which kind of data to include, because both kinds
/// always come along.
class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  CombinedCaughtTransferService _transferService(BuildContext context) {
    final localService = Provider.of<LocalService>(context, listen: false);
    return CombinedCaughtTransferService(
      LocalServiceCaughtPokemonRepository(localService),
      LocalServiceCaughtTcgCardRepository(localService),
    );
  }

  Future<void> _export(BuildContext context) async {
    final pokemonProvider =
        Provider.of<PokemonApiProvider>(context, listen: false);
    final profileId =
        Provider.of<ProfileProvider>(context, listen: false).activeProfileId;

    final currentScopeOnly = await showExportScopeDialog(context,
        currentScopeIsDerived: pokemonProvider.currentScopeIsDerived);
    if (currentScopeOnly == null || !context.mounted) return;

    try {
      final result = await _transferService(context).exportCaught(
        const FilePickerCsvTransport(),
        profileId: profileId,
        pokemonScopeKey: pokemonProvider.resolvedExportScopeKey(currentScopeOnly),
        pokemonNames: {
          for (final entry in pokemonProvider.allPokemon.entries)
            entry.key: entry.value.name,
        },
      );
      if (!context.mounted) return;
      Navigator.pop(context); // Close the drawer
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.saved
            ? 'Exported ${result.exportedPokemonCount} caught Pokemon and '
                '${result.exportedCardCount} caught cards.'
            : 'Export cancelled.'),
      ));
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error exporting: $e')),
      );
    }
  }

  Future<void> _import(BuildContext context) async {
    final pokemonProvider =
        Provider.of<PokemonApiProvider>(context, listen: false);
    final tcgProvider = Provider.of<TcgApiProvider>(context, listen: false);
    final profileId =
        Provider.of<ProfileProvider>(context, listen: false).activeProfileId;

    try {
      final result = await _transferService(context)
          .importCaught(const FilePickerCsvTransport(), profileId: profileId);
      if (!context.mounted) return;
      Navigator.pop(context); // Close the drawer
      if (!result.cancelled &&
          (result.importedPokemonCount > 0 || result.importedCardCount > 0)) {
        await pokemonProvider.reloadCaughtForActiveProfile();
        await tcgProvider.reloadLoadedCaughtStatus();
      }
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result.cancelled
            ? 'Import cancelled.'
            : 'Imported ${result.importedPokemonCount} caught Pokemon and '
                '${result.importedCardCount} caught cards.'),
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
            title: const Text('Export Caught Data'),
            subtitle: const Text('Pokemon and cards, in one file'),
            onTap: () => _export(context),
          ),
          ListTile(
            title: const Text('Import Caught Data'),
            subtitle: const Text('Reads any file this app has exported'),
            onTap: () => _import(context),
          ),
        ],
      ),
    );
  }
}
