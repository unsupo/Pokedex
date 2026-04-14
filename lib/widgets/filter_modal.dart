import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/type_pill.dart';
import 'package:provider/provider.dart';

import '../data/type_chart.dart';
import '../services/pokemon_api_provider.dart';
import 'filter_section.dart';

enum Filters {
  Types,
  Abilities,
  Moves,
  Generations,
  Caught,
}

class FilterModal extends StatefulWidget {
  final Function(Map<Filters, dynamic>) onFilterSelected;

  const FilterModal({super.key, required this.onFilterSelected});

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  Map<Filters, dynamic> selectedFilters = {};

  @override
  void initState() {
    super.initState();
    selectedFilters = Map.from(context.read<PokemonApiProvider>().currentFilters);
  }

  @override
  Widget build(BuildContext context) {
    final allAbilities = context.watch<PokemonApiProvider>().allAbilities;
    final allMoves = context.watch<PokemonApiProvider>().allMoves;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16.0),

          _buildMultiSelectDropdown<int>(
            labelText: 'Generations',
            items: [
              for (int i = 1; i <= 9; i++)
                DropdownMenuItem(value: i, child: Text('Generation $i')),
            ],
            selectedValues: selectedFilters[Filters.Generations] as List<int>? ?? [],
            onChanged: (values) => setState(() => selectedFilters[Filters.Generations] = values),
          ),
          const SizedBox(height: 10),
          _buildMultiSelectDropdown<String>(
            labelText: 'Types',
            items: TYPE_EFFECTIVENESS_DATA.map((type) => DropdownMenuItem(
              value: type['name'] as String,
              child: TypePill(type: type['name'] as String),
            )).toList(),
            selectedValues: selectedFilters[Filters.Types] as List<String>? ?? [],
            onChanged: (values) => setState(() => selectedFilters[Filters.Types] = values),
          ),
          const SizedBox(height: 10),
          _buildMultiSelectDropdown<String>(
            labelText: 'Abilities',
            items: allAbilities.values.map((ability) => DropdownMenuItem(
              value: ability.name,
              child: Text(ability.name ?? ''),
            )).toList(),
            selectedValues: selectedFilters[Filters.Abilities] as List<String>? ?? [],
            onChanged: (values) => setState(() => selectedFilters[Filters.Abilities] = values),
          ),
          const SizedBox(height: 10),
          _buildMultiSelectDropdown<String>(
            labelText: 'Moves',
            items: allMoves.values.map((move) => DropdownMenuItem(
              value: move.name,
              child: Text(move.name ?? ''),
            )).toList(),
            selectedValues: selectedFilters[Filters.Moves] as List<String>? ?? [],
            onChanged: (values) => setState(() => selectedFilters[Filters.Moves] = values),
          ),
          const SizedBox(height: 10),
          _buildCaughtStatusFilter(),

          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              context.read<PokemonApiProvider>().updateFilters(selectedFilters);
              widget.onFilterSelected(selectedFilters);
              Navigator.pop(context);
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildMultiSelectDropdown<T>({
    required String labelText,
    required List<DropdownMenuItem<T>> items,
    required List<T> selectedValues,
    required Function(List<T>) onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(labelText: labelText, border: const OutlineInputBorder()),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: [
          ...selectedValues.map((value) => Chip(
            label: Text(value.toString()),
            onDeleted: () {
              setState(() {
                selectedValues.remove(value);
                onChanged(List.from(selectedValues));
              });
            },
          )),
          PopupMenuButton<T>(
            onSelected: (value) {
              setState(() {
                if (!selectedValues.contains(value)) {
                  selectedValues.add(value);
                  onChanged(List.from(selectedValues));
                }
              });
            },
            itemBuilder: (BuildContext context) {
              return items
                  .where((item) => !selectedValues.contains(item.value))
                  .map((item) => PopupMenuItem<T>(
                value: item.value,
                child: item.child,
              ))
                  .toList();
            },
            child: const Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }

  Widget _buildCaughtStatusFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Caught Status', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            _buildCaughtStatusRadioButton(CaughtStatus.all, 'All'),
            _buildCaughtStatusRadioButton(CaughtStatus.caughtOnly, 'Caught Only'),
            _buildCaughtStatusRadioButton(CaughtStatus.notCaughtOnly, 'Not Caught Only'),
          ],
        ),
      ],
    );
  }

  Widget _buildCaughtStatusRadioButton(CaughtStatus value, String label) {
    return Row(
      children: [
        Radio<CaughtStatus>(
          value: value,
          groupValue: selectedFilters[Filters.Caught] ?? CaughtStatus.all, // Provide Default
          onChanged: (CaughtStatus? newValue) {
            setState(() {
              selectedFilters[Filters.Caught] = newValue ?? CaughtStatus.all;
            });
          },
        ),
        Text(label),
      ],
    );
  }
}