import 'package:flutter/material.dart';
import 'kriya_practice.dart';

class KriyaPage extends StatelessWidget {
  const KriyaPage({super.key});

  static const List<Map<String, String>> examples = [
    {
      'word': 'खाना',
      'sentence': 'राहुल खाना खाता है।',
      'icon': 'restaurant',
    },
    {
      'word': 'दौड़ना',
      'sentence': 'बच्चे मैदान में दौड़ते हैं।',
      'icon': 'directions_run',
    },
    {
      'word': 'पढ़ना',
      'sentence': 'सीमा किताब पढ़ती है।',
      'icon': 'menu_book',
    },
    {
      'word': 'लिखना',
      'sentence': 'मोहन पत्र लिखता है।',
      'icon': 'edit',
    },
    {
      'word': 'खेलना',
      'sentence': 'बच्चे क्रिकेट खेलते हैं।',
      'icon': 'sports_cricket',
    },
    {
      'word': 'सोना',
      'sentence': 'बच्चा रात में सोता है।',
      'icon': 'bedtime',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FFF7),
      appBar: AppBar(
        title: const Text(
          'क्रिया',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF35A66F),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'क्रिया क्या है?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                'जो शब्द किसी काम के करने या होने का बोध कराते हैं, उन्हें क्रिया कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF5E8),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'आसान तरीका',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'वाक्य में पूछा जाए — “क्या कर रहा है?”',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'तो मिलने वाला शब्द अक्सर क्रिया होता है।',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'जैसे: खाना, पढ़ना, लिखना, दौड़ना',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'क्रिया के उदाहरण',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...examples.map((item) => _exampleCard(item)),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE7F8EE),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'याद रखें',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'काम बताने वाला शब्द = क्रिया',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const KriyaPracticePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.quiz),
                label: const Text(
                  'अब अभ्यास करें',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF35A66F),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF42B978),
            Color(0xFF168C63),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'क्रिया',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'काम बताने वाले शब्द',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 5,
            child: CustomPaint(
              size: const Size(150, 125),
              painter: _KriyaPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleCard(Map<String, String> item) {
    IconData icon = Icons.category;

    switch (item['icon']) {
      case 'restaurant':
        icon = Icons.restaurant;
        break;
      case 'directions_run':
        icon = Icons.directions_run;
        break;
      case 'menu_book':
        icon = Icons.menu_book;
        break;
      case 'edit':
        icon = Icons.edit;
        break;
      case 'sports_cricket':
        icon = Icons.sports_cricket;
        break;
      case 'bedtime':
        icon = Icons.bedtime;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFDDF5E8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF249765),
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['word']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['sentence']!,
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
}

class _KriyaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white;

    // Head
    canvas.drawCircle(
      const Offset(75, 30),
      15,
      paint,
    );

    // Body
    canvas.drawOval(
      const Rect.fromLTWH(60, 43, 30, 48),
      paint,
    );

    // Running legs
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(70, 85),
      const Offset(48, 108),
      linePaint,
    );

    canvas.drawLine(
      const Offset(82, 85),
      const Offset(105, 105),
      linePaint,
    );

    // Arms
    canvas.drawLine(
      const Offset(65, 53),
      const Offset(42, 70),
      linePaint,
    );

    canvas.drawLine(
      const Offset(85, 53),
      const Offset(105, 43),
      linePaint,
    );

    // Movement lines
    final movementPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(20, 42),
      const Offset(45, 42),
      movementPaint,
    );

    canvas.drawLine(
      const Offset(12, 55),
      const Offset(37, 55),
      movementPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}