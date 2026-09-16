import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'theme.dart';

class Grade4LearningApp extends StatelessWidget {
  const Grade4LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade 4 Learning',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}