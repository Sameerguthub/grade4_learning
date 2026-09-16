import 'package:flutter/material.dart';
import 'general_data.dart';

class GeneralCategoryPage extends StatelessWidget {
  final GeneralCategory category;

  const GeneralCategoryPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF20243A),
        elevation: 0,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
        itemCount: category.items.length,

        itemBuilder: (context, index) {
          final item = category.items[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _LearningCard(item: item),
          );
        },
      ),
    );
  }
}


// ============================================================================
// LEARNING CARD
// ============================================================================

class _LearningCard extends StatelessWidget {
  final GeneralItem item;

  const _LearningCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(17),

              child: Image.asset(
                item.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,

                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 220,
                    color: const Color(0xFFF0F1F6),

                    child: const Center(
                      child: Icon(
                        Icons.image_rounded,
                        size: 70,
                        color: Color(0xFFB8BDCC),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            // NAME
            Text(
              item.name,

              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Color(0xFF20243A),
              ),
            ),

            const SizedBox(height: 12),

            // WHERE IT LIVES
            _InfoRow(
              icon: Icons.location_on_rounded,
              title: 'Lives',
              text: item.lives,
            ),

            const SizedBox(height: 9),

            // WHAT IT EATS
            _InfoRow(
              icon: Icons.restaurant_rounded,
              title: 'Eats',
              text: item.eats,
            ),

            const SizedBox(height: 12),

            // SHORT ABOUT
            Text(
              item.description,

              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: Color(0xFF64697B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ============================================================================
// INFO ROW
// ============================================================================

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Icon(
          icon,
          size: 20,
          color: const Color(0xFF5B5FEF),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: RichText(
            text: TextSpan(
              children: [

                TextSpan(
                  text: '$title: ',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF303448),
                  ),
                ),

                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF64697B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}