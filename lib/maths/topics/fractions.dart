import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'fractions_practice.dart';

class FractionsPage extends StatelessWidget {
  const FractionsPage({super.key});

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
          'Fractions',
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

              _sectionTitle(
                Icons.pie_chart_rounded,
                'What is a Fraction?',
              ),

              _card(
                const Text(
                  'A fraction represents a part of a whole. '
                  'When a whole object is divided into equal parts, '
                  'a fraction tells us how many of those parts we have.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                    color: Color(0xFF40445A),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.pie_chart_outline_rounded,
                'Understanding 1/4',
              ),

              _card(
                Column(
                  children: [
                    const SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: FractionCirclePainter(
                          numerator: 1,
                          denominator: 4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '1/4 means 1 part out of 4 equal parts.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'The circle is divided into 4 equal parts, '
                      'and 1 part is selected.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.format_list_numbered_rounded,
                'Parts of a Fraction',
              ),

              _card(
                Column(
                  children: [
                    const Text(
                      '3/5',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 18),

                    _fractionPart(
                      '3',
                      'Numerator',
                      'The top number tells us how many parts are selected.',
                    ),

                    _fractionPart(
                      '5',
                      'Denominator',
                      'The bottom number tells us the total number of equal parts.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.view_agenda_rounded,
                'Fraction Bar',
              ),

              _card(
                Column(
                  children: [
                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: FractionBarPainter(
                          numerator: 3,
                          denominator: 5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '3/5 means 3 out of 5 equal parts.',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.category_rounded,
                'Types of Fractions',
              ),

              _card(
                Column(
                  children: [
                    _fractionType(
                      'Proper Fraction',
                      'Numerator is smaller than denominator.',
                      '3/5',
                    ),

                    _fractionType(
                      'Improper Fraction',
                      'Numerator is equal to or greater than denominator.',
                      '7/4',
                    ),

                    _fractionType(
                      'Mixed Number',
                      'A whole number together with a proper fraction.',
                      '1 3/4',
                    ),

                    _fractionType(
                      'Unit Fraction',
                      'Numerator is 1.',
                      '1/6',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.calculate_rounded,
                'Proper Fractions',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'In a proper fraction, the numerator is smaller '
                      'than the denominator.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Center(
                      child: Text(
                        '2/5, 3/7, 4/9',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: FractionBarPainter(
                          numerator: 2,
                          denominator: 5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'A proper fraction is always less than 1.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.functions_rounded,
                'Improper Fractions',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'In an improper fraction, the numerator is equal '
                      'to or greater than the denominator.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Center(
                      child: Text(
                        '5/4',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '5/4 means five quarters. That is more than one whole.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: MultipleFractionBarsPainter(
                          numerator: 5,
                          denominator: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.swap_horiz_rounded,
                'Mixed Numbers',
              ),

              _card(
                Column(
                  children: [
                    const Text(
                      '1 1/4',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'This means 1 whole and 1 quarter.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const SizedBox(
                      height: 145,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: MixedNumberPainter(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '1 1/4 = 5/4',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.compare_arrows_rounded,
                'Comparing Fractions',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'When fractions have the same denominator, '
                      'the fraction with the larger numerator is greater.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: CompareFractionPainter(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Center(
                      child: Text(
                        '3/5 > 2/5',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.sync_alt_rounded,
                'Equivalent Fractions',
              ),

              _card(
                Column(
                  children: [
                    const Text(
                      'Equivalent fractions have the same value '
                      'even though they look different.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: EquivalentFractionPainter(),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '1/2 = 2/4 = 4/8',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'The number of pieces changes, but the amount '
                      'of the whole remains the same.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.add_rounded,
                'Adding Fractions',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'When fractions have the same denominator, '
                      'add the numerators and keep the denominator.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Center(
                      child: Text(
                        '1/5 + 2/5 = 3/5',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: FractionAdditionPainter(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.remove_rounded,
                'Subtracting Fractions',
              ),

              _card(
                Column(
                  children: [
                    const Text(
                      'When fractions have the same denominator, '
                      'subtract the numerators and keep the denominator.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      '4/7 − 2/7 = 2/7',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CustomPaint(
                        painter: FractionSubtractionPainter(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.percent_rounded,
                'Fraction of a Quantity',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'A fraction can be used to find a part of a number.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Example: Find 1/4 of 20.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      '20 ÷ 4 = 5',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Therefore, 1/4 of 20 is 5.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Example: Find 3/4 of 20.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      '20 ÷ 4 = 5\n'
                      '5 × 3 = 15',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Therefore, 3/4 of 20 is 15.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.shopping_basket_rounded,
                'Fractions in Real Life',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _realLife(
                      Icons.local_pizza_rounded,
                      'Food',
                      'We can describe how much pizza or cake we have eaten using fractions.',
                    ),

                    _realLife(
                      Icons.schedule_rounded,
                      'Time',
                      'Half an hour means 1/2 of an hour.',
                    ),

                    _realLife(
                      Icons.water_drop_rounded,
                      'Water',
                      'A half-filled glass contains about 1/2 of its capacity.',
                    ),

                    _realLife(
                      Icons.school_rounded,
                      'Classroom',
                      'Fractions can describe a part of the students in a group.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.warning_amber_rounded,
                'Common Mistakes',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _mistake(
                      'The denominator tells us the total number of equal parts.',
                    ),

                    _mistake(
                      'The numerator tells us how many parts are selected.',
                    ),

                    _mistake(
                      'The parts of a whole must be equal when representing a fraction.',
                    ),

                    _mistake(
                      'When adding fractions with the same denominator, do not add the denominators.',
                    ),

                    _mistake(
                      'Do not confuse an improper fraction with a proper fraction.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.quiz_rounded,
                'Quick Check',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Which fraction represents 3 parts out of 5 equal parts?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _quickOption('2/5'),
                    _quickOption('3/5'),
                    _quickOption('5/3'),
                    _quickOption('3/2'),

                    const SizedBox(height: 8),

                    const Text(
                      'Correct answer: 3/5',
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
                            FractionsPracticePage(),
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
              Icons.pie_chart_rounded,
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
                  'Let’s Learn Fractions!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Understand parts of a whole step by step.',
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

  Widget _sectionTitle(
    IconData icon,
    String title,
  ) {
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

  Widget _fractionPart(
    String number,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FF),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fractionType(
    String title,
    String description,
    String example,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FF),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            color: Color(0xFF5B5FEF),
            size: 23,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Example: $example',
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

  Widget _realLife(
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF5B5FEF),
            size: 25,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
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
        crossAxisAlignment:
            CrossAxisAlignment.start,
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

// =====================================================================
// FRACTION CIRCLE
// =====================================================================

class FractionCirclePainter extends CustomPainter {
  final int numerator;
  final int denominator;

  const FractionCirclePainter({
    required this.numerator,
    required this.denominator,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = math.min(
          size.width,
          size.height,
        ) *
        0.36;

    final fillPaint = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final sliceAngle =
        (2 * math.pi) / denominator;

    for (int i = 0; i < denominator; i++) {
      if (i < numerator) {
        canvas.drawArc(
          Rect.fromCircle(
            center: center,
            radius: radius,
          ),
          -math.pi / 2 + i * sliceAngle,
          sliceAngle,
          true,
          fillPaint,
        );
      }
    }

    canvas.drawCircle(
      center,
      radius,
      outlinePaint,
    );

    for (int i = 0; i < denominator; i++) {
      final angle =
          -math.pi / 2 + i * sliceAngle;

      final end = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      canvas.drawLine(
        center,
        end,
        outlinePaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant FractionCirclePainter oldDelegate,
  ) {
    return oldDelegate.numerator != numerator ||
        oldDelegate.denominator != denominator;
  }
}

// =====================================================================
// FRACTION BAR
// =====================================================================

class FractionBarPainter extends CustomPainter {
  final int numerator;
  final int denominator;

  const FractionBarPainter({
    required this.numerator,
    required this.denominator,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const horizontalPadding = 18.0;
    final barWidth = size.width - horizontalPadding * 2;
    const barHeight = 55.0;

    final left = horizontalPadding;
    final top = (size.height - barHeight) / 2;

    final borderPaint = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final selectedPaint = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.fill;

    final partWidth = barWidth / denominator;

    for (int i = 0; i < denominator; i++) {
      final rect = Rect.fromLTWH(
        left + i * partWidth,
        top,
        partWidth,
        barHeight,
      );

      if (i < numerator) {
        canvas.drawRect(
          rect,
          selectedPaint,
        );
      }

      canvas.drawRect(
        rect,
        borderPaint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant FractionBarPainter oldDelegate,
  ) {
    return oldDelegate.numerator != numerator ||
        oldDelegate.denominator != denominator;
  }
}

// =====================================================================
// MULTIPLE FRACTION BARS
// =====================================================================

class MultipleFractionBarsPainter extends CustomPainter {
  final int numerator;
  final int denominator;

  const MultipleFractionBarsPainter({
    required this.numerator,
    required this.denominator,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const left = 15.0;
    const right = 15.0;
    const barHeight = 38.0;

    final barWidth = size.width - left - right;

    final fill = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    int remaining = numerator;

    for (int row = 0; remaining > 0; row++) {
      final y = 10.0 + row * 52;

      final parts =
          math.min(remaining, denominator);

      final partWidth =
          barWidth / denominator;

      for (int i = 0; i < denominator; i++) {
        final rect = Rect.fromLTWH(
          left + i * partWidth,
          y,
          partWidth,
          barHeight,
        );

        if (i < parts) {
          canvas.drawRect(
            rect,
            fill,
          );
        }

        canvas.drawRect(
          rect,
          border,
        );
      }

      remaining -= parts;
    }
  }

  @override
  bool shouldRepaint(
    covariant MultipleFractionBarsPainter oldDelegate,
  ) {
    return oldDelegate.numerator != numerator ||
        oldDelegate.denominator != denominator;
  }
}

// =====================================================================
// MIXED NUMBER
// =====================================================================

class MixedNumberPainter extends CustomPainter {
  const MixedNumberPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final wholeFill = Paint()
      ..color = const Color(0xFF5B5FEF)
      ..style = PaintingStyle.fill;

    final fractionFill = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.fill;

    const left = 20.0;
    const top = 25.0;
    const barHeight = 45.0;

    final wholeWidth =
        math.min(size.width * 0.42, 180.0);

    final fractionWidth =
        math.min(size.width * 0.42, 180.0);

    canvas.drawRect(
      Rect.fromLTWH(
        left,
        top,
        wholeWidth,
        barHeight,
      ),
      wholeFill,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        left,
        top,
        wholeWidth,
        barHeight,
      ),
      border,
    );

    final fractionLeft =
        left + wholeWidth + 18;

    final partWidth =
        fractionWidth / 4;

    for (int i = 0; i < 4; i++) {
      final rect = Rect.fromLTWH(
        fractionLeft + i * partWidth,
        top,
        partWidth,
        barHeight,
      );

      if (i == 0) {
        canvas.drawRect(
          rect,
          fractionFill,
        );
      }

      canvas.drawRect(
        rect,
        border,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

// =====================================================================
// COMPARE FRACTIONS
// =====================================================================

class CompareFractionPainter extends CustomPainter {
  const CompareFractionPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width * 0.72;
    const barHeight = 42.0;
    final left = size.width * 0.14;

    _drawBar(
      canvas,
      left,
      35,
      barWidth,
      barHeight,
      3,
      5,
    );

    _drawBar(
      canvas,
      left,
      125,
      barWidth,
      barHeight,
      2,
      5,
    );
  }

  void _drawBar(
    Canvas canvas,
    double left,
    double top,
    double width,
    double height,
    int numerator,
    int denominator,
  ) {
    final selected = Paint()
      ..color = const Color(0xFFFF7043);

    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final partWidth = width / denominator;

    for (int i = 0; i < denominator; i++) {
      final rect = Rect.fromLTWH(
        left + i * partWidth,
        top,
        partWidth,
        height,
      );

      if (i < numerator) {
        canvas.drawRect(
          rect,
          selected,
        );
      }

      canvas.drawRect(
        rect,
        border,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

// =====================================================================
// EQUIVALENT FRACTIONS
// =====================================================================

class EquivalentFractionPainter extends CustomPainter {
  const EquivalentFractionPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _drawFraction(
      canvas,
      15,
      10,
      size.width - 30,
      35,
      1,
      2,
    );

    _drawFraction(
      canvas,
      15,
      75,
      size.width - 30,
      35,
      2,
      4,
    );

    _drawFraction(
      canvas,
      15,
      140,
      size.width - 30,
      35,
      4,
      8,
    );
  }

  void _drawFraction(
    Canvas canvas,
    double left,
    double top,
    double width,
    double height,
    int numerator,
    int denominator,
  ) {
    final selected = Paint()
      ..color = const Color(0xFFFF7043);

    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final partWidth =
        width / denominator;

    for (int i = 0; i < denominator; i++) {
      final rect = Rect.fromLTWH(
        left + i * partWidth,
        top,
        partWidth,
        height,
      );

      if (i < numerator) {
        canvas.drawRect(
          rect,
          selected,
        );
      }

      canvas.drawRect(
        rect,
        border,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

// =====================================================================
// ADDITION
// =====================================================================

class FractionAdditionPainter extends CustomPainter {
  const FractionAdditionPainter();

  @override
  void paint(Canvas canvas, Size size) {
    _draw(
      canvas,
      1,
      5,
      10,
    );

    _draw(
      canvas,
      2,
      5,
      75,
    );
  }

  void _draw(
    Canvas canvas,
    int numerator,
    int denominator,
    double top,
  ) {
    final width = 260.0;
    const height = 35.0;
    const left = 15.0;

    final selected = Paint()
      ..color = const Color(0xFFFF7043);

    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final partWidth =
        width / denominator;

    for (int i = 0; i < denominator; i++) {
      final rect = Rect.fromLTWH(
        left + i * partWidth,
        top,
        partWidth,
        height,
      );

      if (i < numerator) {
        canvas.drawRect(
          rect,
          selected,
        );
      }

      canvas.drawRect(
        rect,
        border,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}

// =====================================================================
// SUBTRACTION
// =====================================================================

class FractionSubtractionPainter extends CustomPainter {
  const FractionSubtractionPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const width = 280.0;
    const height = 42.0;
    const left = 10.0;
    const top = 38.0;
    const denominator = 7;

    final border = Paint()
      ..color = const Color(0xFF20243A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final selected = Paint()
      ..color = const Color(0xFFFF7043);

    final faded = Paint()
      ..color = const Color(0xFFE0E2EA);

    final partWidth =
        width / denominator;

    for (int i = 0; i < denominator; i++) {
      final rect = Rect.fromLTWH(
        left + i * partWidth,
        top,
        partWidth,
        height,
      );

      if (i < 4) {
        canvas.drawRect(
          rect,
          selected,
        );
      } else {
        canvas.drawRect(
          rect,
          faded,
        );
      }

      canvas.drawRect(
        rect,
        border,
      );
    }

    for (int i = 0; i < 2; i++) {
      final x1 =
          left + (4 + i) * partWidth;

      canvas.drawLine(
        Offset(x1 + 3, top + 3),
        Offset(
          x1 + partWidth - 3,
          top + height - 3,
        ),
        Paint()
          ..color = const Color(0xFF20243A)
          ..strokeWidth = 3,
      );

      canvas.drawLine(
        Offset(
          x1 + partWidth - 3,
          top + 3,
        ),
        Offset(
          x1 + 3,
          top + height - 3,
        ),
        Paint()
          ..color = const Color(0xFF20243A)
          ..strokeWidth = 3,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}