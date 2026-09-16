
import 'package:flutter/material.dart';

class TimeClockPage extends StatelessWidget {
  const TimeClockPage({super.key});

  static const units = [
    ['Second', '60 seconds = 1 minute'],
    ['Minute', '60 minutes = 1 hour'],
    ['Hour', '24 hours = 1 day'],
    ['Day', '7 days = 1 week'],
    ['Week', 'About 4 weeks = 1 month'],
    ['Month', '12 months = 1 year'],
    ['Year', '365 days = 1 year'],
  ];

  static const clockFacts = [
    ['1:00', 'One o’clock'],
    ['2:00', 'Two o’clock'],
    ['3:00', 'Three o’clock'],
    ['4:00', 'Four o’clock'],
    ['5:00', 'Five o’clock'],
    ['6:00', 'Six o’clock'],
    ['7:00', 'Seven o’clock'],
    ['8:00', 'Eight o’clock'],
    ['9:00', 'Nine o’clock'],
    ['10:00', 'Ten o’clock'],
    ['11:00', 'Eleven o’clock'],
    ['12:00', 'Twelve o’clock'],
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
          'Time & Clock',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Units of Time',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 12),

          ...List.generate(units.length, (index) {
            return _TimeCard(
              title: units[index][0],
              subtitle: units[index][1],
              color: colors[index % colors.length],
            );
          }),

          const SizedBox(height: 24),

          const Text(
            'Reading the Clock',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: clockFacts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      clockFacts[index][0],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF20243A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      clockFacts[index][1],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5B5FEF),
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
}

class _TimeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _TimeCard({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.access_time_rounded,
            color: Color(0xFF5B5FEF),
            size: 28,
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF20243A),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF74788D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
