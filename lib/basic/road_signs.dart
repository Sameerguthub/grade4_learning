
import 'package:flutter/material.dart';

class RoadSignsPage extends StatelessWidget {
  const RoadSignsPage({super.key});

  static const signs = [
    {
      'name': 'Stop',
      'meaning': 'Stop your vehicle completely.',
      'icon': Icons.stop_circle_rounded,
    },
    {
      'name': 'No Entry',
      'meaning': 'Vehicles are not allowed to enter.',
      'icon': Icons.block_rounded,
    },
    {
      'name': 'No Parking',
      'meaning': 'Parking is not allowed here.',
      'icon': Icons.local_parking_rounded,
    },
    {
      'name': 'No U-Turn',
      'meaning': 'U-turns are not allowed.',
      'icon': Icons.u_turn_left_rounded,
    },
    {
      'name': 'No Overtaking',
      'meaning': 'Do not overtake other vehicles.',
      'icon': Icons.directions_car_rounded,
    },
    {
      'name': 'Speed Limit',
      'meaning': 'Do not exceed the displayed speed.',
      'icon': Icons.speed_rounded,
    },
    {
      'name': 'Give Way',
      'meaning': 'Slow down and give way to other traffic.',
      'icon': Icons.priority_high_rounded,
    },
    {
      'name': 'Pedestrian Crossing',
      'meaning': 'People may cross the road here.',
      'icon': Icons.directions_walk_rounded,
    },
    {
      'name': 'School Ahead',
      'meaning': 'A school is nearby. Drive carefully.',
      'icon': Icons.school_rounded,
    },
    {
      'name': 'Hospital',
      'meaning': 'A hospital or medical facility is nearby.',
      'icon': Icons.local_hospital_rounded,
    },
    {
      'name': 'Railway Crossing',
      'meaning': 'A railway crossing is ahead.',
      'icon': Icons.train_rounded,
    },
    {
      'name': 'Traffic Signals',
      'meaning': 'Traffic lights are ahead.',
      'icon': Icons.traffic_rounded,
    },
    {
      'name': 'One Way',
      'meaning': 'Traffic moves in one direction.',
      'icon': Icons.arrow_forward_rounded,
    },
    {
      'name': 'Keep Left',
      'meaning': 'Keep your vehicle on the left side.',
      'icon': Icons.turn_left_rounded,
    },
    {
      'name': 'Keep Right',
      'meaning': 'Keep your vehicle on the right side.',
      'icon': Icons.turn_right_rounded,
    },
    {
      'name': 'Turn Left',
      'meaning': 'Turn left ahead.',
      'icon': Icons.turn_left_rounded,
    },
    {
      'name': 'Turn Right',
      'meaning': 'Turn right ahead.',
      'icon': Icons.turn_right_rounded,
    },
    {
      'name': 'Straight Ahead',
      'meaning': 'Continue straight ahead.',
      'icon': Icons.arrow_upward_rounded,
    },
    {
      'name': 'Roundabout',
      'meaning': 'A roundabout is ahead.',
      'icon': Icons.roundabout_right_rounded,
    },
    {
      'name': 'Road Work',
      'meaning': 'Road construction or repair is ahead.',
      'icon': Icons.construction_rounded,
    },
    {
      'name': 'Slippery Road',
      'meaning': 'The road may be slippery.',
      'icon': Icons.car_crash_rounded,
    },
    {
      'name': 'Speed Breaker',
      'meaning': 'Slow down for a speed breaker.',
      'icon': Icons.warning_rounded,
    },
    {
      'name': 'Narrow Road',
      'meaning': 'The road becomes narrower ahead.',
      'icon': Icons.compare_arrows_rounded,
    },
    {
      'name': 'Children Crossing',
      'meaning': 'Children may cross the road here.',
      'icon': Icons.child_care_rounded,
    },
    {
      'name': 'Cycle Crossing',
      'meaning': 'Cyclists may cross the road here.',
      'icon': Icons.pedal_bike_rounded,
    },
    {
      'name': 'Bus Stop',
      'meaning': 'A bus stop is nearby.',
      'icon': Icons.directions_bus_rounded,
    },
    {
      'name': 'Parking',
      'meaning': 'Parking is available here.',
      'icon': Icons.local_parking_rounded,
    },
    {
      'name': 'Dead End',
      'meaning': 'The road does not continue ahead.',
      'icon': Icons.block_rounded,
    },
    {
      'name': 'Horn Prohibited',
      'meaning': 'Do not use the horn in this area.',
      'icon': Icons.volume_off_rounded,
    },
    {
      'name': 'Pedestrian Zone',
      'meaning': 'Watch for people walking in this area.',
      'icon': Icons.directions_walk_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFFFE8E8),
      const Color(0xFFFFF3CD),
      const Color(0xFFE3F2FD),
      const Color(0xFFE8F5E9),
      const Color(0xFFF0E5FF),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Basic Road Signs',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: signs.length,
        itemBuilder: (context, index) {
          final sign = signs[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(17),
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    sign['icon'] as IconData,
                    size: 32,
                    color: const Color(0xFF5B5FEF),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sign['name'] as String,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF20243A),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        sign['meaning'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF74788D),
                        ),
                      ),
                    ],
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
