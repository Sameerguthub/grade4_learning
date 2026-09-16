import 'package:flutter/material.dart';

import 'tables.dart';
import 'numbers_1_100.dart';
import 'hindi_varnamala.dart';
import 'alphabet_english.dart';
import 'alphabet_hindi.dart';
import 'hindi_matras.dart';
import 'numbers_numerals.dart';
import 'days_months.dart';
import 'measurement_units.dart';
import 'seasons.dart';
import 'time_clock.dart';
import 'shapes_geometry.dart';
import 'colors.dart';
import 'directions.dart';
import 'road_signs.dart';
import 'continents_countries.dart';
import 'national_symbols.dart';
import 'indian_states_capitals.dart';

class BasicHomePage extends StatelessWidget {
  const BasicHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      _BasicTopic(
        title: 'Multiplication Tables',
        subtitle: 'Tables 1 to 20',
        icon: Icons.calculate_rounded,
        page: const TablesPage(),
      ),
      _BasicTopic(
        title: 'Numbers 1–100',
        subtitle: 'Number names in English',
        icon: Icons.numbers_rounded,
        page: const Numbers100Page(),
      ),
        _BasicTopic(
    title: 'Continents & Countries',
    subtitle: 'Learn continents, countries & capitals',
    icon: Icons.public_rounded,
    page: const ContinentsCountriesPage(),
    ),
      _BasicTopic(
    title: 'Numbers & Numerals',
    subtitle: 'Ordinal, Roman & Devanagari numbers',
    icon: Icons.format_list_numbered_rounded,
    page: const NumbersNumeralsPage(),
    ),
    _BasicTopic(
    title: 'English Alphabet',
    subtitle: 'A for Apple, B for Ball & more',
    icon: Icons.abc_rounded,
    page: const AlphabetEnglishPage(),
    ),

    _BasicTopic(
    title: 'हिंदी वर्णमाला',
    subtitle: 'अ से अनार, क से कबूतर & more',
    icon: Icons.translate_rounded,
    page: const AlphabetHindiPage(),
    ),
      _BasicTopic(
        title: 'Hindi Varnamala',
        subtitle: 'स्वर और व्यंजन',
        icon: Icons.translate_rounded,
        page: const HindiVarnamalaPage(),
      ),
      _BasicTopic(
        title: 'Hindi Matras',
        subtitle: 'क, का, कि, की...',
        icon: Icons.menu_book_rounded,
        page: const HindiMatrasPage(),
      ),
      _BasicTopic(
    title: 'National Symbols of India',
    subtitle: 'Flag, animal, bird, flower & more',
    icon: Icons.flag_rounded,
    page: const NationalSymbolsPage(),
    ),

    _BasicTopic(
    title: 'Indian States & Capitals',
    subtitle: 'Learn all 28 states and their capitals',
    icon: Icons.map_rounded,
    page: const IndianStatesCapitalsPage(),
    ),
      _BasicTopic(
    title: 'Days & Months',
    subtitle: 'Days of the week and months of the year',
    icon: Icons.calendar_month_rounded,
    page: const DaysMonthsPage(),
    ),

    _BasicTopic(
    title: 'Measurement Units',
    subtitle: 'Length, weight, capacity, time & more',
    icon: Icons.straighten_rounded,
    page: const MeasurementUnitsPage(),
    ),
    _BasicTopic(
    title: 'Time & Clock',
    subtitle: 'Learn time, clock and units of time',
    icon: Icons.access_time_rounded,
    page: const TimeClockPage(),
    ),

    _BasicTopic(
    title: 'Shapes & Geometry',
    subtitle: 'Basic shapes, sides, corners and angles',
    icon: Icons.category_rounded,
    page: const ShapesGeometryPage(),
    ),

    _BasicTopic(
    title: 'Colours',
    subtitle: 'Learn common colours',
    icon: Icons.palette_rounded,
    page: const ColorsPage(),
    ),

    _BasicTopic(
    title: 'Directions',
    subtitle: 'North, South, East, West and more',
    icon: Icons.explore_rounded,
    page: const DirectionsPage(),
    ),

    _BasicTopic(
    title: 'Basic Road Signs',
    subtitle: 'Learn important road signs',
    icon: Icons.traffic_rounded,
    page: const RoadSignsPage(),
    ),
    _BasicTopic(
    title: 'Seasons',
    subtitle: 'Learn about different seasons',
    icon: Icons.wb_sunny_rounded,
    page: const SeasonsPage(),
    ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Basic Knowledge',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => topic.page,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F1FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          topic.icon,
                          size: 28,
                          color: const Color(0xFF5B5FEF),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topic.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF20243A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              topic.subtitle,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF74788D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF5B5FEF),
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
}

class _BasicTopic {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;

  const _BasicTopic({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });
}