import 'package:flutter/material.dart';

class WaterPracticePage extends StatefulWidget {
  const WaterPracticePage({super.key});

  @override
  State<WaterPracticePage> createState() => _WaterPracticePageState();
}

class _WaterPracticePageState extends State<WaterPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      question: 'Why is water important to living things?',
      options: [
        'Only for washing cars',
        'Living things need water to survive',
        'Only for making roads',
        'Only for swimming',
      ],
      answer: 1,
      explanation:
          'People, animals and plants all need water to live and carry out important life processes.',
    ),
    _Question(
      question: 'Which is a natural source of fresh water?',
      options: [
        'River',
        'Plastic bottle',
        'Soft drink',
        'Cooking oil',
      ],
      answer: 0,
      explanation:
          'Rivers are natural sources of water. Their water may need treatment before it is safe to drink.',
    ),
    _Question(
      question: 'Which source contains salty water?',
      options: [
        'Most oceans',
        'Rainwater',
        'A clean freshwater lake',
        'A drinking-water tank',
      ],
      answer: 0,
      explanation:
          'Ocean water contains a lot of dissolved salts and is not normally suitable for drinking directly.',
    ),
    _Question(
      question: 'What is groundwater?',
      options: [
        'Water found underground',
        'Water inside clouds only',
        'Water in a bottle',
        'Water in a swimming pool',
      ],
      answer: 0,
      explanation:
          'Water that collects beneath the ground is called groundwater.',
    ),
    _Question(
      question: 'What happens during evaporation?',
      options: [
        'Water vapour becomes ice',
        'Liquid water changes into water vapour',
        'Rain becomes plastic',
        'Clouds become soil',
      ],
      answer: 1,
      explanation:
          'During evaporation, heat causes liquid water to change into water vapour.',
    ),
    _Question(
      question: 'What is condensation?',
      options: [
        'Water vapour cools and forms tiny water droplets',
        'Water turns into soil',
        'Water disappears forever',
        'Rivers become oceans',
      ],
      answer: 0,
      explanation:
          'When water vapour cools, it can form tiny water droplets. This process is called condensation.',
    ),
    _Question(
      question: 'What is precipitation?',
      options: [
        'Water falling from clouds',
        'Water going into a bottle',
        'Water being filtered',
        'Water becoming salty',
      ],
      answer: 0,
      explanation:
          'Rain and other forms of precipitation fall from clouds to the Earth.',
    ),
    _Question(
      question: 'Which of these is a use of water?',
      options: [
        'Drinking',
        'Cooking',
        'Washing',
        'All of these',
      ],
      answer: 3,
      explanation:
          'We use water for drinking, cooking, washing, cleaning, farming and many other activities.',
    ),
    _Question(
      question: 'Which action helps save water?',
      options: [
        'Leaving the tap running',
        'Fixing leaking taps',
        'Wasting water while washing',
        'Throwing water away unnecessarily',
      ],
      answer: 1,
      explanation:
          'Fixing leaking taps prevents water from being wasted.',
    ),
    _Question(
      question: 'What is water pollution?',
      options: [
        'Making water dirty or unsafe by adding harmful substances',
        'Freezing water',
        'Boiling water',
        'Collecting rainwater',
      ],
      answer: 0,
      explanation:
          'Water pollution occurs when harmful waste or substances enter water and make it dirty or unsafe.',
    ),
    _Question(
      question: 'Why should we not throw plastic into rivers?',
      options: [
        'It can pollute the water and harm living things',
        'It makes rivers flow faster',
        'It makes water cleaner',
        'It creates rain',
      ],
      answer: 0,
      explanation:
          'Plastic and other waste can pollute water and may harm fish, animals and other organisms.',
    ),
    _Question(
      question: 'What does rainwater harvesting mean?',
      options: [
        'Collecting and storing rainwater',
        'Making seawater salty',
        'Throwing rainwater away',
        'Stopping all rainfall',
      ],
      answer: 0,
      explanation:
          'Rainwater harvesting means collecting and storing rainwater for later use or groundwater recharge.',
    ),
    _Question(
      question: 'Which method can help make water safer for drinking?',
      options: [
        'Boiling',
        'Adding garbage',
        'Leaving it uncovered',
        'Adding soil',
      ],
      answer: 0,
      explanation:
          'Boiling can kill many harmful germs in water. Water treatment and purification methods can also improve safety.',
    ),
    _Question(
      question: 'What provides the heat that drives evaporation in the water cycle?',
      options: [
        'The Sun',
        'The Moon',
        'Rocks',
        'Soil',
      ],
      answer: 0,
      explanation:
          'Heat from the Sun provides much of the energy that causes water to evaporate.',
    ),
    _Question(
      question: 'Which is the best water-saving habit?',
      options: [
        'Use water carefully and avoid unnecessary waste',
        'Keep taps open',
        'Waste water every day',
        'Pollute rivers',
      ],
      answer: 0,
      explanation:
          'Using water carefully and preventing unnecessary waste helps conserve this valuable resource.',
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
      message = 'Excellent! You really know how to protect water!';
    } else if (percentage >= 70) {
      message = 'Great job! Keep learning and saving water.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson and try again.';
    } else {
      message = 'Keep practising. You will become a water expert!';
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
                color: const Color(0xFF0277BD),
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
                  color: Color(0xFF0277BD),
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
                backgroundColor: const Color(0xFF0277BD),
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
                foregroundColor: const Color(0xFF0277BD),
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
      return const Color(0xFFE3F2FD);
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
      return const Color(0xFF0288D1);
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
      backgroundColor: const Color(0xFFF5FAFD),
      appBar: AppBar(
        title: const Text(
          'Water Practice',
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
                          Color(0xFF0288D1),
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
                            color: const Color(0xFFE1F5FE),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.help_outline_rounded,
                            color: Color(0xFF0277BD),
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Question',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0277BD),
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
                                  ? const Color(0xFF0288D1)
                                  : const Color(0xFFF1F3F4),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
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
                                ? const Color(0xFF0288D1)
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
                        ? const Color(0xFFE3F2FD)
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
                            ? const Color(0xFF0277BD)
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
                          const Color(0xFF0277BD),
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