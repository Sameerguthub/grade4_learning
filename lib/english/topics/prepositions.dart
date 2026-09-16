import 'package:flutter/material.dart';
import 'prepositions_practice.dart';

class PrepositionsPage extends StatelessWidget {
  const PrepositionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        title: const Text(
          'Prepositions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                'What is a Preposition?',
              ),
              const SizedBox(height: 10),

              _infoCard(
                'A preposition is a word that shows the relationship '
                'between a noun or pronoun and another word in a sentence. '
                'It can tell us about place, time, direction and position.',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.place_rounded,
                'Prepositions of Place',
              ),
              const SizedBox(height: 10),

              _placeCard(
                'IN',
                'inside something',
                'The books are in the bag.',
                Icons.inventory_2_rounded,
              ),

              _placeCard(
                'ON',
                'touching a surface',
                'The book is on the table.',
                Icons.layers_rounded,
              ),

              _placeCard(
                'UNDER',
                'below something',
                'The cat is under the chair.',
                Icons.keyboard_arrow_down_rounded,
              ),

              _placeCard(
                'ABOVE',
                'higher than something',
                'The fan is above my head.',
                Icons.keyboard_arrow_up_rounded,
              ),

              _placeCard(
                'BESIDE',
                'next to something',
                'The bag is beside the chair.',
                Icons.compare_arrows_rounded,
              ),

              _placeCard(
                'BETWEEN',
                'in the middle of two things',
                'The ball is between the boxes.',
                Icons.unfold_more_rounded,
              ),

              const SizedBox(height: 20),

              _title(
                Icons.access_time_rounded,
                'Prepositions of Time',
              ),
              const SizedBox(height: 10),

              _timeCard(),

              const SizedBox(height: 20),

              _title(
                Icons.navigation_rounded,
                'Prepositions of Direction',
              ),
              const SizedBox(height: 10),

              _directionCard(),

              const SizedBox(height: 20),

              _title(
                Icons.search_rounded,
                'Find the Preposition',
              ),
              const SizedBox(height: 10),

              _example(
                'The pencil is on the desk.',
                'Preposition: on',
              ),

              _example(
                'The puppy is under the table.',
                'Preposition: under',
              ),

              _example(
                'We went to school.',
                'Preposition: to',
              ),

              _example(
                'She came from Mumbai.',
                'Preposition: from',
              ),

              _example(
                'The ball is between the two boxes.',
                'Preposition: between',
              ),

              const SizedBox(height: 20),

              _title(
                Icons.compare_arrows_rounded,
                'Common Preposition Pairs',
              ),
              const SizedBox(height: 10),

              _pairCard(),

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
                        builder: (_) => const PrepositionsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Prepositions Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
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
            Color(0xFF2E7D32),
            Color(0xFF66BB6A),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_searching_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 12),
          Text(
            'Let’s Learn Prepositions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'Learn words that show place, time, direction and position.',
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
          color: Colors.green.shade700,
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
          color: Colors.green.withOpacity(0.13),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_rounded,
            color: Colors.green.shade700,
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

  Widget _placeCard(
    String word,
    String meaning,
    String example,
    IconData icon,
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
          Icon(
            icon,
            color: Colors.green.shade700,
            size: 29,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 17,
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

  Widget _timeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _timeRow(
            'AT',
            'exact time',
            'at 7 o’clock',
          ),
          const Divider(),
          _timeRow(
            'ON',
            'days and dates',
            'on Monday',
          ),
          const Divider(),
          _timeRow(
            'IN',
            'months, years and longer periods',
            'in July',
          ),
        ],
      ),
    );
  }

  Widget _timeRow(
    String word,
    String meaning,
    String example,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 48,
            child: Text(
              word,
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meaning,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  example,
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

  Widget _directionCard() {
    final items = [
      ['to', 'We went to school.'],
      ['from', 'She came from Delhi.'],
      ['into', 'The cat jumped into the box.'],
      ['out of', 'He walked out of the room.'],
      ['towards', 'They walked towards the park.'],
      ['through', 'We walked through the tunnel.'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: items.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.green.shade700,
                  size: 21,
                ),
                const SizedBox(width: 9),
                SizedBox(
                  width: 75,
                  child: Text(
                    e[0],
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    e[1],
                    style: const TextStyle(
                      fontSize: 14,
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

  Widget _example(String sentence, String answer) {
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
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pairCard() {
    final pairs = [
      ['in', 'out'],
      ['up', 'down'],
      ['before', 'after'],
      ['to', 'from'],
      ['above', 'below'],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: pairs.map((pair) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    pair[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.swap_horiz_rounded,
                  size: 21,
                ),
                Expanded(
                  child: Text(
                    pair[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
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

  Widget _rememberCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preposition = Relationship Word',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Place → in, on, under, beside\n'
            'Time → at, on, in\n'
            'Direction → to, from, into\n'
            'Position → above, below, between',
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