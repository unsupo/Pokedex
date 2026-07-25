import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/string_utils.dart';

import '../../models/pokeapi/moves.dart';
import '../../models/pokeapi/pokemon_details.dart';
import '../../models/pokeapi/utility.dart';
import '../../screens/move_screen.dart';
import '../type_pill.dart';
import '../../utils/type_utils.dart';

enum MoveLearnMethodType { machine, levelUp, egg, tutor }

const Map<MoveLearnMethodType, String> moveLearnMethodNames = {
  MoveLearnMethodType.machine: 'machine',
  MoveLearnMethodType.levelUp: 'level-up',
  MoveLearnMethodType.egg: 'egg',
  MoveLearnMethodType.tutor: 'tutor',
};

class MovesTable extends StatefulWidget {
  final List<MoveName> moves;
  final Map<int, Move> allMoves;

  const MovesTable({super.key, required this.allMoves, required this.moves});

  @override
  State<MovesTable> createState() => _MovesTableState();
}

class _MovesTableState extends State<MovesTable> {
  String? _selectedGame;
  List<String> _gameVersions = []; // To store the available game versions
  bool _isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _extractGameVersions();
    _checkLoading(); // Check if loading is complete
  }

  void _checkLoading() {
    // Check if data is available
    setState(() {
      _isLoading = false;
    });
  }

  // Extract unique game versions from the moves data
  void _extractGameVersions() {
    final allVersions = widget.moves.expand<Species?>((moveName) =>
        moveName.versionGroupDetails?.map((detail) => detail.versionGroup) ??
        []);
    _gameVersions = allVersions
        .map((version) => version?.name)
        .whereType<String>() // Drop null names so .sort() never sees a null
        .toSet()
        .toList();
    _gameVersions.sort(); // Sort alphabetically
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show spinner while loading
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      children: [
        // Game Version Dropdown
        DropdownButton<String>(
          hint: const Text('Select Game Version'),
          value: _selectedGame,
          onChanged: (String? newValue) {
            setState(() {
              _selectedGame = newValue;
            });
          },
          items: _gameVersions.map((String version) {
            return DropdownMenuItem<String>(
              value: version,
              child: Text(version),
            );
          }).toList(),
        ),
        DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Level-Up'),
                  Tab(text: 'Egg'),
                  Tab(text: 'Tutor'),
                  Tab(text: 'TM'),
                ],
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  children: [
                    _buildMovesSection(
                      _filterMovesByLearnMethod(MoveLearnMethodType.levelUp),
                      MoveLearnMethodType.levelUp,
                    ),
                    _buildMovesSection(
                      _filterMovesByLearnMethod(MoveLearnMethodType.egg),
                      MoveLearnMethodType.egg,
                    ),
                    _buildMovesSection(
                      _filterMovesByLearnMethod(MoveLearnMethodType.tutor),
                      MoveLearnMethodType.tutor,
                    ),
                    _buildMovesSection(
                      _filterMovesByLearnMethod(MoveLearnMethodType.machine),
                      MoveLearnMethodType.machine,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMovesSection(List<MoveName> moves, MoveLearnMethodType type) {
    if (moves.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 10,
          dataRowMinHeight: 32,
          dataRowMaxHeight: 32,
          headingRowHeight: 32,
          columns: type == MoveLearnMethodType.tutor ||
                  type == MoveLearnMethodType.egg
              ? const [
                  DataColumn(label: SizedBox(width: 100, child: Text('Move'))),
                  DataColumn(label: SizedBox(width: 65, child: Text('Type'))),
                  DataColumn(
                      label: SizedBox(width: 65, child: Text('Category'))),
                  DataColumn(label: SizedBox(width: 40, child: Text('Power'))),
                  DataColumn(label: SizedBox(width: 40, child: Text('Acc.'))),
                ]
              : [
                  DataColumn(
                      label: SizedBox(
                          width: 40,
                          child: Text(type == MoveLearnMethodType.levelUp
                              ? 'Level'
                              : "TM"))),
                  const DataColumn(
                      label: SizedBox(width: 100, child: Text('Move'))),
                  const DataColumn(
                      label: SizedBox(width: 65, child: Text('Type'))),
                  const DataColumn(
                      label: SizedBox(width: 65, child: Text('Category'))),
                  const DataColumn(
                      label: SizedBox(width: 40, child: Text('Power'))),
                  const DataColumn(
                      label: SizedBox(width: 40, child: Text('Acc.'))),
                ],
          rows: moves
              .map((moveName) => _buildMoveRow(moveName, type: type))
              .toList(),
        ),
      ),
    );
  }

  DataRow _buildMoveRow(MoveName moveName,
      {required MoveLearnMethodType type}) {
    Move? move = widget.allMoves[moveName.move?.id];

    return DataRow(
      cells: [
        if (type != MoveLearnMethodType.tutor &&
            type != MoveLearnMethodType.egg)
          DataCell(Text(_getLevelLearned(
              moveName.move?.id, moveName.versionGroupDetails, type))),
        DataCell(Text(capitalizeFirstLetter(moveName.move?.name ?? '-'))),
        DataCell(TypePill(type: move?.type?.name ?? '-')),
        DataCell(_buildCategoryCell(move?.damageClass?.name)),
        DataCell(Text(move?.power?.toString() ?? '-')),
        DataCell(Text(move?.accuracy?.toString() ?? '-')),
      ].map<DataCell>((cell) {
        return DataCell(
          GestureDetector(
            onTap: () {
              if (moveName.move?.id != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoveScreen(
                      moveId: moveName.move!.id!,
                    ),
                  ),
                );
              }
            },
            child:
                cell.child, // Access the child widget of the original DataCell
          ),
        );
      }).toList(),
    );
  }

  List<MoveName> _filterMovesByLearnMethod(MoveLearnMethodType method) {
    String methodName;
    switch (method) {
      case MoveLearnMethodType.levelUp:
        methodName = 'level-up';
        break;
      case MoveLearnMethodType.egg:
        methodName = 'egg';
        break;
      case MoveLearnMethodType.tutor:
        methodName = 'tutor';
        break;
      case MoveLearnMethodType.machine:
        methodName = 'machine';
        break;
    }

    final filteredMoves = widget.moves.where((moveName) {
      // Filter by selected game version if one is selected
      if (_selectedGame != null) {
        return (moveName.versionGroupDetails ?? []).any((detail) =>
            detail.moveLearnMethod?.name == methodName &&
            detail.versionGroup?.name == _selectedGame);
      } else {
        return (moveName.versionGroupDetails ?? [])
            .any((detail) => detail.moveLearnMethod?.name == methodName);
      }
    }).toList();

    if (method == MoveLearnMethodType.levelUp ||
        method == MoveLearnMethodType.machine) {
      filteredMoves.sort((a, b) {
        final levelA = _getLevelLearnedAsInt(
            a.move?.id, a.versionGroupDetails ?? [], method);
        final levelB = _getLevelLearnedAsInt(
            b.move?.id, b.versionGroupDetails ?? [], method);
        return levelA.compareTo(levelB);
      });
    }

    return filteredMoves;
  }

  int _getLevelLearnedAsInt(int? id,
      List<VersionGroupDetail> versionGroupDetails, MoveLearnMethodType type) {
    if (id == null ||
        !widget.allMoves.containsKey(id) ||
        widget.allMoves[id] == null) {
      return -1;
    }

    final levelUpDetail = versionGroupDetails.firstWhere(
      (detail) => detail.moveLearnMethod?.name == moveLearnMethodNames[type],
      orElse: () => VersionGroupDetail(levelLearnedAt: -1),
    );

    if (type == MoveLearnMethodType.levelUp) {
      // The Level-Up column should read the level-up detail, not machine data.
      return levelUpDetail.levelLearnedAt ?? -1;
    }

    final move =
        widget.allMoves[id]!; // Safe to use! here because of the check above

    if (move.machines == null || move.machines!.isEmpty) {
      // Handle the case where machines is null or empty
      return -1; // Or another appropriate default value
    }

    // Find the MachineVersionDetail for the currently selected game, if any.
    final machineVersionDetail = move.machines!.firstWhere(
      (detail) =>
          _selectedGame == null || detail.versionGroup?.name == _selectedGame,
      orElse: () => MachineVersionDetail(), // Provide a default
    );

    // Now you can safely access machine
    return machineVersionDetail.machine?.id ??
        -1; // Use?. in case machine is still null
  }

  String _getLevelLearned(int? id,
      List<VersionGroupDetail>? versionGroupDetails, MoveLearnMethodType type) {
    if (id == null ||
        !widget.allMoves.containsKey(id) ||
        widget.allMoves[id] == null) {
      return '-';
    }
    if (versionGroupDetails == null || versionGroupDetails.isEmpty) {
      return '-';
    }
    final levelUpDetail = versionGroupDetails.firstWhere(
      (detail) => detail.moveLearnMethod?.name == moveLearnMethodNames[type],
      orElse: () => VersionGroupDetail(),
    );

    if (type == MoveLearnMethodType.levelUp) {
      // The Level-Up column should read the level-up detail, not machine data.
      return levelUpDetail.levelLearnedAt?.toString() ?? '-';
    }

    final move =
        widget.allMoves[id]!; // Safe to use! here because of the check above

    if (move.machines == null || move.machines!.isEmpty) {
      // Handle the case where machines is null or empty
      return '-';
    }

    // Find the MachineVersionDetail for the currently selected game, if any.
    final machineVersionDetail = move.machines!.firstWhere(
      (detail) =>
          _selectedGame == null || detail.versionGroup?.name == _selectedGame,
      orElse: () => MachineVersionDetail(), // Provide a default
    );

    return '${machineVersionDetail.machine?.id ?? '-'}'; // Use?. here
  }

  Widget _buildCategoryCell(String? category) {
    String? iconPath = getCategoryIconPath(category);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconPath != null) ...[
          // Image.asset(iconPath, width: 24, height: 24),
          SizedBox(width: 5),
        ],
        Expanded(
          child: Center(
            child:
                Text(category != null ? capitalizeFirstLetter(category) : '-'),
          ),
        ),
      ],
    );
  }
}
