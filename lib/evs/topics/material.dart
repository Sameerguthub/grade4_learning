
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'material_practice.dart';

class MaterialsPage extends StatefulWidget {
  const MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Materials',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xFF30205C),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF30205C),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(),

              const SizedBox(height: 24),

              _sectionTitle(
                'What Are Materials?',
                'Everything around us is made from materials.',
                Icons.lightbulb_rounded,
              ),

              const SizedBox(height: 12),

              _buildWhatAreMaterials(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Common Materials',
                'Different materials are used for different jobs.',
                Icons.category_rounded,
              ),

              const SizedBox(height: 14),

              _buildMaterialGrid(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Properties of Materials',
                'Materials have special properties.',
                Icons.auto_awesome_rounded,
              ),

              const SizedBox(height: 14),

              _buildProperties(),

              const SizedBox(height: 26),

              _buildObserveThink(),

              const SizedBox(height: 26),

              _buildNaturalManMade(),

              const SizedBox(height: 26),

              _buildReuseRecycle(),

              const SizedBox(height: 26),

              _buildQuickFacts(),

              const SizedBox(height: 28),

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
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8E5DE7),
            Color(0xFF5932B4),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -35,
            top: -35,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.10),
              ),
            ),
          ),
          Positioned(
            left: -45,
            bottom: -55,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 10, 10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MATERIALS',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Materials\nAround Us!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 29,
                          height: 1.05,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Let’s discover what things are made of!',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Explore & Learn',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 4,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final movement =
                          math.sin(_controller.value * math.pi * 2) * 5;

                      return Transform.translate(
                        offset: Offset(0, movement),
                        child: child,
                      );
                    },
                    child: const SizedBox(
                      height: 190,
                      child: CustomPaint(
                        painter: _MaterialsHeroPainter(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFE9DEFF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6435C1),
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF30205C),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF706A7D),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWhatAreMaterials() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 150,
            child: CustomPaint(
              painter: _ObjectsMaterialsPainter(),
              size: Size(double.infinity, 150),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Materials are substances used to make objects.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF30205C),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A chair can be made from wood, plastic or metal. '
            'We choose a material depending on what the object needs to do.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Color(0xFF625D6B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.93,
      children: [
        _materialCard(
          'Wood',
          'Furniture, doors & pencils',
          Icons.park_rounded,
          const Color(0xFFFFE8C2),
          const Color(0xFF9A5A18),
        ),
        _materialCard(
          'Metal',
          'Tools, vehicles & buildings',
          Icons.construction_rounded,
          const Color(0xFFE4E9EF),
          const Color(0xFF52606D),
        ),
        _materialCard(
          'Plastic',
          'Bottles, toys & containers',
          Icons.local_drink_rounded,
          const Color(0xFFDDF2FF),
          const Color(0xFF1686C5),
        ),
        _materialCard(
          'Glass',
          'Windows, bottles & glasses',
          Icons.window_rounded,
          const Color(0xFFDFF7F5),
          const Color(0xFF168B87),
        ),
        _materialCard(
          'Cloth',
          'Clothes, bags & curtains',
          Icons.checkroom_rounded,
          const Color(0xFFFFDFE8),
          const Color(0xFFC04469),
        ),
        _materialCard(
          'Paper',
          'Books, cards & notebooks',
          Icons.description_rounded,
          const Color(0xFFFFF0C9),
          const Color(0xFF9B7115),
        ),
      ],
    );
  }

  Widget _materialCard(
    String title,
    String description,
    IconData icon,
    Color background,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.65),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.3,
              color: Color(0xFF4F4A55),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProperties() {
    return Column(
      children: [
        _propertyCard(
          'Hard or Soft?',
          'Some materials are hard, like metal and stone. '
              'Others are soft, like cotton and sponge.',
          Icons.pan_tool_rounded,
          const Color(0xFFFFE3ED),
          const Color(0xFFC13B68),
        ),
        _propertyCard(
          'Transparent or Opaque?',
          'Transparent materials allow light to pass through. '
              'Opaque materials do not.',
          Icons.visibility_rounded,
          const Color(0xFFE1F1FF),
          const Color(0xFF2674B8),
        ),
        _propertyCard(
          'Waterproof or Absorbent?',
          'Plastic and glass can resist water. '
              'Cotton and paper can absorb water.',
          Icons.water_drop_rounded,
          const Color(0xFFE0F8EE),
          const Color(0xFF21815B),
        ),
        _propertyCard(
          'Strong or Weak?',
          'Metal is strong and can carry heavy loads. '
              'Paper is weaker and can tear easily.',
          Icons.fitness_center_rounded,
          const Color(0xFFFFEACF),
          const Color(0xFFB46A18),
        ),
      ],
    );
  }

  Widget _propertyCard(
    String title,
    String text,
    IconData icon,
    Color background,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 13.5,
                    height: 1.4,
                    color: Color(0xFF4F4A55),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObserveThink() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFEBA8),
            Color(0xFFFFD875),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.psychology_rounded,
                size: 30,
                color: Color(0xFF785500),
              ),
              SizedBox(width: 10),
              Text(
                'Observe & Think!',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF634B00),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          const SizedBox(
            height: 125,
            child: CustomPaint(
              painter: _ThinkObjectsPainter(),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Why is a raincoat made from a waterproof material?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF5D4800),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Because we want to keep water from reaching our clothes!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF715B13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNaturalManMade() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Natural & Man-Made Materials',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF30205C),
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _typeCard(
                  'Natural',
                  'Found in nature',
                  Icons.forest_rounded,
                  const Color(0xFFE1F5E9),
                  const Color(0xFF25804B),
                  'Wood • Cotton • Wool',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _typeCard(
                  'Man-Made',
                  'Made by people',
                  Icons.factory_rounded,
                  const Color(0xFFE9E3FF),
                  const Color(0xFF6941B5),
                  'Plastic • Nylon • Glass',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _typeCard(
    String title,
    String subtitle,
    IconData icon,
    Color background,
    Color iconColor,
    String examples,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 34,
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF625D6B),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            examples,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReuseRecycle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDFF6D8),
            Color(0xFFBCE9AE),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 90,
            height: 100,
            child: CustomPaint(
              painter: _RecyclePainter(),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Use Materials Wisely!',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF24652E),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Reduce waste, reuse useful things and recycle materials whenever possible.',
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.4,
                    color: Color(0xFF3E6542),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickFacts() {
    final facts = [
      'Objects can be made from one or more materials.',
      'Different materials have different properties.',
      'We choose materials according to their use.',
      'Some materials are natural and others are man-made.',
      'Recycling helps reduce waste and protects nature.',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Color(0xFFF2A900),
                size: 28,
              ),
              SizedBox(width: 8),
              Text(
                'Quick Facts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF30205C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...facts.map(
            (fact) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 19,
                    color: Color(0xFF6B3FC4),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      fact,
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeButton() {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7B4BD1),
            Color(0xFF5429A9),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5E35B1).withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MaterialsPracticePage(),
            ),
          );
        },
        icon: const Icon(
          Icons.quiz_rounded,
          size: 27,
        ),
        label: const Text(
          'Start Practice',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
      ),
    );
  }
}


