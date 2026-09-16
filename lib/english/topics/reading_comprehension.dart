import 'package:flutter/material.dart';
import 'reading_comprehension_practice.dart';

class ReadingComprehensionPage extends StatelessWidget {
  const ReadingComprehensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading Comprehension'),
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
                Icons.menu_book_rounded,
                'What is Reading Comprehension?',
                'Reading comprehension means reading a passage carefully and understanding '
                    'what it says. After reading, we answer questions using information from the passage.',
              ),

              _section(
                Icons.visibility_rounded,
                'Step 1: Read Carefully',
                'Read the passage slowly. Do not rush. Try to understand who, what, where, '
                    'when and why something happens.',
              ),

              _section(
                Icons.search_rounded,
                'Step 2: Find Important Information',
                'Look for important details such as names, places, dates, actions, problems '
                    'and events. These details can help you answer questions.',
              ),

              _section(
                Icons.help_outline_rounded,
                'Step 3: Understand the Question',
                'Read the question carefully. Look at words such as who, what, where, when, '
                    'why and how.',
              ),

              _questionGuide(),

              _section(
                Icons.fact_check_rounded,
                'Step 4: Find Evidence',
                'Go back to the passage and find the part that helps you answer the question. '
                    'Do not simply guess.',
              ),

              _section(
                Icons.psychology_rounded,
                'Step 5: Think About Meaning',
                'Sometimes the answer is not written exactly in the passage. You may need to '
                    'use clues from the passage and think about what they mean.',
              ),

              _section(
                Icons.edit_note_rounded,
                'Step 6: Answer Clearly',
                'Write a complete and clear answer whenever possible. Use words from the passage '
                    'to help you form your answer.',
              ),

              _passageExample(),

              _section(
                Icons.lightbulb_outline_rounded,
                'Useful Tips',
                '• Read the title first.\n'
                    '• Read the passage at least once completely.\n'
                    '• Do not skip the question carefully.\n'
                    '• Search the passage for clues.\n'
                    '• Check your answer before submitting.\n'
                    '• Make sure your answer actually answers the question.',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ReadingComprehensionPracticePage(),
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
              Icons.menu_book_rounded,
              size: 52,
            ),
            SizedBox(height: 10),
            Text(
              'Reading Comprehension',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              'Read carefully, understand the passage and answer questions.',
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

  Widget _questionGuide() {
    final items = [
      ['WHO?', 'Find the person or people.'],
      ['WHAT?', 'Find the action, thing or event.'],
      ['WHERE?', 'Find the place.'],
      ['WHEN?', 'Find the time or date.'],
      ['WHY?', 'Find the reason.'],
      ['HOW?', 'Find the way something happened.'],
    ];

    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Question Words',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 65,
                      child: Text(
                        item[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(child: Text(item[1])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passageExample() {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mini Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Aarav woke up early on Sunday morning. He packed his bag '
              'and went to the park with his father. They walked around '
              'the park and watched birds sitting on the trees.',
              style: TextStyle(
                fontSize: 15.5,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Question: When did Aarav go to the park?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Answer: He went to the park on Sunday morning.',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}