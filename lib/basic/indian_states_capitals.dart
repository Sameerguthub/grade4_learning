
import 'package:flutter/material.dart';

class IndianStatesCapitalsPage extends StatelessWidget {
  const IndianStatesCapitalsPage({super.key});

  final List<Map<String, String>> states = const [
    {'state': 'Andhra Pradesh', 'capital': 'Amaravati'},
    {'state': 'Arunachal Pradesh', 'capital': 'Itanagar'},
    {'state': 'Assam', 'capital': 'Dispur'},
    {'state': 'Bihar', 'capital': 'Patna'},
    {'state': 'Chhattisgarh', 'capital': 'Raipur'},
    {'state': 'Goa', 'capital': 'Panaji'},
    {'state': 'Gujarat', 'capital': 'Gandhinagar'},
    {'state': 'Haryana', 'capital': 'Chandigarh'},
    {'state': 'Himachal Pradesh', 'capital': 'Shimla'},
    {'state': 'Jharkhand', 'capital': 'Ranchi'},
    {'state': 'Karnataka', 'capital': 'Bengaluru'},
    {'state': 'Kerala', 'capital': 'Thiruvananthapuram'},
    {'state': 'Madhya Pradesh', 'capital': 'Bhopal'},
    {'state': 'Maharashtra', 'capital': 'Mumbai'},
    {'state': 'Manipur', 'capital': 'Imphal'},
    {'state': 'Meghalaya', 'capital': 'Shillong'},
    {'state': 'Mizoram', 'capital': 'Aizawl'},
    {'state': 'Nagaland', 'capital': 'Kohima'},
    {'state': 'Odisha', 'capital': 'Bhubaneswar'},
    {'state': 'Punjab', 'capital': 'Chandigarh'},
    {'state': 'Rajasthan', 'capital': 'Jaipur'},
    {'state': 'Sikkim', 'capital': 'Gangtok'},
    {'state': 'Tamil Nadu', 'capital': 'Chennai'},
    {'state': 'Telangana', 'capital': 'Hyderabad'},
    {'state': 'Tripura', 'capital': 'Agartala'},
    {'state': 'Uttar Pradesh', 'capital': 'Lucknow'},
    {'state': 'Uttarakhand', 'capital': 'Dehradun'},
    {'state': 'West Bengal', 'capital': 'Kolkata'},
  ];

  final List<Color> colors = const [
    Color(0xFFE3F2FD),
    Color(0xFFE8F5E9),
    Color(0xFFFFF3E0),
    Color(0xFFF3E5F5),
    Color(0xFFFFEBEE),
    Color(0xFFE0F7FA),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Indian States & Capitals',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: states.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final item = states[index];

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Icon(
                    Icons.location_on_rounded,
                    color: Color(0xFF4E8DF5),
                    size: 23,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item['state']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20243A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Capital',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item['capital']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF34384F),
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
