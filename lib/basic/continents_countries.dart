
import 'package:flutter/material.dart';

class ContinentsCountriesPage extends StatelessWidget {
  const ContinentsCountriesPage({super.key});

  // ============================================================
  // 7 CONTINENTS
  // ============================================================
  final List<Map<String, String>> continents = const [
    {
      'name': 'Asia',
      'emoji': '🌏',
      'info': 'The largest continent',
    },
    {
      'name': 'Africa',
      'emoji': '🌍',
      'info': 'Known for diverse wildlife',
    },
    {
      'name': 'Europe',
      'emoji': '🌍',
      'info': 'Known for many historic countries',
    },
    {
      'name': 'North America',
      'emoji': '🌎',
      'info': 'Home to the USA, Canada and Mexico',
    },
    {
      'name': 'South America',
      'emoji': '🌎',
      'info': 'Home to the Amazon Rainforest',
    },
    {
      'name': 'Australia/Oceania',
      'emoji': '🌏',
      'info': 'Includes Australia and Pacific islands',
    },
    {
      'name': 'Antarctica',
      'emoji': '❄️',
      'info': 'The coldest continent',
    },
  ];

  // ============================================================
  // 5 OCEANS
  // ============================================================
  final List<Map<String, String>> oceans = const [
    {
      'name': 'Pacific Ocean',
      'emoji': '🌊',
      'info': 'The largest ocean',
    },
    {
      'name': 'Atlantic Ocean',
      'emoji': '🌊',
      'info': 'The second-largest ocean',
    },
    {
      'name': 'Indian Ocean',
      'emoji': '🌊',
      'info': 'The third-largest ocean',
    },
    {
      'name': 'Southern Ocean',
      'emoji': '🌊',
      'info': 'Surrounds Antarctica',
    },
    {
      'name': 'Arctic Ocean',
      'emoji': '🧊',
      'info': 'The smallest and coldest ocean',
    },
  ];

