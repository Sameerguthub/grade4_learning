import 'package:flutter/material.dart';

class PlantsPracticePage extends StatefulWidget {
  const PlantsPracticePage({super.key});

  @override
  State<PlantsPracticePage> createState() => _PlantsPracticePageState();
}

class _PlantsPracticePageState extends State<PlantsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_PlantQuestion> questions = [
    _PlantQuestion(
      question: 'Which part of a plant usually grows under the soil?',
      options: [
        'Flower',
        'Root',
        'Leaf',
        'Fruit',
      ],
      answer: 1,
      explanation:
          'Roots usually grow under the soil. They hold the plant firmly and absorb water and minerals.',
    ),

    _PlantQuestion(
      question: 'Which part of a plant makes food?',
      options: [
        'Roots',
        'Stem',
        'Leaves',
        'Seeds',
      ],
      answer: 2,
      explanation:
          'Green leaves make food for the plant using sunlight, water and carbon dioxide.',
    ),

    _PlantQuestion(
      question: 'What do roots absorb from the soil?',
      options: [
        'Sunlight',
        'Water and minerals',
        'Oxygen only',
        'Flowers',
      ],
      answer: 1,
      explanation:
          'Roots absorb water and minerals from the soil.',
    ),

    _PlantQuestion(
      question: 'Which type of plant is usually tall and has a strong woody trunk?',
      options: [
        'Herb',
        'Creeper',
        'Tree',
        'Climber',
      ],
      answer: 2,
      explanation:
          'Trees are usually tall and have strong, woody stems called trunks.',
    ),

    _PlantQuestion(
      question: 'Which plant has a weak stem and needs support to grow upward?',
      options: [
        'Climber',
        'Tree',
        'Shrub',
        'Creeper',
      ],
      answer: 0,
      explanation:
          'Climbers have weak stems and use support to grow upward.',
    ),

    _PlantQuestion(
      question: 'Which plant usually spreads along the ground?',
      options: [
        'Tree',
        'Creeper',
        'Shrub',
        'Herb',
      ],
      answer: 1,
      explanation:
          'Creepers have weak stems and spread along the ground.',
    ),

    _PlantQuestion(
      question: 'Which of these is an example of a shrub?',
      options: [
        'Rose',
        'Mango tree',
        'Pumpkin',
        'Pea',
      ],
      answer: 0,
      explanation:
          'Rose is a common example of a shrub.',
    ),

    _PlantQuestion(
      question: 'What is photosynthesis?',
      options: [
        'The process of making food in green plants',
        'The process of sleeping',
        'The process of growing roots only',
        'The process of making soil',
      ],
      answer: 0,
      explanation:
          'Photosynthesis is the process by which green plants make food using sunlight, water and carbon dioxide.',
    ),

    _PlantQuestion(
      question: 'Which gas do plants take in from the air to make food?',
      options: [
        'Carbon dioxide',
        'Helium',
        'Hydrogen',
        'Water vapour only',
      ],
      answer: 0,
      explanation:
          'Plants take in carbon dioxide through tiny openings in their leaves.',
    ),

    _PlantQuestion(
      question: 'Which gas is released by green plants during photosynthesis?',
      options: [
        'Carbon dioxide',
        'Oxygen',
        'Nitrogen',
        'Helium',
      ],
      answer: 1,
      explanation:
          'Oxygen is released into the air during photosynthesis.',
    ),

    _PlantQuestion(
      question: 'What can develop into a new plant?',
      options: [
        'Stone',
        'Seed',
        'Soil',
        'Sunlight',
      ],
      answer: 1,
      explanation:
          'A seed contains a tiny baby plant and can grow into a new plant when conditions are suitable.',
    ),

    _PlantQuestion(
      question: 'Which of these is a flowering plant?',
      options: [
        'Rose',
        'Moss',
        'Fern',
        'None of these',
      ],
      answer: 0,
      explanation:
          'Rose is a flowering plant because it produces flowers.',
    ),

    _PlantQuestion(
      question: 'Which of these is a non-flowering plant?',
      options: [
        'Sunflower',
        'Rose',
        'Fern',
        'Mango',
      ],
      answer: 2,
      explanation:
          'Ferns are examples of non-flowering plants.',
    ),

    _PlantQuestion(
      question: 'Which of these is NOT a basic need of most plants?',
      options: [
        'Water',
        'Sunlight',
        'Air',
        'Television',
      ],
      answer: 3,
      explanation:
          'Plants need water, air, sunlight and suitable soil. They do not need television.',
    ),

    _PlantQuestion(
      question: 'Why are plants important to living things?',
      options: [
        'They provide food and oxygen',
        'They make plastic',
        'They stop all rain',
        'They remove all soil',
      ],
      answer: 0,
      explanation:
          'Plants provide food, oxygen, shelter and many useful materials for living things.',
    ),
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
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

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
  }

  void _showResult() {
    final percentage =
        ((score / questions.length) * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent! You really know your plants.';
    } else if (percentage >= 70) {
      message = 'Great job! Keep learning about plants.';
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
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.emoji_events_rounded,
                color: Color(0xFFFFA000),
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Practice Complete!',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score / ${questions.length}',
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF667168),
                  height: 1.4,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                restartQuiz();
              },
              child: const Text(
                'Try Again',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
              ),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress =
        (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4FAF5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        elevation: 0,
        title: const Text(
          'Plants Practice',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================================
              // PROGRESS
              // ==========================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestion + 1} of ${questions.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF526057),
                    ),
                  ),
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 9),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 9,
                  backgroundColor: const Color(0xFFDCE8DE),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF43A047),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ==========================================================
              // QUESTION CARD
              // ==========================================================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF43A047),
                      Color(0xFF2E7D32),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.eco_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      question.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ==========================================================
              // OPTIONS
              // ==========================================================

              ...List.generate(
                question.options.length,
                (index) {
                  return _buildOption(
                    index,
                    question.options[index],
                    question.answer,
                  );
                },
              ),

              // ==========================================================
              // EXPLANATION
              // ==========================================================

              if (answered) ...[
                const SizedBox(height: 8),
                _buildExplanation(question),
              ],

              const SizedBox(height: 22),

              // ==========================================================
              // NEXT BUTTON
              // ==========================================================

              if (answered)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: nextQuestion,
                    icon: Icon(
                      currentQuestion ==
                              questions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              questions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(17),
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

  // ========================================================================
  // OPTION
  // ========================================================================

  Widget _buildOption(
    int index,
    String text,
    int correctAnswer,
  ) {
    final isSelected = selectedAnswer == index;
    final isCorrect = index == correctAnswer;

    Color backgroundColor = Colors.white;
    Color borderColor = const Color(0xFFE0E7E1);
    Color iconColor = const Color(0xFF78909C);

    if (answered && isCorrect) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF43A047);
      iconColor = const Color(0xFF2E7D32);
    } else if (answered && isSelected && !isCorrect) {
      backgroundColor = const Color(0xFFFFEBEE);
      borderColor = const Color(0xFFE53935);
      iconColor = const Color(0xFFE53935);
    }

    return GestureDetector(
      onTap: () => selectAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 11),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: answered
                    ? Icon(
                        isCorrect
                            ? Icons.check_rounded
                            : (isSelected
                                ? Icons.close_rounded
                                : Icons.circle_outlined),
                        color: iconColor,
                        size: 21,
                      )
                    : Text(
                        String.fromCharCode(65 + index),
                        style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF39433C),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================================
  // EXPLANATION
  // ========================================================================

  Widget _buildExplanation(_PlantQuestion question) {
    final correct = selectedAnswer == question.answer;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correct
            ? const Color(0xFFE8F5E9)
            : const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct
                ? Icons.check_circle_rounded
                : Icons.info_rounded,
            color: correct
                ? const Color(0xFF2E7D32)
                : const Color(0xFFEF6C00),
            size: 25,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  correct ? 'Correct!' : 'Good try!',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: correct
                        ? const Color(0xFF2E7D32)
                        : const Color(0xFFEF6C00),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  question.explanation,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF59645C),
                    height: 1.4,
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

// ============================================================================
// QUESTION MODEL
// ============================================================================

class _PlantQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _PlantQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}