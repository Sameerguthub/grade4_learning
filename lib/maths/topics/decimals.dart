import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'decimals_practice.dart';

class DecimalsPage extends StatelessWidget {
  const DecimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Decimals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerCard(),
              const SizedBox(height: 18),

              _sectionTitle(
                'What is a Decimal?',
                Icons.calculate_rounded,
              ),
              _infoCard(
                'A decimal is a number that has a whole-number part and a '
                'part smaller than one whole. A decimal uses a decimal point '
                'to separate these parts.',
              ),

              _exampleCard(
                title: 'Example',
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: '4.5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                      TextSpan(
                        text: ' means 4 wholes and 5 tenths.',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                'Decimal Point',
                Icons.more_horiz_rounded,
              ),
              _infoCard(
                'The decimal point separates the whole-number part from '
                'the fractional part.',
              ),
              _decimalPointCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Decimal Place Value',
                Icons.table_chart_rounded,
              ),
              _infoCard(
                'Each digit after the decimal point has a special place value.',
              ),
              const SizedBox(height: 12),
              _placeValueTable(),

              const SizedBox(height: 20),

              _sectionTitle(
                'See a Decimal Visually',
                Icons.grid_on_rounded,
              ),
              _infoCard(
                'This 10 × 10 grid has 100 equal parts. If 25 parts are '
                'shaded, the decimal is 0.25.',
              ),
              const SizedBox(height: 12),
              _visualCard(
                title: '0.25 = 25 hundredths',
                height: 250,
                painter: DecimalGridPainter(filledCells: 25),
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                'Tenths',
                Icons.looks_one_rounded,
              ),
              _infoCard(
                'When a whole is divided into 10 equal parts, each part is '
                'one tenth, written as 0.1.',
              ),
              const SizedBox(height: 12),
              _visualCard(
                title: '0.3 = 3 tenths',
                height: 150,
                painter: DecimalBarPainter(
                  divisions: 10,
                  filled: 3,
                ),
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                'Hundredths',
                Icons.looks_two_rounded,
              ),
              _infoCard(
                'When a whole is divided into 100 equal parts, each part is '
                'one hundredth, written as 0.01.',
              ),
              const SizedBox(height: 12),
              _visualCard(
                title: '0.47 = 47 hundredths',
                height: 250,
                painter: DecimalGridPainter(filledCells: 47),
              ),

              const SizedBox(height: 20),

              _sectionTitle(
                'Reading Decimals',
                Icons.record_voice_over_rounded,
              ),
              _readingCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Decimals and Fractions',
                Icons.compare_arrows_rounded,
              ),
              _infoCard(
                'Tenths and hundredths can be written as both fractions '
                'and decimals.',
              ),
              _fractionDecimalExamples(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Equivalent Decimals',
                Icons.sync_alt_rounded,
              ),
              _infoCard(
                'Adding zeros to the right of a decimal does not change its '
                'value.',
              ),
              _equivalentCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Comparing Decimals',
                Icons.compare_rounded,
              ),
              _infoCard(
                'To compare decimals, first compare the whole-number part. '
                'If those are equal, compare tenths, then hundredths.',
              ),
              _comparisonCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Ordering Decimals',
                Icons.sort_rounded,
              ),
              _orderingCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Adding Decimals',
                Icons.add_circle_outline_rounded,
              ),
              _infoCard(
                'When adding decimals, line up the decimal points. Then '
                'add each place value column.',
              ),
              _additionCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Subtracting Decimals',
                Icons.remove_circle_outline_rounded,
              ),
              _subtractionCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Decimals in Money',
                Icons.currency_rupee_rounded,
              ),
              _moneyCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Decimals in Real Life',
                Icons.public_rounded,
              ),
              _realLifeCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Common Mistakes',
                Icons.warning_amber_rounded,
              ),
              _mistakesCard(),

              const SizedBox(height: 20),

              _sectionTitle(
                'Quick Check',
                Icons.check_circle_outline_rounded,
              ),
              _quickCheckCard(),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DecimalsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(
                    'Start Practice',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6C63FF),
            Color(0xFF8E85FF),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.calculate_rounded,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(height: 10),
          Text(
            'Decimals',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn tenths, hundredths, place value, comparing, adding and subtracting decimals.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6C63FF),
            size: 27,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202124),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE3E6EF),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _exampleCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EEFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _decimalPointCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '12',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '.',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          Text(
            '34',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeValueTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Table(
        border: TableBorder.all(
          color: const Color(0xFFD9DDE7),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: const [
          TableRow(
            decoration: BoxDecoration(
              color: Color(0xFFF0EEFF),
            ),
            children: [
              _TableCell('Place'),
              _TableCell('Hundreds'),
              _TableCell('Tenths'),
              _TableCell('Hundredths'),
            ],
          ),
          TableRow(
            children: [
              _TableCell('Value'),
              _TableCell('100'),
              _TableCell('0.1'),
              _TableCell('0.01'),
            ],
          ),
          TableRow(
            children: [
              _TableCell('Example'),
              _TableCell('3'),
              _TableCell('4'),
              _TableCell('7'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _visualCard({
    required String title,
    required double height,
    required CustomPainter painter,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height,
            width: double.infinity,
            child: CustomPaint(
              painter: painter,
            ),
          ),
        ],
      ),
    );
  }

  Widget _readingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          _ExampleRow(
            number: '0.5',
            text: 'five tenths',
          ),
          _ExampleRow(
            number: '0.25',
            text: 'twenty-five hundredths',
          ),
          _ExampleRow(
            number: '2.7',
            text: 'two and seven tenths',
          ),
          _ExampleRow(
            number: '4.32',
            text: 'four and thirty-two hundredths',
          ),
        ],
      ),
    );
  }

  Widget _fractionDecimalExamples() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          _ExampleRow(number: '1/10', text: '= 0.1'),
          _ExampleRow(number: '3/10', text: '= 0.3'),
          _ExampleRow(number: '25/100', text: '= 0.25'),
          _ExampleRow(number: '75/100', text: '= 0.75'),
        ],
      ),
    );
  }

  Widget _equivalentCard() {
    return _mathBox(
      Column(
        children: const [
          Text(
            '0.5 = 0.50 = 0.500',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'The value stays the same because zeros are added only to the right.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _comparisonCard() {
    return _mathBox(
      Column(
        children: const [
          Text(
            '0.7  >  0.5',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '7 tenths is greater than 5 tenths.',
            style: TextStyle(fontSize: 16),
          ),
          Divider(height: 24),
          Text(
            '0.45  >  0.32',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Both have 0 wholes, so compare the tenths first.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _orderingCard() {
    return _mathBox(
      const Column(
        children: [
          Text(
            'Arrange from smallest to greatest:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '0.25, 0.70, 0.45, 0.10',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Answer: 0.10, 0.25, 0.45, 0.70',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _additionCard() {
    return _mathBox(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  2.35',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '+ 1.42',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Text(
            '  3.77',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Always line up the decimal points.',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _subtractionCard() {
    return _mathBox(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  5.80',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '- 2.35',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Text(
            '  3.45',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moneyCard() {
    return _mathBox(
      const Column(
        children: [
          Icon(
            Icons.currency_rupee_rounded,
            size: 40,
            color: Color(0xFF287D3C),
          ),
          SizedBox(height: 8),
          Text(
            '₹25.50',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '25 rupees and 50 paise',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _realLifeCard() {
    return _mathBox(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BulletRow(
            icon: Icons.straighten_rounded,
            text: 'A pencil can be 12.5 cm long.',
          ),
          _BulletRow(
            icon: Icons.water_drop_rounded,
            text: 'A bottle can contain 1.5 litres.',
          ),
          _BulletRow(
            icon: Icons.speed_rounded,
            text: 'A runner can run 2.75 km.',
          ),
          _BulletRow(
            icon: Icons.currency_rupee_rounded,
            text: 'A notebook can cost ₹45.50.',
          ),
        ],
      ),
    );
  }

  Widget _mistakesCard() {
    return _mathBox(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MistakeRow(
            wrong: '0.5 > 0.75',
            correct: '0.5 < 0.75',
          ),
          _MistakeRow(
            wrong: '2.3 + 1.25 = 3.28',
            correct: '2.30 + 1.25 = 3.55',
          ),
          _MistakeRow(
            wrong: '0.4 = 0.04',
            correct: '0.4 = 0.40',
          ),
        ],
      ),
    );
  }

  Widget _quickCheckCard() {
    return _mathBox(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. What is the place value of 6 in 3.64?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Answer: Tenths',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
          SizedBox(height: 14),
          Text(
            '2. Which is greater: 0.8 or 0.6?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Answer: 0.8',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
          SizedBox(height: 14),
          Text(
            '3. What is 0.3 + 0.4?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Answer: 0.7',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mathBox(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE3E6EF),
        ),
      ),
      child: child,
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;

  const _TableCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ExampleRow extends StatelessWidget {
  final String number;
  final String text;

  const _ExampleRow({
    required this.number,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6C63FF),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BulletRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 23,
            color: const Color(0xFF6C63FF),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MistakeRow extends StatelessWidget {
  final String wrong;
  final String correct;

  const _MistakeRow({
    required this.wrong,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Incorrect: $wrong',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Correct: $correct',
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class DecimalBarPainter extends CustomPainter {
  final int divisions;
  final int filled;

  DecimalBarPainter({
    required this.divisions,
    required this.filled,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final border = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const left = 20.0;
    const right = 20.0;
    const top = 35.0;
    final width = size.width - left - right;
    const height = 70.0;

    final cellWidth = width / divisions;

    for (int i = 0; i < divisions; i++) {
      paint.color = i < filled
          ? const Color(0xFF6C63FF)
          : const Color(0xFFE9E7FF);

      final rect = Rect.fromLTWH(
        left + i * cellWidth,
        top,
        cellWidth,
        height,
      );

      canvas.drawRect(rect, paint);
      canvas.drawRect(rect, border);
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: '1 whole = $divisions equal parts',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        top + height + 18,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant DecimalBarPainter oldDelegate) {
    return oldDelegate.divisions != divisions ||
        oldDelegate.filled != filled;
  }
}

class DecimalGridPainter extends CustomPainter {
  final int filledCells;

  DecimalGridPainter({
    required this.filledCells,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gridSize = math.min(
      size.width - 40,
      size.height - 50,
    );

    final left = (size.width - gridSize) / 2;
    final top = 15.0;
    final cellSize = gridSize / 10;

    final fillPaint = Paint()
      ..color = const Color(0xFF6C63FF)
      ..style = PaintingStyle.fill;

    final emptyPaint = Paint()
      ..color = const Color(0xFFE9E7FF)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = const Color(0xFF8A8FA3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int row = 0; row < 10; row++) {
      for (int col = 0; col < 10; col++) {
        final index = row * 10 + col;

        final rect = Rect.fromLTWH(
          left + col * cellSize,
          top + row * cellSize,
          cellSize,
          cellSize,
        );

        canvas.drawRect(
          rect,
          index < filledCells ? fillPaint : emptyPaint,
        );

        canvas.drawRect(rect, linePaint);
      }
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: '$filledCells / 100',
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFF6C63FF),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        top + gridSize + 8,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant DecimalGridPainter oldDelegate) {
    return oldDelegate.filledCells != filledCells;
  }
}