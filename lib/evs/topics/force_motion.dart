import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'force_motion_practice.dart';

class ForceMotionPage extends StatefulWidget {
  const ForceMotionPage({super.key});

  @override
  State<ForceMotionPage> createState() => _ForceMotionPageState();
}

class _ForceMotionPageState extends State<ForceMotionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedForce = 0;

  final List<_ForceType> forces = const [
    _ForceType(
      title: 'Push',
      icon: Icons.open_in_full_rounded,
      color: Color(0xFFE53935),
      description:
          'A push is a force that moves an object away from us.',
      example: 'Pushing a door open.',
    ),
    _ForceType(
      title: 'Pull',
      icon: Icons.unfold_less_rounded,
      color: Color(0xFF1976D2),
      description:
          'A pull is a force that brings an object closer to us.',
      example: 'Pulling a drawer open.',
    ),
    _ForceType(
      title: 'Gravity',
      icon: Icons.arrow_downward_rounded,
      color: Color(0xFF6D4C41),
      description:
          'Gravity is a force that pulls objects towards Earth.',
      example: 'A ball falling to the ground.',
    ),
    _ForceType(
      title: 'Friction',
      icon: Icons.do_not_step_rounded,
      color: Color(0xFF00897B),
      description:
          'Friction is a force that opposes motion when surfaces rub together.',
      example: 'Brakes helping a bicycle stop.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Force & Motion',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _hero(),

              const SizedBox(height: 25),

              _sectionTitle(
                'What is Force?',
                Icons.touch_app_rounded,
              ),

              const SizedBox(height: 11),

              _infoCard(
                Icons.touch_app_rounded,
                const Color(0xFFE65100),
                'A force is a push or a pull. Forces can make objects start moving, stop moving, change direction or change their speed.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Types of Forces',
                Icons.category_rounded,
              ),

              const SizedBox(height: 11),

              SizedBox(
                height: 108,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: forces.length,
                  itemBuilder: (context, index) {
                    final force = forces[index];
                    final selected = selectedForce == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedForce = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 108,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selected
                              ? force.color
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              force.icon,
                              color: selected
                                  ? Colors.white
                                  : force.color,
                              size: 30,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              force.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: selected
                                    ? Colors.white
                                    : const Color(0xFF41494D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              _selectedForce(),

              const SizedBox(height: 25),

              _sectionTitle(
                'How Can Force Change Motion?',
                Icons.speed_rounded,
              ),

              const SizedBox(height: 12),

              _motionChanges(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Push and Pull Around Us',
                Icons.compare_arrows_rounded,
              ),

              const SizedBox(height: 12),

              _pushPull(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Friction',
                Icons.do_not_step_rounded,
              ),

              const SizedBox(height: 12),

              _friction(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Gravity',
                Icons.arrow_downward_rounded,
              ),

              const SizedBox(height: 12),

              _gravity(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Force Can Change Direction',
                Icons.alt_route_rounded,
              ),

              const SizedBox(height: 12),

              _direction(),

              const SizedBox(height: 25),

              _quickFacts(),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 57,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ForceMotionPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Force & Motion Practice',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE65100),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF8F00),
            Color(0xFFE65100),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.speed_rounded,
                  color: Colors.white,
                  size: 44,
                ),
                SizedBox(height: 12),
                Text(
                  'Discover Force & Motion!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn how pushes, pulls, gravity and friction affect the objects around us.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.5,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 90,
            height: 120,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  painter: _ForcePainter(
                    animation: _controller.value,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          width: 39,
          height: 39,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFE65100),
            size: 21,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF263238),
            ),
          ),
        ),
      ],
    );
  }

  Widget _infoCard(
    IconData icon,
    Color color,
    String text,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5D625F),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedForce() {
    final force = forces[selectedForce];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(selectedForce),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: force.color.withValues(alpha: .18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: force.color.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                force.icon,
                color: force.color,
                size: 29,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    force.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: force.color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    force.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF5E6562),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Example: ${force.example}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: force.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _motionChanges() {
    final items = [
      (
        Icons.play_arrow_rounded,
        'Start Motion',
        'A push or pull can make an object that is still begin moving.',
      ),
      (
        Icons.stop_rounded,
        'Stop Motion',
        'A force can make a moving object stop.',
      ),
      (
        Icons.speed_rounded,
        'Change Speed',
        'A stronger push or pull can change how fast something moves.',
      ),
      (
        Icons.alt_route_rounded,
        'Change Direction',
        'A force can make a moving object change its direction.',
      ),
    ];

    return Column(
      children: items.map((item) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                item.$1,
                color: const Color(0xFFE65100),
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF68706D),
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _pushPull() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _forceCard(
            Icons.open_in_full_rounded,
            'PUSH',
            const Color(0xFFE53935),
            [
              'Push a door',
              'Kick a ball',
              'Push a chair',
              'Push a trolley',
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _forceCard(
            Icons.unfold_less_rounded,
            'PULL',
            const Color(0xFF1976D2),
            [
              'Pull a drawer',
              'Pull a rope',
              'Pull a bag',
              'Pull a door',
            ],
          ),
        ),
      ],
    );
  }

  Widget _forceCard(
    IconData icon,
    String title,
    Color color,
    List<String> examples,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 34),
          const SizedBox(height: 7),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          ...examples.map(
            (example) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: color,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      example,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: Color(0xFF59615E),
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

  Widget _friction() {
    return _explanationCard(
      icon: Icons.do_not_step_rounded,
      color: const Color(0xFF00897B),
      title: 'Friction slows motion',
      text:
          'Friction is a force that acts between surfaces when they move or try to move against each other.',
      points: const [
        'Friction helps us walk without slipping.',
        'Friction helps bicycle and vehicle brakes work.',
        'Rough surfaces usually produce more friction.',
        'Smooth surfaces usually produce less friction.',
      ],
    );
  }

  Widget _gravity() {
    return _explanationCard(
      icon: Icons.arrow_downward_rounded,
      color: const Color(0xFF6D4C41),
      title: 'Gravity pulls objects down',
      text:
          'Gravity is a force that pulls objects toward Earth. It is why objects fall when dropped.',
      points: const [
        'Gravity keeps us on Earth.',
        'Gravity makes dropped objects fall.',
        'Gravity also affects the movement of planets and moons.',
      ],
    );
  }

  Widget _direction() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_forward_rounded,
                size: 34,
                color: Color(0xFF1976D2),
              ),
              const SizedBox(width: 12),
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFCC80),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.sports_soccer_rounded,
                  color: Color(0xFFE65100),
                  size: 29,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.turn_right_rounded,
                size: 40,
                color: Color(0xFFE53935),
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Text(
            'When a force acts from a different direction, it can change the direction in which an object moves.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF5E6764),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _explanationCard({
    required IconData icon,
    required Color color,
    required String title,
    required String text,
    required List<String> points,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 29),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF5E6764),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 11),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: color,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF59615E),
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

  Widget _quickFacts() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF3E0),
            Color(0xFFFFF8EF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.stars_rounded,
                color: Color(0xFFFF8F00),
              ),
              SizedBox(width: 8),
              Text(
                'Quick Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Text(
            '• A force is a push or a pull.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Gravity pulls objects toward Earth.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Friction can slow down moving objects.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Forces can change speed and direction.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _ForceType {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String example;

  const _ForceType({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.example,
  });
}

class _ForcePainter extends CustomPainter {
  final double animation;

  _ForcePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    final x = 20 + animation * 45;
    final y = size.height * .56;

    paint.color = const Color(0xFFFFCC80);

    canvas.drawCircle(
      Offset(x, y),
      24,
      paint,
    );

    paint.color = const Color(0xFFE65100);

    canvas.drawCircle(
      Offset(x - 7, y - 6),
      3,
      paint,
    );

    canvas.drawCircle(
      Offset(x + 7, y - 6),
      3,
      paint,
    );

    paint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(x, y + 2),
        width: 20,
        height: 14,
      ),
      0,
      math.pi,
      false,
      paint,
    );

    paint.style = PaintingStyle.fill;

    paint.color = Colors.white;

    canvas.drawCircle(
      Offset(15, 20),
      2,
      paint,
    );

    canvas.drawCircle(
      Offset(72, 32),
      2,
      paint,
    );

    canvas.drawCircle(
      Offset(78, 87),
      2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ForcePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}