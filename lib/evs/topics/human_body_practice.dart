import 'package:flutter/material.dart';

class HumanBodyPracticePage extends StatefulWidget {
  const HumanBodyPracticePage({super.key});

  @override
  State<HumanBodyPracticePage> createState() =>
      _HumanBodyPracticePageState();
}

class _HumanBodyPracticePageState
    extends State<HumanBodyPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_BodyQuestion> questions = [
    _BodyQuestion(
      question: 'Which organ controls many activities of the body?',
      options: [
        'Heart',
        'Brain',
        'Stomach',
        'Lungs',
      ],
      answer: 1,
      explanation:
          'The brain is the control centre of the body. It helps us think, learn, remember and control movements.',
    ),

    _BodyQuestion(
      question: 'Which organ pumps blood around the body?',
      options: [
        'Brain',
        'Heart',
        'Lungs',
        'Stomach',
      ],
      answer: 1,
      explanation:
          'The heart is a muscular organ that pumps blood throughout the body.',
    ),

    _BodyQuestion(
      question: 'Which organs help us breathe?',
      options: [
        'Kidneys',
        'Lungs',
        'Stomach',
        'Bones',
      ],
      answer: 1,
      explanation:
          'The lungs help us breathe by taking oxygen from the air and removing carbon dioxide.',
    ),

    _BodyQuestion(
      question: 'What gives our body shape and support?',
      options: [
        'Skeleton',
        'Skin',
        'Hair',
        'Tongue',
      ],
      answer: 0,
      explanation:
          'The skeleton is the framework of bones that gives the body shape and support.',
    ),

    _BodyQuestion(
      question: 'What helps our bones move?',
      options: [
        'Muscles',
        'Teeth',
        'Hair',
        'Nails',
      ],
      answer: 0,
      explanation:
          'Muscles work together with bones to help different parts of the body move.',
    ),

    _BodyQuestion(
      question: 'Which sense organ helps us see?',
      options: [
        'Ear',
        'Nose',
        'Eye',
        'Skin',
      ],
      answer: 2,
      explanation:
          'Our eyes are the sense organs that help us see.',
    ),

    _BodyQuestion(
      question: 'Which sense organ helps us hear?',
      options: [
        'Eye',
        'Ear',
        'Tongue',
        'Nose',
      ],
      answer: 1,
      explanation:
          'Our ears help us hear sounds.',
    ),

    _BodyQuestion(
      question: 'Which sense organ helps us smell?',
      options: [
        'Nose',
        'Eye',
        'Skin',
        'Ear',
      ],
      answer: 0,
      explanation:
          'Our nose helps us detect and identify different smells.',
    ),

    _BodyQuestion(
      question: 'Which part of the body helps us taste food?',
      options: [
        'Tongue',
        'Ear',
        'Eye',
        'Hand',
      ],
      answer: 0,
      explanation:
          'The tongue helps us taste different flavours in food.',
    ),

    _BodyQuestion(
      question: 'Which organ helps break down food?',
      options: [
        'Heart',
        'Stomach',
        'Brain',
        'Lungs',
      ],
      answer: 1,
      explanation:
          'The stomach is part of the digestive system and helps break down food.',
    ),

    _BodyQuestion(
      question: 'What does blood carry around the body?',
      options: [
        'Only water',
        'Oxygen and nutrients',
        'Only food',
        'Only air',
      ],
      answer: 1,
      explanation:
          'Blood carries oxygen and nutrients to different parts of the body.',
    ),

    _BodyQuestion(
      question: 'What should we do to keep our teeth healthy?',
      options: [
        'Never brush them',
        'Brush twice a day',
        'Eat sweets all day',
        'Avoid drinking water',
      ],
      answer: 1,
      explanation:
          'Brushing our teeth twice a day helps keep them clean and healthy.',
    ),

    _BodyQuestion(
      question: 'Which habit helps keep our body healthy?',
      options: [
        'Never exercising',
        'Eating only sweets',
        'Regular physical activity',
        'Sleeping very little',
      ],
      answer: 2,
      explanation:
          'Regular physical activity helps keep our body strong and healthy.',
    ),

    _BodyQuestion(
      question: 'Why do we need sleep?',
      options: [
        'To help the body and brain rest',
        'To stop growing',
        'To avoid drinking water',
        'To make us hungry',
      ],
      answer: 0,
      explanation:
          'Good sleep gives the body and brain time to rest, recover and grow.',
    ),

    _BodyQuestion(
      question: 'Which organ helps us breathe in oxygen?',
      options: [
        'Lungs',
        'Stomach',
        'Teeth',
        'Bones',
      ],
      answer: 0,
      explanation:
          'The lungs take oxygen from the air when we breathe in.',
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
      message = 'Excellent! You know your body really well!';
    } else if (percentage >= 70) {
      message = 'Great job! Keep learning about your body.';
    } else if (percentage >= 50) {
      message = 'Good effort! A little more practice will help.';
    } else {
      message = 'Keep practising. You will improve!';
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
              Expanded(
                child: Text(
                  'Practice Complete!',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
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
                  color: Color(0xFF6A3FC5),
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
                  color: Color(0xFF6B6571),
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
                backgroundColor: const Color(0xFF6A3FC5),
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
      backgroundColor: const Color(0xFFF8F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF252333),
        elevation: 0,
        title: const Text(
          'Human Body Practice',
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
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestion + 1} of ${questions.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF625D68),
                    ),
                  ),
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF6A3FC5),
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
                  backgroundColor: const Color(0xFFE7E1EF),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF8E5DE7),
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
                      Color(0xFF8E5DE7),
                      Color(0xFF5E35B1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.accessibility_new_rounded,
                      color: Colors.white,
                      size: 35,
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

              if (answered) ...[
                const SizedBox(height: 5),
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
                          const Color(0xFF6A3FC5),
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

  // =========================================================================
  // OPTION
  // =========================================================================

  Widget _buildOption(
    int index,
    String text,
    int correctAnswer,
  ) {
    final isSelected = selectedAnswer == index;
    final isCorrect = index == correctAnswer;

    Color backgroundColor = Colors.white;
    Color borderColor = const Color(0xFFE2DDE8);
    Color iconColor = const Color(0xFF817A88);

    if (answered && isCorrect) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF43A047);
      iconColor = const Color(0xFF2E7D32);
    } else if (answered &&
        isSelected &&
        !isCorrect) {
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
                color:
                    iconColor.withValues(alpha: 0.10),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: answered
                    ? Icon(
                        isCorrect
                            ? Icons.check_rounded
                            : isSelected
                                ? Icons.close_rounded
                                : Icons.circle_outlined,
                        color: iconColor,
                        size: 21,
                      )
                    : Text(
                        String.fromCharCode(
                          65 + index,
                        ),
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
                  color: Color(0xFF403A46),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // EXPLANATION
  // =========================================================================

  Widget _buildExplanation(
    _BodyQuestion question,
  ) {
    final correct =
        selectedAnswer == question.answer;

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
        crossAxisAlignment:
            CrossAxisAlignment.start,
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
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  correct
                      ? 'Correct!'
                      : 'Good try!',
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
                    color: Color(0xFF625D64),
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

class _BodyQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _BodyQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}