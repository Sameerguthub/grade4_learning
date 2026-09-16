import 'package:flutter/material.dart';
import 'pronouns_practice.dart';

class PronounsPage extends StatelessWidget {
  const PronounsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Pronouns',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
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

              _sectionTitle(
                Icons.lightbulb_rounded,
                'What is a Pronoun?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'A pronoun is a word used instead of a noun. '
                'Pronouns help us avoid repeating the same noun again and again.',
              ),

              const SizedBox(height: 18),

              _sectionTitle(
                Icons.swap_horiz_rounded,
                'Why Do We Use Pronouns?',
              ),
              const SizedBox(height: 10),

              _exampleCard(
                before: 'Riya is a student. Riya likes reading. Riya has many books.',
                after: 'Riya is a student. She likes reading. She has many books.',
                explanation: 'The pronoun "she" replaces the noun "Riya".',
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                Icons.people_rounded,
                'Personal Pronouns',
              ),
              const SizedBox(height: 10),

              _pronounTable(),

              const SizedBox(height: 20),

              _sectionTitle(
                Icons.person_outline_rounded,
                'Pronouns for People',
              ),
              const SizedBox(height: 10),

              _pronounCard(
                'I',
                'Used when we talk about ourselves.',
                'I am going to school.',
              ),

              _pronounCard(
                'You',
                'Used when talking to one or more people.',
                'You are my friend.',
              ),

              _pronounCard(
                'He',
                'Used for a male person.',
                'Rahul is kind. He helps me.',
              ),

              _pronounCard(
                'She',
                'Used for a female person.',
                'Riya is happy. She is smiling.',
              ),

              _pronounCard(
                'It',
                'Usually used for an animal, object or thing.',
                'The dog is hungry. It wants food.',
              ),

              _pronounCard(
                'We',
                'Used when talking about ourselves with others.',
                'We are going to the park.',
              ),

              _pronounCard(
                'They',
                'Used for two or more people, animals or things.',
                'The children are playing. They are happy.',
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                Icons.format_list_numbered_rounded,
                'Singular and Plural Pronouns',
              ),
              const SizedBox(height: 10),

              _singularPluralCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                Icons.search_rounded,
                'Find the Pronoun',
              ),
              const SizedBox(height: 10),

              _findCard(
                'Aman is my brother. He is ten years old.',
                'Pronoun: He',
              ),

              _findCard(
                'Sara and I are friends. We play together.',
                'Pronoun: We',
              ),

              _findCard(
                'The birds are flying. They are in the sky.',
                'Pronoun: They',
              ),

              _findCard(
                'This is my new bicycle. It is blue.',
                'Pronoun: It',
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                Icons.rule_rounded,
                'Remember',
              ),
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
                        builder: (_) => const PronounsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Pronouns Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
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
            Color(0xFF512DA8),
            Color(0xFF7E57C2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.person_pin_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Pronouns',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn words that take the place of nouns.',
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

  Widget _sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.deepPurple,
          size: 26,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            title,
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
          color: Colors.deepPurple.withOpacity(0.12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.deepPurple,
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

  Widget _exampleCard({
    required String before,
    required String after,
    required String explanation,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Without a pronoun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            before,
            style: const TextStyle(
              fontSize: 15,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'With a pronoun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            after,
            style: const TextStyle(
              fontSize: 15,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            explanation,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronounTable() {
    final rows = [
      ['I', 'myself / me'],
      ['You', 'you'],
      ['He', 'him'],
      ['She', 'her'],
      ['It', 'it'],
      ['We', 'us'],
      ['They', 'them'],
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(17),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Pronoun',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Example Form',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...rows.map(
            (row) => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      row[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(row[1]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronounCard(
    String pronoun,
    String meaning,
    String example,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.09),
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              pronoun,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meaning,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  example,
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

  Widget _singularPluralCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _pair('I', 'We'),
          _pair('He', 'They'),
          _pair('She', 'They'),
          _pair('It', 'They'),
          _pair('You', 'You'),
        ],
      ),
    );
  }

  Widget _pair(String singular, String plural) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              singular,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 20,
          ),
          Expanded(
            child: Text(
              plural,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
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
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
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
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noun → Pronoun',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Riya → She\n'
            'Rahul → He\n'
            'The dog → It\n'
            'Riya and Rahul → They\n'
            'Rahul and I → We',
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