import 'package:flutter/material.dart';
import '../evs/evs_home.dart';
import '../english/english_home.dart';
import '../maths/maths_home.dart';
import '../hindi/hindi_home.dart';
import 'subject_card.dart';
import '../general/general_home.dart';
import '../basic/basic_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =============================================================
              // HEADER
              // =============================================================

              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Learner!',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF20243A),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ready to learn something new?',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF74788D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Color(0xFF5B5FEF),
                      size: 27,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // =============================================================
              // STREAK CARD
              // =============================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF575BEF),
                      Color(0xFF777AF4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.18),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 Day Streak!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Keep learning every day',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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

              // =============================================================
              // SUBJECT TITLE
              // =============================================================

              const Text(
                'Choose a Subject',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF20243A),
                ),
              ),

              const SizedBox(height: 13),

              // =============================================================
              // SUBJECT CARDS
              // =============================================================
// =============================================================
// SUBJECT CARDS
// =============================================================

// ROW 1
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: SubjectCard(
        title: 'Maths',
        subtitle: 'Numbers & more',
        icon: Icons.calculate_rounded,
        color: const Color(0xFF5B5FEF),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MathsHome(),
            ),
          );
        },
      ),
    ),

    const SizedBox(width: 13),

    Expanded(
      child: SubjectCard(
        title: 'English',
        subtitle: 'Grammar & words',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFFFF8A4C),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const EnglishHomePage(),
            ),
          );
        },
      ),
    ),
  ],
),

const SizedBox(height: 13),

// ROW 2
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: SubjectCard(
        title: 'Hindi',
        subtitle: 'हिंदी सीखें',
        icon: Icons.translate_rounded,
        color: const Color(0xFF22B573),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const HindiHomePage(),
            ),
          );
        },
      ),
    ),
    const SizedBox(width: 13),

    Expanded(
      child: SubjectCard(
        title: 'EVS',
        subtitle: 'Our world',
        icon: Icons.eco_rounded,
        color: const Color(0xFF36A9E1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const EvsHomePage(),
            ),
          );
        },
      ),
    ),
  ],
),

const SizedBox(height: 13),

// ROW 3
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: SubjectCard(
        title: 'Basic Knowledge',
        subtitle: 'Learn everyday basics',
        icon: Icons.lightbulb_rounded,
        color: const Color(0xFF1976D2),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const BasicHomePage(),
            ),
          );
        },
      ),
    ),

    const SizedBox(width: 13),

    Expanded(
      child: SubjectCard(
        title: 'Know the World',
        subtitle: 'Animals & more',
        icon: Icons.public_rounded,
        color: const Color(0xFF8E6CEF),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const GeneralHomePage(),
            ),
          );
        },
      ),
    ),
  ],
),

const SizedBox(height: 13),

// =============================================================
// KNOW THE WORLD
// =============================================================
// 0xFF8E6CEF
// color: const Color(0xFF1976D2),


              const SizedBox(height: 20),

              // =============================================================
              // BOTTOM ACTION CARDS
              // =============================================================

              

                  const SizedBox(width: 13),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // =============================================================
  // COMING SOON
  // =============================================================

  static void _comingSoon(
    BuildContext context,
    String name,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name is coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}


// ============================================================================
// ACTION CARD
// ============================================================================

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 8,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 29,
                color: const Color(0xFF5B5FEF),
              ),

              const SizedBox(height: 7),

              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF303448),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}