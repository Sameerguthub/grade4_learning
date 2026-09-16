import 'package:flutter/material.dart';
import 'subtraction_practice.dart';

class SubtractionPage extends StatelessWidget {
  const SubtractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),
        title: const Text(
          'Subtraction',
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 24),

              _title(
                Icons.remove_circle_outline_rounded,
                'What is Subtraction?',
              ),

              _card(
                const Text(
                  'Subtraction means taking one number away from another '
                  'number to find how much is left or how much smaller '
                  'one number is than another.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                    color: Color(0xFF40445A),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.account_balance_rounded,
                'Parts of a Subtraction Problem',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        '  8,456\n'
                        '- 2,341\n'
                        '────────\n'
                        '  6,115',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _bullet(
                      '8,456 is called the minuend.',
                    ),
                    _bullet(
                      '2,341 is called the subtrahend.',
                    ),
                    _bullet(
                      '6,115 is called the difference.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.calculate_rounded,
                'Example 1: Subtraction Without Regrouping',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subtract 5,432 − 2,111',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Center(
                      child: Text(
                        '  5,432\n'
                        '- 2,111\n'
                        '────────\n'
                        '  3,321',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Start from the Ones place:\n'
                      '2 − 1 = 1\n'
                      '3 − 1 = 2\n'
                      '4 − 1 = 3\n'
                      '5 − 2 = 3\n\n'
                      'Answer = 3,321',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.swap_vert_rounded,
                'Example 2: Subtraction With Regrouping',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subtract 4,532 − 1,768',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Look at the Ones place:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '2 − 8 is not possible, so we regroup 1 Ten.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '12 − 8 = 4',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The 3 Tens become 2 Tens.\n'
                      '2 − 6 is not possible, so regroup 1 Hundred.\n'
                      '12 − 6 = 6.\n\n'
                      'Continue in the same way:',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '  4,532\n'
                        '- 1,768\n'
                        '────────\n'
                        '  2,764',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Answer = 2,764',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.looks_one_rounded,
                'Example 3: When There Are Zeros',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Subtract 5,000 − 2,347',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'When there are zeros, we may need to regroup '
                      'across more than one place.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '  5,000\n'
                        '- 2,347\n'
                        '────────\n'
                        '  2,653',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Answer = 2,653',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.grid_view_rounded,
                'Different Types of Subtraction',
              ),

              _card(
                Column(
                  children: [
                    _variation(
                      'Small Numbers',
                      '45 − 23 = 22',
                    ),
                    _variation(
                      'Three-Digit Numbers',
                      '786 − 245 = 541',
                    ),
                    _variation(
                      'Four-Digit Numbers',
                      '7,654 − 2,321 = 5,333',
                    ),
                    _variation(
                      'With Regrouping',
                      '6,204 − 1,875 = 4,329',
                    ),
                    _variation(
                      'Subtracting from a Round Number',
                      '5,000 − 1,250 = 3,750',
                    ),
                    _variation(
                      'Finding the Difference',
                      '900 − 675 = 225',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.verified_rounded,
                'Check Your Answer',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'We can check subtraction using addition.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '875 − 325 = 550',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        '550 + 325 = 875',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Because we get the original number, '
                      'our subtraction is correct.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.shopping_cart_rounded,
                'Subtraction in Real Life',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Example:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A library has 2,500 books. '
                      'If 675 books are borrowed, how many books remain?',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '2,500 − 675 = 1,825',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'So, 1,825 books remain in the library.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.warning_amber_rounded,
                'Common Mistakes',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _mistake(
                      'Always start from the Ones place.',
                    ),
                    _mistake(
                      'Keep digits in the correct place-value columns.',
                    ),
                    _mistake(
                      'Do not forget to reduce the number you borrowed from.',
                    ),
                    _mistake(
                      'Remember that subtraction order matters: '
                      '8 − 3 is not the same as 3 − 8.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.quiz_rounded,
                'Quick Check',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What is 7,000 − 2,500?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _quickOption('4,000'),
                    _quickOption('4,500'),
                    _quickOption('5,000'),
                    _quickOption('5,500'),
                    const SizedBox(height: 10),
                    const Text(
                      'Correct answer: 4,500',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubtractionPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                  label: const Text(
                    'Start Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
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

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF7043),
            Color(0xFFFF8A65),
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
              Icons.remove_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s Learn Subtraction!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Learn to subtract numbers step by step.',
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
    );
  }

  Widget _title(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF5B5FEF),
          size: 25,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF20243A),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _card(Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 7,
            color: Color(0xFF5B5FEF),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _variation(String title, String example) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF5B5FEF),
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  example,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mistake(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 21,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickOption(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE0E2EA),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}