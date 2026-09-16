import 'package:flutter/material.dart';
import 'verbs_practice.dart';

class VerbsPage extends StatelessWidget {
  const VerbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      appBar: AppBar(
        title: const Text(
          'Verbs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
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

              _title(Icons.lightbulb_rounded, 'What is a Verb?'),
              const SizedBox(height: 10),

              _infoCard(
                'A verb is an action word or a word that tells us '
                'about a state or condition. Verbs tell us what someone '
                'or something does, is, or can do.',
              ),

              const SizedBox(height: 20),

              _title(Icons.directions_run_rounded, 'Action Verbs'),
              const SizedBox(height: 10),

              _actionGrid(),

              const SizedBox(height: 20),

              _title(Icons.search_rounded, 'Find the Verb'),
              const SizedBox(height: 10),

              _sentenceCard(
                'The boy runs quickly.',
                'Verb: runs',
              ),

              _sentenceCard(
                'She reads a book.',
                'Verb: reads',
              ),

              _sentenceCard(
                'The birds fly in the sky.',
                'Verb: fly',
              ),

              _sentenceCard(
                'We play football.',
                'Verb: play',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.change_circle_rounded,
                'Verbs Can Change',
              ),
              const SizedBox(height: 10),

              _changeCard(),

              const SizedBox(height: 20),

              _title(
                Icons.access_time_rounded,
                'Verb and Time',
              ),
              const SizedBox(height: 10),

              _tenseCard(
                'Present',
                'I play cricket.',
                'The action happens now or regularly.',
                Icons.today_rounded,
              ),

              _tenseCard(
                'Past',
                'I played cricket.',
                'The action already happened.',
                Icons.history_rounded,
              ),

              _tenseCard(
                'Future',
                'I will play cricket.',
                'The action will happen later.',
                Icons.event_rounded,
              ),

              const SizedBox(height: 20),

              _title(
                Icons.build_circle_rounded,
                'Helping Verbs',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'Helping verbs work with other verbs. Common helping '
                'verbs include am, is, are, was, were, has, have, had, '
                'will and can.',
              ),

              const SizedBox(height: 10),

              _helpingExample(
                'She is reading a book.',
                'is + reading',
              ),

              _helpingExample(
                'They are playing football.',
                'are + playing',
              ),

              _helpingExample(
                'I can swim.',
                'can + swim',
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
                        builder: (_) => const VerbsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Verbs Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
            Color(0xFF00796B),
            Color(0xFF26A69A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.directions_run_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Verbs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn action words and discover how verbs change with time.',
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
          color: Colors.teal,
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
          color: Colors.teal.withOpacity(0.12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_rounded,
            color: Colors.teal,
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

  Widget _actionGrid() {
    final actions = [
      ['Run', Icons.directions_run_rounded],
      ['Jump', Icons.arrow_upward_rounded],
      ['Read', Icons.menu_book_rounded],
      ['Write', Icons.edit_rounded],
      ['Sing', Icons.music_note_rounded],
      ['Eat', Icons.restaurant_rounded],
      ['Sleep', Icons.bedtime_rounded],
      ['Swim', Icons.pool_rounded],
      ['Climb', Icons.trending_up_rounded],
      ['Laugh', Icons.sentiment_satisfied_rounded],
      ['Draw', Icons.brush_rounded],
      ['Dance', Icons.accessibility_new_rounded],
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.15,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                actions[index][1] as IconData,
                color: Colors.teal,
                size: 27,
              ),
              const SizedBox(width: 8),
              Text(
                actions[index][0] as String,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sentenceCard(String sentence, String answer) {
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
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeCard() {
    final examples = [
      ['play', 'plays', 'played'],
      ['walk', 'walks', 'walked'],
      ['jump', 'jumps', 'jumped'],
      ['look', 'looks', 'looked'],
      ['help', 'helps', 'helped'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Base',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'He/She',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  'Past',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(),
          ...examples.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      e[0],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      e[1],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      e[2],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tenseCard(
    String title,
    String example,
    String explanation,
    IconData icon,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.teal,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  example,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  explanation,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _helpingExample(String sentence, String parts) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.teal,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sentence,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  parts,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Verb = Action or State Word',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Run → action\n'
            'Read → action\n'
            'Write → action\n'
            'Is → state\n'
            'Can → ability',
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