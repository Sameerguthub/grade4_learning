
import 'package:flutter/material.dart';
import 'nouns_practice.dart';

class NounsPage extends StatelessWidget {
  const NounsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Nouns',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCard(),
              const SizedBox(height: 18),

              _sectionTitle(
                icon: Icons.lightbulb_rounded,
                title: 'What is a Noun?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'A noun is a word that names a person, place, animal, or thing.',
                Icons.menu_book_rounded,
              ),

              const SizedBox(height: 18),

              _sectionTitle(
                icon: Icons.category_rounded,
                title: 'Four Things Nouns Can Name',
              ),
              const SizedBox(height: 10),

              _nounTypeCard(
                icon: Icons.person_rounded,
                title: 'Person',
                examples: 'boy, teacher, doctor, Riya',
                description: 'A noun can name a person.',
              ),

              _nounTypeCard(
                icon: Icons.location_on_rounded,
                title: 'Place',
                examples: 'school, Mumbai, park, India',
                description: 'A noun can name a place.',
              ),

              _nounTypeCard(
                icon: Icons.pets_rounded,
                title: 'Animal',
                examples: 'dog, cat, lion, elephant',
                description: 'A noun can name an animal.',
              ),

              _nounTypeCard(
                icon: Icons.inventory_2_rounded,
                title: 'Thing',
                examples: 'book, pencil, table, bicycle',
                description: 'A noun can name a thing.',
              ),

              const SizedBox(height: 18),

              _sectionTitle(
                icon: Icons.compare_arrows_rounded,
                title: 'Common and Proper Nouns',
              ),
              const SizedBox(height: 10),

              _comparisonCard(),

              const SizedBox(height: 18),

              _sectionTitle(
                icon: Icons.search_rounded,
                title: 'Find the Noun',
              ),
              const SizedBox(height: 10),

              _exampleCard(
                sentence: 'The dog is playing in the garden.',
                explanation: 'The nouns are dog and garden.',
              ),

              _exampleCard(
                sentence: 'Rohan has a red bicycle.',
                explanation: 'The nouns are Rohan and bicycle.',
              ),

              _exampleCard(
                sentence: 'The teacher opened the book.',
                explanation: 'The nouns are teacher and book.',
              ),

              const SizedBox(height: 18),

              _sectionTitle(
                icon: Icons.rule_rounded,
                title: 'Remember',
              ),
              const SizedBox(height: 10),

              _rememberCard(),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NounsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Nouns Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 3,
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

  Widget _headerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3F51B5),
            Color(0xFF5C6BC0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.text_fields_rounded,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Nouns',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Words that name people, places, animals and things.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle({
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.indigo,
          size: 25,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202124),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String text, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.indigo.withOpacity(0.15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.indigo,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nounTypeCard({
    required IconData icon,
    required String title,
    required String examples,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: Colors.indigo,
              size: 27,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
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
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  examples,
                  style: const TextStyle(
                    color: Colors.indigo,
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

  Widget _comparisonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.indigo.withOpacity(0.12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _comparisonColumn(
                  title: 'Common Noun',
                  examples: 'city\nboy\ncountry\nschool',
                  icon: Icons.public_rounded,
                ),
              ),
              Container(
                width: 1,
                height: 145,
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: _comparisonColumn(
                  title: 'Proper Noun',
                  examples: 'Mumbai\nRohan\nIndia\nOxford School',
                  icon: Icons.star_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.07),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'A proper noun is the special name of a particular person, place, animal or thing. It begins with a capital letter.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _comparisonColumn({
    required String title,
    required String examples,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.indigo,
            size: 30,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            examples,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleCard({
    required String sentence,
    required String explanation,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote_rounded,
            color: Colors.indigo,
            size: 25,
          ),
          const SizedBox(height: 6),
          Text(
            sentence,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
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

  Widget _rememberCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.amber.shade200,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Noun = Naming Word',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Person → teacher\n'
            'Place → school\n'
            'Animal → tiger\n'
            'Thing → pencil',
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
