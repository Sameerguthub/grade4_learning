import 'package:flutter/material.dart';
import 'synonyms_antonyms_practice.dart';

class SynonymsAntonymsPage extends StatelessWidget {
  const SynonymsAntonymsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Synonyms & Antonyms'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 20),

              _section(
                Icons.compare_arrows_rounded,
                'What are Synonyms?',
                'Synonyms are words that have the same or nearly the same meaning.',
              ),

              _wordPairs(
                'Synonym Examples',
                [
                  'happy → joyful',
                  'big → large',
                  'small → little',
                  'fast → quick',
                  'smart → clever',
                  'begin → start',
                  'beautiful → pretty',
                ],
              ),

              _section(
                Icons.swap_horiz_rounded,
                'What are Antonyms?',
                'Antonyms are words that have opposite meanings.',
              ),

              _wordPairs(
                'Antonym Examples',
                [
                  'hot → cold',
                  'big → small',
                  'happy → sad',
                  'fast → slow',
                  'early → late',
                  'old → young',
                  'easy → difficult',
                ],
              ),

              _section(
                Icons.school_rounded,
                'Why Learn Synonyms?',
                'Synonyms help us avoid repeating the same word again and again. '
                    'They also help us learn new vocabulary.',
              ),

              _examples(
                'Example',
                'The movie was funny. The movie was amusing.',
                'Funny and amusing have similar meanings.',
              ),

              _section(
                Icons.school_outlined,
                'Why Learn Antonyms?',
                'Antonyms help us understand differences and opposite ideas.',
              ),

              _examples(
                'Example',
                'The water is hot, but the ice is cold.',
                'Hot and cold have opposite meanings.',
              ),

              _section(
                Icons.lightbulb_outline_rounded,
                'Easy Trick',
                'SYNONYM = SAME OR SIMILAR MEANING\n\n'
                    'ANTONYM = OPPOSITE MEANING',
              ),

              _section(
                Icons.warning_amber_rounded,
                'Remember',
                'A synonym does not always mean exactly the same thing. '
                    'Some words have very similar meanings.\n\n'
                    'For example:\n'
                    'Big and large are similar in meaning.\n\n'
                    'Antonyms are easier to remember as opposites:\n'
                    'up ↔ down\n'
                    'open ↔ closed',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SynonymsAntonymsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Practice',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Card(
      elevation: 3,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            Icon(
              Icons.compare_arrows_rounded,
              size: 52,
            ),
            SizedBox(height: 10),
            Text(
              'Synonyms & Antonyms',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              'Learn words with similar and opposite meanings.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(
    IconData icon,
    String title,
    String content,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 27),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wordPairs(String title, List<String> pairs) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...pairs.map(
              (pair) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        pair,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _examples(
    String title,
    String sentence,
    String explanation,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              sentence,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              explanation,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}