
import 'package:flutter/material.dart';

class AlphabetEnglishPage extends StatelessWidget {
  const AlphabetEnglishPage({super.key});

  final List<Map<String, String>> alphabet = const [
    {'letter': 'A', 'word': 'Apple', 'emoji': '🍎'},
    {'letter': 'B', 'word': 'Ball', 'emoji': '⚽'},
    {'letter': 'C', 'word': 'Cat', 'emoji': '🐱'},
    {'letter': 'D', 'word': 'Dog', 'emoji': '🐶'},
    {'letter': 'E', 'word': 'Egg', 'emoji': '🥚'},
    {'letter': 'F', 'word': 'Fish', 'emoji': '🐟'},
    {'letter': 'G', 'word': 'Grapes', 'emoji': '🍇'},
    {'letter': 'H', 'word': 'House', 'emoji': '🏠'},
    {'letter': 'I', 'word': 'Ice Cream', 'emoji': '🍦'},
    {'letter': 'J', 'word': 'Juice', 'emoji': '🧃'},
    {'letter': 'K', 'word': 'Kite', 'emoji': '🪁'},
    {'letter': 'L', 'word': 'Lion', 'emoji': '🦁'},
    {'letter': 'M', 'word': 'Monkey', 'emoji': '🐒'},
    {'letter': 'N', 'word': 'Nest', 'emoji': '🪺'},
    {'letter': 'O', 'word': 'Orange', 'emoji': '🍊'},
    {'letter': 'P', 'word': 'Parrot', 'emoji': '🦜'},
    {'letter': 'Q', 'word': 'Queen', 'emoji': '👑'},
    {'letter': 'R', 'word': 'Rabbit', 'emoji': '🐇'},
    {'letter': 'S', 'word': 'Sun', 'emoji': '☀️'},
    {'letter': 'T', 'word': 'Tiger', 'emoji': '🐯'},
    {'letter': 'U', 'word': 'Umbrella', 'emoji': '☂️'},
    {'letter': 'V', 'word': 'Van', 'emoji': '🚐'},
    {'letter': 'W', 'word': 'Watermelon', 'emoji': '🍉'},
    {'letter': 'X', 'word': 'Xylophone', 'emoji': '🎵'},
    {'letter': 'Y', 'word': 'Yo-Yo', 'emoji': '🪀'},
    {'letter': 'Z', 'word': 'Zebra', 'emoji': '🦓'},
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
          'English Alphabet',
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
                  style: const TextStyle(fontSize: 42),
                ),
                const SizedBox(height: 8),
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
                  '${item['letter']} for ${item['word']}',
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
