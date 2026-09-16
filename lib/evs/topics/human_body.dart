import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'human_body_practice.dart';

class HumanBodyPage extends StatefulWidget {
  const HumanBodyPage({super.key});

  @override
  State<HumanBodyPage> createState() => _HumanBodyPageState();
}

class _HumanBodyPageState extends State<HumanBodyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int selectedPart = 0;

  final List<_BodyPart> bodyParts = [
    _BodyPart(
      name: 'Brain',
      icon: Icons.psychology_rounded,
      color: Color(0xFF8E5DE7),
      description:
          'The brain is the control centre of the body. It helps us think, learn, remember, feel and control our movements.',
    ),
    _BodyPart(
      name: 'Heart',
      icon: Icons.favorite_rounded,
      color: Color(0xFFE53935),
      description:
          'The heart is a muscular organ that pumps blood around the body. It works continuously, even when we sleep.',
    ),
    _BodyPart(
      name: 'Lungs',
      icon: Icons.air_rounded,
      color: Color(0xFF26A69A),
      description:
          'The lungs help us breathe. They take oxygen from the air and remove carbon dioxide from the body.',
    ),
    _BodyPart(
      name: 'Stomach',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFFF8A4C),
      description:
          'The stomach is part of the digestive system. It helps break down the food we eat.',
    ),
    _BodyPart(
      name: 'Bones',
      icon: Icons.accessibility_new_rounded,
      color: Color(0xFF795548),
      description:
          'Bones form the skeleton. They give our body shape, support and protection.',
    ),
    _BodyPart(
      name: 'Muscles',
      icon: Icons.fitness_center_rounded,
      color: Color(0xFFEF6C00),
      description:
          'Muscles help different parts of our body move. They work together with bones to help us walk, run and play.',
    ),
  ];

  final List<_Sense> senses = [
    _Sense(
      icon: Icons.visibility_rounded,
      name: 'Eyes',
      sense: 'Sight',
      description: 'Help us see the world around us.',
      color: Color(0xFF3949AB),
    ),
    _Sense(
      icon: Icons.hearing_rounded,
      name: 'Ears',
      sense: 'Hearing',
      description: 'Help us hear sounds.',
      color: Color(0xFF7E57C2),
    ),
    _Sense(
      icon: Icons.air_rounded,
      name: 'Nose',
      sense: 'Smell',
      description: 'Helps us detect different smells.',
      color: Color(0xFF26A69A),
    ),
    _Sense(
      icon: Icons.restaurant_rounded,
      name: 'Tongue',
      sense: 'Taste',
      description: 'Helps us taste different foods.',
      color: Color(0xFFE53935),
    ),
    _Sense(
      icon: Icons.touch_app_rounded,
      name: 'Skin',
      sense: 'Touch',
      description: 'Helps us feel hot, cold, soft and hard things.',
      color: Color(0xFFFF8A4C),
    ),
  ];

  final List<_HealthyHabit> habits = [
    _HealthyHabit(
      icon: Icons.restaurant_rounded,
      title: 'Eat Healthy Food',
      text: 'Eat fruits, vegetables, grains and other nutritious foods.',
    ),
    _HealthyHabit(
      icon: Icons.water_drop_rounded,
      title: 'Drink Water',
      text: 'Drink enough clean water throughout the day.',
    ),
    _HealthyHabit(
      icon: Icons.directions_run_rounded,
      title: 'Stay Active',
      text: 'Play, exercise and move your body every day.',
    ),
    _HealthyHabit(
      icon: Icons.bedtime_rounded,
      title: 'Sleep Well',
      text: 'Good sleep helps your body and brain rest and grow.',
    ),
    _HealthyHabit(
      icon: Icons.clean_hands_rounded,
      title: 'Stay Clean',
      text: 'Wash your hands and keep your body clean.',
    ),
    _HealthyHabit(
      icon: Icons.brush_rounded,
      title: 'Care for Teeth',
      text: 'Brush your teeth twice a day and visit a dentist regularly.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF252333),
        elevation: 0,
        title: const Text(
          'Human Body',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
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

              const SizedBox(height: 24),

              _sectionTitle(
                'Our Amazing Body',
                Icons.accessibility_new_rounded,
              ),

              const SizedBox(height: 10),

              _buildInfoCard(
                Icons.lightbulb_rounded,
                const Color(0xFF8E5DE7),
                'The human body is made of many parts that work together. Each part has an important job that helps us live, learn, move and grow.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Main Parts of the Body',
                Icons.account_tree_rounded,
              ),

              const SizedBox(height: 6),

              const Text(
                'Tap a body part to learn what it does.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF777284),
                ),
              ),

              const SizedBox(height: 14),

              _buildBodyDiagram(),

              const SizedBox(height: 13),

              _buildPartSelector(),

              const SizedBox(height: 12),

              _buildSelectedPart(),

              const SizedBox(height: 27),

              _sectionTitle(
                'The Skeleton',
                Icons.accessibility_new_rounded,
              ),

              const SizedBox(height: 12),

              _buildSkeletonCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Muscles and Movement',
                Icons.fitness_center_rounded,
              ),

              const SizedBox(height: 12),

              _buildMuscleCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Heart and Blood',
                Icons.favorite_rounded,
              ),

              const SizedBox(height: 12),

              _buildHeartCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Breathing and Lungs',
                Icons.air_rounded,
              ),

              const SizedBox(height: 12),

              _buildLungsCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Digestion',
                Icons.restaurant_rounded,
              ),

              const SizedBox(height: 12),

              _buildDigestiveCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Five Sense Organs',
                Icons.visibility_rounded,
              ),

              const SizedBox(height: 12),

              ...senses.map(_buildSenseCard),

              const SizedBox(height: 25),

              _sectionTitle(
                'Our Teeth',
                Icons.medical_services_rounded,
              ),

              const SizedBox(height: 12),

              _buildTeethCard(),

              const SizedBox(height: 25),

              _sectionTitle(
                'Healthy Habits',
                Icons.favorite_border_rounded,
              ),

              const SizedBox(height: 12),

              ...habits.map(_buildHabitCard),

              const SizedBox(height: 25),

              _buildQuickFacts(),

              const SizedBox(height: 28),

              _buildPracticeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================================
  // HERO
  // =========================================================================

  Widget _buildHero() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8E5DE7),
            Color(0xFF5E35B1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.17),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.white,
                  size: 43,
                ),
                SizedBox(height: 12),
                Text(
                  'Explore Your Body!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover bones, muscles, organs, senses and healthy habits.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: 95,
            height: 140,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final scale =
                    0.95 +
                    math.sin(
                          _animationController.value * math.pi * 2,
                        ) *
                        0.04;

                return Transform.scale(
                  scale: scale,
                  child: CustomPaint(
                    painter: _HumanFigurePainter(
                      animationValue:
                          _animationController.value,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // SECTION TITLE
  // =========================================================================

  Widget _sectionTitle(
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFF0EAFE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6A3FC5),
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
              color: Color(0xFF252333),
            ),
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // INFO CARD
  // =========================================================================

  Widget _buildInfoCard(
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
          Icon(
            icon,
            color: color,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14.5,
                color: Color(0xFF5F596B),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // BODY DIAGRAM
  // =========================================================================

  Widget _buildBodyDiagram() {
    return Container(
      width: double.infinity,
      height: 330,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: CustomPaint(
        painter: _BodyDiagramPainter(
          selectedPart: selectedPart,
        ),
      ),
    );
  }

  // =========================================================================
  // PART SELECTOR
  // =========================================================================

  Widget _buildPartSelector() {
    return SizedBox(
      height: 77,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: bodyParts.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final part = bodyParts[index];
          final selected = selectedPart == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedPart = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 82,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? part.color
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: selected
                      ? part.color
                      : const Color(0xFFE3DFEA),
                ),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    part.icon,
                    size: 23,
                    color: selected
                        ? Colors.white
                        : part.color,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    part.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? Colors.white
                          : const Color(0xFF514C59),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // =========================================================================
  // SELECTED PART
  // =========================================================================

  Widget _buildSelectedPart() {
    final part = bodyParts[selectedPart];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(part.name),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: part.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: part.color.withValues(alpha: 0.18),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              part.icon,
              color: part.color,
              size: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    part.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: part.color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    part.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF5F596B),
                      height: 1.45,
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

  // =========================================================================
  // SKELETON
  // =========================================================================

  Widget _buildSkeletonCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 210,
            child: CustomPaint(
              painter: _SkeletonPainter(),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Your skeleton is the framework of your body.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Bones give your body shape and support. They also protect important organs such as the brain, heart and lungs.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF6B6571),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // MUSCLES
  // =========================================================================

  Widget _buildMuscleCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF3E8),
            Color(0xFFFFFAF6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 120,
            child: CustomPaint(
              painter: _MusclePainter(),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Muscles help us move',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFEF6C00),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Muscles pull on bones to create movement. They help us walk, run, jump, smile and even breathe.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF665F58),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // HEART
  // =========================================================================

  Widget _buildHeartCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final beat =
                  math.sin(
                    _animationController.value *
                        math.pi *
                        2,
                  );

              final scale = 1.0 + (beat > 0 ? beat * 0.08 : 0);

              return Transform.scale(
                scale: scale,
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFFE53935),
                  size: 70,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          const Text(
            'The Heart Pumps Blood',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFFE53935),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'The heart pumps blood through blood vessels. Blood carries oxygen and nutrients to different parts of the body.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF665F67),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              _heartStep(
                Icons.favorite_rounded,
                'Heart',
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF9E9E9E),
              ),
              _heartStep(
                Icons.bloodtype_rounded,
                'Blood',
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF9E9E9E),
              ),
              _heartStep(
                Icons.accessibility_new_rounded,
                'Body',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heartStep(
    IconData icon,
    String label,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFFE53935),
          size: 25,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // =========================================================================
  // LUNGS
  // =========================================================================

  Widget _buildLungsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final scale =
                  0.92 +
                  (_animationController.value * 0.08);

              return Transform.scale(
                scale: scale,
                child: const Icon(
                  Icons.air_rounded,
                  color: Color(0xFF26A69A),
                  size: 70,
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          const Text(
            'The Lungs Help Us Breathe',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'When we breathe in, oxygen enters our lungs. When we breathe out, carbon dioxide leaves our body.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF596866),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              _breathingChip(
                'Breathe In',
                Icons.south_rounded,
                const Color(0xFF1E88E5),
              ),
              const SizedBox(width: 9),
              _breathingChip(
                'Breathe Out',
                Icons.north_rounded,
                const Color(0xFF26A69A),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _breathingChip(
    String text,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // DIGESTION
  // =========================================================================

  Widget _buildDigestiveCard() {
    final organs = [
      (
        Icons.restaurant_rounded,
        'Mouth',
        'Chews food',
      ),
      (
        Icons.arrow_downward_rounded,
        'Food Pipe',
        'Moves food down',
      ),
      (
        Icons.circle_rounded,
        'Stomach',
        'Breaks down food',
      ),
      (
        Icons.loop_rounded,
        'Intestines',
        'Absorb nutrients',
      ),
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
          const Text(
            'The Journey of Food',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFF7043),
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(
            organs.length,
            (index) {
              final item = organs[index];

              return Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0EA),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item.$1,
                      color: const Color(0xFFFF7043),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 11),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.$2,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          item.$3,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF77716E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < organs.length - 1)
                    const Icon(
                      Icons.arrow_downward_rounded,
                      color: Color(0xFFFFAB91),
                      size: 20,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // SENSE CARDS
  // =========================================================================

  Widget _buildSenseCard(_Sense sense) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: sense.color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              sense.icon,
              color: sense.color,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  '${sense.name} — ${sense.sense}',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: sense.color,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  sense.description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF69636F),
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

  // =========================================================================
  // TEETH
  // =========================================================================

  Widget _buildTeethCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.medical_services_rounded,
            color: Color(0xFF42A5F5),
            size: 55,
          ),
          const SizedBox(height: 9),
          const Text(
            'Teeth Help Us Eat',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1976D2),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Teeth help us bite and chew food. We should brush our teeth twice a day and avoid too many sugary foods.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF606970),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              _toothTip(
                Icons.wb_sunny_rounded,
                'Morning',
              ),
              const SizedBox(width: 10),
              _toothTip(
                Icons.nightlight_rounded,
                'Night',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toothTip(
    IconData icon,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF1976D2),
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1976D2),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // HEALTHY HABITS
  // =========================================================================

  Widget _buildHabitCard(_HealthyHabit habit) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            habit.icon,
            color: const Color(0xFF8E5DE7),
            size: 27,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  habit.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF403A49),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  habit.text,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF706A75),
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

  // =========================================================================
  // QUICK FACTS
  // =========================================================================

  Widget _buildQuickFacts() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF3ECFF),
            Color(0xFFFAF8FF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.stars_rounded,
                color: Color(0xFF8E5DE7),
                size: 27,
              ),
              SizedBox(width: 9),
              Text(
                'Amazing Body Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '• Your brain helps control almost everything you do.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Your heart pumps blood throughout your body.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Your skeleton gives your body shape and protects important organs.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Your skin is the largest organ of your body.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // PRACTICE BUTTON
  // =========================================================================

  Widget _buildPracticeButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  const HumanBodyPracticePage(),
            ),
          );
        },
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Practice Human Body',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A3FC5),
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// DATA MODELS
// ============================================================================

class _BodyPart {
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const _BodyPart({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class _Sense {
  final IconData icon;
  final String name;
  final String sense;
  final String description;
  final Color color;

  const _Sense({
    required this.icon,
    required this.name,
    required this.sense,
    required this.description,
    required this.color,
  });
}

class _HealthyHabit {
  final IconData icon;
  final String title;
  final String text;

  const _HealthyHabit({
    required this.icon,
    required this.title,
    required this.text,
  });
}

// ============================================================================
// HUMAN FIGURE PAINTER
// ============================================================================

class _HumanFigurePainter extends CustomPainter {
  final double animationValue;

  _HumanFigurePainter({
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final bodyPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final outlinePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Head
    canvas.drawCircle(
      Offset(centerX, 25),
      18,
      bodyPaint,
    );

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, 66),
          width: 32,
          height: 62,
        ),
        const Radius.circular(13),
      ),
      bodyPaint,
    );

    // Arms
    final movement =
        math.sin(animationValue * math.pi * 2) * 5;

    canvas.drawLine(
      Offset(centerX - 14, 50),
      Offset(centerX - 32, 83 + movement),
      outlinePaint,
    );

    canvas.drawLine(
      Offset(centerX + 14, 50),
      Offset(centerX + 32, 83 - movement),
      outlinePaint,
    );

    // Legs
    canvas.drawLine(
      Offset(centerX - 9, 94),
      Offset(centerX - 17, 128),
      outlinePaint,
    );

    canvas.drawLine(
      Offset(centerX + 9, 94),
      Offset(centerX + 17, 128),
      outlinePaint,
    );

    // Heart
    final heartPaint = Paint()
      ..color = const Color(0xFFFFCDD2);

    canvas.drawCircle(
      Offset(centerX + 5, 57),
      6,
      heartPaint,
    );
  }

  @override
  bool shouldRepaint(
    covariant _HumanFigurePainter oldDelegate,
  ) {
    return oldDelegate.animationValue !=
        animationValue;
  }
}

// ============================================================================
// BODY DIAGRAM PAINTER
// ============================================================================

class _BodyDiagramPainter extends CustomPainter {
  final int selectedPart;

  _BodyDiagramPainter({
    required this.selectedPart,
  });

  Color _highlight(
    int index,
    Color normal,
  ) {
    return selectedPart == index
        ? normal.withValues(alpha: 0.95)
        : normal.withValues(alpha: 0.60);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final skinPaint = Paint()
      ..color = const Color(0xFFFFCCBC);

    final bodyPaint = Paint()
      ..color = const Color(0xFFF5B9A8);

    // Head
    canvas.drawCircle(
      Offset(centerX, 42),
      29,
      skinPaint,
    );

    // Neck
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, 75),
        width: 20,
        height: 20,
      ),
      skinPaint,
    );

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, 125),
          width: 75,
          height: 95,
        ),
        const Radius.circular(27),
      ),
      bodyPaint,
    );

    // Arms
    final armPaint = Paint()
      ..color = skinPaint.color
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX - 35, 94),
      Offset(centerX - 61, 174),
      armPaint,
    );

    canvas.drawLine(
      Offset(centerX + 35, 94),
      Offset(centerX + 61, 174),
      armPaint,
    );

    // Legs
    final legPaint = Paint()
      ..color = const Color(0xFF90CAF9)
      ..strokeWidth = 23
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX - 19, 171),
      Offset(centerX - 23, 268),
      legPaint,
    );

    canvas.drawLine(
      Offset(centerX + 19, 171),
      Offset(centerX + 23, 268),
      legPaint,
    );

    // Brain
    canvas.drawCircle(
      Offset(centerX, 40),
      17,
      Paint()
        ..color = _highlight(
          0,
          const Color(0xFF8E5DE7),
        ),
    );

    // Heart
    canvas.drawCircle(
      Offset(centerX + 8, 111),
      12,
      Paint()
        ..color = _highlight(
          1,
          const Color(0xFFE53935),
        ),
    );

    // Lungs
    final lungPaint = Paint()
      ..color = _highlight(
        2,
        const Color(0xFF26A69A),
      );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 15, 120),
        width: 20,
        height: 35,
      ),
      lungPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 15, 120),
        width: 20,
        height: 35,
      ),
      lungPaint,
    );

    // Stomach
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 7, 147),
        width: 25,
        height: 29,
      ),
      Paint()
        ..color = _highlight(
          3,
          const Color(0xFFFF8A4C),
        ),
    );

    // Bone lines
    final bonePaint = Paint()
      ..color = _highlight(
        4,
        Colors.white,
      )
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(centerX, 80),
      Offset(centerX, 183),
      bonePaint,
    );

    canvas.drawLine(
      Offset(centerX - 28, 101),
      Offset(centerX + 28, 101),
      bonePaint,
    );

    canvas.drawLine(
      Offset(centerX - 16, 183),
      Offset(centerX + 16, 183),
      bonePaint,
    );

    // Muscles
    final musclePaint = Paint()
      ..color = _highlight(
        5,
        const Color(0xFFEF6C00),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawLine(
      Offset(centerX - 30, 115),
      Offset(centerX - 48, 160),
      musclePaint,
    );

    canvas.drawLine(
      Offset(centerX + 30, 115),
      Offset(centerX + 48, 160),
      musclePaint,
    );

    // Labels
    final labels = [
      ('Brain', Offset(centerX + 38, 30)),
      ('Heart', Offset(centerX + 40, 92)),
      ('Lungs', Offset(centerX - 72, 116)),
      ('Stomach', Offset(centerX + 42, 145)),
      ('Bones', Offset(centerX - 77, 193)),
      ('Muscles', Offset(centerX + 42, 185)),
    ];

    for (final label in labels) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: label.$1,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF4D4855),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        label.$2,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant _BodyDiagramPainter oldDelegate,
  ) {
    return oldDelegate.selectedPart != selectedPart;
  }
}

