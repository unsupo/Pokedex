import 'package:flutter/material.dart';

class GenerationFilter extends StatefulWidget {
  final Function(int?) onGenerationChanged;

  const GenerationFilter({super.key, required this.onGenerationChanged});

  @override
  _GenerationFilterState createState() => _GenerationFilterState();
}

class _GenerationFilterState extends State<GenerationFilter> {
  int? _selectedGeneration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton<int?>(
            value: _selectedGeneration,
            onChanged: (int? newValue) {
              setState(() {
                _selectedGeneration = newValue;
                widget.onGenerationChanged(_selectedGeneration);
              });
            },
            items: [
              DropdownMenuItem(
                value: null,
                child: Text("All Generations"), // null represents all generations
              ),
              // Add menu items for each generation
              for (int i = 1; i <= 9; i++) // Assuming 9 generations
                DropdownMenuItem(
                  value: i,
                  child: Text("Generation $i"),
                ),
            ],
          ),
        ),
      ],
    );
  }
}