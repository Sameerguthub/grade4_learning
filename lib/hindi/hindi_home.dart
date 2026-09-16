import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'hindi_topics.dart';
import 'topics/hindi_stories.dart';
import 'topics/hindi_stories_practice.dart';

class HindiHomePage extends StatefulWidget {
  const HindiHomePage({super.key});

  @override
  State<HindiHomePage> createState() => _HindiHomePageState();
}

class _HindiHomePageState extends State<HindiHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'Hindi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE87535),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'क्या सीखना है?',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _buildMainCard(
              title: 'Hindi Topics',
              subtitle: 'वर्णमाला से वाक्य रचना तक सीखें',
              icon: Icons.menu_book,
              color: const Color(0xFFE87535),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HindiTopicsPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _buildMainCard(
              title: 'कहानियाँ',
              subtitle: 'छोटी कहानियाँ पढ़ें और अच्छी बातें सीखें',
              icon: Icons.auto_stories,
              color: const Color(0xFF7656E8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HindiStoriesPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _buildMainCard(
              title: 'Hindi Practice',
              subtitle: 'अपनी हिंदी की तैयारी जाँचें',
              icon: Icons.quiz,
              color: const Color(0xFF35A66F),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HindiStoriesPracticePage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5D3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Color(0xFFE87535),
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'सीखने का तरीका',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Topic पढ़ो → उदाहरण देखो → Practice करो → अपना score देखो',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
      height: 210,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF08A45),
            Color(0xFFD85C2C),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
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
                  'पढ़ो, समझो, सीखो!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'हिंदी को मज़ेदार तरीके से सीखें',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: CustomPaint(
              size: const Size(170, 140),
              painter: _HindiHeroPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HindiHeroPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Book
    paint.color = Colors.white;

    final leftPage = Path()
      ..moveTo(12, 75)
      ..quadraticBezierTo(52, 58, 85, 74)
      ..lineTo(85, 125)
      ..quadraticBezierTo(50, 108, 12, 125)
      ..close();

    final rightPage = Path()
      ..moveTo(85, 74)
      ..quadraticBezierTo(118, 58, 158, 75)
      ..lineTo(158, 125)
      ..quadraticBezierTo(120, 108, 85, 125)
      ..close();

    canvas.drawPath(leftPage, paint);
    canvas.drawPath(rightPage, paint);

    // Book center
    paint.color = const Color(0xFFFFC99F);

    canvas.drawRect(
      const Rect.fromLTWH(82, 70, 6, 57),
      paint,
    );

    // Hindi letters
    final random = math.Random(4);

    final letterPaint = Paint()
      ..color = const Color(0xFFE87535)
      ..strokeWidth = 2;

    // Decorative dots
    for (int i = 0; i < 8; i++) {
      final x = 25 + random.nextInt(120).toDouble();
      final y = 20 + random.nextInt(35).toDouble();

      canvas.drawCircle(
        Offset(x, y),
        2.5,
        letterPaint,
      );
    }

    // Pencil
    paint.color = const Color(0xFFFFD166);

    canvas.save();
    canvas.translate(130, 112);
    canvas.rotate(-0.7);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(-7, -40, 14, 50),
        const Radius.circular(3),
      ),
      paint,
    );

    final tip = Path()
      ..moveTo(-7, 10)
      ..lineTo(7, 10)
      ..lineTo(0, 22)
      ..close();

    paint.color = Colors.white;
    canvas.drawPath(tip, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}