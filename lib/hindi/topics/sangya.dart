import 'package:flutter/material.dart';
import 'sangya_practice.dart';

class SangyaPage extends StatelessWidget {
  const SangyaPage({super.key});

  static const List<Map<String, String>> types = [
    {
      'title': 'व्यक्ति',
      'examples': 'राम, सीमा, शिक्षक, डॉक्टर',
      'icon': 'person',
    },
    {
      'title': 'स्थान',
      'examples': 'मुंबई, स्कूल, पार्क, भारत',
      'icon': 'place',
    },
    {
      'title': 'वस्तु',
      'examples': 'किताब, मेज, गेंद, पेंसिल',
      'icon': 'category',
    },
    {
      'title': 'प्राणी',
      'examples': 'कुत्ता, बिल्ली, शेर, पक्षी',
      'icon': 'pets',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'संज्ञा',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF8A3D),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),
            const SizedBox(height: 20),

            const Text(
              'संज्ञा क्या है?',
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
                'किसी व्यक्ति, स्थान, वस्तु या प्राणी के नाम को संज्ञा कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'संज्ञा के उदाहरण',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...types.map((item) => _typeCard(item)),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6D2),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'याद रखने की आसान बात',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'नाम बताने वाला शब्द = संज्ञा',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'जैसे: मोहन, मुंबई, किताब, गाय',
                    style: TextStyle(fontSize: 16),
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
                      builder: (_) => const SangyaPracticePage(),
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
                  backgroundColor: const Color(0xFFFF8A3D),
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
            Color(0xFFFF9A52),
            Color(0xFFFF6F61),
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
                  'संज्ञा',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'नाम बताने वाले शब्द',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 5,
            child: CustomPaint(
              size: const Size(150, 125),
              painter: _SangyaPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeCard(Map<String, String> item) {
    IconData icon = Icons.category;

    switch (item['icon']) {
      case 'person':
        icon = Icons.person;
        break;
      case 'place':
        icon = Icons.location_city;
        break;
      case 'pets':
        icon = Icons.pets;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2),
            color: Color(0x14000000),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6D2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF7043),
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['examples']!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
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

class _SangyaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Book
    paint.color = Colors.white;
    final book = Path()
      ..moveTo(15, 72)
      ..quadraticBezierTo(70, 52, 135, 72)
      ..lineTo(135, 115)
      ..quadraticBezierTo(70, 95, 15, 115)
      ..close();

    canvas.drawPath(book, paint);

    paint.color = const Color(0xFFFFD7B5);
    canvas.drawRect(
      Rect.fromLTWH(68, 65, 4, 40),
      paint,
    );

    // Person symbol
    paint.color = Colors.white;
    canvas.drawCircle(
      const Offset(42, 38),
      12,
      paint,
    );

    canvas.drawCircle(
      const Offset(42, 68),
      19,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}