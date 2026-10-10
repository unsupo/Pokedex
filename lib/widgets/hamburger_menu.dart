import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/io/caught_pokemon_repository.dart';
import '../services/io/caught_tcg_card_repository.dart';
import '../services/io/combined_caught_transfer_service.dart';
import '../services/io/file_picker_csv_transport.dart';
import '../services/local/local_service.dart';
import '../services/pokemon_api_provider.dart';
import '../services/profile_provider.dart';
import '../services/profiles/local_service_profile_repository.dart';
import '../services/tcg_api_provider.dart';

/// One export, one import, covering every profile's caught Pokemon and
/// caught TCG cards together, in a single file (see
/// [CombinedCaughtTransferService]) - a full local backup/restore, not a
/// per-profile one. Nothing in the UI asks which profile or which kind of
/// data to include; everything always comes along.
class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  CombinedCaughtTransferService _transferService(BuildContext context) {
    final localService = Provider.of<LocalService>(context, listen: false);
    return CombinedCaughtTransferService(
      LocalServiceCaughtPokemonRepository(localService),
      LocalServiceCaughtTcgCardRepository(localService),
      LocalServiceProfileRepository(localService),
    );
  }

  Future<void> _export(BuildContext context) async {
    final pokemonProvider =
        Provider.of<PokemonApiProvider>(context, listen: false);

    try {
      final result = await _transferService(context).exportCaught(
        const FilePickerCsvTransport(),
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
                '${result.exportedCardCount} caught cards, across every profile.'
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
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

    try {
      final result = await _transferService(context).importCaught(
        const FilePickerCsvTransport(),
        fallbackProfileId: profileProvider.activeProfileId,
      );
      if (!context.mounted) return;
      Navigator.pop(context); // Close the drawer
      if (!result.cancelled &&
          (result.importedPokemonCount > 0 || result.importedCardCount > 0)) {
        // A multi-profile import may have created profiles that didn't
        // exist before (see CombinedCaughtTransferService.importCaught) -
        // reload so the profile switcher shows them immediately.
        await profileProvider.load();
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
            subtitle: const Text('Every profile\'s Pokemon and cards, in one file'),
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
