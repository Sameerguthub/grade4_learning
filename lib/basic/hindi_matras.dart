
import 'package:flutter/material.dart';

class HindiMatrasPage extends StatelessWidget {
  const HindiMatrasPage({super.key});

  static const List<Map<String, String>> letters = [
    {'letter': 'क', 'name': 'Ka'},
    {'letter': 'ख', 'name': 'Kha'},
    {'letter': 'ग', 'name': 'Ga'},
    {'letter': 'घ', 'name': 'Gha'},
    {'letter': 'ङ', 'name': 'Nga'},

    {'letter': 'च', 'name': 'Cha'},
    {'letter': 'छ', 'name': 'Chha'},
    {'letter': 'ज', 'name': 'Ja'},
    {'letter': 'झ', 'name': 'Jha'},
    {'letter': 'ञ', 'name': 'Nya'},

    {'letter': 'ट', 'name': 'Ta'},
    {'letter': 'ठ', 'name': 'Tha'},
    {'letter': 'ड', 'name': 'Da'},
    {'letter': 'ढ', 'name': 'Dha'},
    {'letter': 'ण', 'name': 'Na'},

    {'letter': 'त', 'name': 'Ta'},
    {'letter': 'थ', 'name': 'Tha'},
    {'letter': 'द', 'name': 'Da'},
    {'letter': 'ध', 'name': 'Dha'},
    {'letter': 'न', 'name': 'Na'},

    {'letter': 'प', 'name': 'Pa'},
    {'letter': 'फ', 'name': 'Pha'},
    {'letter': 'ब', 'name': 'Ba'},
    {'letter': 'भ', 'name': 'Bha'},
    {'letter': 'म', 'name': 'Ma'},

    {'letter': 'य', 'name': 'Ya'},
    {'letter': 'र', 'name': 'Ra'},
    {'letter': 'ल', 'name': 'La'},
    {'letter': 'व', 'name': 'Va'},

    {'letter': 'श', 'name': 'Sha'},
    {'letter': 'ष', 'name': 'Sha'},
    {'letter': 'स', 'name': 'Sa'},
    {'letter': 'ह', 'name': 'Ha'},

    {'letter': 'क्ष', 'name': 'Ksha'},
    {'letter': 'त्र', 'name': 'Tra'},
    {'letter': 'ज्ञ', 'name': 'Gya'},
  ];

  static const List<String> matras = [
    '',
    'ा',
    'ि',
    'ी',
    'ु',
    'ू',
    'े',
    'ै',
    'ो',
    'ौ',
    'ं',
    'ः',
  ];

  static const List<String> matraNames = [
    'A',
    'Aa',
    'I',
    'Ee',
    'U',
    'Oo',
    'E',
    'Ai',
    'O',
    'Au',
    'An',
    'Ah',
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFE8E8),
      const Color(0xFFE8F5E9),
      const Color(0xFFFFF3CD),
      const Color(0xFFF0E5FF),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Hindi Matras',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: letters.length,
        itemBuilder: (context, index) {
          final letter = letters[index]['letter']!;
          final name = letters[index]['name']!;
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
                Row(
                  children: [
                    Text(
                      letter,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5B5FEF),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    matras.length,
                    (matraIndex) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$letter${matras[matraIndex]}',
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF20243A),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              matraNames[matraIndex],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFF74788D),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
