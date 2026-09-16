import 'package:flutter/material.dart';
import 'paryayvachi_vilom_practice.dart';

class ParyayvachiVilomPage extends StatelessWidget {
  const ParyayvachiVilomPage({super.key});

  static const List<Map<String, String>> paryayvachi = [
    {
      'word': 'सूर्य',
      'answer': 'रवि, सूरज',
      'icon': 'wb_sunny',
    },
    {
      'word': 'जल',
      'answer': 'पानी, नीर',
      'icon': 'water_drop',
    },
    {
      'word': 'पृथ्वी',
      'answer': 'धरती, भूमि',
      'icon': 'public',
    },
    {
      'word': 'आकाश',
      'answer': 'नभ, आसमान',
      'icon': 'cloud',
    },
    {
      'word': 'घर',
      'answer': 'गृह, मकान',
      'icon': 'home',
    },
  ];

  static const List<Map<String, String>> vilom = [
    {
      'word': 'दिन',
      'answer': 'रात',
      'icon': 'light_mode',
    },
    {
      'word': 'अच्छा',
      'answer': 'बुरा',
      'icon': 'thumb_up',
    },
    {
      'word': 'बड़ा',
      'answer': 'छोटा',
      'icon': 'straighten',
    },
    {
      'word': 'ऊपर',
      'answer': 'नीचे',
      'icon': 'swap_vert',
    },
    {
      'word': 'नया',
      'answer': 'पुराना',
      'icon': 'history',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF),
      appBar: AppBar(
        title: const Text(
          'पर्यायवाची और विलोम',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF7656E8),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'पर्यायवाची शब्द',
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
                'जिन शब्दों के अर्थ समान या लगभग समान होते हैं, उन्हें पर्यायवाची शब्द कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 15),

            ...paryayvachi.map(
              (item) => _wordCard(item),
            ),

            const SizedBox(height: 20),

            const Text(
              'विलोम शब्द',
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
                'जिन शब्दों के अर्थ एक-दूसरे के विपरीत होते हैं, उन्हें विलोम शब्द कहते हैं।',
                style: TextStyle(
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 15),

            ...vilom.map(
              (item) => _wordCard(item),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE9E1FF),
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
                    'समान अर्थ → पर्यायवाची',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'उल्टा अर्थ → विलोम',
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
                      builder: (_) =>
                          const ParyayvachiVilomPracticePage(),
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
                  backgroundColor: const Color(0xFF7656E8),
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
            Color(0xFF8768F0),
            Color(0xFF6043C7),
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
                  'शब्दों का खेल',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'समान और विपरीत अर्थ',
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
            bottom: 10,
            child: CustomPaint(
              size: const Size(145, 120),
              painter: _ParyayvachiPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wordCard(Map<String, String> item) {
    IconData icon = Icons.category;

    switch (item['icon']) {
      case 'wb_sunny':
        icon = Icons.wb_sunny;
        break;
      case 'water_drop':
        icon = Icons.water_drop;
        break;
      case 'public':
        icon = Icons.public;
        break;
      case 'cloud':
        icon = Icons.cloud;
        break;
      case 'home':
        icon = Icons.home;
        break;
      case 'light_mode':
        icon = Icons.light_mode;
        break;
      case 'thumb_up':
        icon = Icons.thumb_up;
        break;
      case 'straighten':
        icon = Icons.straighten;
        break;
      case 'swap_vert':
        icon = Icons.swap_vert;
        break;
      case 'history':
        icon = Icons.history;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE9E1FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF7656E8),
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
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['answer']!,
                  style: const TextStyle(
                    fontSize: 16,
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

class _ParyayvachiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white;

    // Left word card
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(8, 25, 58, 65),
        const Radius.circular(12),
      ),
      paint,
    );

    // Right word card
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(80, 25, 58, 65),
        const Radius.circular(12),
      ),
      paint,
    );

    final linePaint = Paint()
      ..color = const Color(0xFF7656E8)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Connection
    canvas.drawLine(
      const Offset(66, 57),
      const Offset(80, 57),
      linePaint,
    );

    // Opposite arrows
    canvas.drawLine(
      const Offset(68, 50),
      const Offset(78, 50),
      linePaint,
    );

    canvas.drawLine(
      const Offset(68, 64),
      const Offset(78, 64),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}