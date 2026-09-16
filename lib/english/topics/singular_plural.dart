import 'package:flutter/material.dart';
import 'singular_plural_practice.dart';

class SingularPluralPage extends StatelessWidget {
  const SingularPluralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Singular & Plural'),
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
                Icons.looks_one_rounded,
                'What is Singular?',
                'A singular noun names one person, animal, place, thing, or idea.',
              ),

              _examples(
                'Singular Examples',
                [
                  'one boy',
                  'one girl',
                  'one book',
                  'one dog',
                  'one apple',
                  'one school',
                ],
              ),

              _section(
                Icons.looks_two_rounded,
                'What is Plural?',
                'A plural noun names more than one person, animal, place, thing, or idea.',
              ),

              _examples(
                'Plural Examples',
                [
                  'two boys',
                  'three girls',
                  'many books',
                  'two dogs',
                  'five apples',
                  'many schools',
                ],
              ),

              _section(
                Icons.add_rounded,
                'Adding -s',
                'For many nouns, we make the plural by adding -s.',
              ),

              _examples(
                'Examples',
                [
                  'book → books',
                  'pen → pens',
                  'cat → cats',
                  'car → cars',
                  'tree → trees',
                ],
              ),

              _section(
                Icons.edit_rounded,
                'Adding -es',
                'Nouns ending in s, x, ch, sh, or some words ending in o often take -es.',
              ),

              _examples(
                'Examples',
                [
                  'bus → buses',
                  'box → boxes',
                  'watch → watches',
                  'dish → dishes',
                  'tomato → tomatoes',
                ],
              ),

              _section(
                Icons.sync_alt_rounded,
                'Words Ending in Y',
                'For some nouns ending in a consonant + y, change y to i and add -es.',
              ),

              _examples(
                'Examples',
                [
                  'baby → babies',
                  'city → cities',
                  'story → stories',
                  'party → parties',
                ],
              ),

              _section(
                Icons.change_circle_rounded,
                'Irregular Plurals',
                'Some nouns do not follow the usual rules. Their plural forms change completely.',
              ),

              _examples(
                'Examples',
                [
                  'child → children',
                  'man → men',
                  'woman → women',
                  'foot → feet',
                  'tooth → teeth',
                  'mouse → mice',
                ],
              ),

              _section(
                Icons.warning_amber_rounded,
                'Common Mistakes',
                'Do not add -s to every noun.\n\n'
                    'Wrong: childs\n'
                    'Correct: children\n\n'
                    'Wrong: mans\n'
                    'Correct: men\n\n'
                    'Wrong: boxs\n'
                    'Correct: boxes',
              ),

              _section(
                Icons.lightbulb_outline_rounded,
                'Easy Trick',
                'SINGULAR = ONE\n'
                    'PLURAL = MORE THAN ONE\n\n'
                    'Always check the noun and choose the correct plural form.',
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SingularPluralPracticePage(),
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
              Icons.format_list_bulleted_rounded,
              size: 52,
            ),
            SizedBox(height: 10),
            Text(
              'Singular & Plural',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              'Learn how words change when we talk about one or more than one.',
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

  Widget _examples(String title, List<String> examples) {
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
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
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