// ============================================================================
// SKELETON PAINTER
// ============================================================================

class _SkeletonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final bonePaint = Paint()
      ..color = const Color(0xFFD7CCC8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    final thinBonePaint = Paint()
      ..color = const Color(0xFFBCAAA4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Skull
    canvas.drawCircle(
      Offset(centerX, 30),
      23,
      bonePaint,
    );

    // Spine
    canvas.drawLine(
      Offset(centerX, 54),
      Offset(centerX, 145),
      bonePaint,
    );

    // Ribs
    for (int i = 0; i < 5; i++) {
      final y = 70.0 + i * 13;

      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(centerX, y),
          width: 80,
          height: 35,
        ),
        math.pi,
        math.pi,
        false,
        thinBonePaint,
      );
    }

    // Arms
    canvas.drawLine(
      Offset(centerX - 34, 67),
      Offset(centerX - 65, 130),
      bonePaint,
    );

    canvas.drawLine(
      Offset(centerX + 34, 67),
      Offset(centerX + 65, 130),
      bonePaint,
    );

    // Pelvis
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, 154),
        width: 58,
        height: 35,
      ),
      bonePaint,
    );

    // Legs
    canvas.drawLine(
      Offset(centerX - 18, 169),
      Offset(centerX - 28, 210),
      bonePaint,
    );

    canvas.drawLine(
      Offset(centerX + 18, 169),
      Offset(centerX + 28, 210),
      bonePaint,
    );
  }

  @override
  bool shouldRepaint(
    covariant _SkeletonPainter oldDelegate,
  ) {
    return false;
  }
}

// ============================================================================
// MUSCLE PAINTER
// ============================================================================

class _MusclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final musclePaint = Paint()
      ..color = const Color(0xFFE57373);

    final darkPaint = Paint()
      ..color = const Color(0xFFC62828)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Head
    canvas.drawCircle(
      Offset(centerX, 18),
      13,
      Paint()..color = const Color(0xFFFFCCBC),
    );

    // Torso
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX, 57),
          width: 34,
          height: 60,
        ),
        const Radius.circular(12),
      ),
      musclePaint,
    );

    // Arms
    canvas.drawLine(
      Offset(centerX - 15, 43),
      Offset(centerX - 35, 87),
      darkPaint,
    );

    canvas.drawLine(
      Offset(centerX + 15, 43),
      Offset(centerX + 35, 87),
      darkPaint,
    );

    // Legs
    canvas.drawLine(
      Offset(centerX - 9, 85),
      Offset(centerX - 17, 116),
      darkPaint,
    );

    canvas.drawLine(
      Offset(centerX + 9, 85),
      Offset(centerX + 17, 116),
      darkPaint,
    );
  }

  @override
  bool shouldRepaint(
    covariant _MusclePainter oldDelegate,
  ) {
    return false;
  }
}