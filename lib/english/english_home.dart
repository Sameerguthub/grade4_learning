import 'package:flutter/material.dart';
import 'english_topics.dart';

class EnglishHomePage extends StatelessWidget {
  const EnglishHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      // ============================================================
      // APP BAR
      // ============================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'English',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      // ============================================================
      // BODY
      // ============================================================

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================================
              // WELCOME CARD
              // ==========================================================

              _buildWelcomeCard(),

              const SizedBox(height: 24),

              // ==========================================================
              // SECTION TITLE
              // ==========================================================

              const Text(
                'What will you learn?',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF20243A),
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Learn grammar, vocabulary, reading and writing step by step.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF74788D),
                  height: 1.45,
                ),
              ),

              const SizedBox(height: 18),

              // ==========================================================
              // GRAMMAR
              // ==========================================================

              _buildFeatureCard(
                icon: Icons.spellcheck_rounded,
                title: 'Grammar',
                description:
                    'Learn nouns, pronouns, verbs, tenses and more.',
                color: const Color(0xFF3949AB),
              ),

              // ==========================================================
              // VOCABULARY
              // ==========================================================

              _buildFeatureCard(
                icon: Icons.auto_awesome_rounded,
                title: 'Vocabulary',
                description:
                    'Improve your English words, synonyms and antonyms.',
                color: const Color(0xFFFF8A4C),
              ),

              // ==========================================================
              // READING
              // ==========================================================

              _buildFeatureCard(
                icon: Icons.menu_book_rounded,
                title: 'Reading',
                description:
                    'Read passages and understand what you read.',
                color: const Color(0xFF22B573),
              ),

              // ==========================================================
              // WRITING
              // ==========================================================

              _buildFeatureCard(
                icon: Icons.edit_note_rounded,
                title: 'Writing',
                description:
                    'Learn sentence formation and basic paragraph writing.',
                color: const Color(0xFF8E5DE7),
              ),

              const SizedBox(height: 10),

              // ==========================================================
              // EXPLORE ALL TOPICS BUTTON
              // ==========================================================

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const EnglishTopicsPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.library_books_rounded,
                    size: 23,
                  ),
                  label: const Text(
                    'Explore All English Topics',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3949AB),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ==========================================================
              // SMALL INFO CARD
              // ==========================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF1FF),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_rounded,
                      color: Color(0xFF5B5FEF),
                      size: 25,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Learn one topic at a time and practise what you learn.',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF41455C),
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================================================
  // WELCOME CARD
  // ==============================================================

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5C6BC0),
            Color(0xFF3949AB),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 46,
          ),

          SizedBox(height: 14),

          Text(
            'Let\'s Learn English!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.w800,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Build strong English skills through fun lessons and practice.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================
  // FEATURE CARD
  // ==============================================================

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 13),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ICON
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
              size: 29,
            ),
          ),

          const SizedBox(width: 15),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF303448),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFF74788D),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}