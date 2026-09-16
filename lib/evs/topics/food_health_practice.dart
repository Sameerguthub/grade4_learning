import 'package:flutter/material.dart';

class FoodHealthPracticePage extends StatefulWidget {
  const FoodHealthPracticePage({super.key});

  @override
  State<FoodHealthPracticePage> createState() =>
      _FoodHealthPracticePageState();
}

class _FoodHealthPracticePageState
    extends State<FoodHealthPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      question: 'Why do we need food?',
      options: [
        'Only to taste different flavours',
        'For energy, growth and good health',
        'Only when we are hungry',
        'To stay awake all night',
      ],
      answer: 1,
      explanation:
          'Food gives us energy, helps us grow and keeps our body healthy.',
    ),

    _Question(
      question: 'Which nutrient is mainly responsible for giving us energy?',
      options: [
        'Carbohydrates',
        'Vitamins',
        'Minerals',
        'Water',
      ],
      answer: 0,
      explanation:
          'Carbohydrates are an important source of energy for our body.',
    ),

    _Question(
      question: 'Which nutrient helps in growth and repair of our body?',
      options: [
        'Water',
        'Protein',
        'Fibre',
        'Vitamins',
      ],
      answer: 1,
      explanation:
          'Proteins help our body grow and repair muscles and tissues.',
    ),

    _Question(
      question: 'Which foods are especially good sources of vitamins and minerals?',
      options: [
        'Fruits and vegetables',
        'Candy and chocolates',
        'Soft drinks',
        'Chips only',
      ],
      answer: 0,
      explanation:
          'Fruits and vegetables provide many important vitamins and minerals.',
    ),

    _Question(
      question: 'What is a balanced diet?',
      options: [
        'Eating only one type of food',
        'Eating only sweets',
        'Eating different nutritious foods in the right amounts',
        'Skipping meals',
      ],
      answer: 2,
      explanation:
          'A balanced diet includes different kinds of nutritious foods in suitable amounts.',
    ),

    _Question(
      question: 'Which nutrient helps our body stay hydrated?',
      options: [
        'Protein',
        'Water',
        'Fibre',
        'Fat',
      ],
      answer: 1,
      explanation:
          'Water is essential for keeping our body hydrated.',
    ),

    _Question(
      question: 'Which food is a good source of protein?',
      options: [
        'Egg',
        'Candy',
        'Soft drink',
        'Sugar',
      ],
      answer: 0,
      explanation:
          'Eggs contain protein, which helps our body grow and repair itself.',
    ),

    _Question(
      question: 'What does fibre help with?',
      options: [
        'Digestion',
        'Making us taller instantly',
        'Changing our eye colour',
        'Making food sweeter',
      ],
      answer: 0,
      explanation:
          'Fibre helps our digestive system work properly.',
    ),

    _Question(
      question: 'What should you do before eating food?',
      options: [
        'Run outside',
        'Wash your hands',
        'Drink a soft drink',
        'Skip the meal',
      ],
      answer: 1,
      explanation:
          'Washing our hands before eating helps remove germs and keeps us healthier.',
    ),

    _Question(
      question: 'Which is the healthier choice?',
      options: [
        'Fresh fruit',
        'Only candy',
        'Only chips',
        'Sugary drinks',
      ],
      answer: 0,
      explanation:
          'Fresh fruits provide useful nutrients such as vitamins, minerals and fibre.',
    ),

    _Question(
      question: 'Why should food be kept covered?',
      options: [
        'To make it heavier',
        'To protect it from dust and insects',
        'To make it sweeter',
        'To change its colour',
      ],
      answer: 1,
      explanation:
          'Covering food helps protect it from dust, insects and contamination.',
    ),

    _Question(
      question: 'Which habit is good for health?',
      options: [
        'Skipping breakfast every day',
        'Never drinking water',
        'Eating nutritious food and exercising',
        'Eating only junk food',
      ],
      answer: 2,
      explanation:
          'Nutritious food and regular physical activity help us stay healthy and active.',
    ),

    _Question(
      question: 'Which of these is an energy-giving food?',
      options: [
        'Rice',
        'Water',
        'Spinach only',
        'Salt',
      ],
      answer: 0,
      explanation:
          'Rice contains carbohydrates, which provide energy.',
    ),

    _Question(
      question: 'Why do growing children need nutritious food?',
      options: [
        'To help their body grow and develop',
        'Only to make food colourful',
        'So they never need sleep',
        'To avoid drinking water',
      ],
      answer: 0,
      explanation:
          'Children need nutritious food for growth, development, energy and good health.',
    ),

    _Question(
      question: 'Which statement is correct?',
      options: [
        'We should eat only junk food.',
        'Water is not important.',
        'Healthy food, hygiene, exercise and sleep all support good health.',
        'We should skip all meals.',
      ],
      answer: 2,
      explanation:
          'Good health comes from healthy food, hygiene, physical activity, enough sleep and other healthy habits.',
    ),
  ];

  void _selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      _showResult();
    }
  }

  void _restart() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
  }

  void _showResult() {
    final percentage = ((score / questions.length) * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent work! You are a food and health expert!';
    } else if (percentage >= 70) {
      message = 'Great job! Keep learning about healthy habits.';
    } else if (percentage >= 50) {
      message = 'Good effort! A little more practice will help.';
    } else {
      message = 'Keep practising. You will get better!';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Column(
            children: [
              Icon(
                percentage >= 70
                    ? Icons.workspace_premium_rounded
                    : Icons.school_rounded,
                size: 58,
                color: const Color(0xFF43A047),
              ),
              const SizedBox(height: 10),
              const Text(
                'Practice Complete!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                _restart();
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.check_rounded),
              label: const Text('Done'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF2E7D32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _answerColor(int index) {
    if (!answered) {
      return Colors.white;
    }

    if (index == questions[currentQuestion].answer) {
      return const Color(0xFFE8F5E9);
    }

    if (index == selectedAnswer) {
      return const Color(0xFFFFEBEE);
    }

    return Colors.white;
  }

  Color _answerBorderColor(int index) {
    if (!answered) {
      return Colors.black12;
    }

    if (index == questions[currentQuestion].answer) {
      return const Color(0xFF43A047);
    }

    if (index == selectedAnswer) {
      return const Color(0xFFE53935);
    }

    return Colors.black12;
  }

  IconData _answerIcon(int index) {
    if (!answered) {
      return Icons.radio_button_unchecked_rounded;
    }

    if (index == questions[currentQuestion].answer) {
      return Icons.check_circle_rounded;
    }

    if (index == selectedAnswer) {
      return Icons.cancel_rounded;
    }

    return Icons.radio_button_unchecked_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress =
        (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      appBar: AppBar(
        title: const Text(
          'Food & Health Practice',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 9,
                        backgroundColor: Colors.black12,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Color(0xFF43A047),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${currentQuestion + 1}/${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.help_outline_rounded,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Question',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                question.options.length,
                (index) {
                  return GestureDetector(
                    onTap: () => _selectAnswer(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 11),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: _answerColor(index),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: _answerBorderColor(index),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: answered &&
                                      index ==
                                          question.answer
                                  ? const Color(0xFF43A047)
                                  : const Color(0xFFF1F3F4),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(
                                65 + index,
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: answered &&
                                        index ==
                                            question.answer
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              question.options[index],
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _answerIcon(index),
                            size: 22,
                            color: answered &&
                                    index ==
                                        question.answer
                                ? const Color(0xFF43A047)
                                : index == selectedAnswer
                                    ? const Color(0xFFE53935)
                                    : Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              if (answered) ...[
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedAnswer ==
                            question.answer
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer ==
                                question.answer
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: selectedAnswer ==
                                question.answer
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFEF6C00),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          question.explanation,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 20),

              if (answered)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: _nextQuestion,
                    icon: Icon(
                      currentQuestion ==
                              questions.length - 1
                          ? Icons.emoji_events_outlined
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              questions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Question {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _Question({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}