
import 'package:flutter/material.dart';

class SeasonsPage extends StatelessWidget {
  const SeasonsPage({super.key});

  static const seasons = [
    {
      'name': 'Spring',
      'hindi': 'वसंत ऋतु',
      'months': 'March – April',
      'icon': Icons.local_florist_rounded,
    },
    {
      'name': 'Summer',
      'hindi': 'ग्रीष्म ऋतु',
      'months': 'May – June',
      'icon': Icons.wb_sunny_rounded,
    },
    {
      'name': 'Monsoon',
      'hindi': 'वर्षा ऋतु',
      'months': 'July – September',
      'icon': Icons.water_drop_rounded,
    },
    {
      'name': 'Autumn',
      'hindi': 'शरद ऋतु',
      'months': 'October – November',
      'icon': Icons.eco_rounded,
    },
    {
      'name': 'Winter',
      'hindi': 'शीत ऋतु',
      'months': 'December – January',
      'icon': Icons.ac_unit_rounded,
    },
    {
      'name': 'Late Winter / Spring',
      'hindi': 'वसंत की शुरुआत',
      'months': 'February',
      'icon': Icons.park_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFFFE8E8),
      const Color(0xFFFFF3CD),
      const Color(0xFFE3F2FD),
      const Color(0xFFE8F5E9),
      const Color(0xFFE8E8FF),
      const Color(0xFFF0E5FF),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Seasons',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: seasons.length,
        itemBuilder: (context, index) {
          final season = seasons[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    season['icon'] as IconData,
                    size: 31,
                    color: const Color(0xFF5B5FEF),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        season['name'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF20243A),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        season['hindi'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5B5FEF),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        season['months'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF74788D),
                        ),
                      ),
                    ],
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
