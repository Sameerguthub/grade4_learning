
import 'package:flutter/material.dart';

class MeasurementUnitsPage extends StatelessWidget {
  const MeasurementUnitsPage({super.key});

  static const measurements = [
    {
      'title': 'Length',
      'icon': Icons.straighten_rounded,
      'units': 'Millimetre (mm) → Centimetre (cm) → Metre (m) → Kilometre (km)',
      'facts': [
        '10 mm = 1 cm',
        '100 cm = 1 m',
        '1000 m = 1 km',
      ],
      'example': 'Example: A pencil can be about 15 cm long.',
    },
    {
      'title': 'Weight / Mass',
      'icon': Icons.scale_rounded,
      'units': 'Milligram (mg) → Gram (g) → Kilogram (kg) → Tonne (t)',
      'facts': [
        '1000 mg = 1 g',
        '1000 g = 1 kg',
        '1000 kg = 1 tonne',
      ],
      'example': 'Example: A school bag may weigh about 3 kg.',
    },
    {
      'title': 'Capacity',
      'icon': Icons.water_drop_rounded,
      'units': 'Millilitre (mL) → Litre (L)',
      'facts': [
        '1000 mL = 1 L',
        '500 mL = 0.5 L',
      ],
      'example': 'Example: A water bottle may hold 1 litre.',
    },
    {
      'title': 'Time',
      'icon': Icons.access_time_rounded,
      'units': 'Second → Minute → Hour → Day → Week → Month → Year',
      'facts': [
        '60 seconds = 1 minute',
        '60 minutes = 1 hour',
        '24 hours = 1 day',
        '7 days = 1 week',
        '12 months = 1 year',
      ],
      'example': 'Example: A school day may be about 6 hours.',
    },
    {
      'title': 'Temperature',
      'icon': Icons.thermostat_rounded,
      'units': 'Degree Celsius (°C) → Degree Fahrenheit (°F)',
      'facts': [
        'Water freezes at 0°C',
        'Water boils at 100°C',
      ],
      'example': 'Example: A hot summer day can be around 35°C.',
    },
    {
      'title': 'Area',
      'icon': Icons.square_foot_rounded,
      'units': 'Square centimetre (cm²) → Square metre (m²) → Square kilometre (km²)',
      'facts': [
        '100 cm² = 1 m² is NOT correct',
        '1 m² = 10,000 cm²',
        '1 km² = 1,000,000 m²',
      ],
      'example': 'Area tells us how much surface a place or object covers.',
    },
    {
      'title': 'Volume',
      'icon': Icons.view_in_ar_rounded,
      'units': 'Cubic centimetre (cm³) → Cubic metre (m³)',
      'facts': [
        '1 cm³ = 1 millilitre',
        '1000 cm³ = 1 litre',
        '1 m³ = 1,000 litres',
      ],
      'example': 'Volume tells us how much space an object occupies.',
    },
    {
      'title': 'Speed',
      'icon': Icons.speed_rounded,
      'units': 'Metre per second (m/s) → Kilometre per hour (km/h)',
      'facts': [
        'Speed tells us how fast something moves.',
        'A bicycle may travel around 15 km/h.',
      ],
      'example': 'Example: A car may travel at 60 km/h.',
    },
    {
      'title': 'Money',
      'icon': Icons.currency_rupee_rounded,
      'units': 'Paise → Rupee (₹)',
      'facts': [
        '100 paise = ₹1',
        '₹10 = 1000 paise',
      ],
      'example': 'Example: A ₹20 note is worth twenty rupees.',
    },
    {
      'title': 'Digital Storage',
      'icon': Icons.storage_rounded,
      'units': 'Byte → Kilobyte (KB) → Megabyte (MB) → Gigabyte (GB) → Terabyte (TB)',
      'facts': [
        '1024 bytes = 1 KB',
        '1024 KB = 1 MB',
        '1024 MB = 1 GB',
        '1024 GB = 1 TB',
      ],
      'example': 'Example: Photos and videos use digital storage.',
    },
    {
      'title': 'Indian Number System',
      'icon': Icons.numbers_rounded,
      'units': 'Ones → Tens → Hundreds → Thousands → Lakh → Crore',
      'facts': [
        '10 ones = 1 ten',
        '10 tens = 1 hundred',
        '10 hundreds = 1 thousand',
        '100 thousand = 1 lakh',
        '100 lakh = 1 crore',
      ],
      'example': 'Example: ₹1,00,000 = One lakh rupees.',
    },
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
          'Measurement Units',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: measurements.length,
        itemBuilder: (context, index) {
          final item = measurements[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.75),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: const Color(0xFF5B5FEF),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF20243A),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Text(
                  item['units'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF34384F),
                  ),
                ),

                const SizedBox(height: 12),

                ...(item['facts'] as List<String>).map(
                  (fact) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5B5FEF),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            fact,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF34384F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  item['example'] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF74788D),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