  // ============================================================
  // A-Z COUNTRIES
  // ============================================================
  final List<Map<String, String>> alphabetCountries = const [
    {
      'letter': 'A',
      'country': 'Australia',
      'capital': 'Canberra',
      'continent': 'Australia/Oceania',
      'flag': '🇦🇺',
    },
    {
      'letter': 'B',
      'country': 'Brazil',
      'capital': 'Brasília',
      'continent': 'South America',
      'flag': '🇧🇷',
    },
    {
      'letter': 'C',
      'country': 'Canada',
      'capital': 'Ottawa',
      'continent': 'North America',
      'flag': '🇨🇦',
    },
    {
      'letter': 'D',
      'country': 'Denmark',
      'capital': 'Copenhagen',
      'continent': 'Europe',
      'flag': '🇩🇰',
    },
    {
      'letter': 'E',
      'country': 'Egypt',
      'capital': 'Cairo',
      'continent': 'Africa',
      'flag': '🇪🇬',
    },
    {
      'letter': 'F',
      'country': 'France',
      'capital': 'Paris',
      'continent': 'Europe',
      'flag': '🇫🇷',
    },
    {
      'letter': 'G',
      'country': 'Germany',
      'capital': 'Berlin',
      'continent': 'Europe',
      'flag': '🇩🇪',
    },
    {
      'letter': 'H',
      'country': 'Hungary',
      'capital': 'Budapest',
      'continent': 'Europe',
      'flag': '🇭🇺',
    },
    {
      'letter': 'I',
      'country': 'India',
      'capital': 'New Delhi',
      'continent': 'Asia',
      'flag': '🇮🇳',
    },
    {
      'letter': 'J',
      'country': 'Japan',
      'capital': 'Tokyo',
      'continent': 'Asia',
      'flag': '🇯🇵',
    },
    {
      'letter': 'K',
      'country': 'Kenya',
      'capital': 'Nairobi',
      'continent': 'Africa',
      'flag': '🇰🇪',
    },
    {
      'letter': 'L',
      'country': 'Laos',
      'capital': 'Vientiane',
      'continent': 'Asia',
      'flag': '🇱🇦',
    },
    {
      'letter': 'M',
      'country': 'Mexico',
      'capital': 'Mexico City',
      'continent': 'North America',
      'flag': '🇲🇽',
    },
    {
      'letter': 'N',
      'country': 'Nigeria',
      'capital': 'Abuja',
      'continent': 'Africa',
      'flag': '🇳🇬',
    },
    {
      'letter': 'O',
      'country': 'Oman',
      'capital': 'Muscat',
      'continent': 'Asia',
      'flag': '🇴🇲',
    },
    {
      'letter': 'P',
      'country': 'Pakistan',
      'capital': 'Islamabad',
      'continent': 'Asia',
      'flag': '🇵🇰',
    },
    {
      'letter': 'Q',
      'country': 'Qatar',
      'capital': 'Doha',
      'continent': 'Asia',
      'flag': '🇶🇦',
    },
    {
      'letter': 'R',
      'country': 'Russia',
      'capital': 'Moscow',
      'continent': 'Europe & Asia',
      'flag': '🇷🇺',
    },
    {
      'letter': 'S',
      'country': 'Spain',
      'capital': 'Madrid',
      'continent': 'Europe',
      'flag': '🇪🇸',
    },
    {
      'letter': 'T',
      'country': 'Thailand',
      'capital': 'Bangkok',
      'continent': 'Asia',
      'flag': '🇹🇭',
    },
    {
      'letter': 'U',
      'country': 'United Kingdom',
      'capital': 'London',
      'continent': 'Europe',
      'flag': '🇬🇧',
    },
    {
      'letter': 'V',
      'country': 'Vietnam',
      'capital': 'Hanoi',
      'continent': 'Asia',
      'flag': '🇻🇳',
    },
    {
      'letter': 'W',
      'country': 'No sovereign country',
      'capital': '-',
      'continent': '-',
      'flag': '🌍',
    },
    {
      'letter': 'X',
      'country': 'No sovereign country',
      'capital': '-',
      'continent': '-',
      'flag': '🌍',
    },
    {
      'letter': 'Y',
      'country': 'Yemen',
      'capital': 'Sana’a',
      'continent': 'Asia',
      'flag': '🇾🇪',
    },
    {
      'letter': 'Z',
      'country': 'Zambia',
      'capital': 'Lusaka',
      'continent': 'Africa',
      'flag': '🇿🇲',
    },
  ];

