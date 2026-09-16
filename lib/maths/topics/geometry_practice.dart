import 'package:flutter/material.dart';

class GeometryQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const GeometryQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<GeometryQuestion> geometryQuestions = [
  GeometryQuestion(
    question: 'How many sides does a triangle have?',
    options: ['2', '3', '4', '5'],
    correctAnswer: 1,
  ),
  GeometryQuestion(
    question: 'How many vertices does a square have?',
    options: ['2', '3', '4', '5'],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'Which shape has 4 equal sides?',
    options: [
      'Triangle',
      'Rectangle',
      'Square',
      'Circle',
    ],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'How many sides does a rectangle have?',
    options: ['3', '4', '5', '6'],
    correctAnswer: 1,
  ),
  GeometryQuestion(
    question: 'Which angle is exactly 90°?',
    options: [
      'Acute angle',
      'Right angle',
      'Obtuse angle',
      'Straight angle',
    ],
    correctAnswer: 1,
  ),
  GeometryQuestion(
    question: 'An angle smaller than 90° is called:',
    options: [
      'Right angle',
      'Obtuse angle',
      'Acute angle',
      'Straight angle',
    ],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'An angle greater than 90° but less than 180° is called:',
    options: [
      'Acute angle',
      'Right angle',
      'Obtuse angle',
      'Straight angle',
    ],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'How many degrees are in a straight angle?',
    options: ['45°', '90°', '120°', '180°'],
    correctAnswer: 3,
  ),
  GeometryQuestion(
    question: 'Which shape has no straight sides?',
    options: [
      'Square',
      'Triangle',
      'Circle',
      'Rectangle',
    ],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'A line segment has:',
    options: [
      'No endpoints',
      'One endpoint',
      'Two endpoints',
      'Three endpoints',
    ],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'A ray has:',
    options: [
      'No endpoints',
      'One endpoint',
      'Two endpoints',
      'Three endpoints',
    ],
    correctAnswer: 1,
  ),
  GeometryQuestion(
    question: 'How many faces does a cube have?',
    options: ['4', '5', '6', '8'],
    correctAnswer: 2,
  ),
  GeometryQuestion(
    question: 'How many vertices does a cube have?',
    options: ['6', '8', '10', '12'],
    correctAnswer: 1,
  ),
  GeometryQuestion(
    question: 'Which 3D shape has a circular base and one vertex?',
    options: [
      'Cube',
      'Sphere',
      'Cylinder',
      'Cone',
    ],
    correctAnswer: 3,
  ),
  GeometryQuestion(
    question: 'Which shape has 6 sides?',
    options: [
      'Pentagon',
      'Hexagon',
      'Triangle',
      'Quadrilateral',
    ],
    correctAnswer: 1,
  ),
];

class GeometryPracticePage extends StatefulWidget {
  GeometryPracticePage({super.key});

  @override
  State<GeometryPracticePage> createState() =>
      _GeometryPracticePageState();
}

class _GeometryPracticePageState
    extends State<GeometryPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index ==
          geometryQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion <
        geometryQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showResult();
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

  void showResult() {
    final percentage =
        ((score / geometryQuestions.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.emoji_events_rounded),
              SizedBox(width: 8),
              Expanded(
                child: Text('Practice Complete'),
              ),
            ],
          ),
          content: Text(
            'You scored $score out of '
            '${geometryQuestions.length}.\n\n'
            'Your score: $percentage%',
            style: const TextStyle(
              fontSize: 17,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                restartQuiz();
              },
              child: const Text('Retry'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  Color optionColor(int index) {
    if (!answered) {
      return Colors.white;
    }

    final correct =
        geometryQuestions[currentQuestion].correctAnswer;

    if (index == correct) {
      return Colors.green.shade100;
    }

    if (index == selectedAnswer) {
      return Colors.red.shade100;
    }

    return Colors.white;
  }

  IconData? optionIcon(int index) {
    if (!answered) return null;

    final correct =
        geometryQuestions[currentQuestion].correctAnswer;

    if (index == correct) {
      return Icons.check_circle_rounded;
    }

    if (index == selectedAnswer) {
      return Icons.cancel_rounded;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question =
        geometryQuestions[currentQuestion];

    final progress =
        (currentQuestion + 1) /
            geometryQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        title: const Text(
          'Geometry Practice',
          style: TextStyle(
            color: Color(0xFF20243A),
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics:
                    const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  12,
                  16,
                  25,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Question ${currentQuestion + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${currentQuestion + 1}/'
                          '${geometryQuestions.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF74788D),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 9,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: Text(
                        question.question,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.4,
                          color: Color(0xFF20243A),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    ...List.generate(
                      question.options.length,
                      (index) {
                        final icon =
                            optionIcon(index);

                        return GestureDetector(
                          onTap: () =>
                              selectAnswer(index),
                          child: Container(
                            width: double.infinity,
                            margin:
                                const EdgeInsets.only(
                              bottom: 12,
                            ),
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: optionColor(index),
                              borderRadius:
                                  BorderRadius.circular(14),
                              border: Border.all(
                                color:
                                    Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    question.options[index],
                                    style:
                                        const TextStyle(
                                      fontSize: 17,
                                      fontWeight:
                                          FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (icon != null)
                                  Icon(
                                    icon,
                                    size: 24,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    if (answered)
                      Container(
                        width: double.infinity,
                        padding:
                            const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              selectedAnswer ==
                                      question.correctAnswer
                                  ? Icons
                                      .check_circle_rounded
                                  : Icons.info_rounded,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedAnswer ==
                                        question.correctAnswer
                                    ? 'Correct! Great job.'
                                    : 'Not quite. The correct '
                                      'answer is highlighted above.',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                      FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            if (answered)
              Container(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  10,
                  16,
                  18,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: nextQuestion,
                    icon: Icon(
                      currentQuestion ==
                              geometryQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              geometryQuestions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}