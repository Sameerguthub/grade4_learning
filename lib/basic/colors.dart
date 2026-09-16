
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  static const colorList = [
    ['Red', Color(0xFFE53935)],
    ['Blue', Color(0xFF1E88E5)],
    ['Green', Color(0xFF43A047)],
    ['Yellow', Color(0xFFFDD835)],
    ['Orange', Color(0xFFFB8C00)],
    ['Purple', Color(0xFF8E44AD)],
    ['Pink', Color(0xFFE91E63)],
    ['Brown', Color(0xFF795548)],
    ['Black', Color(0xFF212121)],
    ['White', Color(0xFFFFFFFF)],
    ['Grey', Color(0xFF9E9E9E)],
    ['Sky Blue', Color(0xFF4FC3F7)],

    // 10 more
    ['Violet', Color(0xFF673AB7)],
    ['Indigo', Color(0xFF3F51B5)],
    ['Gold', Color(0xFFFFC107)],
    ['Silver', Color(0xFFBDBDBD)],
    ['Teal', Color(0xFF009688)],
    ['Cyan', Color(0xFF00BCD4)],
    ['Lime', Color(0xFF8BC34A)],
    ['Maroon', Color(0xFF800000)],
    ['Navy Blue', Color(0xFF1A237E)],
    ['Beige', Color(0xFFD7CCC8)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Colours',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colorList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final item = colorList[index];

          return Container(
            decoration: BoxDecoration(
              color: item[1] as Color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: Center(
              child: Text(
                item[0] as String,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: (item[0] == 'Yellow' ||
                          item[0] == 'White' ||
                          item[0] == 'Sky Blue')
                      ? const Color(0xFF20243A)
                      : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
