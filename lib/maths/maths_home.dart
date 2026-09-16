import 'package:flutter/material.dart';
import 'maths_topics.dart';

// ================================================================
// MATHS TOPIC PAGES
// ================================================================

import 'topics/numbers.dart';
import 'topics/addition.dart';
import 'topics/subtraction.dart';
import 'topics/multiplication.dart';
import 'topics/division.dart';
import 'topics/fractions.dart';
import 'topics/decimals.dart';
import 'topics/factors_multiples.dart';
import 'topics/geometry.dart';
import 'topics/measurement.dart';
import 'topics/time.dart';
import 'topics/money.dart';
import 'topics/data_handling.dart';
import 'topics/word_problems.dart';

class MathsHome extends StatelessWidget {
  const MathsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),
        title: const Text(
          'Maths',
          style: TextStyle(
            color: Color(0xFF20243A),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            20,
            8,
            20,
            70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =========================================================
              // HEADER
              // =========================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF575BEF),
                      Color(0xFF777AF4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.calculate_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's Learn Maths!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Choose a topic to start learning.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // =========================================================
              // TOPIC TITLE
              // =========================================================

              const Text(
                'Maths Topics',
                style: TextStyle(
                  color: Color(0xFF20243A),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Learn each topic step by step.',
                style: TextStyle(
                  color: Color(0xFF74788D),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              // =========================================================
              // TOPICS
              // =========================================================

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mathsTopics.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 12);
                },
                itemBuilder: (context, index) {
                  final topic = mathsTopics[index];

                  return _TopicCard(
                    number: index + 1,
                    topic: topic,
                    onTap: () {
                      _openTopic(context, index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // OPEN MATHS TOPIC
  // ================================================================

  void _openTopic(
    BuildContext context,
    int index,
  ) {
    Widget? page;

    switch (index) {
      // ------------------------------------------------------------
      // 1. NUMBERS
      // ------------------------------------------------------------

      case 0:
        page = NumbersPage();
        break;

      // ------------------------------------------------------------
      // 2. ADDITION
      // ------------------------------------------------------------

      case 1:
        page = AdditionPage();
        break;

      // ------------------------------------------------------------
      // 3. SUBTRACTION
      // ------------------------------------------------------------

      case 2:
        page = SubtractionPage();
        break;

      // ------------------------------------------------------------
      // 4. MULTIPLICATION
      // ------------------------------------------------------------

      case 3:
        page = MultiplicationPage();
        break;

      // ------------------------------------------------------------
      // 5. DIVISION
      // ------------------------------------------------------------

      case 4:
        page = DivisionPage();
        break;

      // ------------------------------------------------------------
      // 6. FRACTIONS
      // ------------------------------------------------------------

      case 5:
        page = FractionsPage();
        break;

      // ------------------------------------------------------------
      // 7. DECIMALS
      // ------------------------------------------------------------

      case 6:
        page = DecimalsPage();
        break;

      // ------------------------------------------------------------
      // 8. FACTORS & MULTIPLES
      // ------------------------------------------------------------

      case 7:
        page = FactorsMultiplesPage();
        break;

      // ------------------------------------------------------------
      // 9. GEOMETRY
      // ------------------------------------------------------------

      case 8:
        page = GeometryPage();
        break;

      // ------------------------------------------------------------
      // 10. MEASUREMENT
      // ------------------------------------------------------------

      case 9:
        page = MeasurementPage();
        break;

      // ------------------------------------------------------------
      // 11. TIME
      // ------------------------------------------------------------

      case 10:
        page = TimePage();
        break;

      // ------------------------------------------------------------
      // 12. MONEY
      // ------------------------------------------------------------

      case 11:
        page = MoneyPage();
        break;

      // ------------------------------------------------------------
      // 13. DATA HANDLING
      // ------------------------------------------------------------

      case 12:
        page = DataHandlingPage();
        break;

      // ------------------------------------------------------------
      // 14. WORD PROBLEMS
      // ------------------------------------------------------------

      case 13:
        page = WordProblemsPage();
        break;
    }

    if (page != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => page!,
        ),
      );
    }
  }
}

// =====================================================================
// TOPIC CARD
// =====================================================================

class _TopicCard extends StatelessWidget {
  final int number;
  final MathsTopic topic;
  final VoidCallback onTap;

  const _TopicCard({
    required this.number,
    required this.topic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [

              // =======================================================
              // NUMBER
              // =======================================================

              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF0FF),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: Color(0xFF5B5FEF),
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 13),

              // =======================================================
              // ICON
              // =======================================================

              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  topic.icon,
                  color: const Color(0xFF5B5FEF),
                  size: 25,
                ),
              ),

              const SizedBox(width: 13),

              // =======================================================
              // TEXT
              // =======================================================

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF20243A),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      topic.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF74788D),
                        fontSize: 12,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // =======================================================
              // ARROW
              // =======================================================

              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xFFB0B3C2),
                size: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}