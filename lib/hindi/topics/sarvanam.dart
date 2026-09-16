import 'package:flutter/material.dart';
import 'sarvanam_practice.dart';

class SarvanamPage extends StatelessWidget {
  const SarvanamPage({super.key});

  static const List<Map<String, String>> examples = [
    {
      'word': 'मैं',
      'meaning': 'अपने लिए',
      'sentence': 'मैं स्कूल जाता हूँ।',
      'icon': 'person',
    },
    {
      'word': 'हम',
      'meaning': 'अपने और दूसरों के लिए',
      'sentence': 'हम खेल रहे हैं।',
      'icon': 'group',
    },
    {
      'word': 'तुम',
      'meaning': 'सामने वाले के लिए',
      'sentence': 'तुम अच्छे हो।',
      'icon': 'person_outline',
    },
    {
      'word': 'वह',
      'meaning': 'किसी व्यक्ति या वस्तु के लिए',
      'sentence': 'वह बाजार गया।',
      'icon': 'person',
    },
    {
      'word': 'वे',
      'meaning': 'कई लोगों के लिए',
      'sentence': 'वे बच्चे खेल रहे हैं।',
      'icon': 'groups',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Text(
          'सर्वनाम',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4F7CFF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'सर्वनाम क्या है?',
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
                'जो शब्द संज्ञा के स्थान पर प्रयोग किए जाते हैं, उन्हें सर्वनाम कहते हैं।',
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
                color: const Color(0xFFE4ECFF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'उदाहरण',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'राहुल स्कूल गया। राहुल पढ़ाई करता है।',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'इसे ऐसे लिख सकते हैं:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'राहुल स्कूल गया। वह पढ़ाई करता है।',
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
              'कुछ सामान्य सर्वनाम',
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
                color: const Color(0xFFDCE6FF),
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
                    'संज्ञा की जगह आने वाला शब्द = सर्वनाम',
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
                      builder: (_) => const SarvanamPracticePage(),
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
                  backgroundColor: const Color(0xFF4F7CFF),
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
            Color(0xFF5B8CFF),
            Color(0xFF7656E8),
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
                  'सर्वनाम',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'संज्ञा की जगह आने वाले शब्द',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 5,
            child: CustomPaint(
              size: const Size(145, 125),
              painter: _SarvanamPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _exampleCard(Map<String, String> item) {
    IconData icon = Icons.person;

    switch (item['icon']) {
      case 'group':
        icon = Icons.group;
        break;
      case 'groups':
        icon = Icons.groups;
        break;
      case 'person_outline':
        icon = Icons.person_outline;
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
              color: const Color(0xFFE4ECFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF4F7CFF),
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
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item['meaning']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 3),
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

class _SarvanamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Three simple people
    paint.color = Colors.white;

    canvas.drawCircle(
      const Offset(72, 30),
      14,
      paint,
    );

    canvas.drawCircle(
      const Offset(35, 55),
      11,
      paint,
    );

    canvas.drawCircle(
      const Offset(110, 55),
      11,
      paint,
    );

    // Bodies
    canvas.drawOval(
      const Rect.fromLTWH(48, 45, 48, 58),
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(18, 65, 34, 45),
      paint,
    );

    canvas.drawOval(
      const Rect.fromLTWH(94, 65, 34, 45),
      paint,
    );

    // Speech bubble
    paint.color = const Color(0xFFFFFFFF);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(80, 5, 58, 34),
        const Radius.circular(10),
      ),
      paint,
    );

    paint.color = const Color(0xFF4F7CFF);

    final linePaint = Paint()
      ..color = const Color(0xFF4F7CFF)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(94, 18),
      const Offset(124, 18),
      linePaint,
    );

    canvas.drawLine(
      const Offset(94, 27),
      const Offset(116, 27),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}