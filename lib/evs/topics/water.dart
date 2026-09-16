import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'water_practice.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int selectedSource = 0;

  final List<_WaterSource> sources = [
    _WaterSource(
      title: 'Rain',
      icon: Icons.cloud_rounded,
      color: Color(0xFF42A5F5),
      description:
          'Rain is an important natural source of fresh water. Rain fills rivers, lakes and ponds and also helps recharge groundwater.',
    ),
    _WaterSource(
      title: 'Rivers',
      icon: Icons.water_rounded,
      color: Color(0xFF26A69A),
      description:
          'Rivers carry flowing water from higher areas towards lakes, seas and oceans. They are important sources of water for people and animals.',
    ),
    _WaterSource(
      title: 'Lakes',
      icon: Icons.waves_rounded,
      color: Color(0xFF29B6F6),
      description:
          'Lakes are large bodies of water surrounded by land. Some lakes contain fresh water that can be used after proper treatment.',
    ),
    _WaterSource(
      title: 'Groundwater',
      icon: Icons.landscape_rounded,
      color: Color(0xFF8D6E63),
      description:
          'Some rainwater goes into the soil and collects underground. This water is called groundwater and can be obtained using wells and tube wells.',
    ),
    _WaterSource(
      title: 'Oceans',
      icon: Icons.public_rounded,
      color: Color(0xFF5C6BC0),
      description:
          'Oceans contain a huge amount of water, but ocean water is salty and cannot normally be drunk directly.',
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
        builder: (_) => const WaterPracticePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFD),
      appBar: AppBar(
        title: const Text(
          'Water',
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
                'Why Is Water Important?',
                Icons.water_drop_rounded,
              ),
              const SizedBox(height: 10),

              _buildImportanceCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Sources of Water',
                Icons.source_rounded,
              ),
              const SizedBox(height: 10),

              _buildSourceSelector(),

              const SizedBox(height: 24),

              _sectionTitle(
                'The Water Cycle',
                Icons.sync_rounded,
              ),
              const SizedBox(height: 10),

              _buildWaterCycleCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Uses of Water',
                Icons.format_list_bulleted_rounded,
              ),
              const SizedBox(height: 10),

              _buildUsesGrid(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Clean & Safe Drinking Water',
                Icons.local_drink_rounded,
              ),
              const SizedBox(height: 10),

              _buildSafeWaterCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Water Pollution',
                Icons.warning_amber_rounded,
              ),
              const SizedBox(height: 10),

              _buildPollutionCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Save Every Drop',
                Icons.savings_rounded,
              ),
              const SizedBox(height: 10),

              _buildSaveWaterCard(),

              const SizedBox(height: 24),

              _sectionTitle(
                'Rainwater Harvesting',
                Icons.water_damage_rounded,
              ),
              const SizedBox(height: 10),

              _buildRainwaterHarvestingCard(),

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Water Is Precious!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 9),
                const Text(
                  'Discover where water comes from, how it moves around Earth and how we can protect it.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.water_drop_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Every drop counts',
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
          const SizedBox(width: 10),
          SizedBox(
            width: 105,
            height: 125,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaterHeroPainter(
                    progress: _controller.value,
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
            color: const Color(0xFF0288D1).withValues(alpha: 0.11),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF0277BD),
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

  Widget _buildImportanceCard() {
    final items = [
      (
        Icons.favorite_rounded,
        'For Our Body',
        'Our bodies need water to work properly.',
        Color(0xFFEF5350),
      ),
      (
        Icons.local_florist_rounded,
        'For Plants',
        'Plants need water to grow and make food.',
        Color(0xFF66BB6A),
      ),
      (
        Icons.pets_rounded,
        'For Animals',
        'Animals need water to drink and survive.',
        Color(0xFFFFA726),
      ),
      (
        Icons.home_rounded,
        'For Daily Life',
        'We use water for drinking, cooking, washing and cleaning.',
        Color(0xFF42A5F5),
      ),
    ];

    return Column(
      children: items.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: item.$4.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  item.$1,
                  color: item.$4,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$3,
                      style: const TextStyle(
                        fontSize: 12.7,
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

  Widget _buildSourceSelector() {
    final source = sources[selectedSource];

    return Column(
      children: [
        SizedBox(
          height: 112,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sources.length,
            itemBuilder: (context, index) {
              final item = sources[index];
              final selected = selectedSource == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSource = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: 118,
                  margin: EdgeInsets.only(
                    right: index == sources.length - 1 ? 0 : 10,
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
                        color: item.color,
                        size: 30,
                      ),
                      const SizedBox(height: 8),
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
            key: ValueKey(selectedSource),
            width: double.infinity,
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: source.color.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  source.icon,
                  color: source.color,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    source.description,
                    style: const TextStyle(
                      fontSize: 13.2,
                      height: 1.45,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWaterCycleCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 9,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 260,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WaterCyclePainter(
                    progress: _controller.value,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Water keeps moving between the land, water bodies and atmosphere. This continuous movement is called the water cycle.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.2,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 15),
          _cycleStep(
            Icons.wb_sunny_rounded,
            '1. Evaporation',
            'Heat from the Sun changes water into water vapour.',
            const Color(0xFFFFA726),
          ),
          _cycleStep(
            Icons.cloud_rounded,
            '2. Condensation',
            'Water vapour cools and forms tiny water droplets in clouds.',
            const Color(0xFF78909C),
          ),
          _cycleStep(
            Icons.umbrella_rounded,
            '3. Precipitation',
            'Water falls from clouds as rain, snow or other forms of precipitation.',
            const Color(0xFF42A5F5),
          ),
          _cycleStep(
            Icons.landscape_rounded,
            '4. Collection',
            'Water collects in rivers, lakes, oceans and underground.',
            const Color(0xFF26A69A),
          ),
        ],
      ),
    );
  }

  Widget _cycleStep(
    IconData icon,
    String title,
    String text,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: color,
            size: 23,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
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
  }

  Widget _buildUsesGrid() {
    final uses = [
      (Icons.local_drink_rounded, 'Drinking', Color(0xFF42A5F5)),
      (Icons.soup_kitchen_rounded, 'Cooking', Color(0xFFFF7043)),
      (Icons.shower_rounded, 'Bathing', Color(0xFF26A69A)),
      (Icons.cleaning_services_rounded, 'Cleaning', Color(0xFF7E57C2)),
      (Icons.grass_rounded, 'Farming', Color(0xFF66BB6A)),
      (Icons.factory_rounded, 'Industries', Color(0xFF78909C)),
      (Icons.local_florist_rounded, 'Gardening', Color(0xFF43A047)),
      (Icons.electric_bolt_rounded, 'Hydropower', Color(0xFFFFB300)),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: uses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final use = uses[index];

        return Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
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
              Icon(
                use.$1,
                color: use.$3,
                size: 27,
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Text(
                  use.$2,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSafeWaterCard() {
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
      child: Column(
        children: [
          SizedBox(
            height: 125,
            width: double.infinity,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _CleanWaterPainter(
                    progress: _controller.value,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Water that is safe for drinking should be clean and free from harmful germs and substances.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.2,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          _safePoint(
            Icons.filter_alt_rounded,
            'Water can be filtered to remove many impurities.',
          ),
          _safePoint(
            Icons.local_fire_department_rounded,
            'Boiling can kill many harmful germs.',
          ),
          _safePoint(
            Icons.science_rounded,
            'Water may also be treated using suitable purification methods.',
          ),
          _safePoint(
            Icons.storage_rounded,
            'Store drinking water in clean, covered containers.',
          ),
        ],
      ),
    );
  }

  Widget _safePoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF0288D1),
            size: 20,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12.6,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPollutionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFB74D).withValues(alpha: 0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 135,
            width: double.infinity,
            child: CustomPaint(
              painter: _PollutionPainter(
                progress: _controller.value,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Water pollution happens when harmful waste or substances enter water bodies and make the water dirty or unsafe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.2,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          _pollutionPoint(
            Icons.delete_outline_rounded,
            'Do not throw plastic or garbage into rivers and lakes.',
          ),
          _pollutionPoint(
            Icons.science_outlined,
            'Do not release harmful chemicals into water bodies.',
          ),
          _pollutionPoint(
            Icons.recycling_rounded,
            'Reduce waste and dispose of it properly.',
          ),
        ],
      ),
    );
  }

  Widget _pollutionPoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFEF6C00),
            size: 21,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12.7,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveWaterCard() {
    final tips = [
      (
        Icons.water_drop_rounded,
        'Turn off taps',
        'Do not leave the tap running while brushing your teeth.',
      ),
      (
        Icons.plumbing_rounded,
        'Fix leaks',
        'A leaking tap or pipe can waste a lot of water.',
      ),
      (
        Icons.shower_rounded,
        'Use water wisely',
        'Avoid using more water than necessary while bathing.',
      ),
      (
        Icons.local_florist_rounded,
        'Water plants carefully',
        'Use only the amount of water plants need.',
      ),
      (
        Icons.recycling_rounded,
        'Reuse when suitable',
        'Some clean used water can be reused for suitable household tasks.',
      ),
    ];

    return Column(
      children: tips.map((tip) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.035),
                blurRadius: 7,
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
                  color: const Color(0xFF29B6F6).withValues(alpha: 0.11),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  tip.$1,
                  color: const Color(0xFF0288D1),
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip.$2,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      tip.$3,
                      style: const TextStyle(
                        fontSize: 12.3,
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

  Widget _buildRainwaterHarvestingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 175,
            child: CustomPaint(
              painter: _RainwaterHarvestPainter(
                progress: _controller.value,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Rainwater harvesting means collecting and storing rainwater for later use or allowing it to recharge groundwater.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.2,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 13),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF388E3C),
                size: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'It helps conserve water and can help increase groundwater levels.',
                  style: TextStyle(
                    fontSize: 12.7,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFactsCard() {
    final facts = [
      'Most of Earth is covered by water, but much of it is salty ocean water.',
      'Fresh water is found in places such as rivers, lakes, glaciers and underground.',
      'The Sun provides the heat that drives evaporation in the water cycle.',
      'Water changes between liquid, solid and gas forms.',
      'Plants release water vapour into the air through a process called transpiration.',
      'Saving water helps people, animals, plants and the environment.',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: facts.map((fact) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.water_drop_rounded,
                  color: Color(0xFF0288D1),
                  size: 19,
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Text(
                    fact,
                    style: const TextStyle(
                      fontSize: 12.8,
                      height: 1.35,
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
          'Start Water Practice',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0277BD),
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

class _WaterSource {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  const _WaterSource({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class _WaterHeroPainter extends CustomPainter {
  final double progress;

  _WaterHeroPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final bounce =
        math.sin(progress * math.pi * 2) * 5;

    final dropPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95);

    final path = Path();

    path.moveTo(centerX, 18 + bounce);
    path.cubicTo(
      centerX - 32,
      55 + bounce,
      centerX - 28,
      82 + bounce,
      centerX,
      91 + bounce,
    );
    path.cubicTo(
      centerX + 28,
      82 + bounce,
      centerX + 32,
      55 + bounce,
      centerX,
      18 + bounce,
    );

    canvas.drawPath(path, dropPaint);

    final shinePaint = Paint()
      ..color = const Color(0xFF81D4FA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(
          centerX - 7,
          58 + bounce,
        ),
        width: 30,
        height: 40,
      ),
      math.pi * 0.8,
      math.pi * 0.8,
      false,
      shinePaint,
    );

    final wavePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final wavePath = Path();

    for (int i = 0; i < 2; i++) {
      final double y = 103.0 + i * 10.0;

      wavePath.moveTo(12, y);
      wavePath.quadraticBezierTo(
        30,
        y - 7,
        48,
        y,
      );
      wavePath.quadraticBezierTo(
        66,
        y + 7,
        84,
        y,
      );
    }

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant _WaterHeroPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _WaterCyclePainter extends CustomPainter {
  final double progress;

  _WaterCyclePainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final sunPaint = Paint()
      ..color = const Color(0xFFFFC107);

    canvas.drawCircle(
      Offset(w * 0.15, h * 0.18),
      28,
      sunPaint,
    );

    final rayPaint = Paint()
      ..color = const Color(0xFFFFB300)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;

      canvas.drawLine(
        Offset(
          w * 0.15 + math.cos(angle) * 35,
          h * 0.18 + math.sin(angle) * 35,
        ),
        Offset(
          w * 0.15 + math.cos(angle) * 44,
          h * 0.18 + math.sin(angle) * 44,
        ),
        rayPaint,
      );
    }

    final cloudPaint = Paint()
      ..color = Colors.white;

    canvas.drawCircle(
      Offset(w * 0.62, h * 0.19),
      27,
      cloudPaint,
    );

    canvas.drawCircle(
      Offset(w * 0.49, h * 0.23),
      20,
      cloudPaint,
    );

    canvas.drawCircle(
      Offset(w * 0.74, h * 0.23),
      20,
      cloudPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          w * 0.46,
          h * 0.22,
          w * 0.31,
          30,
        ),
        const Radius.circular(15),
      ),
      cloudPaint,
    );

    final waterPaint = Paint()
      ..color = const Color(0xFF29B6F6);

    final waterPath = Path();

    waterPath.moveTo(0, h * 0.72);
    waterPath.lineTo(w, h * 0.72);
    waterPath.lineTo(w, h);
    waterPath.lineTo(0, h);
    waterPath.close();

    canvas.drawPath(waterPath, waterPaint);

    final landPaint = Paint()
      ..color = const Color(0xFF66BB6A);

    final landPath = Path();

    landPath.moveTo(0, h * 0.63);
    landPath.quadraticBezierTo(
      w * 0.18,
      h * 0.55,
      w * 0.34,
      h * 0.64,
    );
    landPath.quadraticBezierTo(
      w * 0.47,
      h * 0.72,
      w * 0.62,
      h * 0.64,
    );
    landPath.quadraticBezierTo(
      w * 0.80,
      h * 0.54,
      w,
      h * 0.64,
    );
    landPath.lineTo(w, h);
    landPath.lineTo(0, h);
    landPath.close();

    canvas.drawPath(landPath, landPaint);

    final arrowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final evaporationPath = Path();

    evaporationPath.moveTo(
      w * 0.32,
      h * 0.68,
    );

    evaporationPath.cubicTo(
      w * 0.27,
      h * 0.50,
      w * 0.22,
      h * 0.38,
      w * 0.20,
      h * 0.28,
    );

    canvas.drawPath(
      evaporationPath,
      arrowPaint,
    );

    _drawArrowHead(
      canvas,
      Offset(w * 0.20, h * 0.28),
      math.pi * 1.5,
      arrowPaint,
    );

    final precipitationPath = Path();

    precipitationPath.moveTo(
      w * 0.78,
      h * 0.30,
    );

    precipitationPath.cubicTo(
      w * 0.82,
      h * 0.43,
      w * 0.82,
      h * 0.51,
      w * 0.78,
      h * 0.61,
    );

    canvas.drawPath(
      precipitationPath,
      arrowPaint,
    );

    _drawArrowHead(
      canvas,
      Offset(w * 0.78, h * 0.61),
      math.pi / 2,
      arrowPaint,
    );

    final dropPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85);

    for (int i = 0; i < 6; i++) {
      final y =
          h * 0.31 +
          ((progress * 120 + i * 22) % 95);

      canvas.drawCircle(
        Offset(
          w * 0.54 + (i % 3) * 15,
          y,
        ),
        2.5,
        dropPaint,
      );
    }

    final labels = [
      ('Evaporation', w * 0.12, h * 0.40),
      ('Clouds', w * 0.51, h * 0.08),
      ('Rain', w * 0.79, h * 0.42),
      ('Collection', w * 0.40, h * 0.82),
    ];

    for (final label in labels) {
      final painter = TextPainter(
        text: TextSpan(
          text: label.$1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      painter.layout();

      painter.paint(
        canvas,
        Offset(
          label.$2 - painter.width / 2,
          label.$3,
        ),
      );
    }
  }

  void _drawArrowHead(
    Canvas canvas,
    Offset point,
    double angle,
    Paint paint,
  ) {
    final path = Path();

    path.moveTo(point.dx, point.dy);
    path.lineTo(
      point.dx + math.cos(angle + 2.5) * 10,
      point.dy + math.sin(angle + 2.5) * 10,
    );
    path.moveTo(point.dx, point.dy);
    path.lineTo(
      point.dx + math.cos(angle - 2.5) * 10,
      point.dy + math.sin(angle - 2.5) * 10,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaterCyclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _CleanWaterPainter extends CustomPainter {
  final double progress;

  _CleanWaterPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;

    final glassPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 45,
          22,
          90,
          90,
        ),
        const Radius.circular(12),
      ),
      glassPaint,
    );

    final waterPaint = Paint()
      ..color = const Color(0xFF29B6F6).withValues(alpha: 0.55);

    final waterY =
        65 + math.sin(progress * math.pi * 2) * 2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          centerX - 39,
          waterY,
          78,
          39,
        ),
        const Radius.circular(9),
      ),
      waterPaint,
    );

    final sparklePaint = Paint()
      ..color = const Color(0xFFFFC107)
      ..strokeWidth = 2;

    for (int i = 0; i < 5; i++) {
      final angle =
          progress * math.pi * 2 + i * 1.2;

      final x =
          centerX + math.cos(angle) * (60 + i * 5);

      final y =
          55 + math.sin(angle) * 35;

      canvas.drawLine(
        Offset(x - 4, y),
        Offset(x + 4, y),
        sparklePaint,
      );

      canvas.drawLine(
        Offset(x, y - 4),
        Offset(x, y + 4),
        sparklePaint,
      );
    }

    final checkPaint = Paint()
      ..color = const Color(0xFF43A047)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final check = Path()
      ..moveTo(centerX - 16, 48)
      ..lineTo(centerX - 4, 60)
      ..lineTo(centerX + 18, 36);

    canvas.drawPath(check, checkPaint);
  }

  @override
  bool shouldRepaint(covariant _CleanWaterPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _PollutionPainter extends CustomPainter {
  final double progress;

  _PollutionPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final waterPaint = Paint()
      ..color = const Color(0xFF78909C);

    final waterPath = Path();

    waterPath.moveTo(0, h * 0.45);
    waterPath.quadraticBezierTo(
      w * 0.25,
      h * 0.35,
      w * 0.5,
      h * 0.45,
    );
    waterPath.quadraticBezierTo(
      w * 0.75,
      h * 0.55,
      w,
      h * 0.43,
    );
    waterPath.lineTo(w, h);
    waterPath.lineTo(0, h);
    waterPath.close();

    canvas.drawPath(waterPath, waterPaint);

    final bottlePaint = Paint()
      ..color = const Color(0xFFE0E0E0);

    final bottleX =
        w * 0.30 +
        math.sin(progress * math.pi * 2) * 8;

    canvas.save();

    canvas.translate(bottleX, h * 0.42);
    canvas.rotate(-0.3);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(
          -15,
          -10,
          30,
          50,
        ),
        const Radius.circular(5),
      ),
      bottlePaint,
    );

    canvas.drawRect(
      const Rect.fromLTWH(
        -9,
        -20,
        18,
        12,
      ),
      Paint()..color = const Color(0xFF90A4AE),
    );

    canvas.restore();

    final garbagePaint = Paint()
      ..color = const Color(0xFF424242);

    canvas.drawRect(
      Rect.fromLTWH(
        w * 0.62,
        h * 0.67,
        35,
        18,
      ),
      garbagePaint,
    );

    final warningPaint = Paint()
      ..color = const Color(0xFFFFA000);

    final warningPath = Path()
      ..moveTo(w * 0.75, h * 0.18)
      ..lineTo(w * 0.85, h * 0.40)
      ..lineTo(w * 0.65, h * 0.40)
      ..close();

    canvas.drawPath(
      warningPath,
      warningPaint,
    );

    final exclamation = TextPainter(
      text: const TextSpan(
        text: '!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    exclamation.layout();

    exclamation.paint(
      canvas,
      Offset(
        w * 0.75 - exclamation.width / 2,
        h * 0.22,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _PollutionPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _RainwaterHarvestPainter extends CustomPainter {
  final double progress;

  _RainwaterHarvestPainter({
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final roofPaint = Paint()
      ..color = const Color(0xFF78909C);

    final roof = Path()
      ..moveTo(w * 0.10, h * 0.38)
      ..lineTo(w * 0.48, h * 0.10)
      ..lineTo(w * 0.88, h * 0.38)
      ..close();

    canvas.drawPath(roof, roofPaint);

    final housePaint = Paint()
      ..color = Colors.white;

    canvas.drawRect(
      Rect.fromLTWH(
        w * 0.18,
        h * 0.38,
        w * 0.62,
        h * 0.38,
      ),
      housePaint,
    );

    final pipePaint = Paint()
      ..color = const Color(0xFF455A64)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    final pipePath = Path()
      ..moveTo(w * 0.82, h * 0.34)
      ..lineTo(w * 0.82, h * 0.78)
      ..lineTo(w * 0.65, h * 0.78)
      ..lineTo(w * 0.65, h * 0.91);

    canvas.drawPath(pipePath, pipePaint);

    final tankPaint = Paint()
      ..color = const Color(0xFF42A5F5);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          w * 0.53,
          h * 0.73,
          w * 0.25,
          h * 0.22,
        ),
        const Radius.circular(12),
      ),
      tankPaint,
    );

    final dropPaint = Paint()
      ..color = const Color(0xFF29B6F6);

    for (int i = 0; i < 7; i++) {
      final x = w * 0.25 + i * 18;

      final y =
          5 + ((progress * 80 + i * 17) % 55);

      canvas.drawCircle(
        Offset(x, y),
        3,
        dropPaint,
      );
    }

    final label = TextPainter(
      text: const TextSpan(
        text: 'RAINWATER',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0277BD),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    label.layout();

    label.paint(
      canvas,
      Offset(
        w * 0.52,
        h * 0.97 - label.height,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _RainwaterHarvestPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}