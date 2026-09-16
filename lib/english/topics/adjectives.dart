import 'package:flutter/material.dart';
import 'adjectives_practice.dart';

class AdjectivesPage extends StatelessWidget {
  const AdjectivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),
      appBar: AppBar(
        title: const Text(
          'Adjectives',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heroCard(),
              const SizedBox(height: 20),

              _title(
                Icons.lightbulb_rounded,
                'What is an Adjective?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'An adjective is a describing word. It tells us more '
                'about a noun or pronoun. It can tell us about size, '
                'colour, shape, number, quality, or other qualities.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.description_rounded,
                'Adjectives Describe Nouns',
              ),
              const SizedBox(height: 10),

              _descriptionExamples(),

              const SizedBox(height: 20),

              _title(
                Icons.palette_rounded,
                'Adjectives of Colour',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.palette_rounded,
                'Colour',
                [
                  'red',
                  'blue',
                  'green',
                  'yellow',
                  'black',
                  'white',
                ],
                'The blue sky looks beautiful.',
              ),

              const SizedBox(height: 12),

              _title(
                Icons.straighten_rounded,
                'Adjectives of Size',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.straighten_rounded,
                'Size',
                [
                  'big',
                  'small',
                  'large',
                  'tiny',
                  'tall',
                  'short',
                ],
                'The elephant is a large animal.',
              ),

              const SizedBox(height: 12),

              _title(
                Icons.star_rounded,
                'Adjectives of Quality',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.star_rounded,
                'Quality',
                [
                  'good',
                  'bad',
                  'beautiful',
                  'clever',
                  'kind',
                  'brave',
                ],
                'Riya is a clever student.',
              ),

              const SizedBox(height: 12),

              _title(
                Icons.numbers_rounded,
                'Adjectives of Number',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.numbers_rounded,
                'Number',
                [
                  'one',
                  'two',
                  'three',
                  'many',
                  'few',
                  'several',
                ],
                'I have three pencils.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.question_mark_rounded,
                'Which Questions Do Adjectives Answer?',
              ),
              const SizedBox(height: 10),

              _questionCard(
                'What kind?',
                'a beautiful flower',
                'Beautiful tells us what kind of flower.',
              ),

              _questionCard(
                'Which one?',
                'that book',
                'That tells us which book.',
              ),

              _questionCard(
                'How many?',
                'five apples',
                'Five tells us how many apples.',
              ),

              _questionCard(
                'How much?',
                'some water',
                'Some tells us the amount of water.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.search_rounded,
                'Find the Adjective',
              ),
              const SizedBox(height: 10),

              _findCard(
                'The red car is fast.',
                'Adjective: red',
              ),

              _findCard(
                'She has a beautiful dress.',
                'Adjective: beautiful',
              ),

              _findCard(
                'There are five birds.',
                'Adjective: five',
              ),

              _findCard(
                'The little boy is happy.',
                'Adjectives: little, happy',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.compare_arrows_rounded,
                'Adjective Changes the Meaning',
              ),
              const SizedBox(height: 10),

              _comparisonCard(),

              const SizedBox(height: 20),

              _title(Icons.rule_rounded, 'Remember'),
              const SizedBox(height: 10),

              _rememberCard(),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AdjectivesPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Adjectives Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE64A19),
            Color(0xFFFF7043),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Adjectives',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn words that describe people, animals, places and things.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.deepOrange,
          size: 26,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: Colors.deepOrange.withOpacity(0.13),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.deepOrange,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionExamples() {
    final examples = [
      ['a car', 'a red car', 'red describes the car'],
      ['a house', 'a large house', 'large describes the house'],
      ['a girl', 'a clever girl', 'clever describes the girl'],
      ['a flower', 'a beautiful flower', 'beautiful describes the flower'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: examples.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e[0],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        e[1],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        e[2],
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _categoryCard(
    IconData icon,
    String title,
    List<String> words,
    String example,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.deepOrange,
                size: 28,
              ),
              const SizedBox(width: 9),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: words.map((word) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  word,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Text(
            example,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _questionCard(
    String question,
    String example,
    String explanation,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            example,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            explanation,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _findCard(String sentence, String answer) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sentence,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _comparisonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        children: [
          _ComparisonRow(
            noun: 'House',
            adjective: 'small',
            sentence: 'a small house',
          ),
          Divider(),
          _ComparisonRow(
            noun: 'House',
            adjective: 'large',
            sentence: 'a large house',
          ),
          Divider(),
          _ComparisonRow(
            noun: 'Flower',
            adjective: 'beautiful',
            sentence: 'a beautiful flower',
          ),
        ],
      ),
    );
  }

  Widget _rememberCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adjective = Describing Word',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Colour → red, blue\n'
            'Size → big, small\n'
            'Quality → kind, clever\n'
            'Number → one, five, many\n'
            'Shape → round, square',
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonRow extends StatelessWidget {
  final String noun;
  final String adjective;
  final String sentence;

  const _ComparisonRow({
    required this.noun,
    required this.adjective,
    required this.sentence,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            noun,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(
          Icons.add_rounded,
          size: 20,
          color: Colors.deepOrange,
        ),
        Expanded(
          child: Text(
            adjective,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_rounded,
          size: 20,
        ),
        Expanded(
          child: Text(
            sentence,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}