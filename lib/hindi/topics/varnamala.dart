
import 'package:flutter/material.dart';
import 'varnamala_practice.dart';

class VarnamalaPage extends StatefulWidget {
  const VarnamalaPage({super.key});

  @override
  State<VarnamalaPage> createState() => _VarnamalaPageState();
}

class _VarnamalaPageState extends State<VarnamalaPage> {
  int selectedTab = 0;

  final List<String> vowels = [
    'अ',
    'आ',
    'इ',
    'ई',
    'उ',
    'ऊ',
    'ऋ',
    'ए',
    'ऐ',
    'ओ',
    'औ',
    'अं',
    'अः',
  ];

  final List<String> consonants = [
    'क',
    'ख',
    'ग',
    'घ',
    'ङ',
    'च',
    'छ',
    'ज',
    'झ',
    'ञ',
    'ट',
    'ठ',
    'ड',
    'ढ',
    'ण',
    'त',
    'थ',
    'द',
    'ध',
    'न',
    'प',
    'फ',
    'ब',
    'भ',
    'म',
    'य',
    'र',
    'ल',
    'व',
    'श',
    'ष',
    'स',
    'ह',
  ];

  @override
  Widget build(BuildContext context) {
    final letters = selectedTab == 0 ? vowels : consonants;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'वर्णमाला',
          style: TextStyle(
            color: Color(0xFF6D2C1B),
            fontWeight: FontWeight.w900,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF6D2C1B),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 30),
          child: Column(
            children: [
              _buildHero(),

              const SizedBox(height: 22),

              _buildTabSelector(),

              const SizedBox(height: 20),

              _buildLetterGrid(letters),

              const SizedBox(height: 24),

              _buildLearningCard(),

              const SizedBox(height: 24),

              _buildPracticeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      height: 205,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF9A76),
            Color(0xFFE65D3C),
          ],
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            left: -30,
            bottom: -50,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
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
                        'हिन्दी अक्षर',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'वर्णमाला\nसीखें!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'स्वर और व्यंजन पहचानना सीखो।',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: CustomPaint(
                  size: const Size(150, 180),
                  painter: _VarnamalaPainter(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE6DC),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Expanded(
            child: _tab(
              'स्वर',
              Icons.record_voice_over_rounded,
              selectedTab == 0,
              () => setState(() => selectedTab = 0),
            ),
          ),
          Expanded(
            child: _tab(
              'व्यंजन',
              Icons.text_fields_rounded,
              selectedTab == 1,
              () => setState(() => selectedTab = 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(
    String title,
    IconData icon,
    bool selected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 7,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? const Color(0xFFE4512E)
                  : const Color(0xFF806A63),
            ),
            const SizedBox(width: 7),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: selected
                    ? const Color(0xFFE4512E)
                    : const Color(0xFF806A63),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterGrid(List<String> letters) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedTab == 0 ? 'स्वर' : 'व्यंजन',
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w900,
            color: Color(0xFF542318),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          selectedTab == 0
              ? 'स्वर वे अक्षर हैं जिन्हें बोलते समय किसी दूसरे अक्षर की सहायता नहीं चाहिए।'
              : 'व्यंजन को बोलते समय स्वर की सहायता की आवश्यकता होती है।',
          style: const TextStyle(
            fontSize: 13,
            height: 1.4,
            color: Color(0xFF786A65),
          ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: letters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return _letterCard(
              letters[index],
              index,
              selectedTab == 0,
            );
          },
        ),
      ],
    );
  }

  Widget _letterCard(
    String letter,
    int index,
    bool vowel,
  ) {
    final colors = [
      const Color(0xFFFFE2D8),
      const Color(0xFFFFEFC7),
      const Color(0xFFE1F4E9),
      const Color(0xFFE2EEFF),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        borderRadius: BorderRadius.circular(17),
      ),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: vowel ? 28 : 26,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF5A2C21),
          ),
        ),
      ),
    );
  }

  Widget _buildLearningCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFFFE0D5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.tips_and_updates_rounded,
                color: Color(0xFFFFA000),
              ),
              SizedBox(width: 8),
              Text(
                'याद रखो!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF542318),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          _fact(
            'अ',
            'अनार',
          ),
          _fact(
            'आ',
            'आम',
          ),
          _fact(
            'क',
            'कमल',
          ),
          _fact(
            'ग',
            'गमला',
          ),
        ],
      ),
    );
  }

  Widget _fact(String letter, String word) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE7DE),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                color: Color(0xFFE4512E),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '$letter — $word',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeButton() {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: FilledButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const VarnamalaPracticePage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz_rounded),
        label: const Text(
          'वर्णमाला अभ्यास करें',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFFE4512E),
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

class _VarnamalaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final centerX = size.width / 2;

    // Book
    paint.color = const Color(0xFFFFF4D6);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, 105),
          width: 115,
          height: 75,
        ),
        const Radius.circular(9),
      ),
      paint,
    );

    // Book center
    paint.color = const Color(0xFFE7CFAE);

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, 105),
        width: 4,
        height: 67,
      ),
      paint,
    );

    // Writing lines
    paint.color = const Color(0xFFE4512E);

    for (int i = 0; i < 3; i++) {
      final y = 87.0 + i * 14;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            centerX - 48,
            y,
            37,
            3,
          ),
          const Radius.circular(2),
        ),
        paint,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            centerX + 11,
            y,
            37,
            3,
          ),
          const Radius.circular(2),
        ),
        paint,
      );
    }

    // Floating letters
    _letter(canvas, 'अ', Offset(centerX - 63, 38), 27);
    _letter(canvas, 'आ', Offset(centerX + 34, 18), 23);
  }

  void _letter(
    Canvas canvas,
    String text,
    Offset position,
    double size,
  ) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    painter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

