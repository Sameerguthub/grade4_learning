import 'package:flutter/material.dart';
import 'tenses_practice.dart';

class TensesPage extends StatelessWidget {
  const TensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenses'),
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
                Icons.access_time_rounded,
                'What is a Tense?',
                'A tense tells us when an action happens. '
                    'It can tell us whether something happens now, happened before, '
                    'or will happen later.',
              ),

              _tenseCard(
                '1. Simple Present Tense',
                'We use the simple present tense for things that happen regularly, '
                    'habits, facts, and things that are generally true.',
                [
                  'I go to school every day.',
                  'She plays tennis on Sundays.',
                  'The sun rises in the east.',
                ],
                'Common words: every day, usually, always, often, sometimes',
              ),

              _tenseCard(
                '2. Present Continuous Tense',
                'We use the present continuous tense for an action that is happening now.',
                [
                  'I am reading a book.',
                  'She is eating lunch.',
                  'They are playing football.',
                ],
                'Common words: now, at the moment, right now',
              ),

              _tenseCard(
                '3. Simple Past Tense',
                'We use the simple past tense for an action that happened and finished in the past.',
                [
                  'I visited Delhi last year.',
                  'She watched a movie yesterday.',
                  'They played cricket on Sunday.',
                ],
                'Common words: yesterday, last week, last year, ago',
              ),

              _tenseCard(
                '4. Past Continuous Tense',
                'We use the past continuous tense for an action that was happening at a particular time in the past.',
                [
                  'I was reading at 8 o’clock.',
                  'She was cooking dinner.',
                  'They were playing outside.',
                ],
                'Common words: while, at that time, at 5 o’clock yesterday',
              ),

              _tenseCard(
                '5. Simple Future Tense',
                'We use the simple future tense for actions that will happen later.',
                [
                  'I will visit my grandmother tomorrow.',
                  'She will help you.',
                  'We will play tomorrow.',
                ],
                'Common words: tomorrow, next week, next year, soon',
              ),

              _section(
                Icons.compare_arrows_rounded,
                'Compare the Tenses',
                'Present: I play football.\n'
                    'Present Continuous: I am playing football.\n'
                    'Past: I played football.\n'
                    'Past Continuous: I was playing football.\n'
                    'Future: I will play football.',
              ),

              _section(
                Icons.lightbulb_outline_rounded,
                'Easy Way to Remember',
                'PRESENT = happening regularly or now\n'
                    'PAST = already happened\n'
                    'FUTURE = will happen later',
              ),

              _section(
                Icons.warning_amber_rounded,
                'Common Mistakes',
                'Remember that the verb should match the tense.\n\n'
                    'Wrong: Yesterday I play cricket.\n'
                    'Correct: Yesterday I played cricket.\n\n'
                    'Wrong: Look! The baby sleeps now.\n'
                    'Correct: Look! The baby is sleeping now.',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TensesPracticePage(),
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
              Icons.access_time_rounded,
              size: 52,
            ),
            SizedBox(height: 10),
            Text(
              'Tenses',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Learn when an action happens.',
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

  Widget _tenseCard(
    String title,
    String explanation,
    List<String> examples,
    String clue,
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
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              explanation,
              style: const TextStyle(
                fontSize: 15.5,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Examples:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            ...examples.map(
              (example) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
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
            const SizedBox(height: 10),
            Text(
              clue,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}