import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'animals_practice.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  int selectedCategory = 0;
  int selectedFood = 0;

  final List<_AnimalCategory> categories = [
    _AnimalCategory(
      title: 'Wild Animals',
      icon: Icons.forest_rounded,
      color: Color(0xFF2E7D32),
      description:
          'Wild animals live mostly in forests, grasslands, deserts, mountains or other natural habitats.',
      examples: 'Lion, tiger, elephant, deer',
    ),
    _AnimalCategory(
      title: 'Domestic Animals',
      icon: Icons.agriculture_rounded,
      color: Color(0xFF8D6E63),
      description:
          'Domestic animals are kept by people and can be useful to us in many ways.',
      examples: 'Cow, goat, horse, buffalo',
    ),
    _AnimalCategory(
      title: 'Pet Animals',
      icon: Icons.pets_rounded,
      color: Color(0xFFFF8A4C),
      description:
          'Pet animals live with people and are cared for as companions.',
      examples: 'Dog, cat, fish, rabbit',
    ),
  ];

  final List<_FoodType> foodTypes = [
    _FoodType(
      title: 'Herbivores',
      icon: Icons.grass_rounded,
      color: Color(0xFF43A047),
      description:
          'Animals that mainly eat plants, grass, fruits, seeds or leaves.',
      examples: 'Cow, deer, rabbit',
    ),
    _FoodType(
      title: 'Carnivores',
      icon: Icons.pets_rounded,
      color: Color(0xFFE53935),
      description:
          'Animals that mainly eat other animals.',
      examples: 'Lion, tiger, eagle',
    ),
    _FoodType(
      title: 'Omnivores',
      icon: Icons.restaurant_rounded,
      color: Color(0xFF7E57C2),
      description:
          'Animals that eat both plants and other animals.',
      examples: 'Bear, crow, human',
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
          'Animals',
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
                'What are animals?',
                Icons.pets_rounded,
              ),

              const SizedBox(height: 10),

              _buildInfoCard(
                Icons.lightbulb_rounded,
                const Color(0xFF43A047),
                'Animals are living things. They need food, water and air, and most animals can move from one place to another.',
              ),

              const SizedBox(height: 25),

              _sectionTitle(
                'Animals Around Us',
                Icons.category_rounded,
              ),

              const SizedBox(height: 6),

              const Text(
                'Tap a category to learn more.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF68756B),
                ),
              ),

              const SizedBox(height: 14),

              _buildCategorySelector(),

              const SizedBox(height: 12),

              _buildSelectedCategory(),

              const SizedBox(height: 26),

              _sectionTitle(
                'What do animals eat?',
                Icons.restaurant_rounded,
              ),

              const SizedBox(height: 10),

              ...List.generate(
                foodTypes.length,
                (index) => _buildFoodCard(index),
              ),

              const SizedBox(height: 14),

              _buildFoodChain(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Where do animals live?',
                Icons.home_work_rounded,
              ),

              const SizedBox(height: 12),

              _buildHabitats(),

              const SizedBox(height: 26),

              _sectionTitle(
                'How do animals move?',
                Icons.directions_run_rounded,
              ),

              const SizedBox(height: 12),

              _buildMovementGrid(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Animal Groups',
                Icons.account_tree_rounded,
              ),

              const SizedBox(height: 12),

              _buildAnimalGroups(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Animal Body Coverings',
                Icons.layers_rounded,
              ),

              const SizedBox(height: 12),

              _buildBodyCoverings(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Animal Babies',
                Icons.family_restroom_rounded,
              ),

              const SizedBox(height: 12),

              _buildBabies(),

              const SizedBox(height: 26),

              _sectionTitle(
                'Why are animals important?',
                Icons.volunteer_activism_rounded,
              ),

              const SizedBox(height: 12),

              _buildImportance(),

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
                  Icons.pets_rounded,
                  color: Colors.white,
                  size: 43,
                ),
                SizedBox(height: 12),
                Text(
                  'Let\'s Explore Animals!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover animal groups, habitats, food, movement and amazing facts.',
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
            width: 100,
            height: 135,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final movement =
                    math.sin(_animationController.value * math.pi) * 8;

                return Transform.translate(
                  offset: Offset(movement, 0),
                  child: CustomPaint(
                    painter: _AnimalPainter(
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
  // CATEGORY SELECTOR
  // =========================================================================

  Widget _buildCategorySelector() {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 125,
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: selected
                    ? category.color
                    : Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: selected
                      ? category.color
                      : const Color(0xFFE0E7E1),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category.icon,
                    size: 28,
                    color: selected
                        ? Colors.white
                        : category.color,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    category.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: selected
                          ? Colors.white
                          : const Color(0xFF39433C),
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
  // SELECTED CATEGORY
  // =========================================================================

  Widget _buildSelectedCategory() {
    final category = categories[selectedCategory];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Container(
        key: ValueKey(category.title),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: category.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: category.color.withValues(alpha: 0.16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              category.icon,
              color: category.color,
              size: 31,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: category.color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category.description,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF4E5A52),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Examples: ${category.examples}',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: category.color,
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
  // FOOD CARDS
  // =========================================================================

  Widget _buildFoodCard(int index) {
    final food = foodTypes[index];
    final selected = selectedFood == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFood = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? food.color.withValues(alpha: 0.10)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? food.color
                : Colors.transparent,
            width: 1.4,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 51,
              height: 51,
              decoration: BoxDecoration(
                color: food.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                food.icon,
                color: food.color,
                size: 27,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: food.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    food.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF5D675F),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Examples: ${food.examples}',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: food.color,
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
  // FOOD CHAIN
  // =========================================================================

  Widget _buildFoodChain() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFF8FFF9),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'A Simple Food Chain',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1B5E20),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _chainIcon(
                Icons.eco_rounded,
                'Plant',
                const Color(0xFF43A047),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF78909C),
              ),
              _chainIcon(
                Icons.pets_rounded,
                'Herbivore',
                const Color(0xFF7CB342),
              ),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFF78909C),
              ),
              _chainIcon(
                Icons.pets_rounded,
                'Carnivore',
                const Color(0xFFE53935),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Plants can provide food for herbivores, which can become food for carnivores.',
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

  Widget _chainIcon(
    IconData icon,
    String label,
    Color color,
  ) {
    return SizedBox(
      width: 70,
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
  // HABITATS
  // =========================================================================

  Widget _buildHabitats() {
    final habitats = [
      (
        Icons.forest_rounded,
        'Forest',
        'Tiger, monkey, elephant',
        Color(0xFF2E7D32),
      ),
      (
        Icons.water_rounded,
        'Water',
        'Fish, whale, dolphin',
        Color(0xFF1E88E5),
      ),
      (
        Icons.landscape_rounded,
        'Desert',
        'Camel, lizard, scorpion',
        Color(0xFFD68C45),
      ),
      (
        Icons.ac_unit_rounded,
        'Polar Region',
        'Polar bear, penguin',
        Color(0xFF546E7A),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: habitats.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 1.42,
      ),
      itemBuilder: (context, index) {
        final item = habitats[index];

        return Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.$1,
                color: item.$4,
                size: 31,
              ),
              const SizedBox(height: 7),
              Text(
                item.$2,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.$3,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10.5,
                  color: Color(0xFF748076),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // =========================================================================
  // MOVEMENT
  // =========================================================================

  Widget _buildMovementGrid() {
    final movements = [
      (
        Icons.directions_walk_rounded,
        'Walk',
        'Elephant, dog',
      ),
      (
        Icons.flight_rounded,
        'Fly',
        'Eagle, butterfly',
      ),
      (
        Icons.pool_rounded,
        'Swim',
        'Fish, dolphin',
      ),
      (
        Icons.sports_handball_rounded,
        'Hop / Jump',
        'Frog, rabbit',
      ),
      (
        Icons.pest_control_rounded,
        'Crawl',
        'Snake, lizard',
      ),
      (
        Icons.directions_run_rounded,
        'Run',
        'Horse, cheetah',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movements.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 2.05,
      ),
      itemBuilder: (context, index) {
        final item = movements[index];

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                item.$1,
                color: const Color(0xFF43A047),
                size: 25,
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
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      item.$3,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 9.5,
                        color: Color(0xFF78827A),
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

  // =========================================================================
  // ANIMAL GROUPS
  // =========================================================================

  Widget _buildAnimalGroups() {
    final groups = [
      (
        Icons.pets_rounded,
        'Mammals',
        'Most have hair or fur and mothers feed babies milk.',
        'Dog, cow, lion, whale',
      ),
      (
        Icons.flight_rounded,
        'Birds',
        'Birds have feathers, wings and beaks. Most lay eggs.',
        'Eagle, parrot, pigeon',
      ),
      (
        Icons.egg_rounded,
        'Reptiles',
        'Most reptiles have dry, scaly skin.',
        'Snake, lizard, crocodile',
      ),
      (
        Icons.bug_report_rounded,
        'Insects',
        'Insects have six legs and three main body parts.',
        'Ant, butterfly, bee',
      ),
      (
        Icons.water_rounded,
        'Fish',
        'Fish live in water and use gills to breathe.',
        'Rohu, goldfish, shark',
      ),
      (
        Icons.fingerprint_rounded,
        'Amphibians',
        'They can live on land and in water during different stages of life.',
        'Frog, toad',
      ),
    ];

    return Column(
      children: groups.map((group) {
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
                group.$1,
                color: const Color(0xFF43A047),
                size: 29,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.$2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      group.$3,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF667168),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Examples: ${group.$4}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2E7D32),
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
  // BODY COVERINGS
  // =========================================================================

  Widget _buildBodyCoverings() {
    final coverings = [
      (
        Icons.pets_rounded,
        'Fur / Hair',
        'Mammals',
        'Dog, cat, bear',
      ),
      (
        Icons.layers_rounded,
        'Feathers',
        'Birds',
        'Parrot, eagle',
      ),
      (
        Icons.texture_rounded,
        'Scales',
        'Fish & reptiles',
        'Fish, snake',
      ),
      (
        Icons.water_drop_rounded,
        'Moist Skin',
        'Many amphibians',
        'Frog, toad',
      ),
    ];

    return Column(
      children: coverings.map((item) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.$1,
                  color: Color(0xFF2E7D32),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
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
                        fontSize: 11.5,
                        color: Color(0xFF78827A),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                item.$4,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF43A047),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // =========================================================================
  // BABIES
  // =========================================================================

  Widget _buildBabies() {
    final babies = [
      ('Dog', 'Puppy', Icons.pets_rounded),
      ('Cat', 'Kitten', Icons.pets_rounded),
      ('Cow', 'Calf', Icons.agriculture_rounded),
      ('Horse', 'Foal', Icons.agriculture_rounded),
      ('Goat', 'Kid', Icons.pets_rounded),
      ('Hen', 'Chick', Icons.egg_rounded),
      ('Frog', 'Tadpole', Icons.water_rounded),
      ('Butterfly', 'Caterpillar', Icons.bug_report_rounded),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: babies.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      itemBuilder: (context, index) {
        final item = babies[index];

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                item.$3,
                color: const Color(0xFF43A047),
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$1,
                      style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      item.$2,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF43A047),
                        fontWeight: FontWeight.w800,
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

  // =========================================================================
  // IMPORTANCE
  // =========================================================================

  Widget _buildImportance() {
    final points = [
      (
        Icons.eco_rounded,
        'Nature',
        'Animals are an important part of ecosystems.'
      ),
      (
        Icons.restaurant_rounded,
        'Food',
        'Animals provide food such as milk, eggs and honey.'
      ),
      (
        Icons.agriculture_rounded,
        'Work',
        'Some domestic animals help people with farming and transport.'
      ),
      (
        Icons.volunteer_activism_rounded,
        'Balance',
        'Different animals help keep nature balanced.'
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
            children: [
              Icon(
                point.$1,
                color: const Color(0xFF43A047),
                size: 27,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
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
                'Amazing Animal Facts',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '• Elephants use their trunks to pick up food and drink water.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Dolphins use sounds to communicate and find their way underwater.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Butterflies begin life as caterpillars before changing into adults.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '• Some birds travel very long distances during migration.',
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
              builder: (_) => const AnimalsPracticePage(),
            ),
          );
        },
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Practice Animals',
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
// DATA MODELS
// ============================================================================

class _AnimalCategory {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String examples;

  const _AnimalCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.examples,
  });
}

class _FoodType {
  final String title;
  final IconData icon;
  final Color color;
  final String description;
  final String examples;

  const _FoodType({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
    required this.examples,
  });
}

// ============================================================================
// ANIMAL PAINTER
// ============================================================================

class _AnimalPainter extends CustomPainter {
  final double animationValue;

  _AnimalPainter({
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height * 0.50;

    // Ground
    paint.color = const Color(0xFF6D4C41);

    canvas.drawRect(
      Rect.fromLTWH(
        8,
        size.height - 18,
        size.width - 16,
        4,
      ),
      paint,
    );

    // Body
    paint.color = const Color(0xFF795548);

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 8),
        width: 70,
        height: 45,
      ),
      paint,
    );

    // Head
    canvas.drawCircle(
      Offset(centerX + 34, centerY - 10),
      25,
      paint,
    );

    // Ears
    final earPaint = Paint()
      ..color = const Color(0xFF5D4037);

    canvas.drawCircle(
      Offset(centerX + 18, centerY - 30),
      10,
      earPaint,
    );

    canvas.drawCircle(
      Offset(centerX + 49, centerY - 30),
      10,
      earPaint,
    );

    // Eyes
    final eyePaint = Paint()
      ..color = Colors.white;

    canvas.drawCircle(
      Offset(centerX + 27, centerY - 14),
      5,
      eyePaint,
    );

    canvas.drawCircle(
      Offset(centerX + 43, centerY - 14),
      5,
      eyePaint,
    );

    final pupilPaint = Paint()
      ..color = const Color(0xFF212121);

    canvas.drawCircle(
      Offset(centerX + 28, centerY - 14),
      2.5,
      pupilPaint,
    );

    canvas.drawCircle(
      Offset(centerX + 44, centerY - 14),
      2.5,
      pupilPaint,
    );

    // Nose
    canvas.drawCircle(
      Offset(centerX + 58, centerY - 4),
      5,
      pupilPaint,
    );

    // Legs
    final legPaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final legMovement =
        math.sin(animationValue * math.pi) * 4;

    canvas.drawLine(
      Offset(centerX - 25, centerY + 25),
      Offset(
        centerX - 25 + legMovement,
        centerY + 48,
      ),
      legPaint,
    );

    canvas.drawLine(
      Offset(centerX + 5, centerY + 25),
      Offset(
        centerX + 5 - legMovement,
        centerY + 48,
      ),
      legPaint,
    );

    canvas.drawLine(
      Offset(centerX + 27, centerY + 24),
      Offset(
        centerX + 27 + legMovement,
        centerY + 47,
      ),
      legPaint,
    );

    // Tail
    final tailPath = Path();

    tailPath.moveTo(
      centerX - 32,
      centerY - 2,
    );

    tailPath.quadraticBezierTo(
      centerX - 62,
      centerY - 30,
      centerX - 58,
      centerY - 52,
    );

    final tailPaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(tailPath, tailPaint);
  }

  @override
  bool shouldRepaint(covariant _AnimalPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}