  // ============================================================
  // POPULAR COUNTRIES
  // Repetition with A-Z list is intentional.
  // ============================================================
  final List<Map<String, String>> popularCountries = const [
    {
      'country': 'India',
      'capital': 'New Delhi',
      'continent': 'Asia',
      'flag': '🇮🇳',
    },
    {
      'country': 'United States',
      'capital': 'Washington, D.C.',
      'continent': 'North America',
      'flag': '🇺🇸',
    },
    {
      'country': 'United Kingdom',
      'capital': 'London',
      'continent': 'Europe',
      'flag': '🇬🇧',
    },
    {
      'country': 'China',
      'capital': 'Beijing',
      'continent': 'Asia',
      'flag': '🇨🇳',
    },
    {
      'country': 'Japan',
      'capital': 'Tokyo',
      'continent': 'Asia',
      'flag': '🇯🇵',
    },
    {
      'country': 'South Korea',
      'capital': 'Seoul',
      'continent': 'Asia',
      'flag': '🇰🇷',
    },
    {
      'country': 'Russia',
      'capital': 'Moscow',
      'continent': 'Europe & Asia',
      'flag': '🇷🇺',
    },
    {
      'country': 'France',
      'capital': 'Paris',
      'continent': 'Europe',
      'flag': '🇫🇷',
    },
    {
      'country': 'Germany',
      'capital': 'Berlin',
      'continent': 'Europe',
      'flag': '🇩🇪',
    },
    {
      'country': 'Italy',
      'capital': 'Rome',
      'continent': 'Europe',
      'flag': '🇮🇹',
    },
    {
      'country': 'Spain',
      'capital': 'Madrid',
      'continent': 'Europe',
      'flag': '🇪🇸',
    },
    {
      'country': 'Canada',
      'capital': 'Ottawa',
      'continent': 'North America',
      'flag': '🇨🇦',
    },
    {
      'country': 'Mexico',
      'capital': 'Mexico City',
      'continent': 'North America',
      'flag': '🇲🇽',
    },
    {
      'country': 'Brazil',
      'capital': 'Brasília',
      'continent': 'South America',
      'flag': '🇧🇷',
    },
    {
      'country': 'Argentina',
      'capital': 'Buenos Aires',
      'continent': 'South America',
      'flag': '🇦🇷',
    },
    {
      'country': 'Australia',
      'capital': 'Canberra',
      'continent': 'Australia/Oceania',
      'flag': '🇦🇺',
    },
    {
      'country': 'New Zealand',
      'capital': 'Wellington',
      'continent': 'Australia/Oceania',
      'flag': '🇳🇿',
    },
    {
      'country': 'Egypt',
      'capital': 'Cairo',
      'continent': 'Africa',
      'flag': '🇪🇬',
    },
    {
      'country': 'South Africa',
      'capital': 'Pretoria',
      'continent': 'Africa',
      'flag': '🇿🇦',
    },
    {
      'country': 'Nigeria',
      'capital': 'Abuja',
      'continent': 'Africa',
      'flag': '🇳🇬',
    },
    {
      'country': 'Kenya',
      'capital': 'Nairobi',
      'continent': 'Africa',
      'flag': '🇰🇪',
    },
    {
      'country': 'Saudi Arabia',
      'capital': 'Riyadh',
      'continent': 'Asia',
      'flag': '🇸🇦',
    },
    {
      'country': 'United Arab Emirates',
      'capital': 'Abu Dhabi',
      'continent': 'Asia',
      'flag': '🇦🇪',
    },
    {
      'country': 'Singapore',
      'capital': 'Singapore',
      'continent': 'Asia',
      'flag': '🇸🇬',
    },
    {
      'country': 'Thailand',
      'capital': 'Bangkok',
      'continent': 'Asia',
      'flag': '🇹🇭',
    },
    {
      'country': 'Malaysia',
      'capital': 'Kuala Lumpur',
      'continent': 'Asia',
      'flag': '🇲🇾',
    },
    {
      'country': 'Indonesia',
      'capital': 'Jakarta',
      'continent': 'Asia',
      'flag': '🇮🇩',
    },
    {
      'country': 'Nepal',
      'capital': 'Kathmandu',
      'continent': 'Asia',
      'flag': '🇳🇵',
    },
    {
      'country': 'Bangladesh',
      'capital': 'Dhaka',
      'continent': 'Asia',
      'flag': '🇧🇩',
    },
    {
      'country': 'Sri Lanka',
      'capital': 'Sri Jayawardenepura Kotte',
      'continent': 'Asia',
      'flag': '🇱🇰',
    },
    {
      'country': 'Pakistan',
      'capital': 'Islamabad',
      'continent': 'Asia',
      'flag': '🇵🇰',
    },
    {
      'country': 'Türkiye',
      'capital': 'Ankara',
      'continent': 'Europe & Asia',
      'flag': '🇹🇷',
    },
  ];

  // ============================================================
  // 7 WONDERS OF THE WORLD
  // ============================================================
  final List<Map<String, String>> wonders = const [
    {
      'name': 'Great Wall of China',
      'location': 'China',
      'continent': 'Asia',
      'emoji': '🏯',
      'info': 'A huge ancient wall system built across northern China.',
    },
    {
      'name': 'Petra',
      'location': 'Jordan',
      'continent': 'Asia',
      'emoji': '🏛️',
      'info': 'An ancient city famous for buildings carved into rose-colored rock.',
    },
    {
      'name': 'Colosseum',
      'location': 'Italy',
      'continent': 'Europe',
      'emoji': '🏟️',
      'info': 'A famous ancient Roman amphitheatre in Rome.',
    },
    {
      'name': 'Chichén Itzá',
      'location': 'Mexico',
      'continent': 'North America',
      'emoji': '🏛️',
      'info': 'An ancient Maya city known for its large pyramid.',
    },
    {
      'name': 'Machu Picchu',
      'location': 'Peru',
      'continent': 'South America',
      'emoji': '⛰️',
      'info': 'An ancient Inca site high in the Andes Mountains.',
    },
    {
      'name': 'Christ the Redeemer',
      'location': 'Brazil',
      'continent': 'South America',
      'emoji': '🗿',
      'info': 'A famous statue overlooking Rio de Janeiro.',
    },
    {
      'name': 'Taj Mahal',
      'location': 'India',
      'continent': 'Asia',
      'emoji': '🕌',
      'info': 'A famous white marble monument in Agra, India.',
    },
  ];

