import 'package:flutter/material.dart';
import 'multiplication_practice.dart';

class MultiplicationPage extends StatelessWidget {
  const MultiplicationPage({super.key});

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
          'Multiplication',
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
                Icons.close_rounded,
                'What is Multiplication?',
              ),
              _card(
                const Text(
                  'Multiplication is a quick way of adding the same '
                  'number again and again. It tells us how many groups '
                  'of a number we have.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                    color: Color(0xFF40445A),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.repeat_rounded,
                'Multiplication as Repeated Addition',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Example: 4 × 3',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '4 × 3 means 4 groups of 3.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '3 + 3 + 3 + 3 = 12',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Therefore, 4 × 3 = 12',
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
                Icons.table_chart_rounded,
                'Multiplication Tables',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Knowing tables makes multiplication much easier.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _tableRow('2 Table', '2, 4, 6, 8, 10, 12, 14, 16'),
                    _tableRow('3 Table', '3, 6, 9, 12, 15, 18, 21, 24'),
                    _tableRow('4 Table', '4, 8, 12, 16, 20, 24, 28, 32'),
                    _tableRow('5 Table', '5, 10, 15, 20, 25, 30, 35, 40'),
                    _tableRow('10 Table', '10, 20, 30, 40, 50, 60, 70, 80'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.calculate_rounded,
                'Example 1: One-Digit Multiplication',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Multiply 7 × 6',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Using the 7 times table:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '7 × 6 = 42',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'So, 7 groups of 6 make 42.',
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
                Icons.grid_3x3_rounded,
                'Example 2: Two-Digit × One-Digit',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Multiply 24 × 3',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Center(
                      child: Text(
                        '  24\n'
                        '×  3\n'
                        '────\n'
                        '  72',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'First multiply the Ones:\n'
                      '4 × 3 = 12\n\n'
                      'Write 2 in the Ones place and carry 1 Ten.\n\n'
                      'Then multiply the Tens:\n'
                      '2 × 3 = 6, plus the carried 1 = 7.\n\n'
                      'Answer = 72',
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
                Icons.view_column_rounded,
                'Example 3: Two-Digit × Two-Digit',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Multiply 23 × 14',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '    23\n'
                        '×   14\n'
                        '──────\n'
                        '    92\n'
                        '+ 230\n'
                        '──────\n'
                        '   322',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          height: 1.35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'First multiply 23 × 4 = 92.\n'
                      'Then multiply 23 × 1 Ten = 230.\n'
                      'Finally add 92 + 230 = 322.',
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
                Icons.numbers_rounded,
                'Example 4: Three-Digit × One-Digit',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Multiply 125 × 4',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        '  125\n'
                        '×   4\n'
                        '─────\n'
                        '  500',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '5 × 4 = 20\n'
                      '2 × 4 = 8\n'
                      '1 × 4 = 4\n\n'
                      'Therefore, 125 × 4 = 500.',
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
                Icons.exposure_zero_rounded,
                'Multiplying by 10, 100 and 1,000',
              ),
              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _variation(
                      'Multiply by 10',
                      '45 × 10 = 450',
                    ),
                    _variation(
                      'Multiply by 100',
                      '45 × 100 = 4,500',
                    ),
                    _variation(
                      'Multiply by 1,000',
                      '45 × 1,000 = 45,000',
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'When multiplying a whole number by 10, 100 or '
                      '1,000, we can add one, two or three zeros.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.swap_horiz_rounded,
                'Order of Factors',
              ),
              _card(
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The order of numbers can be changed in '
                      'multiplication.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        '4 × 7 = 28\n'
                        '7 × 4 = 28',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This is called the commutative property of '
                      'multiplication.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.auto_awesome_rounded,
                'Useful Multiplication Patterns',
              ),
              _card(
                Column(
                  children: [
                    _variation(
                      'Multiply by 0',
                      '8 × 0 = 0',
                    ),
                    _variation(
                      'Multiply by 1',
                      '8 × 1 = 8',
                    ),
                    _variation(
                      'Multiply by 2',
                      '8 × 2 = 16',
                    ),
                    _variation(
                      'Multiply by 5',
                      '8 × 5 = 40',
                    ),
                    _variation(
                      'Multiply by 10',
                      '8 × 10 = 80',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _title(
                Icons.shopping_bag_rounded,
                'Multiplication in Real Life',
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
                      'There are 6 boxes. Each box contains 24 pencils. '
                      'How many pencils are there altogether?',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '6 × 24 = 144',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Therefore, there are 144 pencils.',
                      style: TextStyle(
                        fontSize: 16,
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
                      'Keep the numbers lined up correctly when doing '
                      'column multiplication.',
                    ),
                    _mistake(
                      'Do not forget to carry when a product is 10 or more.',
                    ),
                    _mistake(
                      'When multiplying by the Tens place, remember '
                      'that it represents tens.',
                    ),
                    _mistake(
                      'Do not confuse multiplication with addition.',
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
                      'What is 25 × 4?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _quickOption('50'),
                    _quickOption('75'),
                    _quickOption('100'),
                    _quickOption('125'),
                    const SizedBox(height: 8),
                    const Text(
                      'Correct answer: 100',
                      style: TextStyle(
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
                            MultiplicationPracticePage(),
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
            Color(0xFF43A047),
            Color(0xFF66BB6A),
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
              Icons.close_rounded,
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
                  'Let’s Learn Multiplication!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Learn multiplication step by step.',
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

  Widget _tableRow(String title, String values) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              values,
              style: const TextStyle(
                fontSize: 14,
                height: 1.35,
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
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}