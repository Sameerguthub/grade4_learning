import 'package:flutter/material.dart';
import 'vocabulary_practice.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
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
                'What is Vocabulary?',
                'Vocabulary means the collection of words that a person knows and uses. '
                    'A strong vocabulary helps us speak, read and write better.',
              ),

              _section(
                Icons.auto_awesome_rounded,
                'Why is Vocabulary Important?',
                'Learning new words helps us understand stories and lessons. '
                    'It also helps us express our thoughts clearly and choose the right words.',
              ),

              _wordCard(
                'Words About Feelings',
                [
                  'Happy — feeling good or joyful',
                  'Sad — feeling unhappy',
                  'Angry — feeling upset',
                  'Excited — feeling very happy about something',
                  'Nervous — worried or afraid about something',
                  'Proud — feeling pleased about something you have done',
                ],
              ),

              _wordCard(
                'Words About People',
                [
                  'Brave — someone who is not easily afraid',
                  'Honest — someone who tells the truth',
                  'Kind — someone who cares about others',
                  'Polite — someone who behaves respectfully',
                  'Helpful — someone who likes to help others',
                  'Clever — someone who learns and understands quickly',
                ],
              ),

              _wordCard(
                'Words About Actions',
                [
                  'Observe — to watch carefully',
                  'Protect — to keep someone or something safe',
                  'Discover — to find something for the first time',
                  'Create — to make something new',
                  'Explore — to travel around or learn about something',
                  'Prepare — to get ready for something',
                ],
              ),

              _section(
                Icons.translate_rounded,
                'Using New Words',
                'Do not only memorize a new word. Try to use it in a sentence.\n\n'
                    'Word: Curious\n'
                    'Meaning: Wanting to know or learn something.\n'
                    'Sentence: The curious child asked many questions.',
              ),

              _wordCard(
                'Useful Everyday Words',
                [
                  'Ancient — very old',
                  'Huge — very large',
                  'Tiny — very small',
                  'Rapid — very fast',
                  'Silent — without sound',
                  'Difficult — not easy',
                  'Famous — known by many people',
                  'Dangerous — able to cause harm',
                ],
              ),

              _section(
                Icons.lightbulb_outline_rounded,
                'How to Learn New Words',
                '1. Read books and stories regularly.\n'
                    '2. Notice unfamiliar words.\n'
                    '3. Find out their meanings.\n'
                    '4. Say the word aloud.\n'
                    '5. Make your own sentence.\n'
                    '6. Try to use the word again later.',
              ),

              _section(
                Icons.school_rounded,
                'Word in Context',
                'The meaning of a word can sometimes be understood from the words around it.\n\n'
                    'Example:\n'
                    'The enormous elephant walked slowly.\n\n'
                    'The word "enormous" means very large because an elephant is being described.',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VocabularyPracticePage(),
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
              'Vocabulary',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Learn new words and use them correctly.',
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

  Widget _wordCard(String title, List<String> words) {
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...words.map(
              (word) => Padding(
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
                        word,
                        style: const TextStyle(
                          fontSize: 15.5,
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