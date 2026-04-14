import 'package:flutter/material.dart';

class FilterSection extends StatefulWidget {
  // final List<String> allTypes;
  final Function(List<String>) onFilterChanged;
  final Function(CaughtStatus) onCaughtFilterChanged; // Update the callback type

  const FilterSection({
    super.key,
    // required this.allTypes,
    required this.onFilterChanged,
    required this.onCaughtFilterChanged,
  });

  @override
  _FilterSectionState createState() => _FilterSectionState();
}

// Define an enum for the caught status options
enum CaughtStatus {
  all,
  caughtOnly,
  notCaughtOnly,
}

class _FilterSectionState extends State<FilterSection> {
  CaughtStatus _caughtStatus = CaughtStatus.all; // Initial value

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<CaughtStatus>(
              value: _caughtStatus,
              onChanged: (CaughtStatus? newValue) {
                setState(() {
                  _caughtStatus = newValue!;
                  widget.onCaughtFilterChanged(_caughtStatus);
                });
              },
              items: [
                DropdownMenuItem(
                  value: CaughtStatus.all,
                  child: Text("Show Caught and not"),
                ),
                DropdownMenuItem(
                  value: CaughtStatus.caughtOnly,
                  child: Text("Show Caught Only"),
                ),
                DropdownMenuItem(
                  value: CaughtStatus.notCaughtOnly,
                  child: Text("Show Not Caught Only"),
                ),
              ],
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   child: LayoutBuilder(
        //     builder: (BuildContext context, BoxConstraints constraints) {
        //       return SizedBox(
        //         width: constraints.maxWidth, // Constrain the width
        //         child: Wrap(
        //           spacing: 8.0,
        //           runSpacing: 8.0,
        //           children: widget.allTypes.map((type) {
        //             return InkWell(
        //               onTap: () {
        //                 setState(() {
        //                   if (_selectedTypes.contains(type)) {
        //                     _selectedTypes.remove(type);
        //                   } else {
        //                     _selectedTypes.add(type);
        //                   }
        //                   widget.onFilterChanged(_selectedTypes);
        //                 });
        //               },
        //               child: TypePill(type: type),
        //             );
        //           }).toList(),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}