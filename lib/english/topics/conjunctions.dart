import 'package:flutter/material.dart';
import 'conjunctions_practice.dart';

class ConjunctionsPage extends StatelessWidget {
  const ConjunctionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conjunctions'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCard(),
              const SizedBox(height: 20),

              _section(
                icon: Icons.link_rounded,
                title: 'What is a Conjunction?',
                content:
                    'A conjunction is a word that joins words, groups of words, or sentences together.',
              ),

              _exampleCard(
                'Examples',
                [
                  'Riya and Aman are friends.',
                  'I wanted to play, but it was raining.',
                  'Would you like tea or juice?',
                  'I stayed home because I was sick.',
                  'It was raining, so we carried umbrellas.',
                ],
              ),

              _section(
                icon: Icons.add_link_rounded,
                title: 'AND',
                content:
                    'We use "and" to join similar ideas or to add information.',
              ),

              _exampleCard(
                'Examples',
                [
                  'Tom and Jerry are famous characters.',
                  'I like apples and bananas.',
                  'She opened the book and started reading.',
                ],
              ),

              _section(
                icon: Icons.compare_arrows_rounded,
                title: 'BUT',
                content:
                    'We use "but" to join two ideas that are different or opposite.',
              ),

              _exampleCard(
                'Examples',
                [
                  'I am tired, but I will finish my homework.',
                  'The bag is small, but it is very useful.',
                  'He is young, but he is very brave.',
                ],
              ),

              _section(
                icon: Icons.alt_route_rounded,
                title: 'OR',
                content:
                    'We use "or" when we give a choice between two or more things.',
              ),

              _exampleCard(
                'Examples',
                [
                  'Would you like milk or juice?',
                  'You can walk or take the bus.',
                  'Do you want red or blue?',
                ],
              ),

              _section(
                icon: Icons.help_outline_rounded,
                title: 'BECAUSE',
                content:
                    'We use "because" to give a reason for something.',
              ),

              _exampleCard(
                'Examples',
                [
                  'I was late because I missed the bus.',
                  'She is happy because she won the race.',
                  'We stayed inside because it was raining.',
                ],
              ),

              _section(
                icon: Icons.arrow_forward_rounded,
                title: 'SO',
                content:
                    'We use "so" to show a result or what happened because of something.',
              ),

              _exampleCard(
                'Examples',
                [
                  'It was cold, so I wore a jacket.',
                  'I was hungry, so I ate a sandwich.',
                  'She studied hard, so she passed the test.',
                ],
              ),

              _section(
                icon: Icons.menu_book_rounded,
                title: 'Quick Guide',
                content:
                    'AND = adds information\n'
                    'BUT = shows a difference\n'
                    'OR = gives a choice\n'
                    'BECAUSE = gives a reason\n'
                    'SO = shows a result',
              ),

              _section(
                icon: Icons.warning_amber_rounded,
                title: 'Common Mistakes',
                content:
                    'Remember to use the conjunction that matches the meaning of the sentence.\n\n'
                    'Wrong: I was hungry but I ate food.\n'
                    'Better: I was hungry, so I ate food.\n\n'
                    'Wrong: Do you want tea because coffee?\n'
                    'Better: Do you want tea or coffee?',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ConjunctionsPracticePage(),
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

  Widget _headerCard() {
    return Card(
      elevation: 3,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            Icon(
              Icons.link_rounded,
              size: 52,
            ),
            SizedBox(height: 10),
            Text(
              'Conjunctions',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Learn words that join ideas together.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required IconData icon,
    required String title,
    required String content,
  }) {
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

  Widget _exampleCard(String title, List<String> examples) {
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
            ...examples.map(
              (example) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        example,
                        style: const TextStyle(
                          fontSize: 15,
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
}