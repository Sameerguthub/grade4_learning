import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'plants_practice.dart';

class PlantsPage extends StatefulWidget {
  const PlantsPage({super.key});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _growthController;
  int selectedPart = 0;

  final List<_PlantPart> plantParts = [
    _PlantPart(
      name: 'Roots',
      icon: Icons.grass_rounded,
      color: const Color(0xFF8D6E63),
      description:
          'Roots usually grow under the soil. They hold the plant firmly and absorb water and minerals from the soil.',
    ),
    _PlantPart(
      name: 'Stem',
      icon: Icons.height_rounded,
      color: const Color(0xFF43A047),
      description:
          'The stem supports the plant and carries water and minerals from the roots to the leaves.',
    ),
    _PlantPart(
      name: 'Leaves',
      icon: Icons.eco_rounded,
      color: const Color(0xFF2E7D32),
      description:
          'Leaves make food for the plant using sunlight, water and carbon dioxide. This process is called photosynthesis.',
    ),
    _PlantPart(
      name: 'Flowers',
      icon: Icons.local_florist_rounded,
      color: const Color(0xFFE91E63),
      description:
          'Flowers help many plants reproduce and can develop into fruits containing seeds.',
    ),
    _PlantPart(
      name: 'Fruits',
      icon: Icons.apple_rounded,
      color: const Color(0xFFFF7043),
      description:
          'Fruits protect seeds in many plants. Some fruits are also important food for people and animals.',
    ),
    _PlantPart(
      name: 'Seeds',
      icon: Icons.grain_rounded,
      color: const Color(0xFF795548),
      description:
          'A seed contains a tiny baby plant. With suitable conditions, it can grow into a new plant.',
    ),
  ];

  final List<_PlantType> plantTypes = [
    _PlantType(
      title: 'Herbs',
      icon: Icons.spa_rounded,
      color: const Color(0xFF66BB6A),
      description:
          'Herbs are small plants with soft, green stems.',
      examples: 'Mint, coriander, spinach',
    ),
    _PlantType(
      title: 'Shrubs',
      icon: Icons.park_rounded,
      color: const Color(0xFF43A047),
      description:
          'Shrubs are medium-sized, bushy plants with many branches near the ground.',
      examples: 'Rose, hibiscus, cotton',
    ),
    _PlantType(
      title: 'Trees',
      icon: Icons.park_rounded,
      color: const Color(0xFF2E7D32),
      description:
          'Trees are usually tall plants with a strong, woody stem called a trunk.',
      examples: 'Mango, neem, banyan',
    ),
    _PlantType(
      title: 'Climbers',
      icon: Icons.trending_up_rounded,
      color: const Color(0xFF26A69A),
      description:
          'Climbers have weak stems and need support to grow upward.',
      examples: 'Pea, grapevine, bean',
    ),
    _PlantType(
      title: 'Creepers',
      icon: Icons.trending_flat_rounded,
      color: const Color(0xFF7CB342),
      description:
          'Creepers have weak stems and spread along the ground.',
      examples: 'Pumpkin, watermelon, muskmelon',
    ),
  ];

