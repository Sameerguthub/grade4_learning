
import 'package:flutter/material.dart';

class HindiVarnamalaPage extends StatelessWidget {
  const HindiVarnamalaPage({super.key});

  static const List<Map<String, String>> swar = [
    {'letter': 'अ', 'sound': 'A'},
    {'letter': 'आ', 'sound': 'Aa'},
    {'letter': 'इ', 'sound': 'I'},
    {'letter': 'ई', 'sound': 'Ee'},
    {'letter': 'उ', 'sound': 'U'},
    {'letter': 'ऊ', 'sound': 'Oo'},
    {'letter': 'ऋ', 'sound': 'Ri'},
    {'letter': 'ए', 'sound': 'E'},
    {'letter': 'ऐ', 'sound': 'Ai'},
    {'letter': 'ओ', 'sound': 'O'},
    {'letter': 'औ', 'sound': 'Au'},
    {'letter': 'अं', 'sound': 'An'},
    {'letter': 'अः', 'sound': 'Ah'},
  ];

  static const List<Map<String, String>> vyanjan = [
    {'letter': 'क', 'sound': 'Ka'},
    {'letter': 'ख', 'sound': 'Kha'},
    {'letter': 'ग', 'sound': 'Ga'},
    {'letter': 'घ', 'sound': 'Gha'},
    {'letter': 'ङ', 'sound': 'Nga'},
    {'letter': 'च', 'sound': 'Cha'},
    {'letter': 'छ', 'sound': 'Chha'},
    {'letter': 'ज', 'sound': 'Ja'},
    {'letter': 'झ', 'sound': 'Jha'},
    {'letter': 'ञ', 'sound': 'Nya'},
    {'letter': 'ट', 'sound': 'Ta'},
    {'letter': 'ठ', 'sound': 'Tha'},
    {'letter': 'ड', 'sound': 'Da'},
    {'letter': 'ढ', 'sound': 'Dha'},
    {'letter': 'ण', 'sound': 'Na'},
    {'letter': 'त', 'sound': 'Ta'},
    {'letter': 'थ', 'sound': 'Tha'},
    {'letter': 'द', 'sound': 'Da'},
    {'letter': 'ध', 'sound': 'Dha'},
    {'letter': 'न', 'sound': 'Na'},
    {'letter': 'प', 'sound': 'Pa'},
    {'letter': 'फ', 'sound': 'Pha'},
    {'letter': 'ब', 'sound': 'Ba'},
    {'letter': 'भ', 'sound': 'Bha'},
    {'letter': 'म', 'sound': 'Ma'},
    {'letter': 'य', 'sound': 'Ya'},
    {'letter': 'र', 'sound': 'Ra'},
    {'letter': 'ल', 'sound': 'La'},
    {'letter': 'व', 'sound': 'Va'},
    {'letter': 'श', 'sound': 'Sha'},
    {'letter': 'ष', 'sound': 'Sha'},
    {'letter': 'स', 'sound': 'Sa'},
    {'letter': 'ह', 'sound': 'Ha'},
    {'letter': 'क्ष', 'sound': 'Ksha'},
    {'letter': 'त्र', 'sound': 'Tra'},
    {'letter': 'ज्ञ', 'sound': 'Gya'},
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
          'Hindi Varnamala',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle('स्वर', 'Swar - Vowels'),

          const SizedBox(height: 12),

          _letterGrid(swar, colors),

          const SizedBox(height: 24),

          _sectionTitle('व्यंजन', 'Vyanjan - Consonants'),

          const SizedBox(height: 12),

          _letterGrid(vyanjan, colors),
        ],
      ),
    );
  }

  Widget _sectionTitle(String hindi, String english) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hindi,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Color(0xFF20243A),
          ),
        ),
        Text(
          english,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF74788D),
          ),
        ),
      ],
    );
  }

  Widget _letterGrid(
    List<Map<String, String>> letters,
    List<Color> colors,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: letters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: colors[index % colors.length],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                letters[index]['letter']!,
                style: const TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF20243A),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                letters[index]['sound']!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5B5FEF),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