  // ============================================================
  // COLORS
  // ============================================================
  final List<Color> colors = const [
    Color(0xFFFFE0E0),
    Color(0xFFFFF0C2),
    Color(0xFFDFF5E1),
    Color(0xFFDDEBFF),
    Color(0xFFE9DEFF),
    Color(0xFFFFDFF2),
  ];

  // ============================================================
  // BUILD
  // ============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'Continents & Countries',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ======================================================
          // CONTINENTS
          // ======================================================

          _sectionTitle(
            'The 7 Continents',
            Icons.public_rounded,
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: continents.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final item = continents[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['emoji']!,
                      style: const TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item['info']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF5F6475),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 28),

          // ======================================================
          // OCEANS
          // ======================================================

          _sectionTitle(
            'The 5 Oceans',
            Icons.water_rounded,
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: oceans.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final item = oceans[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colors[(index + 2) % colors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['emoji']!,
                      style: const TextStyle(
                        fontSize: 34,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item['info']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF5F6475),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 28),

          // ======================================================
          // A-Z COUNTRIES
          // ======================================================

          _sectionTitle(
            'Countries A–Z',
            Icons.sort_by_alpha_rounded,
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: alphabetCountries.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.92,
            ),
            itemBuilder: (context, index) {
              final item = alphabetCountries[index];

              return _countryCard(
                item,
                index,
                showLetter: true,
              );
            },
          ),

          const SizedBox(height: 28),

          // ======================================================
          // POPULAR COUNTRIES
          // ======================================================

          _sectionTitle(
            'Popular Countries',
            Icons.star_rounded,
          ),

          const SizedBox(height: 6),

          const Text(
            'Learn popular countries, their capitals and continents.',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF666B7A),
            ),
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: popularCountries.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.92,
            ),
            itemBuilder: (context, index) {
              final item = popularCountries[index];

              return _countryCard(
                item,
                index,
                showLetter: false,
              );
            },
          ),

          const SizedBox(height: 28),

          // ======================================================
          // 7 WONDERS
          // ======================================================

          _sectionTitle(
            '7 Wonders of the World',
            Icons.auto_awesome_rounded,
          ),

          const SizedBox(height: 6),

          const Text(
            'Famous landmarks from around the world.',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF666B7A),
            ),
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: wonders.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.88,
            ),
            itemBuilder: (context, index) {
              final item = wonders[index];

              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colors[(index + 3) % colors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        item['emoji']!,
                        style: const TextStyle(
                          fontSize: 42,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      item['name']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      item['location']!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF34384F),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      'Continent',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      item['continent']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4E8DF5),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Expanded(
                      child: Text(
                        item['info']!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          height: 1.3,
                          color: Color(0xFF5F6475),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================
  Widget _sectionTitle(
    String title,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1976D2),
            size: 23,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // COUNTRY CARD
  // ============================================================
  Widget _countryCard(
    Map<String, String> item,
    int index, {
    required bool showLetter,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                item['flag']!,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),

              const Spacer(),

              if (showLetter)
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                      alpha: 0.7,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      item['letter']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF4E8DF5),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            item['country']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            'Capital',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
            ),
          ),

          Text(
            item['capital']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF34384F),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Continent',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
            ),
          ),

          Expanded(
            child: Text(
              item['continent']!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4E8DF5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
