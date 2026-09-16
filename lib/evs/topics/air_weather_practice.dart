import 'package:flutter/material.dart';

class AirWeatherPracticePage extends StatefulWidget {
  const AirWeatherPracticePage({super.key});

  @override
  State<AirWeatherPracticePage> createState() =>
      _AirWeatherPracticePageState();
}

class _AirWeatherPracticePageState
    extends State<AirWeatherPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      question: 'What is air?',
      options: [
        'A solid rock',
        'A mixture of gases around Earth',
        'Only water',
        'A type of soil',
      ],
      answer: 1,
      explanation:
          'Air is a mixture of gases that surrounds Earth.',
    ),
    _Question(
      question: 'Which gas do humans need for respiration?',
      options: [
        'Oxygen',
        'Carbon dioxide',
        'Nitrogen only',
        'Water vapour',
      ],
      answer: 0,
      explanation:
          'Humans and many animals need oxygen for respiration.',
    ),
    _Question(
      question: 'Which gas do green plants use to make food?',
      options: [
        'Oxygen',
        'Carbon dioxide',
        'Nitrogen only',
        'Hydrogen',
      ],
      answer: 1,
      explanation:
          'Green plants use carbon dioxide, along with water and sunlight, to make food.',
    ),
    _Question(
      question: 'What is moving air called?',
      options: [
        'Rain',
        'Cloud',
        'Wind',
        'Fog',
      ],
      answer: 2,
      explanation:
          'Moving air is called wind.',
    ),
    _Question(
      question: 'What does weather describe?',
      options: [
        'The condition of the atmosphere at a particular place and time',
        'Only the colour of the sky',
        'The shape of mountains',
        'The number of trees in a city',
      ],
      answer: 0,
      explanation:
          'Weather describes the condition of the atmosphere at a particular place and time.',
    ),
    _Question(
      question: 'Which is an example of weather?',
      options: [
        'A rainy day',
        'The shape of Earth',
        'The number of planets',
        'The colour of a pencil',
      ],
      answer: 0,
      explanation:
          'Rain, sunshine, wind and temperature are examples of weather conditions.',
    ),
    _Question(
      question: 'Which instrument measures temperature?',
      options: [
        'Rain gauge',
        'Thermometer',
        'Anemometer',
        'Barometer',
      ],
      answer: 1,
      explanation:
          'A thermometer is used to measure temperature.',
    ),
    _Question(
      question: 'Which instrument measures wind speed?',
      options: [
        'Thermometer',
        'Rain gauge',
        'Anemometer',
        'Compass only',
      ],
      answer: 2,
      explanation:
          'An anemometer is used to measure wind speed.',
    ),
    _Question(
      question: 'What does a rain gauge measure?',
      options: [
        'Temperature',
        'Rainfall',
        'Wind speed',
        'Air pressure',
      ],
      answer: 1,
      explanation:
          'A rain gauge measures the amount of rainfall received.',
    ),
    _Question(
      question: 'What are clouds made of?',
      options: [
        'Only smoke',
        'Tiny water droplets and/or ice crystals',
        'Dust only',
        'Rocks',
      ],
      answer: 1,
      explanation:
          'Clouds are made of tiny water droplets and/or ice crystals.',
    ),
    _Question(
      question: 'What is humidity?',
      options: [
        'The amount of water vapour in the air',
        'The speed of a car',
        'The amount of soil in a field',
        'The brightness of the Sun',
      ],
      answer: 0,
      explanation:
          'Humidity tells us about the amount of water vapour present in the air.',
    ),
    _Question(
      question: 'Which of these can cause air pollution?',
      options: [
        'Planting trees',
        'Vehicle exhaust',
        'Clean air',
        'Rainwater',
      ],
      answer: 1,
      explanation:
          'Vehicle exhaust can release pollutants into the air.',
    ),
    _Question(
      question: 'Which action helps keep air clean?',
      options: [
        'Burning plastic',
        'Planting and protecting trees',
        'Throwing waste on roads',
        'Burning garbage in the open',
      ],
      answer: 1,
      explanation:
          'Planting and protecting trees is one way we can help keep our environment healthier.',
    ),
    _Question(
      question: 'Which statement about weather is correct?',
      options: [
        'Weather never changes.',
        'Weather can change from day to day.',
        'Weather only means rainfall.',
        'Weather is the same everywhere.',
      ],
      answer: 1,
      explanation:
          'Weather can change from one day to another and can be different from one place to another.',
    ),
    _Question(
      question: 'What is the main source of heat and light for Earth?',
      options: [
        'The Moon',
        'The Sun',
        'Clouds',
        'Wind',
      ],
      answer: 1,
      explanation:
          'The Sun is Earth’s main natural source of heat and light.',
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
    final percentage =
        ((score / questions.length) * 100).round();

    String message;

    if (percentage >= 90) {
      message =
          'Excellent! You are an Air & Weather expert!';
    } else if (percentage >= 70) {
      message =
          'Great job! Keep observing the weather around you.';
    } else if (percentage >= 50) {
      message =
          'Good effort! Review the lesson and try again.';
    } else {
      message =
          'Keep practising. You will learn it soon!';
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
                color: const Color(0xFF00796B),
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
                  color: Color(0xFF00796B),
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
                backgroundColor: const Color(0xFF00796B),
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
                foregroundColor: const Color(0xFF00796B),
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
      return const Color(0xFFE0F2F1);
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
      return const Color(0xFF00897B);
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
      backgroundColor: const Color(0xFFF5F9FC),
      appBar: AppBar(
        title: const Text(
          'Air & Weather Practice',
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
          padding: const EdgeInsets.fromLTRB(
            16,
            18,
            16,
            100,
          ),
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
                          Color(0xFF00897B),
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
                            color: const Color(0xFFE0F2F1),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.help_outline_rounded,
                            color: Color(0xFF00796B),
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Question',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00796B),
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
                      duration:
                          const Duration(milliseconds: 220),
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(bottom: 11),
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: _answerColor(index),
                        borderRadius:
                            BorderRadius.circular(17),
                        border: Border.all(
                          color:
                              _answerBorderColor(index),
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
                                  ? const Color(0xFF00897B)
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
                                ? const Color(0xFF00897B)
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
                        ? const Color(0xFFE0F2F1)
                        : const Color(0xFFFFF3E0),
                    borderRadius:
                        BorderRadius.circular(17),
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
                            ? const Color(0xFF00796B)
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
                          ? Icons.assessment_rounded
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
                          const Color(0xFF00796B),
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