import 'package:flutter/material.dart';
import 'articles_practice.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F1),
      appBar: AppBar(
        title: const Text(
          'Articles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
                'What are Articles?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'Articles are small words that come before nouns. '
                'In English, the three articles are A, AN and THE.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.abc_rounded,
                'The Three Articles',
              ),
              const SizedBox(height: 10),

              _articleCard(
                'A',
                'Use "a" before a singular noun that begins with a consonant sound.',
                'a boy • a book • a cat • a school',
                Icons.looks_one_rounded,
              ),

              _articleCard(
                'AN',
                'Use "an" before a singular noun that begins with a vowel sound.',
                'an apple • an elephant • an orange • an umbrella',
                Icons.looks_two_rounded,
              ),

              _articleCard(
                'THE',
                'Use "the" when talking about a particular or specific person, place, animal or thing.',
                'the sun • the moon • the book on the table',
                Icons.looks_3_rounded,
              ),

              const SizedBox(height: 20),

              _title(
                Icons.record_voice_over_rounded,
                'A or AN?',
              ),
              const SizedBox(height: 10),

              _aAnCard(),

              const SizedBox(height: 20),

              _title(
                Icons.volume_up_rounded,
                'Remember: Sound Matters',
              ),
              const SizedBox(height: 10),

              _soundCard(),

              const SizedBox(height: 20),

              _title(
                Icons.compare_arrows_rounded,
                'A, AN and THE',
              ),
              const SizedBox(height: 10),

              _comparisonCard(),

              const SizedBox(height: 20),

              _title(
                Icons.search_rounded,
                'Articles in Sentences',
              ),
              const SizedBox(height: 10),

              _sentenceCard(
                'I saw a dog in the park.',
                'A is used because we are talking about one dog, not a specific dog.',
              ),

              _sentenceCard(
                'She ate an apple.',
                'An is used before apple because apple begins with a vowel sound.',
              ),

              _sentenceCard(
                'The dog was very friendly.',
                'The is used because we now know which dog we are talking about.',
              ),

              _sentenceCard(
                'The sun rises in the east.',
                'The is used for something unique or specific.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.warning_amber_rounded,
                'Common Mistakes',
              ),
              const SizedBox(height: 10),

              _mistakeCard(
                'a apple',
                'an apple',
              ),

              _mistakeCard(
                'an book',
                'a book',
              ),

              _mistakeCard(
                'a orange',
                'an orange',
              ),

              _mistakeCard(
                'an car',
                'a car',
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
                        builder: (_) => const ArticlesPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Articles Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
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
            Color(0xFF6A1B9A),
            Color(0xFFAB47BC),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.article_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Articles',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn when to use A, AN and THE before nouns.',
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
          color: Colors.purple,
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
          color: Colors.purple.withOpacity(0.13),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.purple,
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

  Widget _articleCard(
    String article,
    String explanation,
    String examples,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: Colors.purple,
              size: 29,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article,
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  explanation,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  examples,
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
  }

  Widget _aAnCard() {
    final examples = [
      ['a', 'a ball'],
      ['a', 'a teacher'],
      ['a', 'a university'],
      ['an', 'an apple'],
      ['an', 'an elephant'],
      ['an', 'an hour'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: examples.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                Container(
                  width: 55,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    e[0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    e[1],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _soundCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Usually:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'A → before a consonant sound\n'
            'a car • a dog • a pencil',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'AN → before a vowel sound',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'an apple • an egg • an orange',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Important:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'We choose A or AN based on the sound, not simply the first letter.',
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _comparisonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _comparisonRow(
            'A',
            'a cat',
            'one non-specific cat',
          ),
          const Divider(),
          _comparisonRow(
            'AN',
            'an apple',
            'one non-specific apple',
          ),
          const Divider(),
          _comparisonRow(
            'THE',
            'the cat',
            'a particular cat',
          ),
        ],
      ),
    );
  }

  Widget _comparisonRow(
    String article,
    String example,
    String meaning,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 55,
            child: Text(
              article,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  example,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  meaning,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sentenceCard(
    String sentence,
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
            explanation,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mistakeCard(String wrong, String correct) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              wrong,
              style: const TextStyle(
                color: Colors.red,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 20,
          ),
          Expanded(
            child: Text(
              correct,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
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
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Rule',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'A → one, before a consonant sound\n'
            'AN → one, before a vowel sound\n'
            'THE → a particular or specific noun',
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