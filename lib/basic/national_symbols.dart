
import 'package:flutter/material.dart';

class NationalSymbolsPage extends StatelessWidget {
  const NationalSymbolsPage({super.key});

  final List<Map<String, String>> symbols = const [
    {
      'symbol': 'National Flag',
      'name': 'Tiranga',
      'description': 'India’s national flag has three colours: saffron, white and green, with the Ashoka Chakra in the centre.',
      'emoji': '🇮🇳',
    },
    {
      'symbol': 'National Emblem',
      'name': 'Lion Capital of Ashoka',
      'description': 'The Lion Capital of Ashoka at Sarnath is the national emblem of India.',
      'emoji': '🦁',
    },
    {
      'symbol': 'National Anthem',
      'name': 'Jana Gana Mana',
      'description': 'Jana Gana Mana is the national anthem of India.',
      'emoji': '🎵',
    },
    {
      'symbol': 'National Song',
      'name': 'Vande Mataram',
      'description': 'Vande Mataram is the national song of India.',
      'emoji': '🎶',
    },
    {
      'symbol': 'National Animal',
      'name': 'Bengal Tiger',
      'description': 'The Bengal Tiger is the national animal of India.',
      'emoji': '🐅',
    },
    {
      'symbol': 'National Bird',
      'name': 'Indian Peacock',
      'description': 'The Indian Peacock is the national bird of India.',
      'emoji': '🦚',
    },
    {
      'symbol': 'National Flower',
      'name': 'Lotus',
      'description': 'The Lotus is the national flower of India.',
      'emoji': '🪷',
    },
    {
      'symbol': 'National Tree',
      'name': 'Banyan Tree',
      'description': 'The Banyan Tree is the national tree of India.',
      'emoji': '🌳',
    },
    {
      'symbol': 'National Fruit',
      'name': 'Mango',
      'description': 'Mango is the national fruit of India.',
      'emoji': '🥭',
    },
    {
      'symbol': 'National Aquatic Animal',
      'name': 'Ganges River Dolphin',
      'description': 'The Ganges River Dolphin is the national aquatic animal of India.',
      'emoji': '🐬',
    },
    {
      'symbol': 'National River',
      'name': 'Ganga',
      'description': 'The Ganga is the national river of India.',
      'emoji': '🌊',
    },
    {
      'symbol': 'National Calendar',
      'name': 'Saka Calendar',
      'description': 'The Saka Calendar is the national calendar of India.',
      'emoji': '📅',
    },
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
          'National Symbols of India',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: symbols.length,
        itemBuilder: (context, index) {
          final item = symbols[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      item['emoji']!,
                      style: const TextStyle(fontSize: 34),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['symbol']!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF666B7A),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item['name']!,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF20243A),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['description']!,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.35,
                          color: Color(0xFF34384F),
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
