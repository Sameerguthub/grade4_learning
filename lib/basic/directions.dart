
import 'package:flutter/material.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  static const directions = [
    ['North', Icons.north_rounded],
    ['South', Icons.south_rounded],
    ['East', Icons.east_rounded],
    ['West', Icons.west_rounded],
    ['North-East', Icons.north_east_rounded],
    ['North-West', Icons.north_west_rounded],
    ['South-East', Icons.south_east_rounded],
    ['South-West', Icons.south_west_rounded],
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFE8E8),
      const Color(0xFFE8F5E9),
      const Color(0xFFFFF3CD),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Directions',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: directions.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  directions[index][1] as IconData,
                  size: 52,
                  color: const Color(0xFF5B5FEF),
                ),
                const SizedBox(height: 10),
                Text(
                  directions[index][0] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
