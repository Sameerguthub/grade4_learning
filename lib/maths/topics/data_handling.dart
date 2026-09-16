import 'package:flutter/material.dart';
import 'data_handling_practice.dart';

class DataHandlingPage extends StatelessWidget {
  const DataHandlingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text(
          'Data Handling',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),
              const SizedBox(height: 20),

              _section(
                icon: Icons.analytics_rounded,
                title: 'What is Data?',
                child: const Text(
                  'Data means information collected about people, things, '
                  'numbers, or events. We can collect, organise, read, '
                  'and understand data.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),

              _section(
                icon: Icons.list_alt_rounded,
                title: 'Example of Data',
                child: Column(
                  children: [
                    const Text(
                      'Favourite fruits of 8 children:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _dataRow('Apple', 3),
                    _dataRow('Mango', 2),
                    _dataRow('Banana', 2),
                    _dataRow('Orange', 1),
                  ],
                ),
              ),

              _section(
                icon: Icons.format_list_numbered_rounded,
                title: 'Tally Marks',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tally marks help us count data quickly.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 14),
                    _tallyRow('Apple', '||||'),
                    _tallyRow('Mango', '||||'),
                    _tallyRow('Banana', '|||'),
                    _tallyRow('Orange', '||'),
                  ],
                ),
              ),

              _section(
                icon: Icons.bar_chart_rounded,
                title: 'Bar Graph',
                child: Column(
                  children: [
                    const Text(
                      'A bar graph uses bars to show data.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 230,
                      child: CustomPaint(
                        painter: BarGraphPainter(),
                        child: const SizedBox.expand(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Number of books read by four children',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

              _section(
                icon: Icons.table_chart_rounded,
                title: 'Reading a Table',
                child: Column(
                  children: [
                    _tableRow('Day', 'Books Read', isHeader: true),
                    _tableRow('Monday', '4'),
                    _tableRow('Tuesday', '6'),
                    _tableRow('Wednesday', '3'),
                    _tableRow('Thursday', '7'),
                    _tableRow('Friday', '5'),
                  ],
                ),
              ),

              _section(
                icon: Icons.arrow_upward_rounded,
                title: 'Maximum and Minimum',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Maximum means the greatest value.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Minimum means the smallest value.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 14),
                    _exampleBox(
                      'Example',
                      'Numbers: 8, 4, 12, 6, 10\n'
                          'Maximum = 12\n'
                          'Minimum = 4',
                    ),
                  ],
                ),
              ),

              _section(
                icon: Icons.calculate_rounded,
                title: 'Total from Data',
                child: _exampleBox(
                  'Example',
                  'Monday = 4 books\n'
                      'Tuesday = 6 books\n'
                      'Wednesday = 3 books\n\n'
                      'Total = 4 + 6 + 3 = 13 books',
                ),
              ),

              _section(
                icon: Icons.compare_arrows_rounded,
                title: 'Comparing Data',
                child: _exampleBox(
                  'Example',
                  'Riya read 8 books.\n'
                      'Aman read 5 books.\n\n'
                      'Riya read 3 more books than Aman.',
                ),
              ),

              _section(
                icon: Icons.pie_chart_rounded,
                title: 'Important Words',
                child: Column(
                  children: [
                    _meaningRow('Data', 'Information collected'),
                    _meaningRow('Tally', 'Quick counting marks'),
                    _meaningRow('Bar Graph', 'Bars used to show data'),
                    _meaningRow('Maximum', 'Greatest value'),
                    _meaningRow('Minimum', 'Smallest value'),
                    _meaningRow('Total', 'All values added together'),
                  ],
                ),
              ),

              _section(
                icon: Icons.lightbulb_rounded,
                title: 'Real-Life Data',
                child: Column(
                  children: [
                    _realLifeRow(Icons.people_rounded, 'Number of students'),
                    _realLifeRow(Icons.cloud_rounded, 'Weather information'),
                    _realLifeRow(Icons.menu_book_rounded, 'Books read'),
                    _realLifeRow(Icons.sports_soccer_rounded, 'Sports scores'),
                    _realLifeRow(Icons.shopping_cart_rounded, 'Items sold'),
                  ],
                ),
              ),

              _section(
                icon: Icons.warning_rounded,
                title: 'Common Mistakes',
                child: Column(
                  children: [
                    _mistake('Do not forget to count every value.'),
                    _mistake('Read the scale of a graph carefully.'),
                    _mistake('Check whether the question asks for total, maximum, or minimum.'),
                    _mistake('Do not confuse the number of categories with the total data.'),
                  ],
                ),
              ),

              _section(
                icon: Icons.check_circle_rounded,
                title: 'Quick Check',
                child: _exampleBox(
                  'Question',
                  'A bar graph shows:\n'
                      'A = 5, B = 8, C = 3\n\n'
                      'Which category has the maximum value?\n\n'
                      'Answer: B',
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DataHandlingPracticePage(),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade500,
            Colors.blue.shade400,
          ],
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.bar_chart_rounded,
            color: Colors.white,
            size: 55,
          ),
          SizedBox(height: 12),
          Text(
            'Data Handling',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn how to collect, organise and understand information.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.indigo.shade600),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _dataRow(String name, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tallyRow(String name, String tally) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            tally,
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableRow(
    String first,
    String second, {
    bool isHeader = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: isHeader ? Colors.indigo.shade50 : Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              first,
              style: TextStyle(
                fontWeight:
                    isHeader ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              second,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight:
                    isHeader ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleBox(String title, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _meaningRow(String term, String meaning) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              term,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(meaning)),
        ],
      ),
    );
  }

  Widget _realLifeRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.indigo.shade500,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _mistake(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.close_rounded,
            size: 20,
            color: Colors.red.shade400,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class BarGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final axisPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;

    const left = 42.0;
    const bottom = 35.0;
    final graphHeight = height - bottom - 20;
    final graphWidth = width - left - 15;

    canvas.drawLine(
      Offset(left, 20),
      Offset(left, height - bottom),
      axisPaint,
    );

    canvas.drawLine(
      Offset(left, height - bottom),
      Offset(width - 10, height - bottom),
      axisPaint,
    );

    final values = [4, 7, 3, 6];
    final labels = ['A', 'B', 'C', 'D'];

    final barWidth = graphWidth / 7;

    for (int i = 0; i < values.length; i++) {
      final x = left + 25 + i * barWidth * 1.5;
      final barHeight = graphHeight * values[i] / 8;

      final rect = Rect.fromLTWH(
        x,
        height - bottom - barHeight,
        barWidth,
        barHeight,
      );

      canvas.drawRect(rect, paint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(
          x + barWidth / 2 - textPainter.width / 2,
          height - bottom + 8,
        ),
      );
    }

    for (int i = 0; i <= 8; i += 2) {
      final y = height - bottom - graphHeight * i / 8;

      final textPainter = TextPainter(
        text: TextSpan(
          text: '$i',
          style: const TextStyle(fontSize: 11),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(left - textPainter.width - 7, y - 7),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}