  final List<_PlantFact> facts = [
    _PlantFact(
      icon: Icons.wb_sunny_rounded,
      title: 'Plants need sunlight',
      text:
          'Most green plants use sunlight to make their own food.',
    ),
    _PlantFact(
      icon: Icons.water_drop_rounded,
      title: 'Plants need water',
      text:
          'Water helps plants carry nutrients and supports their growth.',
    ),
    _PlantFact(
      icon: Icons.air_rounded,
      title: 'Plants use air',
      text:
          'Leaves take in carbon dioxide from the air to help make food.',
    ),
    _PlantFact(
      icon: Icons.public_rounded,
      title: 'Plants help Earth',
      text:
          'Plants release oxygen and provide food and shelter for many living things.',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _growthController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _growthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        elevation: 0,
        title: const Text(
          'Plants',
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
                'What is a plant?',
                Icons.eco_rounded,
              ),

              const SizedBox(height: 10),

              _buildInfoCard(
                icon: Icons.lightbulb_rounded,
                color: const Color(0xFF43A047),
                text:
                    'A plant is a living thing that grows, needs water and air, and usually makes its own food using sunlight.',
              ),

              const SizedBox(height: 24),

              _sectionTitle(
                'Parts of a Plant',
                Icons.account_tree_rounded,
              ),

              const SizedBox(height: 6),

              const Text(
                'Tap each part to learn what it does.',
                style: TextStyle(
                  color: Color(0xFF68756B),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 14),

              _buildPlantDiagram(),

              const SizedBox(height: 14),

              _buildPartSelector(),

              const SizedBox(height: 12),

              _buildSelectedPart(),

              const SizedBox(height: 26),

              _sectionTitle(
                'What do plants need?',
                Icons.volunteer_activism_rounded,
              ),

              const SizedBox(height: 12),

              _buildNeedsGrid(),

              const SizedBox(height: 26),

              _sectionTitle(
                'How do plants make food?',
                Icons.wb_sunny_rounded,
              ),

              const SizedBox(height: 12),

              _buildPhotosynthesisCard(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Types of Plants',
                Icons.category_rounded,
              ),

              const SizedBox(height: 6),

              const Text(
                'Plants can be grouped by their size and the way they grow.',
                style: TextStyle(
                  color: Color(0xFF68756B),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 14),

              ...plantTypes.map(_buildPlantTypeCard),

              const SizedBox(height: 14),

              _buildSpecialTypesCard(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Plant Life Cycle',
                Icons.loop_rounded,
              ),

              const SizedBox(height: 12),

              _buildLifeCycle(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Why are plants important?',
                Icons.public_rounded,
              ),

              const SizedBox(height: 12),

              ...facts.map(_buildFactCard),

              const SizedBox(height: 26),

              _buildFunFacts(),

              const SizedBox(height: 28),

              _buildPracticeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // HERO
  // ========================================================================

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
            blurRadius: 16,
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
                  Icons.eco_rounded,
                  color: Colors.white,
                  size: 42,
                ),
                SizedBox(height: 12),
                Text(
                  'Let\'s Explore Plants!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover plant parts, types, life cycles and how plants help us.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            width: 95,
            height: 145,
            child: AnimatedBuilder(
              animation: _growthController,
              builder: (context, child) {
                final scale =
                    0.92 + (_growthController.value * 0.08);

                return Transform.scale(
                  scale: scale,
                  alignment: Alignment.bottomCenter,
                  child: CustomPaint(
                    painter: _PlantPainter(
                      growth: _growthController.value,
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

  // ========================================================================
  // SECTION TITLE
  // ========================================================================

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

  // ========================================================================
  // INFO CARD
  // ========================================================================

  Widget _buildInfoCard({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: color.withValues(alpha: 0.12),
        ),
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
                height: 1.5,
                color: Color(0xFF4E5A52),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // PLANT DIAGRAM
  // ========================================================================

  Widget _buildPlantDiagram() {
    return Container(
      width: double.infinity,
      height: 270,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: CustomPaint(
        painter: _DetailedPlantPainter(
          selectedPart: selectedPart,
        ),
      ),
    );
  }

  // ========================================================================
  // PART SELECTOR
  // ========================================================================

  Widget _buildPartSelector() {
    return SizedBox(
      height: 76,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: plantParts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final part = plantParts[index];
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
                horizontal: 7,
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
                      : const Color(0xFFE0E7E1),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          : const Color(0xFF4E5A52),
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

  // ========================================================================
  // SELECTED PART
  // ========================================================================

  Widget _buildSelectedPart() {
    final part = plantParts[selectedPart];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(part.name),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: part.color.withValues(alpha: 0.09),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Color(0xFF4E5A52),
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

  // ========================================================================
  // PLANT NEEDS
  // ========================================================================

  Widget _buildNeedsGrid() {
    final needs = [
      (
        Icons.wb_sunny_rounded,
        'Sunlight',
        'Energy',
        const Color(0xFFFFA000),
      ),
      (
        Icons.water_drop_rounded,
        'Water',
        'Growth',
        const Color(0xFF1E88E5),
      ),
      (
        Icons.air_rounded,
        'Air',
        'Carbon dioxide',
        const Color(0xFF26A69A),
      ),
      (
        Icons.landscape_rounded,
        'Soil',
        'Minerals',
        const Color(0xFF795548),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: needs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final item = needs[index];

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Row(
            children: [
              Icon(
                item.$1,
                color: item.$4,
                size: 29,
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF7A847D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ========================================================================
  // PHOTOSYNTHESIS
  // ========================================================================

  Widget _buildPhotosynthesisCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFF7FFF8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny_rounded,
                color: Color(0xFFFFA000),
                size: 34,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.add_rounded,
                color: Color(0xFF78909C),
                size: 25,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.water_drop_rounded,
                color: Color(0xFF1E88E5),
                size: 32,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF546E7A),
                size: 25,
              ),
              SizedBox(width: 12),
              Icon(
                Icons.eco_rounded,
                color: Color(0xFF2E7D32),
                size: 34,
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            'Photosynthesis',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B5E20),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Green leaves use sunlight, water and carbon dioxide to make food for the plant. Oxygen is released into the air.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.5,
              color: Color(0xFF4E5A52),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // PLANT TYPE CARD
  // ========================================================================

  Widget _buildPlantTypeCard(_PlantType type) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 53,
            height: 53,
            decoration: BoxDecoration(
              color: type.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              type.icon,
              color: type.color,
              size: 29,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: type.color,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  type.description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFF4E5A52),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 7),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: type.color.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    'Examples: ${type.examples}',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: type.color,
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

  // ========================================================================
  // FLOWERING / NON-FLOWERING
  // ========================================================================

  Widget _buildSpecialTypesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Flowering and Non-flowering Plants',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF263238),
            ),
          ),

          const SizedBox(height: 14),

          _specialTypeRow(
            Icons.local_florist_rounded,
            'Flowering Plants',
            'These plants produce flowers and usually form seeds.',
            'Examples: Rose, sunflower, mango',
            const Color(0xFFE91E63),
          ),

          const SizedBox(height: 12),

          _specialTypeRow(
            Icons.forest_rounded,
            'Non-flowering Plants',
            'These plants do not produce flowers. Some reproduce using spores.',
            'Examples: Ferns, mosses',
            const Color(0xFF388E3C),
          ),
        ],
      ),
    );
  }

  Widget _specialTypeRow(
    IconData icon,
    String title,
    String description,
    String examples,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 29,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF59645C),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  examples,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // LIFE CYCLE
  // ========================================================================

  Widget _buildLifeCycle() {
    final stages = [
      (
        Icons.grain_rounded,
        'Seed',
        'A tiny plant is inside.',
      ),
      (
        Icons.water_drop_rounded,
        'Germination',
        'The seed begins to grow.',
      ),
      (
        Icons.spa_rounded,
        'Seedling',
        'A young plant appears.',
      ),
      (
        Icons.eco_rounded,
        'Mature Plant',
        'The plant grows bigger.',
      ),
      (
        Icons.local_florist_rounded,
        'Flower & Fruit',
        'New seeds are produced.',
      ),
    ];

    return SizedBox(
      height: 185,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: stages.length,
        separatorBuilder: (_, __) {
          return const Padding(
            padding: EdgeInsets.only(top: 38),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Color(0xFF9EAA9F),
              size: 22,
            ),
          );
        },
        itemBuilder: (context, index) {
          final stage = stages[index];

          return SizedBox(
            width: 125,
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      stage.$1,
                      color: Color(0xFF2E7D32),
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    stage.$2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    stage.$3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: Color(0xFF748076),
                      height: 1.3,
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

  // ========================================================================
  // FACT CARDS
  // ========================================================================

  Widget _buildFactCard(_PlantFact fact) {
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
          Icon(
            fact.icon,
            color: const Color(0xFF43A047),
            size: 27,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fact.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF303A32),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  fact.text,
                  style: const TextStyle(
                    fontSize: 12.8,
                    color: Color(0xFF667168),
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

  // ========================================================================
  // FUN FACTS
  // ========================================================================

  Widget _buildFunFacts() {
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
                'Quick Plant Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          Text(
            '• Some plants can live for hundreds or even thousands of years.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),

          SizedBox(height: 6),

          Text(
            '• Bamboo can grow very quickly under suitable conditions.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),

          SizedBox(height: 6),

          Text(
            '• Cactus plants are adapted to places with very little water.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // PRACTICE BUTTON
  // ========================================================================

  Widget _buildPracticeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PlantsPracticePage(),
            ),
          );
        },
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Practice Plants',
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

// ============================================================================
// DATA CLASSES
// ============================================================================

class _PlantPart {
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const _PlantPart({
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class _PlantType {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String examples;

  const _PlantType({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.examples,
  });
}

class _PlantFact {
  final IconData icon;
  final String title;
  final String text;

  const _PlantFact({
    required this.icon,
    required this.title,
    required this.text,
  });
}

// ============================================================================
// ANIMATED PLANT PAINTER
// ============================================================================

class _PlantPainter extends CustomPainter {
  final double growth;

  _PlantPainter({
    required this.growth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final groundY = size.height - 20;

    // Ground
    paint
      ..color = const Color(0xFF795548)
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(12, groundY),
      Offset(size.width - 12, groundY),
      paint,
    );

    // Stem
    paint
      ..color = const Color(0xFF2E7D32)
      ..strokeWidth = 6;

    final stemHeight = 65 + (growth * 35);

    canvas.drawLine(
      Offset(centerX, groundY),
      Offset(centerX, groundY - stemHeight),
      paint,
    );

    final leafPaint = Paint()
      ..color = const Color(0xFF43A047)
      ..style = PaintingStyle.fill;

    // Left leaf
    final leftLeaf = Path()
      ..moveTo(centerX, groundY - stemHeight * 0.45)
      ..quadraticBezierTo(
        centerX - 40,
        groundY - stemHeight * 0.62,
        centerX - 38,
        groundY - stemHeight * 0.30,
      )
      ..quadraticBezierTo(
        centerX - 18,
        groundY - stemHeight * 0.32,
        centerX,
        groundY - stemHeight * 0.45,
      );

    canvas.drawPath(leftLeaf, leafPaint);

    // Right leaf
    final rightLeaf = Path()
      ..moveTo(centerX, groundY - stemHeight * 0.65)
      ..quadraticBezierTo(
        centerX + 42,
        groundY - stemHeight * 0.82,
        centerX + 40,
        groundY - stemHeight * 0.50,
      )
      ..quadraticBezierTo(
        centerX + 18,
        groundY - stemHeight * 0.52,
        centerX,
        groundY - stemHeight * 0.65,
      );

    canvas.drawPath(rightLeaf, leafPaint);

    // Top leaves
    canvas.drawCircle(
      Offset(centerX - 12, groundY - stemHeight),
      14,
      leafPaint,
    );

    canvas.drawCircle(
      Offset(centerX + 12, groundY - stemHeight + 2),
      14,
      leafPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _PlantPainter oldDelegate) {
    return oldDelegate.growth != growth;
  }
}

// ============================================================================
// DETAILED PLANT DIAGRAM
// ============================================================================

class _DetailedPlantPainter extends CustomPainter {
  final int selectedPart;

  _DetailedPlantPainter({
    required this.selectedPart,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final stemPaint = Paint()
      ..color = selectedPart == 1
          ? const Color(0xFF1B5E20)
          : const Color(0xFF43A047)
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    final rootPaint = Paint()
      ..color = selectedPart == 0
          ? const Color(0xFF5D4037)
          : const Color(0xFF8D6E63)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final leafPaint = Paint()
      ..color = selectedPart == 2
          ? const Color(0xFF1B5E20)
          : const Color(0xFF4CAF50)
      ..style = PaintingStyle.fill;

    final flowerPaint = Paint()
      ..color = selectedPart == 3
          ? const Color(0xFFC2185B)
          : const Color(0xFFE91E63)
      ..style = PaintingStyle.fill;

    final fruitPaint = Paint()
      ..color = selectedPart == 4
          ? const Color(0xFFE64A19)
          : const Color(0xFFFF7043)
      ..style = PaintingStyle.fill;

    // Soil
    final soilPaint = Paint()
      ..color = const Color(0xFFD7CCC8);

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        size.height * 0.70,
        size.width,
        size.height * 0.30,
      ),
      soilPaint,
    );

    // Stem
    canvas.drawLine(
      Offset(centerX, size.height * 0.70),
      Offset(centerX, size.height * 0.24),
      stemPaint,
    );

    // Roots
    final rootStart = Offset(centerX, size.height * 0.70);

    final roots = [
      Offset(centerX - 60, size.height * 0.91),
      Offset(centerX - 35, size.height * 0.95),
      Offset(centerX - 15, size.height * 0.89),
      Offset(centerX + 20, size.height * 0.95),
      Offset(centerX + 45, size.height * 0.91),
      Offset(centerX + 67, size.height * 0.94),
    ];

    for (final end in roots) {
      canvas.drawLine(rootStart, end, rootPaint);
    }

    // Leaves
    final leaves = [
      Offset(centerX - 45, size.height * 0.42),
      Offset(centerX + 45, size.height * 0.50),
      Offset(centerX - 43, size.height * 0.58),
      Offset(centerX + 42, size.height * 0.34),
    ];

    for (final position in leaves) {
      final path = Path()
        ..moveTo(centerX, position.dy)
        ..quadraticBezierTo(
          position.dx - 20,
          position.dy - 18,
          position.dx,
          position.dy - 2,
        )
        ..quadraticBezierTo(
          position.dx - 12,
          position.dy + 12,
          centerX,
          position.dy,
        );

      canvas.drawPath(path, leafPaint);
    }

    // Flower
    final flowerCenter = Offset(
      centerX,
      size.height * 0.19,
    );

    for (int i = 0; i < 5; i++) {
      final angle = i * math.pi * 2 / 5;

      canvas.drawCircle(
        Offset(
          flowerCenter.dx + math.cos(angle) * 13,
          flowerCenter.dy + math.sin(angle) * 13,
        ),
        10,
        flowerPaint,
      );
    }

    canvas.drawCircle(
      flowerCenter,
      7,
      Paint()..color = const Color(0xFFFFC107),
    );

    // Fruit
    canvas.drawCircle(
      Offset(centerX + 18, size.height * 0.57),
      13,
      fruitPaint,
    );

    // Small highlight
    canvas.drawCircle(
      Offset(centerX + 14, size.height * 0.53),
      3,
      Paint()..color = Colors.white.withValues(alpha: 0.6),
    );
  }

  @override
  bool shouldRepaint(covariant _DetailedPlantPainter oldDelegate) {
    return oldDelegate.selectedPart != selectedPart;
  }
}