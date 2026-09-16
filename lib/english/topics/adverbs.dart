import 'package:flutter/material.dart';
import 'adverbs_practice.dart';

class AdverbsPage extends StatelessWidget {
  const AdverbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF),
      appBar: AppBar(
        title: const Text(
          'Adverbs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                'What is an Adverb?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'An adverb is a word that gives us more information '
                'about a verb, an adjective, or sometimes another adverb. '
                'Adverbs can tell us how, when, where, or how often something happens.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.directions_run_rounded,
                'Adverbs Tell Us How',
              ),
              const SizedBox(height: 10),

              _howCard(),

              const SizedBox(height: 20),

              _title(
                Icons.access_time_rounded,
                'Adverbs Tell Us When',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.access_time_rounded,
                'When',
                [
                  'today',
                  'yesterday',
                  'tomorrow',
                  'now',
                  'soon',
                  'later',
                ],
                'We will visit Grandma tomorrow.',
              ),

              const SizedBox(height: 14),

              _title(
                Icons.place_rounded,
                'Adverbs Tell Us Where',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.place_rounded,
                'Where',
                [
                  'here',
                  'there',
                  'outside',
                  'inside',
                  'everywhere',
                  'away',
                ],
                'The children are playing outside.',
              ),

              const SizedBox(height: 14),

              _title(
                Icons.repeat_rounded,
                'Adverbs Tell Us How Often',
              ),
              const SizedBox(height: 10),

              _categoryCard(
                Icons.repeat_rounded,
                'Frequency',
                [
                  'always',
                  'usually',
                  'often',
                  'sometimes',
                  'rarely',
                  'never',
                ],
                'I always brush my teeth.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.compare_arrows_rounded,
                'Adjective vs Adverb',
              ),
              const SizedBox(height: 10),

              _adjectiveAdverbCard(),

              const SizedBox(height: 20),

              _title(
                Icons.search_rounded,
                'Find the Adverb',
              ),
              const SizedBox(height: 10),

              _findCard(
                'The boy runs quickly.',
                'Adverb: quickly',
                'Quickly tells us how the boy runs.',
              ),

              _findCard(
                'She arrived yesterday.',
                'Adverb: yesterday',
                'Yesterday tells us when she arrived.',
              ),

              _findCard(
                'The children are playing outside.',
                'Adverb: outside',
                'Outside tells us where they are playing.',
              ),

              _findCard(
                'He always helps his mother.',
                'Adverb: always',
                'Always tells us how often he helps.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.question_mark_rounded,
                'Questions Adverbs Answer',
              ),
              const SizedBox(height: 10),

              _questionCard(
                'How?',
                'She sings beautifully.',
                'Beautifully tells us how she sings.',
              ),

              _questionCard(
                'When?',
                'He came yesterday.',
                'Yesterday tells us when he came.',
              ),

              _questionCard(
                'Where?',
                'They are playing outside.',
                'Outside tells us where they are playing.',
              ),

              _questionCard(
                'How often?',
                'I often read books.',
                'Often tells us how frequently I read.',
              ),

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
                        builder: (_) => const AdverbsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Adverbs Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
            Color(0xFF1565C0),
            Color(0xFF42A5F5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.speed_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Adverbs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn words that tell us how, when, where and how often.',
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
          color: Colors.blue,
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
          color: Colors.blue.withOpacity(0.13),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.blue,
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

  Widget _howCard() {
    final examples = [
      ['quickly', 'The boy runs quickly.'],
      ['slowly', 'The turtle walks slowly.'],
      ['carefully', 'She writes carefully.'],
      ['loudly', 'They laughed loudly.'],
      ['quietly', 'The baby slept quietly.'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: examples.map((e) {
          return Container(
            margin: const EdgeInsets.only(bottom: 9),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.blue,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e[0],
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e[1],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
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
                color: Colors.blue,
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
                  horizontal: 11,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  word,
                  style: const TextStyle(
                    color: Colors.blue,
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

  Widget _adjectiveAdverbCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _comparison(
            'Adjective',
            'a quick runner',
            'Describes a noun',
          ),
          const Divider(height: 24),
          _comparison(
            'Adverb',
            'runs quickly',
            'Describes how an action happens',
          ),
        ],
      ),
    );
  }

  Widget _comparison(
    String title,
    String example,
    String explanation,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                example,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                explanation,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _findCard(
    String sentence,
    String answer,
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
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            explanation,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
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
              color: Colors.blue,
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

  Widget _rememberCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Adverb = Gives More Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'How? → quickly, slowly, carefully\n'
            'When? → today, yesterday, soon\n'
            'Where? → here, there, outside\n'
            'How often? → always, often, never',
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