// ------------------------------------------------------------
// HERO GRAPHIC
// ------------------------------------------------------------

class _MaterialsHeroPainter extends CustomPainter {
  const _MaterialsHeroPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Wood block
    paint.color = const Color(0xFF9A5A24);
    final wood = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.04,
        size.height * 0.48,
        size.width * 0.25,
        size.height * 0.22,
      ),
      const Radius.circular(7),
    );
    canvas.drawRRect(wood, paint);

    paint.color = const Color(0xFFD89A59);
    canvas.drawCircle(
      Offset(size.width * 0.165, size.height * 0.59),
      size.width * 0.07,
      paint,
    );

    // Metal block
    paint.color = const Color(0xFFBFC7D0);
    final metal = Path()
      ..moveTo(size.width * 0.33, size.height * 0.67)
      ..lineTo(size.width * 0.43, size.height * 0.39)
      ..lineTo(size.width * 0.66, size.height * 0.45)
      ..lineTo(size.width * 0.56, size.height * 0.73)
      ..close();
    canvas.drawPath(metal, paint);

    // Glass
    paint.color = const Color(0xFFB9ECFF);
    final glass = Path()
      ..moveTo(size.width * 0.70, size.height * 0.40)
      ..lineTo(size.width * 0.91, size.height * 0.47)
      ..lineTo(size.width * 0.84, size.height * 0.74)
      ..lineTo(size.width * 0.75, size.height * 0.70)
      ..close();
    canvas.drawPath(glass, paint);

    paint.color = Colors.white.withValues(alpha: 0.65);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.76,
        size.height * 0.47,
        size.width * 0.035,
        size.height * 0.18,
      ),
      paint,
    );

    // Sparkles
    paint.color = const Color(0xFFFFD54F);
    _drawStar(
      canvas,
      Offset(size.width * 0.76, size.height * 0.20),
      13,
      paint,
    );

    _drawStar(
      canvas,
      Offset(size.width * 0.24, size.height * 0.27),
      9,
      paint,
    );
  }

  void _drawStar(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint,
  ) {
    final path = Path();

    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final r = i.isEven ? radius : radius * 0.25;

      final point = Offset(
        center.dx + math.cos(angle) * r,
        center.dy + math.sin(angle) * r,
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// ------------------------------------------------------------
// OBJECTS GRAPHIC
// ------------------------------------------------------------

class _ObjectsMaterialsPainter extends CustomPainter {
  const _ObjectsMaterialsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final paint = Paint()..style = PaintingStyle.fill;

    // Chair
    paint.color = const Color(0xFFB87535);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX - 105, 72),
          width: 55,
          height: 16,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(centerX - 128, 76, 8, 55),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(centerX - 80, 76, 8, 55),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(centerX - 128, 37, 56, 8),
      paint,
    );

    // Bottle
    paint.color = const Color(0xFF3E9DD4);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(centerX - 24, 47, 43, 80),
        const Radius.circular(12),
      ),
      paint,
    );

    paint.color = const Color(0xFF2678AD);

    canvas.drawRect(
      Rect.fromLTWH(centerX - 14, 35, 23, 14),
      paint,
    );

    // Metal spoon
    paint.color = const Color(0xFF9CA7B2);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 92, 51),
        width: 35,
        height: 45,
      ),
      paint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(centerX + 86, 70, 12, 65),
        const Radius.circular(6),
      ),
      paint,
    );

    // Labels
    _label(
      canvas,
      Offset(centerX - 105, 143),
      'Wood',
      const Color(0xFF9A5A24),
    );

    _label(
      canvas,
      Offset(centerX, 143),
      'Plastic',
      const Color(0xFF247EAE),
    );

    _label(
      canvas,
      Offset(centerX + 90, 143),
      'Metal',
      const Color(0xFF59636D),
    );
  }

  void _label(
    Canvas canvas,
    Offset position,
    String text,
    Color color,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        position.dx - textPainter.width / 2,
        position.dy,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// ------------------------------------------------------------
// THINK GRAPHIC
// ------------------------------------------------------------

class _ThinkObjectsPainter extends CustomPainter {
  const _ThinkObjectsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final center = size.width / 2;

    // Raincoat
    paint.color = const Color(0xFF4C8FEA);

    final coat = Path()
      ..moveTo(center - 65, 100)
      ..lineTo(center - 48, 35)
      ..lineTo(center - 20, 20)
      ..lineTo(center + 20, 20)
      ..lineTo(center + 48, 35)
      ..lineTo(center + 65, 100)
      ..close();

    canvas.drawPath(coat, paint);

    // Hood
    paint.color = const Color(0xFF3274C9);
    canvas.drawCircle(
      Offset(center, 27),
      22,
      paint,
    );

    // Water drops
    paint.color = const Color(0xFF4CA7E8);

    for (int i = 0; i < 5; i++) {
      final x = center - 65 + i * 33.0;
      final y = 8.0 + (i % 2) * 10;

      final drop = Path()
        ..moveTo(x, y)
        ..quadraticBezierTo(
          x - 7,
          y + 10,
          x,
          y + 16,
        )
        ..quadraticBezierTo(
          x + 7,
          y + 10,
          x,
          y,
        )
        ..close();

      canvas.drawPath(drop, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// ------------------------------------------------------------
// RECYCLE GRAPHIC
// ------------------------------------------------------------

class _RecyclePainter extends CustomPainter {
  const _RecyclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF39A852);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = 31.0;

    for (int i = 0; i < 3; i++) {
      final start = -math.pi / 2 + i * 2 * math.pi / 3;

      final path = Path()
        ..moveTo(
          center.dx + math.cos(start) * radius,
          center.dy + math.sin(start) * radius,
        )
        ..arcTo(
          Rect.fromCircle(
            center: center,
            radius: radius,
          ),
          start,
          math.pi * 0.48,
          false,
        );

      canvas.drawPath(path, paint);

      final endAngle = start + math.pi * 0.48;

      final end = Offset(
        center.dx + math.cos(endAngle) * radius,
        center.dy + math.sin(endAngle) * radius,
      );

      _arrow(canvas, end, endAngle, paint);
    }
  }

  void _arrow(
    Canvas canvas,
    Offset point,
    double angle,
    Paint paint,
  ) {
    final size = 10.0;

    final p1 = Offset(
      point.dx + math.cos(angle + 2.5) * size,
      point.dy + math.sin(angle + 2.5) * size,
    );

    final p2 = Offset(
      point.dx + math.cos(angle - 2.5) * size,
      point.dy + math.sin(angle - 2.5) * size,
    );

    canvas.drawLine(point, p1, paint);
    canvas.drawLine(point, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

