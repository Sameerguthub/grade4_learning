import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'light_sound_practice.dart';

class LightSoundPage extends StatefulWidget {
  const LightSoundPage({super.key});

  @override
  State<LightSoundPage> createState() => _LightSoundPageState();
}

class _LightSoundPageState extends State<LightSoundPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedLight = 0;

  final List<_LightType> lightTypes = const [
    _LightType(
      title: 'Natural Light',
      icon: Icons.wb_sunny_rounded,
      color: Color(0xFFFFA000),
      description:
          'Natural light comes from nature. The Sun is the main natural source of light for Earth.',
      examples: 'Sun, stars, lightning',
    ),
    _LightType(
      title: 'Artificial Light',
      icon: Icons.lightbulb_rounded,
      color: Color(0xFFFF8F00),
      description:
          'Artificial light is produced by people using devices and electrical energy.',
      examples: 'Bulb, torch, lamp',
    ),
    _LightType(
      title: 'Luminous',
      icon: Icons.brightness_7_rounded,
      color: Color(0xFFE65100),
      description:
          'Luminous objects produce their own light.',
      examples: 'Sun, candle flame, electric bulb',
    ),
    _LightType(
      title: 'Non-Luminous',
      icon: Icons.brightness_4_rounded,
      color: Color(0xFF546E7A),
      description:
          'Non-luminous objects do not produce their own light. We see them when light falls on them.',
      examples: 'Book, chair, Moon',
    ),
  ];

  final List<_SoundCard> sounds = const [
    _SoundCard(
      title: 'Music',
      icon: Icons.music_note_rounded,
      color: Color(0xFF7E57C2),
      text:
          'Musical instruments and voices can produce sounds that we enjoy listening to.',
    ),
    _SoundCard(
      title: 'Communication',
      icon: Icons.record_voice_over_rounded,
      color: Color(0xFF1976D2),
      text:
          'We use sound when we speak and communicate with other people.',
    ),
    _SoundCard(
      title: 'Warning Sounds',
      icon: Icons.warning_rounded,
      color: Color(0xFFE53935),
      text:
          'Alarms, horns and sirens can warn us about danger or get our attention.',
    ),
    _SoundCard(
      title: 'Nature Sounds',
      icon: Icons.nature_rounded,
      color: Color(0xFF2E7D32),
      text:
          'Birds, animals, flowing water, wind and thunder can produce sounds in nature.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
      backgroundColor: const Color(0xFFFFFBF4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Light & Sound',
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
              _buildHero(),

              const SizedBox(height: 25),

              _sectionTitle(
                'What is Light?',
                Icons.light_mode_rounded,
              ),

              const SizedBox(height: 11),

              _infoCard(
                Icons.light_mode_rounded,
                const Color(0xFFFFA000),
                'Light is a form of energy that allows us to see objects. Without enough light, our eyes cannot see things clearly.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Sources of Light',
                Icons.wb_sunny_rounded,
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 112,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: lightTypes.length,
                  itemBuilder: (context, index) {
                    final item = lightTypes[index];
                    final selected = selectedLight == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLight = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 115,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: selected ? item.color : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item.icon,
                              size: 31,
                              color: selected
                                  ? Colors.white
                                  : item.color,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w800,
                                color: selected
                                    ? Colors.white
                                    : const Color(0xFF424A4D),
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

              _selectedLight(),

              const SizedBox(height: 25),

              _sectionTitle(
                'How Does Light Help Us?',
                Icons.visibility_rounded,
              ),

              const SizedBox(height: 12),

              _buildLightUses(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Transparent, Translucent & Opaque',
                Icons.layers_rounded,
              ),

              const SizedBox(height: 12),

              _buildMaterialsWithLight(),

              const SizedBox(height: 25),

              _sectionTitle(
                'What is Sound?',
                Icons.volume_up_rounded,
              ),

              const SizedBox(height: 11),

              _infoCard(
                Icons.volume_up_rounded,
                const Color(0xFF7E57C2),
                'Sound is a form of energy that we can hear. Sound is produced when objects vibrate.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Sounds Around Us',
                Icons.hearing_rounded,
              ),

              const SizedBox(height: 12),

              _buildSoundCards(),

              const SizedBox(height: 25),

              _sectionTitle(
                'How is Sound Produced?',
                Icons.graphic_eq_rounded,
              ),

              const SizedBox(height: 12),

              _buildSoundProduction(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Loud and Soft Sounds',
                Icons.volume_up_rounded,
              ),

              const SizedBox(height: 12),

              _buildLoudSoft(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Noise Pollution',
                Icons.volume_off_rounded,
              ),

              const SizedBox(height: 12),

              _buildNoisePollution(),

              const SizedBox(height: 25),

              _quickFacts(),

              const SizedBox(height: 28),

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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFA000),
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
                  Icons.lightbulb_rounded,
                  color: Colors.white,
                  size: 43,
                ),
                SizedBox(height: 12),
                Text(
                  'Let’s Explore Light & Sound!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover how we see, hear and understand the world around us.',
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
            height: 120,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  painter: _LightSoundPainter(
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
          Icon(icon, color: color, size: 29),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5E625F),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedLight() {
    final item = lightTypes[selectedLight];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(selectedLight),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: item.color.withValues(alpha: .18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: .11),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 29,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      color: item.color,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF5E6561),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Examples: ${item.examples}',
                    style: TextStyle(
                      fontSize: 12,
                      color: item.color,
                      fontWeight: FontWeight.w700,
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

  Widget _buildLightUses() {
    final items = [
      (
        Icons.visibility_rounded,
        'Seeing Objects',
        'Light allows our eyes to see objects around us.',
      ),
      (
        Icons.wb_sunny_rounded,
        'Plants',
        'Plants need sunlight to make their food.',
      ),
      (
        Icons.home_rounded,
        'Lighting Homes',
        'Lamps and bulbs provide light when it is dark.',
      ),
      (
        Icons.navigation_rounded,
        'Finding Our Way',
        'Light helps us see roads and surroundings safely.',
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
                color: const Color(0xFFFFA000),
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
                        color: Color(0xFF666D69),
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

  Widget _buildMaterialsWithLight() {
    final items = [
      (
        Icons.blur_on_rounded,
        'Transparent',
        'Light passes through clearly.',
        'Clear glass',
        Color(0xFF1976D2),
      ),
      (
        Icons.blur_circular_rounded,
        'Translucent',
        'Some light passes through, but objects cannot be seen clearly.',
        'Frosted glass',
        Color(0xFF7E57C2),
      ),
      (
        Icons.block_rounded,
        'Opaque',
        'Light cannot pass through.',
        'Wood',
        Color(0xFF795548),
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
                color: item.$5,
                size: 29,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: item.$5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF626A67),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Example: ${item.$4}',
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: item.$5,
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

  Widget _buildSoundCards() {
    return Column(
      children: sounds.map((sound) {
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
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: sound.color.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  sound.icon,
                  color: sound.color,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sound.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: sound.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      sound.text,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF626A67),
                        height: 1.4,
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

  Widget _buildSoundProduction() {
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
                Icons.graphic_eq_rounded,
                color: Color(0xFF7E57C2),
                size: 35,
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF9E9E9E),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.hearing_rounded,
                color: Color(0xFF1976D2),
                size: 35,
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Text(
            'When an object vibrates, it can produce sound. The vibrations travel through a medium and reach our ears.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF606966),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoudSoft() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _soundLevelCard(
            Icons.volume_up_rounded,
            'Loud',
            'Thunder, a horn or a loudspeaker can produce strong sounds.',
            const Color(0xFFE53935),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _soundLevelCard(
            Icons.volume_down_rounded,
            'Soft',
            'A whisper or quiet rustling leaves can produce softer sounds.',
            const Color(0xFF1976D2),
          ),
        ),
      ],
    );
  }

  Widget _soundLevelCard(
    IconData icon,
    String title,
    String text,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 35),
          const SizedBox(height: 7),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF606865),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoisePollution() {
    return _infoCard(
      Icons.volume_off_rounded,
      const Color(0xFFE53935),
      'Very loud and unwanted sounds can cause noise pollution. We can reduce it by avoiding unnecessary honking, keeping music at a reasonable volume and respecting quiet places.',
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
                color: Color(0xFFFFA000),
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
            '• The Sun is a natural source of light.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• We need light to see objects.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Sound is produced by vibrations.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
          SizedBox(height: 5),
          Text(
            '• Very loud unwanted sound can cause noise pollution.',
            style: TextStyle(fontSize: 13, height: 1.45),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const LightSoundPracticePage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz_rounded),
        label: const Text(
          'Start Light & Sound Practice',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
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
    );
  }
}

class _LightType {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String examples;

  const _LightType({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.examples,
  });
}

class _SoundCard {
  final String title;
  final IconData icon;
  final Color color;
  final String text;

  const _SoundCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.text,
  });
}

class _LightSoundPainter extends CustomPainter {
  final double animation;

  _LightSoundPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    final pulse = 5 + animation * 8;

    paint.color = const Color(0xFFFFD54F);

    canvas.drawCircle(
      Offset(size.width * .48, size.height * .42),
      23,
      paint,
    );

    paint.color = const Color(0xFFFFF59D);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;

      final start = Offset(
        size.width * .48 + math.cos(angle) * 29,
        size.height * .42 + math.sin(angle) * 29,
      );

      final end = Offset(
        size.width * .48 + math.cos(angle) * (35 + pulse / 2),
        size.height * .42 + math.sin(angle) * (35 + pulse / 2),
      );

      canvas.drawLine(start, end, paint);
    }

    paint.style = PaintingStyle.stroke;
    paint.color = Colors.white.withValues(alpha: .8);
    paint.strokeWidth = 2;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(
          size.width * .48,
          size.height * .42,
        ),
        width: 80 + pulse,
        height: 80 + pulse,
      ),
      -0.7,
      1.4,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(
          size.width * .48,
          size.height * .42,
        ),
        width: 100 + pulse,
        height: 100 + pulse,
      ),
      -0.55,
      1.1,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _LightSoundPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}