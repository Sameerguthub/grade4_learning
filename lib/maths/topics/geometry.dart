import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'geometry_practice.dart';

class GeometryPage extends StatelessWidget {
  const GeometryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),
        title: const Text(
          'Geometry',
          style: TextStyle(
            color: Color(0xFF20243A),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 24),

              _sectionTitle(
                Icons.menu_book_rounded,
                'What is Geometry?',
              ),

              _card(
                const Text(
                  'Geometry is the part of mathematics that helps us '
                  'understand shapes, sizes, positions, lines and angles. '
                  'We see geometry everywhere around us — in buildings, '
                  'books, windows, roads, clocks and many other objects.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.55,
                    color: Color(0xFF40445A),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.category_rounded,
                '2D Shapes',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '2D shapes are flat shapes. They have length and width, '
                      'but no height.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const _ShapePainterCard(
                      painter: CircleShapePainter(),
                      title: 'Circle',
                      description:
                          'A round shape with no straight sides or corners.',
                    ),

                    const _ShapePainterCard(
                      painter: TriangleShapePainter(),
                      title: 'Triangle',
                      description:
                          'A shape with 3 sides and 3 vertices.',
                    ),

                    const _ShapePainterCard(
                      painter: SquareShapePainter(),
                      title: 'Square',
                      description:
                          'A shape with 4 equal sides and 4 right angles.',
                    ),

                    const _ShapePainterCard(
                      painter: RectangleShapePainter(),
                      title: 'Rectangle',
                      description:
                          'A shape with 4 sides and 4 right angles.',
                    ),

                    const _ShapePainterCard(
                      painter: ParallelogramShapePainter(),
                      title: 'Parallelogram',
                      description:
                          'A four-sided shape with opposite sides parallel.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.view_in_ar_rounded,
                '3D Shapes',
              ),

              _card(
                Column(
                  children: [
                    const Text(
                      '3D shapes are solid objects. They have length, '
                      'width and height.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const _ShapePainterCard(
                      painter: CubeShapePainter(),
                      title: 'Cube',
                      description:
                          'A solid shape with 6 square faces, 12 edges and 8 vertices.',
                    ),

                    const _ShapePainterCard(
                      painter: CuboidShapePainter(),
                      title: 'Cuboid',
                      description:
                          'A solid shape with 6 rectangular faces, 12 edges and 8 vertices.',
                    ),

                    const _ShapePainterCard(
                      painter: CylinderShapePainter(),
                      title: 'Cylinder',
                      description:
                          'A solid shape with 2 circular flat faces and one curved surface.',
                    ),

                    const _ShapePainterCard(
                      painter: SphereShapePainter(),
                      title: 'Sphere',
                      description:
                          'A completely round solid shape with no edges or vertices.',
                    ),

                    const _ShapePainterCard(
                      painter: ConeShapePainter(),
                      title: 'Cone',
                      description:
                          'A solid shape with one circular base and one vertex.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.timeline_rounded,
                'Points, Lines and Line Segments',
              ),

              _card(
                Column(
                  children: [
                    const _ShapePainterCard(
                      painter: PointPainter(),
                      title: 'Point',
                      description:
                          'A point shows an exact position. It has no length or width.',
                    ),

                    const _ShapePainterCard(
                      painter: LinePainter(),
                      title: 'Line',
                      description:
                          'A straight path that continues forever in both directions.',
                    ),

                    const _ShapePainterCard(
                      painter: LineSegmentPainter(),
                      title: 'Line Segment',
                      description:
                          'A part of a line with two fixed endpoints.',
                    ),

                    const _ShapePainterCard(
                      painter: RayPainter(),
                      title: 'Ray',
                      description:
                          'A part of a line that has one endpoint and continues forever in one direction.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.architecture_rounded,
                'What is an Angle?',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'An angle is formed when two rays meet at a common '
                      'endpoint. The common endpoint is called the vertex.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.55,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const _AnglePainterCard(
                      painter: AcuteAnglePainter(),
                      title: 'Acute Angle',
                      description:
                          'An angle smaller than 90°.',
                    ),

                    const _AnglePainterCard(
                      painter: RightAnglePainter(),
                      title: 'Right Angle',
                      description:
                          'An angle exactly equal to 90°.',
                    ),

                    const _AnglePainterCard(
                      painter: ObtuseAnglePainter(),
                      title: 'Obtuse Angle',
                      description:
                          'An angle greater than 90° but less than 180°.',
                    ),

                    const _AnglePainterCard(
                      painter: StraightAnglePainter(),
                      title: 'Straight Angle',
                      description:
                          'An angle exactly equal to 180°.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.threesixty_rounded,
                'Understanding Angles',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Angles are measured in degrees (°).',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    _angleExample(
                      '45°',
                      'Acute angle',
                    ),

                    _angleExample(
                      '90°',
                      'Right angle',
                    ),

                    _angleExample(
                      '120°',
                      'Obtuse angle',
                    ),

                    _angleExample(
                      '180°',
                      'Straight angle',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.square_rounded,
                'Sides and Vertices',
              ),

              _card(
                Column(
                  children: [
                    _propertyRow(
                      'Triangle',
                      '3 sides',
                      '3 vertices',
                    ),
                    _propertyRow(
                      'Square',
                      '4 equal sides',
                      '4 vertices',
                    ),
                    _propertyRow(
                      'Rectangle',
                      '4 sides',
                      '4 vertices',
                    ),
                    _propertyRow(
                      'Pentagon',
                      '5 sides',
                      '5 vertices',
                    ),
                    _propertyRow(
                      'Hexagon',
                      '6 sides',
                      '6 vertices',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.compare_rounded,
                'Compare Shapes',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Square vs Rectangle',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'A square has 4 equal sides and 4 right angles.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'A rectangle has 4 right angles, but only opposite '
                      'sides are equal.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 110,
                            child: CustomPaint(
                              painter: SquareShapePainter(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 110,
                            child: CustomPaint(
                              painter: RectangleShapePainter(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.home_work_rounded,
                'Geometry Around Us',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _realLifeExample(
                      Icons.access_time_rounded,
                      'Clock',
                      'The hands of a clock form different angles.',
                    ),
                    _realLifeExample(
                      Icons.window_rounded,
                      'Window',
                      'Many windows are rectangles or squares.',
                    ),
                    _realLifeExample(
                      Icons.change_history_rounded,
                      'Roof',
                      'Some roofs contain triangular shapes.',
                    ),
                    _realLifeExample(
                      Icons.crop_square_rounded,
                      'Tiles',
                      'Floor tiles can be squares, rectangles or other shapes.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.warning_amber_rounded,
                'Common Mistakes',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _mistake(
                      'Do not confuse sides with vertices. A vertex is a corner.',
                    ),
                    _mistake(
                      'A square has four equal sides, while a rectangle does not necessarily have four equal sides.',
                    ),
                    _mistake(
                      'A right angle is exactly 90°, not approximately 90°.',
                    ),
                    _mistake(
                      'A line continues in both directions, while a line segment has two endpoints.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                Icons.quiz_rounded,
                'Quick Check',
              ),

              _card(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Which angle is exactly 90°?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _quickOption('45°'),
                    _quickOption('90°'),
                    _quickOption('120°'),
                    _quickOption('180°'),
                    const SizedBox(height: 8),
                    const Text(
                      'Correct answer: 90° — Right Angle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GeometryPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                  label: const Text(
                    'Start Practice',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5B5FEF),
            Color(0xFF7B7FF5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.category_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s Learn Geometry!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Explore shapes, lines and angles.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
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
    IconData icon,
    String title,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF5B5FEF),
          size: 25,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF20243A),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _card(Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _angleExample(
    String angle,
    String type,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              angle,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              type,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _propertyRow(
    String shape,
    String sides,
    String vertices,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              shape,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              sides,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              vertices,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _realLifeExample(
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF5B5FEF),
            size: 25,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mistake(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 21,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickOption(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE0E2EA),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

// =====================================================================
// SHAPE CARD
// =====================================================================

class _ShapePainterCard extends StatelessWidget {
  final CustomPainter painter;
  final String title;
  final String description;

  const _ShapePainterCard({
    required this.painter,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 95,
            child: CustomPaint(
              painter: painter,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
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

// =====================================================================
// ANGLE CARD
// =====================================================================

class _AnglePainterCard extends StatelessWidget {
  final CustomPainter painter;
  final String title;
  final String description;

  const _AnglePainterCard({
    required this.painter,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 135,
            child: CustomPaint(
              painter: painter,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================================
// SHAPE PAINTERS
// =====================================================================

class CircleShapePainter extends CustomPainter {
  const CircleShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFEF5350)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFFC62828)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = math.min(
          size.width,
          size.height,
        ) *
        0.32;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleShapePainter extends CustomPainter {
  const TriangleShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 12)
      ..lineTo(size.width - 12, size.height - 12)
      ..lineTo(12, size.height - 12)
      ..close();

    final fill = Paint()
      ..color = const Color(0xFF42A5F5)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF1565C0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SquareShapePainter extends CustomPainter {
  const SquareShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final side = math.min(size.width, size.height) * 0.62;

    final rect = Rect.fromCenter(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      width: side,
      height: side,
    );

    final fill = Paint()
      ..color = const Color(0xFF66BB6A)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF2E7D32)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRect(rect, fill);
    canvas.drawRect(rect, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleShapePainter extends CustomPainter {
  const RectangleShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      width: size.width * 0.78,
      height: size.height * 0.52,
    );

    final fill = Paint()
      ..color = const Color(0xFFAB47BC)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF6A1B9A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRect(rect, fill);
    canvas.drawRect(rect, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ParallelogramShapePainter extends CustomPainter {
  const ParallelogramShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(28, 20)
      ..lineTo(size.width - 12, 20)
      ..lineTo(size.width - 30, size.height - 20)
      ..lineTo(12, size.height - 20)
      ..close();

    final fill = Paint()
      ..color = const Color(0xFFFFB74D)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFFEF6C00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// =====================================================================
// 3D SHAPES
// =====================================================================

class CubeShapePainter extends CustomPainter {
  const CubeShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF42A5F5)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF1565C0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final left = 20.0;
    final top = 25.0;
    final side = 42.0;

    final front = Path()
      ..moveTo(left, top + 15)
      ..lineTo(left + side, top + 15)
      ..lineTo(left + side, top + side + 15)
      ..lineTo(left, top + side + 15)
      ..close();

    final topFace = Path()
      ..moveTo(left, top + 15)
      ..lineTo(left + 15, top)
      ..lineTo(left + side + 15, top)
      ..lineTo(left + side, top + 15)
      ..close();

    final rightFace = Path()
      ..moveTo(left + side, top + 15)
      ..lineTo(left + side + 15, top)
      ..lineTo(left + side + 15, top + side)
      ..lineTo(left + side, top + side + 15)
      ..close();

    canvas.drawPath(front, paint);
    canvas.drawPath(topFace, Paint()
      ..color = const Color(0xFF90CAF9)
      ..style = PaintingStyle.fill);
    canvas.drawPath(rightFace, Paint()
      ..color = const Color(0xFF1E88E5)
      ..style = PaintingStyle.fill);

    canvas.drawPath(front, border);
    canvas.drawPath(topFace, border);
    canvas.drawPath(rightFace, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CuboidShapePainter extends CustomPainter {
  const CuboidShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final left = 12.0;
    final top = 30.0;
    final width = 60.0;
    final height = 38.0;

    final front = Path()
      ..moveTo(left, top)
      ..lineTo(left + width, top)
      ..lineTo(left + width, top + height)
      ..lineTo(left, top + height)
      ..close();

    final topFace = Path()
      ..moveTo(left, top)
      ..lineTo(left + 16, top - 15)
      ..lineTo(left + width + 16, top - 15)
      ..lineTo(left + width, top)
      ..close();

    final side = Path()
      ..moveTo(left + width, top)
      ..lineTo(left + width + 16, top - 15)
      ..lineTo(left + width + 16, top + height - 15)
      ..lineTo(left + width, top + height)
      ..close();

    canvas.drawPath(
      front,
      Paint()
        ..color = const Color(0xFFFF7043)
        ..style = PaintingStyle.fill,
    );

    canvas.drawPath(
      topFace,
      Paint()
        ..color = const Color(0xFFFFAB91)
        ..style = PaintingStyle.fill,
    );

    canvas.drawPath(
      side,
      Paint()
        ..color = const Color(0xFFE64A19)
        ..style = PaintingStyle.fill,
    );

    final border = Paint()
      ..color = const Color(0xFFBF360C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    canvas.drawPath(front, border);
    canvas.drawPath(topFace, border);
    canvas.drawPath(side, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CylinderShapePainter extends CustomPainter {
  const CylinderShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 55,
      height: 18,
    );

    final body = Path()
      ..moveTo(rect.left, rect.center.dy)
      ..lineTo(rect.left, rect.center.dy + 40)
      ..quadraticBezierTo(
        rect.center.dx,
        rect.center.dy + 52,
        rect.right,
        rect.center.dy + 40,
      )
      ..lineTo(rect.right, rect.center.dy)
      ..close();

    canvas.drawPath(
      body,
      Paint()
        ..color = const Color(0xFFAB47BC)
        ..style = PaintingStyle.fill,
    );

    canvas.drawOval(
      rect,
      Paint()
        ..color = const Color(0xFFCE93D8)
        ..style = PaintingStyle.fill,
    );

    final border = Paint()
      ..color = const Color(0xFF6A1B9A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    canvas.drawPath(body, border);
    canvas.drawOval(rect, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SphereShapePainter extends CustomPainter {
  const SphereShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = 30.0;

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFA5D6A7),
          const Color(0xFF43A047),
        ],
        center: const Alignment(-0.35, -0.35),
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      );

    canvas.drawCircle(center, radius, paint);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFF2E7D32)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ConeShapePainter extends CustomPainter {
  const ConeShapePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final topY = 12.0;
    final bottomY = size.height - 18;

    final path = Path()
      ..moveTo(centerX, topY)
      ..lineTo(centerX + 32, bottomY)
      ..quadraticBezierTo(
        centerX,
        bottomY + 12,
        centerX - 32,
        bottomY,
      )
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFFFCA28)
        ..style = PaintingStyle.fill,
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFF57F17)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// =====================================================================
// LINES
// =====================================================================

class PointPainter extends CustomPainter {
  const PointPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final point = Offset(
      size.width / 2,
      size.height / 2,
    );

    canvas.drawCircle(
      point,
      7,
      Paint()..color = const Color(0xFF5B5FEF),
    );

    const text = TextSpan(
      text: 'A',
      style: TextStyle(
        color: Color(0xFF20243A),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );

    final painter = TextPainter(
      text: text,
      textDirection: TextDirection.ltr,
    );

    painter.layout();
    painter.paint(
      canvas,
      point + const Offset(10, -10),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LinePainter extends CustomPainter {
  const LinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5B5FEF)
      ..strokeWidth = 3;

    final y = size.height / 2;

    canvas.drawLine(
      Offset(5, y),
      Offset(size.width - 5, y),
      paint,
    );

    canvas.drawLine(
      const Offset(5, 0),
      const Offset(0, 0),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - 5, y),
      Offset(size.width, y),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LineSegmentPainter extends CustomPainter {
  const LineSegmentPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5B5FEF)
      ..strokeWidth = 4;

    final y = size.height / 2;

    canvas.drawLine(
      Offset(15, y),
      Offset(size.width - 15, y),
      paint,
    );

    canvas.drawCircle(
      Offset(15, y),
      5,
      Paint()..color = const Color(0xFF20243A),
    );

    canvas.drawCircle(
      Offset(size.width - 15, y),
      5,
      Paint()..color = const Color(0xFF20243A),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RayPainter extends CustomPainter {
  const RayPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5B5FEF)
      ..strokeWidth = 4;

    final y = size.height / 2;

    canvas.drawCircle(
      Offset(15, y),
      5,
      Paint()..color = const Color(0xFF20243A),
    );

    canvas.drawLine(
      Offset(15, y),
      Offset(size.width - 10, y),
      paint,
    );

    final path = Path()
      ..moveTo(size.width - 10, y)
      ..lineTo(size.width - 20, y - 7)
      ..lineTo(size.width - 20, y + 7)
      ..close();

    canvas.drawPath(
      path,
      Paint()..color = const Color(0xFF5B5FEF),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// =====================================================================
// ANGLES
// =====================================================================

class AcuteAnglePainter extends CustomPainter {
  const AcuteAnglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    _drawAngle(
      canvas,
      size,
      -35,
      35,
      '45°',
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RightAnglePainter extends CustomPainter {
  const RightAnglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    _drawAngle(
      canvas,
      size,
      -90,
      0,
      '90°',
      showSquare: true,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ObtuseAnglePainter extends CustomPainter {
  const ObtuseAnglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    _drawAngle(
      canvas,
      size,
      -145,
      20,
      '120°',
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StraightAnglePainter extends CustomPainter {
  const StraightAnglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height * 0.65,
    );

    final paint = Paint()
      ..color = const Color(0xFF5B5FEF)
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(25, center.dy),
      Offset(size.width - 25, center.dy),
      paint,
    );

    canvas.drawCircle(
      center,
      6,
      Paint()..color = const Color(0xFF20243A),
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '180°',
        style: TextStyle(
          color: Color(0xFF20243A),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - 35,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void _drawAngle(
  Canvas canvas,
  Size size,
  double leftAngle,
  double rightAngle,
  String label, {
  bool showSquare = false,
}) {
  final center = Offset(
    size.width / 2,
    size.height * 0.70,
  );

  final radius = math.min(
    size.width,
    size.height,
  ) *
      0.42;

  final paint = Paint()
    ..color = const Color(0xFF5B5FEF)
    ..strokeWidth = 4
    ..style = PaintingStyle.stroke;

  final fill = Paint()
    ..color = const Color(0xFFEEF0FF)
    ..style = PaintingStyle.fill;

  final a1 = leftAngle * math.pi / 180;
  final a2 = rightAngle * math.pi / 180;

  final p1 = Offset(
    center.dx + radius * math.cos(a1),
    center.dy + radius * math.sin(a1),
  );

  final p2 = Offset(
    center.dx + radius * math.cos(a2),
    center.dy + radius * math.sin(a2),
  );

  final wedge = Path()
    ..moveTo(center.dx, center.dy)
    ..lineTo(p1.dx, p1.dy)
    ..arcToPoint(
      p2,
      radius: Radius.circular(radius),
      clockwise: true,
    )
    ..close();

  canvas.drawPath(wedge, fill);

  canvas.drawLine(center, p1, paint);
  canvas.drawLine(center, p2, paint);

  canvas.drawCircle(
    center,
    5,
    Paint()..color = const Color(0xFF20243A),
  );

  if (showSquare) {
    final sizeSquare = 22.0;

    final pA = Offset(
      center.dx,
      center.dy - sizeSquare,
    );

    final pB = Offset(
      center.dx + sizeSquare,
      center.dy - sizeSquare,
    );

    final pC = Offset(
      center.dx + sizeSquare,
      center.dy,
    );

    final squarePath = Path()
      ..moveTo(pA.dx, pA.dy)
      ..lineTo(pB.dx, pB.dy)
      ..lineTo(pC.dx, pC.dy);

    canvas.drawPath(
      squarePath,
      Paint()
        ..color = const Color(0xFF5B5FEF)
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke,
    );
  }

  final textPainter = TextPainter(
    text: TextSpan(
      text: label,
      style: const TextStyle(
        color: Color(0xFF20243A),
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout();

  textPainter.paint(
    canvas,
    Offset(
      center.dx - textPainter.width / 2,
      center.dy - radius * 0.55,
    ),
  );
}