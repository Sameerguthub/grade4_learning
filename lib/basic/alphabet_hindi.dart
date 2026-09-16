
import 'package:flutter/material.dart';

class AlphabetHindiPage extends StatelessWidget {
  const AlphabetHindiPage({super.key});

  final List<Map<String, String>> alphabet = const [
    {'letter': 'अ', 'word': 'अनार', 'emoji': '🍎'},
    {'letter': 'आ', 'word': 'आम', 'emoji': '🥭'},
    {'letter': 'इ', 'word': 'इमली', 'emoji': '🌿'},
    {'letter': 'ई', 'word': 'ईख', 'emoji': '🎋'},
    {'letter': 'उ', 'word': 'उल्लू', 'emoji': '🦉'},
    {'letter': 'ऊ', 'word': 'ऊन', 'emoji': '🧶'},
    {'letter': 'ऋ', 'word': 'ऋषि', 'emoji': '🧘'},
    {'letter': 'ए', 'word': 'एड़ी', 'emoji': '🦶'},
    {'letter': 'ऐ', 'word': 'ऐनक', 'emoji': '👓'},
    {'letter': 'ओ', 'word': 'ओखली', 'emoji': '🥣'},
    {'letter': 'औ', 'word': 'औजार', 'emoji': '🔧'},
    {'letter': 'अं', 'word': 'अंगूर', 'emoji': '🍇'},
    {'letter': 'अः', 'word': 'अः', 'emoji': '📖'},

    {'letter': 'क', 'word': 'कबूतर', 'emoji': '🕊️'},
    {'letter': 'ख', 'word': 'खरगोश', 'emoji': '🐇'},
    {'letter': 'ग', 'word': 'गमला', 'emoji': '🪴'},
    {'letter': 'घ', 'word': 'घर', 'emoji': '🏠'},
    {'letter': 'ङ', 'word': 'ङ', 'emoji': '📖'},
    {'letter': 'च', 'word': 'चम्मच', 'emoji': '🥄'},
    {'letter': 'छ', 'word': 'छाता', 'emoji': '☂️'},
    {'letter': 'ज', 'word': 'जहाज', 'emoji': '✈️'},
    {'letter': 'झ', 'word': 'झंडा', 'emoji': '🚩'},
    {'letter': 'ञ', 'word': 'ञ', 'emoji': '📖'},
    {'letter': 'ट', 'word': 'टमाटर', 'emoji': '🍅'},
    {'letter': 'ठ', 'word': 'ठेला', 'emoji': '🛒'},
    {'letter': 'ड', 'word': 'डमरू', 'emoji': '🥁'},
    {'letter': 'ढ', 'word': 'ढक्कन', 'emoji': '🫙'},
    {'letter': 'ण', 'word': 'ण', 'emoji': '📖'},
    {'letter': 'त', 'word': 'तरबूज', 'emoji': '🍉'},
    {'letter': 'थ', 'word': 'थर्मस', 'emoji': '🫖'},
    {'letter': 'द', 'word': 'दवात', 'emoji': '🖋️'},
    {'letter': 'ध', 'word': 'धनुष', 'emoji': '🏹'},
    {'letter': 'न', 'word': 'नल', 'emoji': '🚰'},
    {'letter': 'प', 'word': 'पतंग', 'emoji': '🪁'},
    {'letter': 'फ', 'word': 'फल', 'emoji': '🍎'},
    {'letter': 'ब', 'word': 'बकरी', 'emoji': '🐐'},
    {'letter': 'भ', 'word': 'भालू', 'emoji': '🐻'},
    {'letter': 'म', 'word': 'मछली', 'emoji': '🐟'},
    {'letter': 'य', 'word': 'यमराज', 'emoji': '👑'},
    {'letter': 'र', 'word': 'रस्सी', 'emoji': '🪢'},
    {'letter': 'ल', 'word': 'लड्डू', 'emoji': '🍬'},
    {'letter': 'व', 'word': 'वन', 'emoji': '🌳'},
    {'letter': 'श', 'word': 'शेर', 'emoji': '🦁'},
    {'letter': 'ष', 'word': 'षट्कोण', 'emoji': '🔷'},
    {'letter': 'स', 'word': 'सेब', 'emoji': '🍎'},
    {'letter': 'ह', 'word': 'हाथी', 'emoji': '🐘'},
    {'letter': 'क्ष', 'word': 'क्षत्रिय', 'emoji': '🛡️'},
    {'letter': 'त्र', 'word': 'त्रिशूल', 'emoji': '🔱'},
    {'letter': 'ज्ञ', 'word': 'ज्ञानी', 'emoji': '🧠'},
  ];

  final List<Color> colors = const [
    Color(0xFFFFE0E0),
    Color(0xFFFFF0C2),
    Color(0xFFDFF5E1),
    Color(0xFFDDEBFF),
    Color(0xFFE9DEFF),
    Color(0xFFFFDFF2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'हिंदी वर्णमाला',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: alphabet.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final item = alphabet[index];

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['emoji']!,
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 7),
                Text(
                  item['letter']!,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF20243A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item['letter']} से ${item['word']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF34384F),
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
