
import 'package:flutter/material.dart';

class DaysMonthsPage extends StatelessWidget {
  const DaysMonthsPage({super.key});

  static const days = [
    ['Monday', 'सोमवार'],
    ['Tuesday', 'मंगलवार'],
    ['Wednesday', 'बुधवार'],
    ['Thursday', 'गुरुवार'],
    ['Friday', 'शुक्रवार'],
    ['Saturday', 'शनिवार'],
    ['Sunday', 'रविवार'],
  ];

  static const months = [
    ['January', 'जनवरी'],
    ['February', 'फरवरी'],
    ['March', 'मार्च'],
    ['April', 'अप्रैल'],
    ['May', 'मई'],
    ['June', 'जून'],
    ['July', 'जुलाई'],
    ['August', 'अगस्त'],
    ['September', 'सितंबर'],
    ['October', 'अक्टूबर'],
    ['November', 'नवंबर'],
    ['December', 'दिसंबर'],
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
          'Days & Months',
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
            'Days of the Week',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '7 days in a week',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF74788D),
            ),
          ),
          const SizedBox(height: 14),

          ...List.generate(days.length, (index) {
            return _InfoCard(
              number: '${index + 1}',
              title: days[index][0],
              subtitle: days[index][1],
              color: colors[index % colors.length],
            );
          }),

          const SizedBox(height: 25),

          const Text(
            'Months of the Year',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '12 months in a year',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF74788D),
            ),
          ),
          const SizedBox(height: 14),

          ...List.generate(months.length, (index) {
            return _InfoCard(
              number: '${index + 1}',
              title: months[index][0],
              subtitle: months[index][1],
              color: colors[index % colors.length],
            );
          }),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final Color color;

  const _InfoCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.75),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                color: Color(0xFF5B5FEF),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
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
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF5B5FEF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
