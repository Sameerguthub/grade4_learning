
import 'package:flutter/material.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFFFE0E0),
      const Color(0xFFFFF0C2),
      const Color(0xFFDFF5E1),
      const Color(0xFFDDEBFF),
      const Color(0xFFE9DEFF),
      const Color(0xFFFFDFF2),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Multiplication Tables',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) {
          final table = index + 1;
          final cardColor = colors[index % colors.length];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Table of $table',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),

                const SizedBox(height: 10),

                for (int i = 1; i <= 10; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      '$table × $i = ${table * i}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF34384F),
                      ),
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
