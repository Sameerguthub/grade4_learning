
import 'package:flutter/material.dart';

class ShapesGeometryPage extends StatelessWidget {
  const ShapesGeometryPage({super.key});

  static const shapes = [
    ['Circle', '0 sides • 0 corners', Icons.circle_rounded],
    ['Triangle', '3 sides • 3 corners', Icons.change_history_rounded],
    ['Square', '4 equal sides • 4 corners', Icons.square_rounded],
    ['Rectangle', '4 sides • 4 corners', Icons.rectangle_rounded],
    ['Oval', 'Curved shape • 0 corners', Icons.circle_outlined],
    ['Pentagon', '5 sides • 5 corners', Icons.pentagon_rounded],
    ['Hexagon', '6 sides • 6 corners', Icons.hexagon_rounded],
  ];

  static const geometry = [
    ['Side', 'A straight edge of a shape.'],
    ['Corner / Vertex', 'The point where two sides meet.'],
    ['Angle', 'The space between two lines.'],
    ['Line', 'A straight path extending in both directions.'],
    ['Point', 'An exact position or location.'],
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFE8E8),
      const Color(0xFFE8F5E9),
      const Color(0xFFFFF3CD),
      const Color(0xFFF0E5FF),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Shapes & Geometry',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Basic Shapes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shapes.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      shapes[index][2] as IconData,
                      size: 55,
                      color: const Color(0xFF5B5FEF),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      shapes[index][0] as String,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      shapes[index][1] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF74788D),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 25),

          const Text(
            'Basic Geometry',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 12),

          ...List.generate(geometry.length, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    geometry[index][0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF20243A),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    geometry[index][1],
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF74788D),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
