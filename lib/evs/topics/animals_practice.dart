import 'package:flutter/material.dart';

class AnimalsPracticePage extends StatefulWidget {
  const AnimalsPracticePage({super.key});

  @override
  State<AnimalsPracticePage> createState() =>
      _AnimalsPracticePageState();
}

class _AnimalsPracticePageState
    extends State<AnimalsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_AnimalQuestion> questions = [
    _AnimalQuestion(
      question: 'Which of these is a wild animal?',
      options: [
        'Cow',
        'Dog',
        'Tiger',
        'Goat',
      ],
      answer: 2,
      explanation:
          'A tiger is a wild animal that normally lives in natural habitats such as forests.',
    ),

    _AnimalQuestion(
      question: 'Which animal is commonly kept as a pet?',
      options: [
        'Lion',
        'Dog',
        'Tiger',
        'Elephant',
      ],
      answer: 1,
      explanation:
          'Dogs are commonly kept as pets and companions by people.',
    ),

    _AnimalQuestion(
      question: 'Which animal is a herbivore?',
      options: [
        'Lion',
        'Tiger',
        'Cow',
        'Eagle',
      ],
      answer: 2,
      explanation:
          'A cow is a herbivore because it mainly eats plants and grass.',
    ),

    _AnimalQuestion(
      question: 'Which animal is a carnivore?',
      options: [
        'Cow',
        'Deer',
        'Rabbit',
        'Lion',
      ],
      answer: 3,
      explanation:
          'A lion is a carnivore because it mainly eats other animals.',
    ),

    _AnimalQuestion(
      question: 'Which animal is an omnivore?',
      options: [
        'Bear',
        'Cow',
        'Deer',
        'Rabbit',
      ],
      answer: 0,
      explanation:
          'Bears can eat both plant food and animal food, so they are omnivores.',
    ),

    _AnimalQuestion(
      question: 'Where does a fish live?',
      options: [
        'Desert',
        'Water',
        'Tree',
        'Mountain top',
      ],
      answer: 1,
      explanation:
          'Fish live in water and use gills to breathe.',
    ),

    _AnimalQuestion(
      question: 'Which animal can live both on land and in water?',
      options: [
        'Frog',
        'Camel',
        'Eagle',
        'Cow',
      ],
      answer: 0,
      explanation:
          'A frog is an amphibian and can live in water and on land during different stages of its life.',
    ),

    _AnimalQuestion(
      question: 'Which group of animals has feathers?',
      options: [
        'Mammals',
        'Birds',
        'Fish',
        'Reptiles',
      ],
      answer: 1,
      explanation:
          'Birds have feathers covering their bodies.',
    ),

    _AnimalQuestion(
      question: 'How many legs does an insect have?',
      options: [
        'Two',
        'Four',
        'Six',
        'Eight',
      ],
      answer: 2,
      explanation:
          'Insects have six legs.',
    ),

    _AnimalQuestion(
      question: 'Which animal has scales and usually crawls?',
      options: [
        'Snake',
        'Dog',
        'Cow',
        'Parrot',
      ],
      answer: 0,
      explanation:
          'A snake is a reptile with scales and moves by crawling or slithering.',
    ),

    _AnimalQuestion(
      question: 'What is a baby dog called?',
      options: [
        'Calf',
        'Puppy',
        'Kitten',
        'Chick',
      ],
      answer: 1,
      explanation:
          'A baby dog is called a puppy.',
    ),

    _AnimalQuestion(
      question: 'What is a baby cat called?',
      options: [
        'Kitten',
        'Puppy',
        'Foal',
        'Calf',
      ],
      answer: 0,
      explanation:
          'A baby cat is called a kitten.',
    ),

    _AnimalQuestion(
      question: 'Which animal is adapted to life in a desert?',
      options: [
        'Camel',
        'Penguin',
        'Dolphin',
        'Frog',
      ],
      answer: 0,
      explanation:
          'Camels are well adapted to hot desert environments.',
    ),

    _AnimalQuestion(
      question: 'Which animal can fly?',
      options: [
        'Elephant',
        'Eagle',
        'Cow',
        'Horse',
      ],
      answer: 1,
      explanation:
          'An eagle is a bird and can fly using its wings.',
    ),

    _AnimalQuestion(
      question: 'Why are animals important?',
      options: [
        'They are part of nature',
        'They help maintain ecosystems',
        'Some provide useful products',
        'All of these',
      ],
      answer: 3,
      explanation:
          'Animals are important parts of nature. They help ecosystems and some provide useful products and services.',
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
      message = 'Excellent! You are an animal expert!';
    } else if (percentage >= 70) {
      message = 'Great job! You know a lot about animals.';
    } else if (percentage >= 50) {
      message = 'Good effort! Keep exploring the animal world.';
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
      backgroundColor: const Color(0xFFF5F9F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        elevation: 0,
        title: const Text(
          'Animals Practice',
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
                  backgroundColor:
                      const Color(0xFFDCE8DE),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF43A047),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ==========================================================
              // QUESTION
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
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.pets_rounded,
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

              // ==========================================================
              // EXPLANATION
              // ==========================================================

              if (answered) ...[
                const SizedBox(height: 5),
                _buildExplanation(question),
              ],

              const SizedBox(height: 22),

              // ==========================================================
              // NEXT
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
    Color borderColor = const Color(0xFFE0E7E1);
    Color iconColor = const Color(0xFF78909C);

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

  // =========================================================================
  // EXPLANATION
  // =========================================================================

  Widget _buildExplanation(
    _AnimalQuestion question,
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

class _AnimalQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _AnimalQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}