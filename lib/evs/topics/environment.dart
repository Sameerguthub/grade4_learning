import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'environment_practice.dart';

class EnvironmentPage extends StatefulWidget {
  const EnvironmentPage({super.key});

  @override
  State<EnvironmentPage> createState() => _EnvironmentPageState();
}

class _EnvironmentPageState extends State<EnvironmentPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int selectedEnvironment = 0;

  final List<_EnvironmentType> environmentTypes = [
    _EnvironmentType(
      title: 'Natural Environment',
      icon: Icons.forest_rounded,
      color: Color(0xFF2E7D32),
      description:
          'The natural environment includes things that occur naturally around us, such as air, water, soil, plants, animals, mountains and rivers.',
      examples: 'Forests, rivers, mountains, lakes',
    ),
    _EnvironmentType(
      title: 'Built Environment',
      icon: Icons.location_city_rounded,
      color: Color(0xFF546E7A),
      description:
          'The built environment includes places and things made by people to live, work and travel.',
      examples: 'Houses, roads, bridges, schools',
    ),
    _EnvironmentType(
      title: 'Living Things',
      icon: Icons.eco_rounded,
      color: Color(0xFF43A047),
      description:
          'Living things grow, need food, water and air, and can reproduce. Plants, animals and humans are living things.',
      examples: 'Plants, animals, birds, humans',
    ),
    _EnvironmentType(
      title: 'Non-Living Things',
      icon: Icons.landscape_rounded,
      color: Color(0xFF8D6E63),
      description:
          'Non-living things do not grow, breathe or reproduce. They include air, water, rocks, soil and sunlight.',
      examples: 'Air, water, rocks, soil',
    ),
  ];

  final List<_EnvironmentalProblem> problems = [
    _EnvironmentalProblem(
      title: 'Air Pollution',
      icon: Icons.air_rounded,
      color: Color(0xFFE53935),
      description:
          'Smoke and harmful gases from vehicles, factories and burning waste can make the air dirty.',
      solution: 'Use clean energy, plant trees and avoid unnecessary burning.',
    ),
    _EnvironmentalProblem(
      title: 'Water Pollution',
      icon: Icons.water_drop_rounded,
      color: Color(0xFF1976D2),
      description:
          'Waste, chemicals and plastic can pollute rivers, lakes and other water sources.',
      solution: 'Keep water bodies clean and never throw waste into water.',
    ),
    _EnvironmentalProblem(
      title: 'Deforestation',
      icon: Icons.park_rounded,
      color: Color(0xFF6D4C41),
      description:
          'Cutting down too many trees can destroy habitats and reduce green cover.',
      solution: 'Protect forests and plant more trees.',
    ),
    _EnvironmentalProblem(
      title: 'Plastic Waste',
      icon: Icons.delete_outline_rounded,
      color: Color(0xFF7E57C2),
      description:
          'Plastic waste can remain in the environment for a long time and can harm animals.',
      solution: 'Reduce, reuse and recycle plastic items.',
    ),
  ];

  final List<_EcoHabit> ecoHabits = [
    _EcoHabit(
      icon: Icons.water_drop_rounded,
      title: 'Save Water',
      description: 'Turn off taps when water is not needed.',
      color: Color(0xFF1976D2),
    ),
    _EcoHabit(
      icon: Icons.lightbulb_rounded,
      title: 'Save Electricity',
      description: 'Switch off lights and fans when leaving a room.',
      color: Color(0xFFFFA000),
    ),
    _EcoHabit(
      icon: Icons.recycling_rounded,
      title: 'Recycle',
      description: 'Reuse useful things and separate recyclable waste.',
      color: Color(0xFF00897B),
    ),
    _EcoHabit(
      icon: Icons.nature_people_rounded,
      title: 'Plant Trees',
      description: 'Trees provide oxygen, shade and homes for many animals.',
      color: Color(0xFF388E3C),
    ),
    _EcoHabit(
      icon: Icons.directions_walk_rounded,
      title: 'Walk or Cycle',
      description: 'Walking and cycling can help reduce pollution.',
      color: Color(0xFF5E35B1),
    ),
    _EcoHabit(
      icon: Icons.shopping_bag_rounded,
      title: 'Avoid Extra Plastic',
      description: 'Carry reusable bags and bottles whenever possible.',
      color: Color(0xFFE65100),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        elevation: 0,
        title: const Text(
          'Environment',
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
                'What is the Environment?',
                Icons.public_rounded,
              ),

              const SizedBox(height: 10),

              _buildInfoCard(
                Icons.lightbulb_rounded,
                const Color(0xFF43A047),
                'The environment is everything around us. It includes living things such as plants, animals and people, and non-living things such as air, water, soil, sunlight and rocks.',
              ),

              const SizedBox(height: 26),

              _sectionTitle(
                'Parts of Our Environment',
                Icons.category_rounded,
              ),

              const SizedBox(height: 7),

              const Text(
                'Tap a card to learn about different parts of our environment.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF68756B),
                ),
              ),

              const SizedBox(height: 14),

              _buildEnvironmentSelector(),

              const SizedBox(height: 12),

              _buildSelectedEnvironment(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Living and Non-Living Things',
                Icons.eco_rounded,
              ),

              const SizedBox(height: 12),

              _buildLivingNonLiving(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Environmental Problems',
                Icons.warning_amber_rounded,
              ),

              const SizedBox(height: 7),

              const Text(
                'Human activities can sometimes harm our environment.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF68756B),
                ),
              ),

              const SizedBox(height: 13),

              ...List.generate(
                problems.length,
                (index) => _buildProblemCard(problems[index]),
              ),

              const SizedBox(height: 16),

              _buildPollutionFlow(),

              const SizedBox(height: 26),

              _sectionTitle(
                'How Can We Protect Nature?',
                Icons.volunteer_activism_rounded,
              ),

              const SizedBox(height: 12),

              _buildProtectionCards(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Good Eco-Friendly Habits',
                Icons.recycling_rounded,
              ),

              const SizedBox(height: 12),

              _buildEcoHabits(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Why Are Trees Important?',
                Icons.park_rounded,
              ),

              const SizedBox(height: 12),

              _buildTreeImportance(),

              const SizedBox(height: 26),

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
            Color(0xFF43A047),
            Color(0xFF1B5E20),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withValues(alpha: 0.18),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.public_rounded,
                  color: Colors.white,
                  size: 43,
                ),
                SizedBox(height: 12),
                Text(
                  'Let\'s Explore Our Environment!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learn about nature, pollution, conservation and how we can care for our planet.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          SizedBox(
            width: 92,
            height: 125,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final movement =
                    math.sin(_animationController.value * math.pi) * 7;

                return Transform.translate(
                  offset: Offset(0, -movement),
                  child: CustomPaint(
                    painter: _EnvironmentPainter(
                      animationValue: _animationController.value,
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
            color: const Color(0xFFE3F2E5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF2E7D32),
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
                color: Color(0xFF4E5A52),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // ENVIRONMENT SELECTOR
  // =========================================================================

  Widget _buildEnvironmentSelector() {
    return SizedBox(
      height: 112,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: environmentTypes.length,
        itemBuilder: (context, index) {
          final item = environmentTypes[index];
          final selected = selectedEnvironment == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedEnvironment = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 118,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selected ? item.color : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: selected
                      ? item.color
                      : item.color.withValues(alpha: 0.15),
                  width: selected ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.035),
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: selected ? Colors.white : item.color,
                    size: 30,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w800,
                      color: selected
                          ? Colors.white
                          : const Color(0xFF344039),
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
  // SELECTED ENVIRONMENT
  // =========================================================================

  Widget _buildSelectedEnvironment() {
    final item = environmentTypes[selectedEnvironment];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey(selectedEnvironment),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: item.color.withValues(alpha: 0.16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: item.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                item.icon,
                color: item.color,
                size: 29,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: item.color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF59645C),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Examples: ${item.examples}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: item.color,
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
  // LIVING / NON-LIVING
  // =========================================================================

  Widget _buildLivingNonLiving() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _livingCard(
            Icons.eco_rounded,
            'Living',
            'Plants, animals and people',
            const Color(0xFF2E7D32),
            [
              'Grow',
              'Need food and water',
              'Breathe',
              'Reproduce',
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _livingCard(
            Icons.landscape_rounded,
            'Non-Living',
            'Air, water, soil and rocks',
            const Color(0xFF795548),
            [
              'Do not grow',
              'Do not breathe',
              'Do not reproduce',
              'No life processes',
            ],
          ),
        ),
      ],
    );
  }

  Widget _livingCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
    List<String> points,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: color,
              size: 25,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF6B746E),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          ...points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: color,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: Color(0xFF4E5851),
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

  // =========================================================================
  // ENVIRONMENTAL PROBLEMS
  // =========================================================================

  Widget _buildProblemCard(_EnvironmentalProblem problem) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: problem.color.withValues(alpha: 0.11),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              problem.icon,
              color: problem.color,
              size: 26,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  problem.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: problem.color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  problem.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF5D675F),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.tips_and_updates_rounded,
                      color: problem.color,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        problem.solution,
                        style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w700,
                          color: problem.color,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // POLLUTION FLOW
  // =========================================================================

  Widget _buildPollutionFlow() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFF3E0),
            Color(0xFFFFFBF5),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Pollution Can Affect Nature',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFFE65100),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _flowIcon(
                Icons.factory_rounded,
                'Pollution',
                const Color(0xFFE53935),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF78909C),
              ),
              _flowIcon(
                Icons.public_rounded,
                'Environment',
                const Color(0xFF43A047),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF78909C),
              ),
              _flowIcon(
                Icons.warning_rounded,
                'Harm',
                const Color(0xFFFF8F00),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Pollution can make air, water and soil unhealthy for living things.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: Color(0xFF59645C),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _flowIcon(
    IconData icon,
    String label,
    Color color,
  ) {
    return SizedBox(
      width: 76,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 25,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // PROTECTION
  // =========================================================================

  Widget _buildProtectionCards() {
    final cards = [
      (
        Icons.forest_rounded,
        'Protect Forests',
        'Save trees and protect natural habitats.',
        Color(0xFF2E7D32),
      ),
      (
        Icons.clean_hands_rounded,
        'Keep Places Clean',
        'Put waste in the correct bins.',
        Color(0xFF00897B),
      ),
      (
        Icons.water_drop_rounded,
        'Save Water',
        'Use water carefully and prevent wastage.',
        Color(0xFF1976D2),
      ),
      (
        Icons.energy_savings_leaf_rounded,
        'Save Energy',
        'Use electricity wisely and reduce waste.',
        Color(0xFFF9A825),
      ),
    ];

    return Column(
      children: cards.map((card) {
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
                  color: card.$4.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  card.$1,
                  color: card.$4,
                  size: 25,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.$2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      card.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF667168),
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

  // =========================================================================
  // ECO HABITS
  // =========================================================================

  Widget _buildEcoHabits() {
    return Column(
      children: ecoHabits.map((habit) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: habit.color.withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  habit.icon,
                  color: habit.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.title,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      habit.description,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF667168),
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

  // =========================================================================
  // TREES
  // =========================================================================

  Widget _buildTreeImportance() {
    final points = [
      (
        Icons.air_rounded,
        'Clean Air',
        'Trees release oxygen and help improve air quality.',
      ),
      (
        Icons.home_work_rounded,
        'Animal Homes',
        'Many birds and animals depend on trees for shelter.',
      ),
      (
        Icons.water_drop_rounded,
        'Water Cycle',
        'Trees help the movement of water through nature.',
      ),
      (
        Icons.thermostat_rounded,
        'Cooler Places',
        'Trees provide shade and can help keep surroundings cooler.',
      ),
    ];

    return Column(
      children: points.map((point) {
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
                point.$1,
                color: const Color(0xFF2E7D32),
                size: 27,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point.$2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      point.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF667168),
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
            Color(0xFFFFF8E1),
            Color(0xFFFFFDE7),
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
                size: 27,
              ),
              SizedBox(width: 9),
              Text(
                'Amazing Environment Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '• Forests provide homes for many plants and animals.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Clean air and clean water are important for living things.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Recycling can help reduce the amount of waste we throw away.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Every person can help protect the environment through small daily actions.',
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

  Widget _buildPracticeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const EnvironmentPracticePage(),
            ),
          );
        },
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Start Environment Practice',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
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

// =============================================================================
// DATA CLASSES
// =============================================================================

class _EnvironmentType {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String examples;

  const _EnvironmentType({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.examples,
  });
}

class _EnvironmentalProblem {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String solution;

  const _EnvironmentalProblem({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.solution,
  });
}

class _EcoHabit {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _EcoHabit({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

// =============================================================================
// ANIMATED ENVIRONMENT PAINTER
// =============================================================================

class _EnvironmentPainter extends CustomPainter {
  final double animationValue;

  _EnvironmentPainter({
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final double cx = size.width / 2;
    final double ground = size.height * 0.88;

    // Sun
    paint.color = const Color(0xFFFFD54F);

    canvas.drawCircle(
      Offset(size.width * 0.72, size.height * 0.18),
      17,
      paint,
    );

    // Sun rays
    paint
      ..color = const Color(0xFFFFE082)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final start = Offset(
        size.width * 0.72 + math.cos(angle) * 23,
        size.height * 0.18 + math.sin(angle) * 23,
      );
      final end = Offset(
        size.width * 0.72 + math.cos(angle) * 29,
        size.height * 0.18 + math.sin(angle) * 29,
      );

      canvas.drawLine(start, end, paint);
    }

    paint.style = PaintingStyle.fill;

    // Ground
    paint.color = const Color(0xFF66BB6A);

    final groundPath = Path()
      ..moveTo(0, ground)
      ..quadraticBezierTo(
        size.width * 0.35,
        ground - 18,
        size.width * 0.58,
        ground,
      )
      ..quadraticBezierTo(
        size.width * 0.8,
        ground + 10,
        size.width,
        ground - 7,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(groundPath, paint);

    // Tree trunk
    paint.color = const Color(0xFF795548);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          cx - 8,
          size.height * 0.43,
          16,
          size.height * 0.42,
        ),
        const Radius.circular(5),
      ),
      paint,
    );

    // Tree crown
    paint.color = const Color(0xFF2E7D32);

    canvas.drawCircle(
      Offset(cx - 16, size.height * 0.42),
      27,
      paint,
    );

    canvas.drawCircle(
      Offset(cx + 15, size.height * 0.40),
      30,
      paint,
    );

    canvas.drawCircle(
      Offset(cx, size.height * 0.29),
      30,
      paint,
    );

    // Small moving leaf
    final leafMovement =
        math.sin(animationValue * math.pi * 2) * 5;

    paint.color = const Color(0xFF81C784);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(
          size.width * 0.22 + leafMovement,
          size.height * 0.34,
        ),
        width: 14,
        height: 8,
      ),
      paint,
    );

    // Small flowers
    paint.color = Colors.white;

    canvas.drawCircle(
      Offset(size.width * 0.18, ground - 7),
      4,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.82, ground - 12),
      4,
      paint,
    );

    paint.color = const Color(0xFFFFEB3B);

    canvas.drawCircle(
      Offset(size.width * 0.18, ground - 7),
      2,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.82, ground - 12),
      2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _EnvironmentPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}