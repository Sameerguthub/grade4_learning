import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'earth_space_practice.dart';

class EarthSpacePage extends StatefulWidget {
  const EarthSpacePage({super.key});

  @override
  State<EarthSpacePage> createState() => _EarthSpacePageState();
}

class _EarthSpacePageState extends State<EarthSpacePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedTopic = 0;

  final List<_SpaceTopic> topics = const [
    _SpaceTopic(
      title: 'Earth',
      icon: Icons.public_rounded,
      color: Color(0xFF1976D2),
      text:
          'Earth is the planet on which we live. It has land, water and an atmosphere that supports life.',
    ),
    _SpaceTopic(
      title: 'Sun',
      icon: Icons.wb_sunny_rounded,
      color: Color(0xFFFFA000),
      text:
          'The Sun is a star. It gives Earth light and heat and is very important for life.',
    ),
    _SpaceTopic(
      title: 'Moon',
      icon: Icons.nightlight_round,
      color: Color(0xFF5E6B73),
      text:
          'The Moon is Earth’s natural satellite. It moves around Earth and reflects light from the Sun.',
    ),
    _SpaceTopic(
      title: 'Stars',
      icon: Icons.stars_rounded,
      color: Color(0xFF7E57C2),
      text:
          'Stars are huge, hot balls of gases that give out their own light and heat.',
    ),
    _SpaceTopic(
      title: 'Planets',
      icon: Icons.language_rounded,
      color: Color(0xFF00897B),
      text:
          'Planets are large objects that move around stars. Our solar system has eight planets.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
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
      backgroundColor: const Color(0xFFF4F6FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Earth & Space',
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
                'Our Home — Earth',
                Icons.public_rounded,
              ),

              const SizedBox(height: 11),

              _infoCard(
                Icons.public_rounded,
                const Color(0xFF1976D2),
                'Earth is the third planet from the Sun. It has land, oceans, an atmosphere and the right conditions for many forms of life.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Explore Space',
                Icons.explore_rounded,
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    final selected = selectedTopic == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTopic = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 105,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selected
                              ? topic.color
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              topic.icon,
                              color: selected
                                  ? Colors.white
                                  : topic.color,
                              size: 31,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              topic.title,
                              style: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : const Color(0xFF37434A),
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
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

              _selectedTopic(),

              const SizedBox(height: 25),

              _sectionTitle(
                'The Solar System',
                Icons.blur_on_rounded,
              ),

              const SizedBox(height: 12),

              _solarSystem(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Earth’s Rotation',
                Icons.sync_rounded,
              ),

              const SizedBox(height: 12),

              _rotationCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Day and Night',
                Icons.wb_sunny_rounded,
              ),

              const SizedBox(height: 12),

              _dayNight(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Earth’s Revolution',
                Icons.all_inclusive_rounded,
              ),

              const SizedBox(height: 12),

              _revolutionCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'The Moon',
                Icons.nightlight_round,
              ),

              const SizedBox(height: 12),

              _moonCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Space Exploration',
                Icons.rocket_launch_rounded,
              ),

              const SizedBox(height: 12),

              _explorationCard(),

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
                            const EarthSpacePracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.quiz_rounded),
                  label: const Text(
                    'Start Earth & Space Practice',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3949AB),
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
            Color(0xFF3949AB),
            Color(0xFF1A237E),
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
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 43,
                ),
                SizedBox(height: 12),
                Text(
                  'Journey Through Earth & Space!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover our planet, the Sun, Moon, stars and the amazing solar system.',
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
            width: 92,
            height: 125,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  painter: _SpacePainter(
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
            color: const Color(0xFFE8EAF6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF3949AB),
            size: 21,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
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
                height: 1.5,
                color: Color(0xFF56616A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedTopic() {
    final topic = topics[selectedTopic];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(selectedTopic),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: topic.color.withValues(alpha: .18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 53,
              height: 53,
              decoration: BoxDecoration(
                color: topic.color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                topic.icon,
                color: topic.color,
                size: 28,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    style: TextStyle(
                      color: topic.color,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    topic.text,
                    style: const TextStyle(
                      fontSize: 13.5,
                      height: 1.45,
                      color: Color(0xFF5D6870),
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

  Widget _solarSystem() {
    final planets = [
      ('Mercury', Color(0xFF8D8D8D)),
      ('Venus', Color(0xFFD39B58)),
      ('Earth', Color(0xFF1976D2)),
      ('Mars', Color(0xFFD84315)),
      ('Jupiter', Color(0xFF9C7353)),
      ('Saturn', Color(0xFFD6B778)),
      ('Uranus', Color(0xFF4DB6AC)),
      ('Neptune', Color(0xFF3949AB)),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.wb_sunny_rounded,
                color: Color(0xFFFFA000),
                size: 28,
              ),
              SizedBox(width: 9),
              Text(
                'Sun',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(
                  '→ The center of our solar system',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF68737A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 9,
            runSpacing: 9,
            children: planets.asMap().entries.map((entry) {
              final index = entry.key;
              final planet = entry.value;

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: planet.$2.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: index == 4 ? 20 : 14,
                      height: index == 4 ? 20 : 14,
                      decoration: BoxDecoration(
                        color: planet.$2,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${index + 1}. ${planet.$1}',
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _rotationCard() {
    return _explanationCard(
      icon: Icons.sync_rounded,
      color: const Color(0xFF3949AB),
      title: 'Earth spins on its axis',
      text:
          'Earth rotates around an imaginary line called its axis. One complete rotation takes about 24 hours.',
      points: const [
        'Rotation causes day and night.',
        'Earth rotates from west to east.',
        'One rotation takes about one day.',
      ],
    );
  }

  Widget _dayNight() {
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
            children: [
              Expanded(
                child: _dayNightItem(
                  Icons.wb_sunny_rounded,
                  'Day',
                  'The side facing the Sun receives sunlight.',
                  const Color(0xFFFFA000),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _dayNightItem(
                  Icons.nightlight_round,
                  'Night',
                  'The side facing away from the Sun is darker.',
                  const Color(0xFF3949AB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'As Earth rotates, different parts of Earth move into and out of sunlight.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: Color(0xFF657078),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dayNightItem(
    IconData icon,
    String title,
    String text,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 7),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF606B72),
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _revolutionCard() {
    return _explanationCard(
      icon: Icons.all_inclusive_rounded,
      color: const Color(0xFF00897B),
      title: 'Earth moves around the Sun',
      text:
          'Earth travels around the Sun along a path called its orbit. One complete revolution takes about 365 days.',
      points: const [
        'Earth takes about one year to orbit the Sun.',
        'The path around the Sun is called an orbit.',
        'Earth’s revolution is connected with the yearly cycle.',
      ],
    );
  }

  Widget _moonCard() {
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
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  color: Color(0xFFECEFF1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.nightlight_round,
                  color: Color(0xFF546E7A),
                  size: 33,
                ),
              ),
              const SizedBox(width: 13),
              const Expanded(
                child: Text(
                  'Earth’s Natural Satellite',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'The Moon travels around Earth. It does not produce its own light. We see sunlight reflected from its surface.',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF5E6970),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _explorationCard() {
    final items = [
      (
        Icons.satellite_alt_rounded,
        'Satellites',
        'Machines sent into space to collect information and communicate.',
      ),
      (
        Icons.rocket_launch_rounded,
        'Rockets',
        'Vehicles used to carry people and equipment into space.',
      ),
      (
        Icons.science_rounded,
        'Space Science',
        'Scientists study planets, stars and other objects in space.',
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
                color: const Color(0xFF3949AB),
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
                        color: Color(0xFF667178),
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
              color: Color(0xFF5E6970),
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
                        color: Color(0xFF59646B),
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
            Color(0xFFE8EAF6),
            Color(0xFFF3F4FF),
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
                color: Color(0xFF5E35B1),
              ),
              SizedBox(width: 8),
              Text(
                'Quick Space Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Text(
            '• The Sun is a star.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Earth is the third planet from the Sun.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Earth has one natural satellite — the Moon.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Our solar system has eight planets.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Light from the Sun is essential for life on Earth.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _SpaceTopic {
  final String title;
  final IconData icon;
  final Color color;
  final String text;

  const _SpaceTopic({
    required this.title,
    required this.icon,
    required this.color,
    required this.text,
  });
}

class _SpacePainter extends CustomPainter {
  final double animation;

  _SpacePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    paint.color = const Color(0xFF283593);
    canvas.drawCircle(
      Offset(size.width * .5, size.height * .52),
      30,
      paint,
    );

    paint.color = const Color(0xFF42A5F5);
    canvas.drawCircle(
      Offset(size.width * .43, size.height * .45),
      7,
      paint,
    );

    paint.color = const Color(0xFF66BB6A);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(
          size.width * .57,
          size.height * .58,
        ),
        width: 17,
        height: 10,
      ),
      paint,
    );

    paint.color = const Color(0xFFFFD54F);

    final orbitAngle = animation * math.pi * 2;

    final moonX =
        size.width * .5 + math.cos(orbitAngle) * 42;
    final moonY =
        size.height * .52 + math.sin(orbitAngle) * 42;

    canvas.drawCircle(
      Offset(moonX, moonY),
      8,
      paint,
    );

    paint.color = Colors.white;

    final stars = [
      Offset(12, 15),
      Offset(72, 25),
      Offset(22, 85),
      Offset(80, 100),
      Offset(48, 8),
    ];

    for (final star in stars) {
      canvas.drawCircle(star, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SpacePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}