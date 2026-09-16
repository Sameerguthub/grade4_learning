import 'package:flutter/material.dart';
import 'matra_practice.dart';

class MatraPage extends StatelessWidget {
  const MatraPage({super.key});

  final List<Map<String, String>> matras = const [
    {
      'matra': 'ा',
      'name': 'आ की मात्रा',
      'example': 'का — आम',
    },
    {
      'matra': 'ि',
      'name': 'इ की मात्रा',
      'example': 'कि — किताब',
    },
    {
      'matra': 'ी',
      'name': 'ई की मात्रा',
      'example': 'की — कील',
    },
    {
      'matra': 'ु',
      'name': 'उ की मात्रा',
      'example': 'कु — कुत्ता',
    },
    {
      'matra': 'ू',
      'name': 'ऊ की मात्रा',
      'example': 'कू — फूल',
    },
    {
      'matra': 'े',
      'name': 'ए की मात्रा',
      'example': 'के — केला',
    },
    {
      'matra': 'ै',
      'name': 'ऐ की मात्रा',
      'example': 'कै — पैसा',
    },
    {
      'matra': 'ो',
      'name': 'ओ की मात्रा',
      'example': 'को — मोर',
    },
    {
      'matra': 'ौ',
      'name': 'औ की मात्रा',
      'example': 'कौ — कौआ',
    },
    {
      'matra': 'ं',
      'name': 'अनुस्वार',
      'example': 'अंग — रंग',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'मात्राएँ',
          style: TextStyle(
            color: Color(0xFF164B6D),
            fontWeight: FontWeight.w900,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF164B6D),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
          child: Column(
            children: [
              _buildHero(),

              const SizedBox(height: 24),

              _buildIntroduction(),

              const SizedBox(height: 24),

              _buildMatraGrid(),

              const SizedBox(height: 24),

              _buildRuleCard(),

              const SizedBox(height: 24),

              _buildPracticeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      height: 220,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4DB6E8),
            Color(0xFF2879B5),
          ],
        ),
        borderRadius: BorderRadius.circular(27),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -40,
            child: Container(
              width: 145,
              height: 145,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.10),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'शब्दों का जादू',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'मात्राएँ\nसीखें!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'मात्रा बदलो और शब्द बदल जाता है!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: CustomPaint(
                  size: const Size(150, 190),
                  painter: _MatraHeroPainter(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIntroduction() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                color: Color(0xFF2879B5),
              ),
              SizedBox(width: 8),
              Text(
                'मात्रा क्या है?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF164B6D),
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Text(
            'मात्रा एक ऐसा चिह्न है जो व्यंजन के साथ जुड़कर उसकी आवाज़ बदल देता है।',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFF5F6E76),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'उदाहरण:',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFF2879B5),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'क + ा = का     क + ि = कि     क + ी = की',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF164B6D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatraGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'मात्राओं को पहचानो',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w900,
            color: Color(0xFF164B6D),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'हर मात्रा के साथ एक उदाहरण याद करो।',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF65747C),
          ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matras.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.18,
          ),
          itemBuilder: (context, index) {
            final item = matras[index];

            return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: index.isEven
                    ? const Color(0xFFE2F5FF)
                    : const Color(0xFFE9F8F1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 53,
                    height: 53,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      item['matra']!,
                      style: const TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF2879B5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF164B6D),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item['example']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF586970),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRuleCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFE9A8),
            Color(0xFFFFD66B),
          ],
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_rounded,
                color: Color(0xFF795600),
              ),
              SizedBox(width: 8),
              Text(
                'एक आसान तरीका',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF624700),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'किसी व्यंजन के साथ अलग-अलग मात्राएँ लगाकर उसे बोलकर देखो।',
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Color(0xFF715A16),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'क → का → कि → की → कु → कू → के → कै → को → कौ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Color(0xFF624700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: FilledButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MatraPracticePage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz_rounded),
        label: const Text(
          'मात्राओं का अभ्यास करें',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF2879B5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------
// GRAPHIC
// ------------------------------------------------------------

class _MatraHeroPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, 105);

    // White card
    paint.color = Colors.white.withValues(alpha: 0.95);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: center,
          width: 105,
          height: 105,
        ),
        const Radius.circular(18),
      ),
      paint,
    );

    // Main letter
    final painter = TextPainter(
      text: const TextSpan(
        text: 'क',
        style: TextStyle(
          color: Color(0xFF2879B5),
          fontSize: 54,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter.paint(
      canvas,
      Offset(
        center.dx - painter.width / 2,
        center.dy - painter.height / 2 - 4,
      ),
    );

    // Matra
    final matraPainter = TextPainter(
      text: const TextSpan(
        text: 'ा',
        style: TextStyle(
          color: Color(0xFFE4512E),
          fontSize: 45,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    matraPainter.paint(
      canvas,
      Offset(
        center.dx + 17,
        center.dy - 28,
      ),
    );

    // Floating dots
    paint.color = const Color(0xFFFFD54F);

    canvas.drawCircle(
      Offset(size.width * 0.17, 42),
      7,
      paint,
    );

    paint.color = const Color(0xFF81D4FA);

    canvas.drawCircle(
      Offset(size.width * 0.85, 62),
      6,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}