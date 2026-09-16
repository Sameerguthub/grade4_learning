import 'package:flutter/material.dart';
import 'ling_vachan_practice.dart';

class LingVachanPage extends StatelessWidget {
  const LingVachanPage({super.key});

  static const List<Map<String, String>> lingExamples = [
    {
      'title': 'पुल्लिंग',
      'examples': 'लड़का, राजा, घोड़ा, शेर',
      'icon': 'male',
    },
    {
      'title': 'स्त्रीलिंग',
      'examples': 'लड़की, रानी, घोड़ी, शेरनी',
      'icon': 'female',
    },
  ];

  static const List<Map<String, String>> vachanExamples = [
    {
      'title': 'एकवचन',
      'examples': 'लड़का, किताब, बच्चा',
      'icon': 'looks_one',
    },
    {
      'title': 'बहुवचन',
      'examples': 'लड़के, किताबें, बच्चे',
      'icon': 'looks_two',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5FA),
      appBar: AppBar(
        title: const Text(
          'लिंग और वचन',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFD94F8A),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'लिंग क्या है?',
              style: TextStyle(
                fontSize: 23,
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
                'शब्द से पुरुष या स्त्री जाति का पता चले, तो उसे लिंग कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            ...lingExamples.map(
              (item) => _lingCard(item),
            ),

            const SizedBox(height: 20),

            const Text(
              'वचन क्या है?',
              style: TextStyle(
                fontSize: 23,
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
                'शब्द से एक या एक से अधिक होने का पता चले, तो उसे वचन कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 16),

            ...vachanExamples.map(
              (item) => _lingCard(item),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE0EC),
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
                    'लिंग → पुरुष या स्त्री',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'वचन → एक या अनेक',
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
                      builder: (_) => const LingVachanPracticePage(),
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
                  backgroundColor: const Color(0xFFD94F8A),
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
            Color(0xFFEC6A9C),
            Color(0xFFB83F78),
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
                  'लिंग और वचन',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'एक, अनेक और पहचान',
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
              painter: _LingVachanPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lingCard(Map<String, String> item) {
    IconData icon = Icons.category;

    switch (item['icon']) {
      case 'male':
        icon = Icons.male;
        break;
      case 'female':
        icon = Icons.female;
        break;
      case 'looks_one':
        icon = Icons.looks_one;
        break;
      case 'looks_two':
        icon = Icons.looks_two;
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
            color: Color(0x12000000),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0EC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFD94F8A),
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

class _LingVachanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white;

    // One person
    canvas.drawCircle(
      const Offset(38, 42),
      13,
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(24, 56, 28, 43),
      paint,
    );

    // Group
    canvas.drawCircle(
      const Offset(90, 35),
      11,
      paint,
    );

    canvas.drawCircle(
      const Offset(65, 52),
      10,
      paint,
    );

    canvas.drawCircle(
      const Offset(115, 52),
      10,
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(78, 46, 25, 38),
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(52, 62, 25, 34),
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(103, 62, 25, 34),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}