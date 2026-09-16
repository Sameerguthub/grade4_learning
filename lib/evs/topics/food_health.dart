import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'food_health_practice.dart';

class FoodHealthPage extends StatefulWidget {
  const FoodHealthPage({super.key});

  @override
  State<FoodHealthPage> createState() => _FoodHealthPageState();
}

class _FoodHealthPageState extends State<FoodHealthPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedFoodGroup = 0;

  final List<_FoodGroup> foodGroups = [
    _FoodGroup(
      title: 'Energy Foods',
      icon: Icons.bolt_rounded,
      color: Color(0xFFFFA726),
      foods: 'Rice, bread, potato, cereals',
      description:
          'These foods give us energy to study, play, walk and work.',
    ),
    _FoodGroup(
      title: 'Body-Building Foods',
      icon: Icons.fitness_center_rounded,
      color: Color(0xFF42A5F5),
      foods: 'Milk, eggs, pulses, fish, meat',
      description:
          'These foods help our body grow and repair muscles and tissues.',
    ),
    _FoodGroup(
      title: 'Protective Foods',
      icon: Icons.health_and_safety_rounded,
      color: Color(0xFF66BB6A),
      foods: 'Fruits and vegetables',
      description:
          'These foods provide vitamins and minerals that help protect us from diseases.',
    ),
    _FoodGroup(
      title: 'Water & Fibre',
      icon: Icons.water_drop_rounded,
      color: Color(0xFF26A69A),
      foods: 'Water, fruits, vegetables, whole grains',
      description:
          'Water keeps us hydrated, while fibre helps our digestive system work properly.',
    ),
  ];

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

  void _openPractice() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FoodHealthPracticePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      appBar: AppBar(
        title: const Text(
          'Food & Health',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroCard(),
              const SizedBox(height: 24),

              _sectionTitle(
                'Why Do We Need Food?',
                Icons.restaurant_rounded,
              ),
              const SizedBox(height: 10),

              _buildInfoCard(
                icon: Icons.bolt_rounded,
                color: const Color(0xFFFFA726),
                title: 'Energy',
                text:
                    'Food gives us energy to run, play, study, think and do our daily activities.',
              ),

              _buildInfoCard(
                icon: Icons.trending_up_rounded,
                color: const Color(0xFF42A5F5),
                title: 'Growth',
                text:
                    'Growing children need nutritious food to build strong bones, muscles and tissues.',
              ),

              _buildInfoCard(
                icon: Icons.shield_rounded,
                color: const Color(0xFF66BB6A),
                title: 'Protection',
                text:
                    'Vitamins and minerals help our body stay healthy and fight diseases.',
              ),

              const SizedBox(height: 22),

              _sectionTitle(
                'Nutrients in Food',
                Icons.science_rounded,
              ),
              const SizedBox(height: 10),

              _buildNutrientGrid(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Food Groups',
                Icons.category_rounded,
              ),
              const SizedBox(height: 10),

              _buildFoodGroupSelector(),

              const SizedBox(height: 24),

              _sectionTitle(
                'What Is a Balanced Diet?',
                Icons.balance_rounded,
              ),
              const SizedBox(height: 10),

              _buildBalancedDietCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Healthy Eating Habits',
                Icons.check_circle_rounded,
              ),
              const SizedBox(height: 10),

              _buildHealthyHabits(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Food Hygiene',
                Icons.clean_hands_rounded,
              ),
              const SizedBox(height: 10),

              _buildHygieneCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Why Is Water Important?',
                Icons.water_drop_rounded,
              ),
              const SizedBox(height: 10),

              _buildWaterCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Remember',
                Icons.lightbulb_rounded,
              ),
              const SizedBox(height: 10),

              _buildRememberCard(),

              const SizedBox(height: 28),

              _buildPracticeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF43A047),
            Color(0xFF2E7D32),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.20),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eat Smart, Stay Healthy!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Learn how healthy food helps your body grow, stay strong and active.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Healthy choices matter!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 105,
            height: 125,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final angle = math.sin(_controller.value * math.pi * 2) * 0.04;

                return Transform.rotate(
                  angle: angle,
                  child: CustomPaint(
                    painter: _FoodHeroPainter(
                      progress: _controller.value,
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

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF43A047).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF2E7D32),
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color color,
    required String title,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  text,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientGrid() {
    final nutrients = [
      (
        Icons.bolt_rounded,
        'Carbohydrates',
        'Main source of energy',
        Color(0xFFFFA726),
      ),
      (
        Icons.fitness_center_rounded,
        'Proteins',
        'Growth and repair',
        Color(0xFF42A5F5),
      ),
      (
        Icons.opacity_rounded,
        'Fats',
        'Energy and warmth',
        Color(0xFFAB47BC),
      ),
      (
        Icons.health_and_safety_rounded,
        'Vitamins',
        'Keep the body healthy',
        Color(0xFF66BB6A),
      ),
      (
        Icons.science_rounded,
        'Minerals',
        'Strong bones and body',
        Color(0xFF26A69A),
      ),
      (
        Icons.water_drop_rounded,
        'Water',
        'Keeps us hydrated',
        Color(0xFF29B6F6),
      ),
      (
        Icons.grass_rounded,
        'Fibre',
        'Helps digestion',
        Color(0xFF8D6E63),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: nutrients.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 1.18,
      ),
      itemBuilder: (context, index) {
        final nutrient = nutrients[index];

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: nutrient.$4.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  nutrient.$1,
                  color: nutrient.$4,
                  size: 23,
                ),
              ),
              const Spacer(),
              Text(
                nutrient.$2,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                nutrient.$3,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Colors.black54,
                  height: 1.25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFoodGroupSelector() {
    final group = foodGroups[selectedFoodGroup];

    return Column(
      children: [
        SizedBox(
          height: 112,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodGroups.length,
            itemBuilder: (context, index) {
              final item = foodGroups[index];
              final selected = selectedFoodGroup == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFoodGroup = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 125,
                  margin: EdgeInsets.only(
                    right: index == foodGroups.length - 1 ? 0 : 10,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: selected
                        ? item.color.withValues(alpha: 0.12)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: selected
                          ? item.color
                          : Colors.transparent,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Icon(
                        item.icon,
                        color: item.color,
                        size: 30,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        item.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.w600,
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(selectedFoodGroup),
            width: double.infinity,
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: group.color.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      group.icon,
                      color: group.color,
                      size: 23,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        group.title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: group.color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  group.description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Examples: ${group.foods}',
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalancedDietCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFF1F8E9),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF81C784).withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(
              painter: _BalancedPlatePainter(),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'A balanced diet contains different kinds of nutritious foods in the right amounts.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          _dietPoint(
            Icons.eco_rounded,
            'Fruits and vegetables',
          ),
          _dietPoint(
            Icons.grain_rounded,
            'Cereals and grains',
          ),
          _dietPoint(
            Icons.egg_rounded,
            'Protein-rich foods',
          ),
          _dietPoint(
            Icons.water_drop_rounded,
            'Enough water',
          ),
        ],
      ),
    );
  }

  Widget _dietPoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: const Color(0xFF388E3C),
          ),
          const SizedBox(width: 9),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthyHabits() {
    final habits = [
      (
        Icons.wash_rounded,
        'Wash your hands',
        'Wash hands before eating and after using the toilet.',
      ),
      (
        Icons.schedule_rounded,
        'Eat meals on time',
        'Try to have regular meals instead of skipping them.',
      ),
      (
        Icons.eco_rounded,
        'Eat fruits and vegetables',
        'They provide important vitamins, minerals and fibre.',
      ),
      (
        Icons.water_drop_rounded,
        'Drink enough water',
        'Water helps your body stay hydrated and work properly.',
      ),
      (
        Icons.no_food_rounded,
        'Limit junk food',
        'Too many sugary, salty or highly processed foods are not healthy.',
      ),
      (
        Icons.cleaning_services_rounded,
        'Keep food clean',
        'Eat clean and properly prepared food.',
      ),
    ];

    return Column(
      children: habits.map((habit) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF43A047).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  habit.$1,
                  color: const Color(0xFF388E3C),
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.$2,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      habit.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Colors.black54,
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

  Widget _buildHygieneCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: CustomPaint(
              painter: _HygienePainter(
                progress: _controller.value,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Food hygiene means keeping food and the places where food is prepared clean and safe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          _hygienePoint(
            Icons.clean_hands_rounded,
            'Wash hands before touching food.',
          ),
          _hygienePoint(
            Icons.kitchen_rounded,
            'Keep cooking areas and utensils clean.',
          ),
          _hygienePoint(
            Icons.inventory_2_rounded,
            'Keep food covered from dust and insects.',
          ),
          _hygienePoint(
            Icons.kitchen_rounded,
            'Store food properly.',
          ),
        ],
      ),
    );
  }

  Widget _hygienePoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: const Color(0xFF00897B),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12.8,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE1F5FE),
            Color(0xFFE0F7FA),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 130,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaterBottlePainter(
                    progress: _controller.value,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Water keeps us hydrated.',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  'Our body needs water for many important functions. We lose water through sweating, breathing and urine, so we need to replace it by drinking fluids and eating water-rich foods.',
                  style: TextStyle(
                    fontSize: 12.8,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRememberCard() {
    final facts = [
      'Eat a variety of nutritious foods.',
      'Include fruits and vegetables in your meals.',
      'Drink enough clean water.',
      'Wash your hands before eating.',
      'Do not eat food that looks spoiled.',
      'Exercise and get enough sleep.',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFD54F).withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        children: facts.map((fact) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFFF9A825),
                  size: 20,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    fact,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPracticeButton() {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: _openPractice,
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Start Food & Health Practice',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
      ),
    );
  }
}

class _FoodGroup {
  final String title;
  final IconData icon;
  final Color color;
  final String foods;
  final String description;

  const _FoodGroup({
    required this.title,
    required this.icon,
    required this.color,
    required this.foods,
    required this.description,
  });
}

class _FoodHeroPainter extends CustomPainter {
  final double progress;

  _FoodHeroPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final platePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, centerY + 15),
      42,
      platePaint,
    );

    final innerPaint = Paint()
      ..color = const Color(0xFFE8F5E9)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, centerY + 15),
      34,
      innerPaint,
    );

    _drawFood(
      canvas,
      Offset(centerX - 19, centerY + 3),
      const Color(0xFFEF5350),
      13,
    );

    _drawFood(
      canvas,
      Offset(centerX + 18, centerY + 2),
      const Color(0xFFFFCA28),
      12,
    );

    _drawFood(
      canvas,
      Offset(centerX, centerY + 30),
      const Color(0xFF66BB6A),
      14,
    );

    final bounce = math.sin(progress * math.pi * 2) * 4;

    final glassPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.fill;

    final glass = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        centerX - 18,
        10 + bounce,
        36,
        45,
      ),
      const Radius.circular(8),
    );

    canvas.drawRRect(glass, glassPaint);

    final waterPaint = Paint()
      ..color = const Color(0xFF29B6F6).withValues(alpha: 0.65);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 14,
          28 + bounce,
          28,
          23,
        ),
        const Radius.circular(5),
      ),
      waterPaint,
    );
  }

  void _drawFood(
    Canvas canvas,
    Offset center,
    Color color,
    double radius,
  ) {
    final paint = Paint()..color = color;
    canvas.drawCircle(center, radius, paint);

    final leafPaint = Paint()
      ..color = const Color(0xFF43A047);

    canvas.drawOval(
      Rect.fromCenter(
        center: center.translate(7, -radius + 2),
        width: 9,
        height: 5,
      ),
      leafPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _FoodHeroPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _BalancedPlatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final shadow = Paint()
      ..color = Colors.black.withValues(alpha: 0.08);

    canvas.drawCircle(
      center.translate(0, 5),
      70,
      shadow,
    );

    final plate = Paint()
      ..color = Colors.white;

    canvas.drawCircle(
      center,
      70,
      plate,
    );

    final border = Paint()
      ..color = const Color(0xFF81C784)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(
      center,
      70,
      border,
    );

    final sections = [
      (
        const Color(0xFF66BB6A),
        math.pi * 0.0,
        math.pi * 0.95,
      ),
      (
        const Color(0xFFFFCA28),
        math.pi * 0.95,
        math.pi * 0.62,
      ),
      (
        const Color(0xFF42A5F5),
        math.pi * 1.57,
        math.pi * 0.75,
      ),
      (
        const Color(0xFFEF5350),
        math.pi * 2.32,
        math.pi * 0.82,
      ),
    ];

    for (final section in sections) {
      final paint = Paint()..color = section.$1;

      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: 62,
        ),
        section.$2,
        section.$3,
        true,
        paint,
      );
    }

    final centerPaint = Paint()
      ..color = Colors.white;

    canvas.drawCircle(
      center,
      22,
      centerPaint,
    );

    final centerIcon = TextPainter(
      text: const TextSpan(
        text: 'BALANCED',
        style: TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.bold,
          color: Color(0xFF388E3C),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    centerIcon.layout();

    centerIcon.paint(
      canvas,
      Offset(
        center.dx - centerIcon.width / 2,
        center.dy - centerIcon.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _HygienePainter extends CustomPainter {
  final double progress;

  _HygienePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final sinkPaint = Paint()
      ..color = const Color(0xFFE0E0E0);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 70,
          70,
          140,
          35,
        ),
        const Radius.circular(8),
      ),
      sinkPaint,
    );

    final tapPaint = Paint()
      ..color = const Color(0xFF78909C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final tapPath = Path()
      ..moveTo(centerX + 25, 70)
      ..lineTo(centerX + 25, 45)
      ..quadraticBezierTo(
        centerX + 25,
        28,
        centerX + 7,
        28,
      )
      ..lineTo(centerX - 10, 28);

    canvas.drawPath(tapPath, tapPaint);

    final dropPaint = Paint()
      ..color = const Color(0xFF29B6F6).withValues(alpha: 0.7);

    for (int i = 0; i < 5; i++) {
      final offset =
          (progress * 60 + i * 18) % 65;

      canvas.drawCircle(
        Offset(
          centerX - 10 + i * 5,
          48 + offset,
        ),
        3,
        dropPaint,
      );
    }

    final handPaint = Paint()
      ..color = const Color(0xFFFFCC80);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX - 40, 54),
        width: 35,
        height: 20,
      ),
      handPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 40, 54),
        width: 35,
        height: 20,
      ),
      handPaint,
    );

    final sparklePaint = Paint()
      ..color = const Color(0xFFFFCA28)
      ..strokeWidth = 2;

    for (int i = 0; i < 4; i++) {
      final x = centerX - 75 + i * 50;
      final y = 20 + math.sin(progress * math.pi * 2 + i) * 5;

      canvas.drawLine(
        Offset(x - 5, y),
        Offset(x + 5, y),
        sparklePaint,
      );

      canvas.drawLine(
        Offset(x, y - 5),
        Offset(x, y + 5),
        sparklePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _HygienePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _WaterBottlePainter extends CustomPainter {
  final double progress;

  _WaterBottlePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final bottlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final bottle = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        centerX - 28,
        25,
        56,
        90,
      ),
      const Radius.circular(15),
    );

    canvas.drawRRect(bottle, bottlePaint);

    final waterLevel =
        82 + math.sin(progress * math.pi * 2) * 3;

    final waterPaint = Paint()
      ..color = const Color(0xFF29B6F6).withValues(alpha: 0.55);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 24,
          waterLevel,
          48,
          30,
        ),
        const Radius.circular(10),
      ),
      waterPaint,
    );

    final capPaint = Paint()
      ..color = const Color(0xFF42A5F5);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 17,
          12,
          34,
          18,
        ),
        const Radius.circular(5),
      ),
      capPaint,
    );

    final bubblePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7);

    for (int i = 0; i < 4; i++) {
      final y =
          105 - ((progress * 55 + i * 18) % 55);

      canvas.drawCircle(
        Offset(
          centerX - 10 + i * 7,
          y,
        ),
        3,
        bubblePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaterBottlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}