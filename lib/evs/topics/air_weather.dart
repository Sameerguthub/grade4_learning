import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'air_weather_practice.dart';

class AirWeatherPage extends StatefulWidget {
  const AirWeatherPage({super.key});

  @override
  State<AirWeatherPage> createState() => _AirWeatherPageState();
}

class _AirWeatherPageState extends State<AirWeatherPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedTopic = 0;

  final List<_AirWeatherTopic> topics = [
    _AirWeatherTopic(
      title: 'Air',
      icon: Icons.air_rounded,
      color: Color(0xFF0288D1),
      description:
          'Air is all around us. We cannot usually see it, but we can feel it when it moves. Air is important for people, animals and plants.',
    ),
    _AirWeatherTopic(
      title: 'Oxygen',
      icon: Icons.favorite_rounded,
      color: Color(0xFF039BE5),
      description:
          'Oxygen is a part of the air that living things need for breathing. Plants also release oxygen during photosynthesis.',
    ),
    _AirWeatherTopic(
      title: 'Wind',
      icon: Icons.air_rounded,
      color: Color(0xFF26A69A),
      description:
          'Moving air is called wind. Wind can be gentle or strong. It can move leaves, sail boats and turn windmills.',
    ),
    _AirWeatherTopic(
      title: 'Weather',
      icon: Icons.wb_sunny_rounded,
      color: Color(0xFFFFA000),
      description:
          'Weather tells us what the air and sky are like at a particular time and place. It can be sunny, cloudy, rainy or windy.',
    ),
    _AirWeatherTopic(
      title: 'Seasons',
      icon: Icons.wb_cloudy_rounded,
      color: Color(0xFF5C6BC0),
      description:
          'Seasons are different periods of the year with different weather conditions. Common seasons include summer, rainy season, autumn and winter.',
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

  void _openPractice() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AirWeatherPracticePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFD),
      appBar: AppBar(
        title: const Text(
          'Air & Weather',
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
                'What Is Air?',
                Icons.air_rounded,
              ),
              const SizedBox(height: 10),

              _buildAirCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Parts of Air',
                Icons.science_rounded,
              ),
              const SizedBox(height: 10),

              _buildPartsOfAirCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Explore Air & Weather',
                Icons.explore_rounded,
              ),
              const SizedBox(height: 10),

              _buildTopicSelector(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Weather',
                Icons.wb_sunny_rounded,
              ),
              const SizedBox(height: 10),

              _buildWeatherCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Weather Elements',
                Icons.tune_rounded,
              ),
              const SizedBox(height: 10),

              _buildWeatherElements(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Seasons',
                Icons.calendar_month_rounded,
              ),
              const SizedBox(height: 10),

              _buildSeasonsCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Why Is Air Important?',
                Icons.favorite_rounded,
              ),
              const SizedBox(height: 10),

              _buildImportanceCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Keep the Air Clean',
                Icons.eco_rounded,
              ),
              const SizedBox(height: 10),

              _buildCleanAirCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Quick Facts',
                Icons.lightbulb_rounded,
              ),
              const SizedBox(height: 10),

              _buildFactsCard(),

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
            Color(0xFF0288D1),
            Color(0xFF01579B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.20),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final angle = math.sin(
                    _controller.value * math.pi * 2,
                  ) *
                  0.05;

              return Transform.rotate(
                angle: angle,
                child: child,
              );
            },
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.air_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Air & Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Discover air, wind, weather and seasons!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.5,
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

  Widget _sectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 22,
          color: const Color(0xFF0288D1),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: Color(0xFF26332A),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAirCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF0288D1).withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.air_rounded,
              size: 38,
              color: Color(0xFF0288D1),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Air is a mixture of gases',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF26332A),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Air surrounds us everywhere. We need air to live, and moving air is called wind.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartsOfAirCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          _airPartRow(
            Icons.favorite_rounded,
            'Oxygen',
            'Needed by people and animals for breathing.',
            const Color(0xFFE53935),
          ),
          const Divider(height: 22),
          _airPartRow(
            Icons.eco_rounded,
            'Carbon dioxide',
            'Used by green plants to make food.',
            const Color(0xFF43A047),
          ),
          const Divider(height: 22),
          _airPartRow(
            Icons.water_drop_rounded,
            'Water vapour',
            'Water present in the air as an invisible gas.',
            const Color(0xFF039BE5),
          ),
          const Divider(height: 22),
          _airPartRow(
            Icons.grain_rounded,
            'Other gases',
            'Air also contains nitrogen and small amounts of other gases.',
            const Color(0xFF7E57C2),
          ),
        ],
      ),
    );
  }

  Widget _airPartRow(
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: color,
            size: 25,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF26332A),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.35,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopicSelector() {
    return Column(
      children: List.generate(
        topics.length,
        (index) {
          final topic = topics[index];
          final selected = selectedTopic == index;

          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  setState(() {
                    selectedTopic = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: selected
                          ? topic.color.withValues(alpha: 0.35)
                          : Colors.black12,
                      width: selected ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: topic.color.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          topic.icon,
                          color: topic.color,
                          size: 26,
                        ),
                      ),

                      const SizedBox(width: 13),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topic.title,
                              style: const TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF26332A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              topic.description,
                              maxLines: selected ? 5 : 2,
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
                        selected
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: topic.color,
                        size: 23,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFFFA000).withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE1F5FE),
                  Color(0xFFF5FAFD),
                ],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 28,
                  top: 24,
                  child: Icon(
                    Icons.cloud_rounded,
                    size: 55,
                    color: Colors.blueGrey.shade300,
                  ),
                ),
                const Positioned(
                  right: 38,
                  top: 20,
                  child: Icon(
                    Icons.wb_sunny_rounded,
                    size: 62,
                    color: Color(0xFFFFB300),
                  ),
                ),
                const Positioned(
                  bottom: 22,
                  child: Icon(
                    Icons.air_rounded,
                    size: 38,
                    color: Color(0xFF0288D1),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'What is weather?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF26332A),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            'Weather describes the condition of the atmosphere around us at a particular time. It can change from day to day.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              height: 1.45,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherElements() {
    final elements = [
      (
        Icons.thermostat_rounded,
        'Temperature',
        'How hot or cold the air is.',
        Color(0xFFE53935),
      ),
      (
        Icons.water_drop_rounded,
        'Rainfall',
        'Water that falls from clouds.',
        Color(0xFF0288D1),
      ),
      (
        Icons.air_rounded,
        'Wind',
        'Moving air around us.',
        Color(0xFF26A69A),
      ),
      (
        Icons.cloud_rounded,
        'Clouds',
        'Tiny water droplets or ice crystals in the sky.',
        Color(0xFF607D8B),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: elements.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.18,
      ),
      itemBuilder: (context, index) {
        final item = elements[index];

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: item.$4.withValues(alpha: 0.12),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.$1,
                size: 32,
                color: item.$4,
              ),
              const SizedBox(height: 8),
              Text(
                item.$2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF26332A),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.$3,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.5,
                  height: 1.25,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSeasonsCard() {
    final seasons = [
      (
        Icons.wb_sunny_rounded,
        'Summer',
        'Usually hot and sunny.',
        Color(0xFFFFA000),
      ),
      (
        Icons.water_drop_rounded,
        'Rainy',
        'Cloudy days and rainfall.',
        Color(0xFF0288D1),
      ),
      (
        Icons.eco_rounded,
        'Autumn',
        'Some trees shed their leaves.',
        Color(0xFFEF6C00),
      ),
      (
        Icons.ac_unit_rounded,
        'Winter',
        'Usually cooler days and nights.',
        Color(0xFF5C6BC0),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: List.generate(
          seasons.length,
          (index) {
            final season = seasons[index];

            return Padding(
              padding: EdgeInsets.only(
                bottom: index == seasons.length - 1 ? 0 : 10,
              ),
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: season.$4.withValues(alpha: 0.07),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: season.$4.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        season.$1,
                        color: season.$4,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            season.$2,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF26332A),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            season.$3,
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImportanceCard() {
    final points = [
      (
        Icons.air_rounded,
        'Breathing',
        'People and animals need oxygen from air.',
      ),
      (
        Icons.eco_rounded,
        'Plants',
        'Plants use carbon dioxide from air to make food.',
      ),
      (
        Icons.directions_boat_rounded,
        'Wind energy',
        'Moving air can help sail boats and turn wind turbines.',
      ),
      (
        Icons.local_florist_rounded,
        'Nature',
        'Air is an important part of our environment.',
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: points.map((point) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  point.$1,
                  color: const Color(0xFF0288D1),
                  size: 24,
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        point.$2,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF26332A),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        point.$3,
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.35,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCleanAirCard() {
    final tips = [
      'Plant more trees and protect existing trees.',
      'Avoid burning leaves and waste.',
      'Use public transport, walking or cycling when possible.',
      'Keep vehicles properly maintained.',
    ];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE8F5E9),
            Color(0xFFF5FAFD),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.eco_rounded,
            size: 42,
            color: Color(0xFF2E7D32),
          ),
          const SizedBox(height: 10),
          const Text(
            'Clean air keeps us healthy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: Color(0xFF26332A),
            ),
          ),
          const SizedBox(height: 12),
          ...tips.map(
            (tip) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 19,
                    color: Color(0xFF43A047),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tip,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.35,
                        color: Colors.grey.shade700,
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

  Widget _buildFactsCard() {
    final facts = [
      'Moving air is called wind.',
      'We need oxygen for breathing.',
      'Weather can change from day to day.',
      'Clouds are made of tiny water droplets or ice crystals.',
      'Trees help keep the air cleaner.',
      'Wind can be used to produce electricity.',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: facts.asMap().entries.map((entry) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: entry.key == facts.length - 1 ? 0 : 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE1F5FE),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${entry.key + 1}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.35,
                      color: Colors.grey.shade700,
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
      height: 56,
      child: ElevatedButton.icon(
        onPressed: _openPractice,
        icon: const Icon(
          Icons.quiz_rounded,
          size: 24,
        ),
        label: const Text(
          'Practice Air & Weather',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0288D1),
          foregroundColor: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class _AirWeatherTopic {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  const _AirWeatherTopic({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}