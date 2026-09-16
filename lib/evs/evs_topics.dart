import 'package:flutter/material.dart';

import 'topics/plants.dart';
import 'topics/animals.dart';
import 'topics/human_body.dart';
import 'topics/food_health.dart';
import 'topics/water.dart';
import 'topics/air_weather.dart';
import 'topics/environment.dart';
import 'topics/earth_space.dart';
import 'topics/force_motion.dart';
import 'topics/light_sound.dart';
import 'topics/material.dart';

class EvsTopicsPage extends StatelessWidget {
  const EvsTopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      {
        'title': 'Plants',
        'subtitle': 'Learn about plants, parts and their importance',
        'icon': Icons.eco_rounded,
        'color': const Color(0xFF2E7D32),
        'page': const PlantsPage(),
      },
      {
        'title': 'Animals',
        'subtitle': 'Discover animals, habitats and food habits',
        'icon': Icons.pets_rounded,
        'color': const Color(0xFF8D6E63),
        'page': const AnimalsPage(),
      },
      {
        'title': 'Human Body',
        'subtitle': 'Explore the amazing parts of our body',
        'icon': Icons.accessibility_new_rounded,
        'color': const Color(0xFFE53935),
        'page': const HumanBodyPage(),
      },
      {
        'title': 'Food & Health',
        'subtitle': 'Learn about healthy food and good habits',
        'icon': Icons.restaurant_rounded,
        'color': const Color(0xFFFF8F00),
        'page': const FoodHealthPage(),
      },
      {
        'title': 'Water',
        'subtitle': 'Discover water, its uses and conservation',
        'icon': Icons.water_drop_rounded,
        'color': const Color(0xFF1976D2),
        'page': const WaterPage(),
      },
      {
        'title': 'Air & Weather',
        'subtitle': 'Learn about air, weather and seasons',
        'icon': Icons.air_rounded,
        'color': const Color(0xFF0288D1),
        'page': const AirWeatherPage(),
      },
      {
        'title': 'Environment',
        'subtitle': 'Understand nature and how to protect it',
        'icon': Icons.nature_people_rounded,
        'color': const Color(0xFF388E3C),
        'page': const EnvironmentPage(),
      },
      {
        'title': 'Earth & Space',
        'subtitle': 'Explore Earth, the Sun, Moon and space',
        'icon': Icons.public_rounded,
        'color': const Color(0xFF3949AB),
        'page': const EarthSpacePage(),
      },
      {
        'title': 'Force & Motion',
        'subtitle': 'Learn how pushes, pulls and movement work',
        'icon': Icons.directions_run_rounded,
        'color': const Color(0xFFD84315),
        'page': const ForceMotionPage(),
      },
      {
        'title': 'Light & Sound',
        'subtitle': 'Explore light, shadows, vibrations and sound',
        'icon': Icons.lightbulb_rounded,
        'color': const Color(0xFFE65100),
        'page': const LightSoundPage(),
      },
      {
        'title': 'Materials',
        'subtitle': 'Learn about materials and their properties',
        'icon': Icons.category_rounded,
        'color': const Color(0xFF5E35B1),
        'page': const MaterialsPage(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4FBF6),
      appBar: AppBar(
        title: const Text(
          'EVS Topics',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
          children: [
            _buildHeader(),

            const SizedBox(height: 22),

            ...List.generate(
              topics.length,
              (index) {
                final topic = topics[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _buildTopicCard(
                    context: context,
                    number: index + 1,
                    title: topic['title'] as String,
                    subtitle: topic['subtitle'] as String,
                    icon: topic['icon'] as IconData,
                    color: topic['color'] as Color,
                    page: topic['page'] as Widget,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF2E7D32).withOpacity(0.08),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.explore_rounded,
              color: Color(0xFF2E7D32),
              size: 32,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore EVS',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF173B25),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Choose a topic and start learning.',
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: Color(0xFF65736A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard({
    required BuildContext context,
    required int number,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: color.withOpacity(0.10),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 27,
                ),
              ),

              const SizedBox(width: 13),

              Container(
                width: 27,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF26332A),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.35,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}