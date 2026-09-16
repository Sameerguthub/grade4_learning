
import 'package:flutter/material.dart';

class NumbersNumeralsPage extends StatelessWidget {
  const NumbersNumeralsPage({super.key});

  static const ordinalWords = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth',
    'Ninth',
    'Tenth',
    'Eleventh',
    'Twelfth',
    'Thirteenth',
    'Fourteenth',
    'Fifteenth',
    'Sixteenth',
    'Seventeenth',
    'Eighteenth',
    'Nineteenth',
    'Twentieth',
  ];

  static const romanNumerals = [
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
    'XIII',
    'XIV',
    'XV',
    'XVI',
    'XVII',
    'XVIII',
    'XIX',
    'XX',
  ];

  static const numberNames = [
    ['1', 'One', '१', 'एक'],
    ['2', 'Two', '२', 'दो'],
    ['3', 'Three', '३', 'तीन'],
    ['4', 'Four', '४', 'चार'],
    ['5', 'Five', '५', 'पाँच'],
    ['6', 'Six', '६', 'छह'],
    ['7', 'Seven', '७', 'सात'],
    ['8', 'Eight', '८', 'आठ'],
    ['9', 'Nine', '९', 'नौ'],
    ['10', 'Ten', '१०', 'दस'],
    ['50', 'Fifty', '५०', 'पचास'],
    ['100', 'One Hundred', '१००', 'एक सौ'],
    ['1000', 'One Thousand', '१०००', 'एक हजार'],
    ['10000', 'Ten Thousand', '१००००', 'दस हजार'],
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFE3F2FD),
      const Color(0xFFFFE8E8),
      const Color(0xFFE8F5E9),
      const Color(0xFFFFF3CD),
      const Color(0xFFF0E5FF),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text(
          'Numbers & Numerals',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),

      body: ListView(
        padding: const EdgeInsets.all(14),

        children: [

          // THREE HEADINGS SIDE BY SIDE
          Row(
            children: [
              _headingBox(
                'Ordinal',
                '1st, 2nd, 3rd',
                colors[0],
              ),

              const SizedBox(width: 7),

              _headingBox(
                'Roman',
                'I, II, III',
                colors[1],
              ),

              const SizedBox(width: 7),

              _headingBox(
                'देवनागरी',
                '१, २, ३',
                colors[2],
              ),
            ],
          ),

          const SizedBox(height: 15),

          // THREE COLUMNS
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: _ordinalColumn(colors),
              ),

              const SizedBox(width: 7),

              Expanded(
                child: _romanColumn(colors),
              ),

              const SizedBox(width: 7),

              Expanded(
                child: _devanagariColumn(colors),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // IMPORTANT NUMBER NAMES
          const Text(
            'Important Number Names',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),

          const SizedBox(height: 12),

          ...List.generate(
            numberNames.length,
            (index) {
              final item = numberNames[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [

                    SizedBox(
                      width: 65,
                      child: Text(
                        item[0],
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF20243A),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        item[1],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5B5FEF),
                        ),
                      ),
                    ),

                    Text(
                      item[2],
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        item[3],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B5FEF),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _headingBox(
    String title,
    String subtitle,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF20243A),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF74788D),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ordinalColumn(List<Color> colors) {
    return Column(
      children: List.generate(
        ordinalWords.length,
        (index) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 7),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  '${index + 1}${_ordinalSuffix(index + 1)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  ordinalWords[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF5B5FEF),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _romanColumn(List<Color> colors) {
    return Column(
      children: List.generate(
        romanNumerals.length,
        (index) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 7),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  romanNumerals[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF5B5FEF),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _devanagariColumn(List<Color> colors) {
    return Column(
      children: List.generate(
        20,
        (index) {
          final hindiNumbers = [
            '१',
            '२',
            '३',
            '४',
            '५',
            '६',
            '७',
            '८',
            '९',
            '१०',
            '११',
            '१२',
            '१३',
            '१४',
            '१५',
            '१६',
            '१७',
            '१८',
            '१९',
            '२०',
          ];

          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 7),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  hindiNumbers[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF5B5FEF),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  static String _ordinalSuffix(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return 'th';
    }

    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
