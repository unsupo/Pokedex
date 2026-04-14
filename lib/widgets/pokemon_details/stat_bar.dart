import 'package:flutter/material.dart';
import '../../utils/stats_util.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;

  const StatBar({
    super.key,
    required this.label,
    required this.value,
    this.maxValue = 255, // Max stat value in Pokemon games
  });

  @override
  Widget build(BuildContext context) {
    final Color color = _getStatColor(value / maxValue); // Pass normalized value

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 65, // Adjust label width as needed
            child: Text(
              formatStatName(label),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: SizedBox(
              width: 30, // Fixed width for the stat value
              child: Text(
                '$value',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start, // Right-align the text
              ),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / maxValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10, // Adjust height as needed
            ),
          ),
          SizedBox(width: 10), // Add some space
          SizedBox(
            width: 70, // Fixed width for level 50/100 stats
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Right-align text
              children: [SizedBox(width: 30,child:
                Text(
                  '${_calculateStatAtLevel(50)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )),
                SizedBox(width: 16), // Add some space
                Text(
                  '${_calculateStatAtLevel(100)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to calculate stat at a given level (simplified formula)
  int _calculateStatAtLevel(int level) {
    return (((2 * value + 31 + 0) * level) ~/ 100) + 5;
  }

  // Helper function to get the color based on the stat value
  Color _getStatColor(double normalizedValue) {
    // Red (0) to Blue (1) interpolation
    final int red = 255;
    final int green = 0;
    final int blue = (255 * normalizedValue).round();
    return Color.fromARGB(255, red, green, blue);
  }
}