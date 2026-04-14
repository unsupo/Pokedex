import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/pokeapi/pokemon.dart';
import '../services/pokemon_api_provider.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  Future<String?> writeFile(String contents) async {
    // storage permission ask
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Caught Pokemon',
        fileName: 'caught_pokemon.txt',
        type: FileType.custom,
        allowedExtensions: ['txt'],
        bytes: utf8.encode(contents.toString()));

    return outputFile;
  }

  Future<bool> storagePermission() async {
    final DeviceInfoPlugin info =
        DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';
    final AndroidDeviceInfo androidInfo = await info.androidInfo;
    debugPrint('releaseVersion : ${androidInfo.version.release}');
    final int androidVersion = int.parse(androidInfo.version.release);
    bool havePermission = false;

    // Here you can use android api level
    // like android api level 33 = android 13
    // This way you can also find out how to request storage permission

    if (androidVersion >= 13) {
      final request = await [
        Permission.storage,
        Permission.manageExternalStorage
      ].request();

      havePermission =
          request.values.every((status) => status == PermissionStatus.granted);
    } else {
      final status = await Permission.storage.request();
      havePermission = status.isGranted;
    }
    if (!havePermission) {
      // if no permission then open app-setting
      // await openAppSettings();
    }
    return havePermission;
  }

  Future<void> _exportCaughtPokemon(
      PokemonApiProvider pokemonProvider, BuildContext context) async {
    final caughtPokemon =
        pokemonProvider.allPokemon.values.where((p) => p.isCaught).toList();

    try {
      // final jsonString =
      //     jsonEncode(caughtPokemon.map((p) => {"id": p.id}).toList());
      // Prepare CSV data
      final csvData = StringBuffer();
      csvData.write('id\n'); // Header row
      for (var pokemon in caughtPokemon) {
        csvData.write('${pokemon.id}\n');
      }

      // Encode as bytes
      final bytes = utf8.encode(csvData.toString());
      // final Uint8List? bytes = Uint8List.fromList(utf8.encode(jsonString));

      final permission = await storagePermission();

      // if (!permission) {
      //   Navigator.pop(context); // Close the drawer
      //   // openAppSettings();
      //   if (context.mounted) {
      //     // Check if context is valid
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Storage permission not granted.')),
      //     );
      //   }
      //   return;
      // }
      var file = await writeFile(csvData.toString());
      Navigator.pop(context); // Close the drawer
      // openAppSettings();
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Caught Pokemon exported successfully!')),
      );
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
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.single.path!);
        String contents = await file.readAsString();
        List<dynamic> jsonList = jsonDecode(contents);
        List<Pokemon> importedPokemon =
            jsonList.map((json) => Pokemon.fromJson(json)).toList();

        pokemonProvider.importPokemon(importedPokemon);

        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Caught Pokemon imported successfully!')),
        );
      }
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
