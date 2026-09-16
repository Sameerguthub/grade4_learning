import 'package:flutter/material.dart';
import 'numbers_practice.dart';
class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),

        title: const Text(
          'Numbers',
          style: TextStyle(
            color: Color(0xFF20243A),
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.fromLTRB(
            20,
            8,
            20,
            60,
          ),

          children: [

            // =========================================================
            // INTRO CARD
            // =========================================================

            Container(
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
                      color: Colors.white.withValues(
                        alpha: 0.18,
                      ),
                      borderRadius: BorderRadius.circular(17),
                    ),

                    child: const Icon(
                      Icons.numbers_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Numbers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Let’s understand numbers!',
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

            const SizedBox(height: 24),

            // =========================================================
            // LESSON 1
            // =========================================================

            const _SectionTitle(
              icon: Icons.lightbulb_rounded,
              title: 'What are Numbers?',
            ),

            const SizedBox(height: 10),

            _InfoCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Numbers help us count and describe things.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Color(0xFF303448),
                    ),
                  ),

                  const SizedBox(height: 14),

                  _ExampleBox(
                    title: 'Example',
                    text: 'There are 25 books on a shelf.',
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Here, 25 tells us how many books there are.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      color: Color(0xFF74788D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // =========================================================
            // PLACE VALUE
            // =========================================================

            const _SectionTitle(
              icon: Icons.grid_view_rounded,
              title: 'Place Value',
            ),

            const SizedBox(height: 10),

            _InfoCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'The position of a digit tells us its value.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Color(0xFF303448),
                    ),
                  ),

                  const SizedBox(height: 18),

                  _NumberPlaceValue(),

                  const SizedBox(height: 15),

                  const Text(
                    'In 4,582:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF20243A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    '4 → Thousands\n'
                    '5 → Hundreds\n'
                    '8 → Tens\n'
                    '2 → Ones',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color(0xFF74788D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // =========================================================
            // EXPANDED FORM
            // =========================================================

            const _SectionTitle(
              icon: Icons.open_in_full_rounded,
              title: 'Expanded Form',
            ),

            const SizedBox(height: 10),

            _InfoCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Expanded form shows the value of each digit separately.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Color(0xFF303448),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _ExampleBox(
                    title: 'Example',
                    text: '4,582 = 4,000 + 500 + 80 + 2',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // =========================================================
            // COMPARING NUMBERS
            // =========================================================

            const _SectionTitle(
              icon: Icons.compare_arrows_rounded,
              title: 'Comparing Numbers',
            ),

            const SizedBox(height: 10),

            _InfoCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'We use these symbols to compare numbers:',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Color(0xFF303448),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _SymbolRow(
                    symbol: '>',
                    meaning: 'Greater than',
                  ),

                  const SizedBox(height: 8),

                  _SymbolRow(
                    symbol: '<',
                    meaning: 'Less than',
                  ),

                  const SizedBox(height: 8),

                  _SymbolRow(
                    symbol: '=',
                    meaning: 'Equal to',
                  ),

                  const SizedBox(height: 15),

                  _ExampleBox(
                    title: 'Example',
                    text: '45 > 32',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // =========================================================
            // QUICK CHECK
            // =========================================================

            const _SectionTitle(
              icon: Icons.check_circle_rounded,
              title: 'Quick Check',
            ),

            const SizedBox(height: 10),

            _InfoCard(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  const Text(
                    'What is the place value of 7 in 3,742?',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF20243A),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _AnswerOption(
                    text: '7',
                    isCorrect: false,
                  ),

                  const SizedBox(height: 8),

                  _AnswerOption(
                    text: '70',
                    isCorrect: true,
                  ),

                  const SizedBox(height: 8),

                  _AnswerOption(
                    text: '700',
                    isCorrect: false,
                  ),

                  const SizedBox(height: 8),

                  _AnswerOption(
                    text: '7,000',
                    isCorrect: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // =========================================================
            // NEXT BUTTON
            // =========================================================

            SizedBox(
              width: double.infinity,
              height: 54,

              child: ElevatedButton.icon(
                onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) {
                        return NumbersPracticePage();
                    },
                    ),
                );
                },

                icon: const Icon(
                  Icons.edit_note_rounded,
                ),

                label: const Text(
                  'Start Practice',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF5B5FEF),

                  foregroundColor: Colors.white,

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =====================================================================
// SECTION TITLE
// =====================================================================

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF5B5FEF),
          size: 24,
        ),

        const SizedBox(width: 9),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF20243A),
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}


// =====================================================================
// INFO CARD
// =====================================================================

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(17),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),

      child: child,
    );
  }
}


// =====================================================================
// EXAMPLE BOX
// =====================================================================

class _ExampleBox extends StatelessWidget {
  final String title;
  final String text;

  const _ExampleBox({
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FF),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF5B5FEF),
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF303448),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}


// =====================================================================
// PLACE VALUE
// =====================================================================

class _NumberPlaceValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const values = [
      ('4', 'Thousands'),
      ('5', 'Hundreds'),
      ('8', 'Tens'),
      ('2', 'Ones'),
    ];

    return Row(
      children: values.map((item) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 5),

            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFF3F4FF),
              borderRadius:
                  BorderRadius.circular(12),
            ),

            child: Column(
              children: [
                Text(
                  item.$1,
                  style: const TextStyle(
                    color: Color(0xFF5B5FEF),
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  item.$2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF74788D),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}


// =====================================================================
// SYMBOL ROW
// =====================================================================

class _SymbolRow extends StatelessWidget {
  final String symbol;
  final String meaning;

  const _SymbolRow({
    required this.symbol,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 38,

          decoration: BoxDecoration(
            color: const Color(0xFFEEF0FF),
            borderRadius:
                BorderRadius.circular(10),
          ),

          child: Center(
            child: Text(
              symbol,
              style: const TextStyle(
                color: Color(0xFF5B5FEF),
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Text(
          meaning,
          style: const TextStyle(
            color: Color(0xFF303448),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}


// =====================================================================
// ANSWER OPTION
// =====================================================================

class _AnswerOption extends StatelessWidget {
  final String text;
  final bool isCorrect;

  const _AnswerOption({
    required this.text,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE4E6EF),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFB7BAC7),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF303448),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}