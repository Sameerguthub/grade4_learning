import 'package:flutter/material.dart';
import 'vakya_rachna_practice.dart';

class VakyaRachnaPage extends StatelessWidget {
  const VakyaRachnaPage({super.key});

  static const List<Map<String, String>> examples = [
    {
      'title': 'सही क्रम',
      'wrong': 'खाता / आम / राहुल',
      'right': 'राहुल आम खाता है।',
      'icon': 'sort',
    },
    {
      'title': 'सही वाक्य',
      'wrong': 'स्कूल जाता मोहन है।',
      'right': 'मोहन स्कूल जाता है।',
      'icon': 'school',
    },
    {
      'title': 'शब्दों से वाक्य',
      'wrong': 'सुंदर / फूल / है',
      'right': 'फूल सुंदर है।',
      'icon': 'local_florist',
    },
    {
      'title': 'एक और उदाहरण',
      'wrong': 'रही / सीमा / पढ़',
      'right': 'सीमा पढ़ रही है।',
      'icon': 'menu_book',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAFF),
      appBar: AppBar(
        title: const Text(
          'वाक्य रचना',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1597C9),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'वाक्य रचना क्या है?',
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
                'शब्दों को सही क्रम में लगाकर अर्थपूर्ण वाक्य बनाना वाक्य रचना कहलाता है।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFDDF3FC),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'वाक्य बनाते समय',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. शब्दों को सही क्रम में लगाएँ।',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2. वाक्य का अर्थ समझ में आना चाहिए।',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3. वाक्य के अंत में उचित विराम चिह्न लगाएँ।',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'उदाहरण देखें',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...examples.map(
              (item) => _exampleCard(item),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F5FC),
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
                    'शब्द + सही क्रम + पूरा अर्थ = सही वाक्य',
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
                      builder: (_) => const VakyaRachnaPracticePage(),
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
                  backgroundColor: const Color(0xFF1597C9),
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
            Color(0xFF22A9D8),
            Color(0xFF1178A5),
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
                  'वाक्य रचना',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'शब्दों से सुंदर वाक्य बनाओ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 8,
            child: CustomPaint(
              size: const Size(145, 120),
              painter: _VakyaPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleCard(Map<String, String> item) {
    IconData icon = Icons.sort;

    switch (item['icon']) {
      case 'school':
        icon = Icons.school;
        break;
      case 'local_florist':
        icon = Icons.local_florist;
        break;
      case 'menu_book':
        icon = Icons.menu_book;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFDDF3FC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1597C9),
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  item['wrong']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['right']!,
                  style: const TextStyle(
                    fontSize: 16,
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
}

class _VakyaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white;

    // Paper
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(28, 12, 100, 95),
        const Radius.circular(10),
      ),
      paint,
    );

    final linePaint = Paint()
      ..color = const Color(0xFF1597C9)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Text lines
    canvas.drawLine(
      const Offset(45, 35),
      const Offset(108, 35),
      linePaint,
    );

    canvas.drawLine(
      const Offset(45, 55),
      const Offset(115, 55),
      linePaint,
    );

    canvas.drawLine(
      const Offset(45, 75),
      const Offset(95, 75),
      linePaint,
    );

    // Pencil
    final pencilPaint = Paint()
      ..color = const Color(0xFFFFD166);

    canvas.save();

    canvas.translate(105, 98);
    canvas.rotate(-0.65);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(-8, -48, 16, 65),
        const Radius.circular(4),
      ),
      pencilPaint,
    );

    final tipPaint = Paint()
      ..color = Colors.white;

    final tip = Path()
      ..moveTo(-8, 17)
      ..lineTo(8, 17)
      ..lineTo(0, 29)
      ..close();

    canvas.drawPath(tip, tipPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}