import 'package:flutter/material.dart';

class MathsTopic {
  final String title;
  final String description;
  final IconData icon;

  const MathsTopic({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const List<MathsTopic> mathsTopics = [
  MathsTopic(
    title: 'Numbers',
    description: 'Read, write and understand numbers',
    icon: Icons.numbers_rounded,
  ),
  MathsTopic(
    title: 'Addition',
    description: 'Add numbers with confidence',
    icon: Icons.add_circle_rounded,
  ),
  MathsTopic(
    title: 'Subtraction',
    description: 'Learn subtraction step by step',
    icon: Icons.remove_circle_rounded,
  ),
  MathsTopic(
    title: 'Multiplication',
    description: 'Tables and multiplication',
    icon: Icons.close_rounded,
  ),
  MathsTopic(
    title: 'Division',
    description: 'Share numbers equally',
    icon: Icons.pie_chart_rounded,
  ),
  MathsTopic(
    title: 'Fractions',
    description: 'Understand parts of a whole',
    icon: Icons.pie_chart_outline_rounded,
  ),
  MathsTopic(
    title: 'Decimals',
    description: 'Learn numbers with decimal points',
    icon: Icons.calculate_rounded,
  ),
  MathsTopic(
    title: 'Factors & Multiples',
    description: 'Find factors and multiples',
    icon: Icons.account_tree_rounded,
  ),
  MathsTopic(
    title: 'Geometry',
    description: 'Shapes, lines and angles',
    icon: Icons.category_rounded,
  ),
  MathsTopic(
    title: 'Measurement',
    description: 'Length, weight and capacity',
    icon: Icons.straighten_rounded,
  ),
  MathsTopic(
    title: 'Time',
    description: 'Read clocks and understand time',
    icon: Icons.access_time_rounded,
  ),
  MathsTopic(
    title: 'Money',
    description: 'Learn about rupees and prices',
    icon: Icons.currency_rupee_rounded,
  ),
  MathsTopic(
    title: 'Data Handling',
    description: 'Read charts and information',
    icon: Icons.bar_chart_rounded,
  ),
  MathsTopic(
    title: 'Word Problems',
    description: 'Use maths in everyday situations',
    icon: Icons.lightbulb_rounded,
  ),
];