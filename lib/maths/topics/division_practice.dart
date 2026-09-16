import 'package:flutter/material.dart';

class DivisionQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const DivisionQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<DivisionQuestion> divisionQuestions = [
  DivisionQuestion(
    question: 'What is 12 ÷ 3?',
    options: ['3', '4', '5', '6'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 20 ÷ 5?',
    options: ['2', '3', '4', '5'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'What is 84 ÷ 4?',
    options: ['19', '20', '21', '22'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'What is 96 ÷ 3?',
    options: ['22', '32', '42', '52'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 144 ÷ 12?',
    options: ['10', '11', '12', '13'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'What is 17 ÷ 5?',
    options: ['2 R 3', '3 R 2', '3 R 3', '4 R 1'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 29 ÷ 4?',
    options: ['6 R 5', '7 R 1', '7 R 2', '8 R 1'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 450 ÷ 10?',
    options: ['4.5', '45', '450', '4,500'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 4,500 ÷ 100?',
    options: ['4.5', '45', '450', '4,500'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'Which multiplication fact helps solve 56 ÷ 7?',
    options: ['7 × 6 = 42', '7 × 7 = 49', '7 × 8 = 56', '7 × 9 = 63'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'A teacher shares 48 pencils equally among 6 students. How many does each student get?',
    options: ['6', '7', '8', '9'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'What is 100 ÷ 10?',
    options: ['1', '10', '100', '1,000'],
    correctAnswer: 1,
  ),
  DivisionQuestion(
    question: 'What is 72 ÷ 8?',
    options: ['7', '8', '9', '10'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'In 35 ÷ 6 = 5 R 5, what is the remainder?',
    options: ['3', '4', '5', '6'],
    correctAnswer: 2,
  ),
  DivisionQuestion(
    question: 'If 9 × 7 = 63, then 63 ÷ 9 = ?',
    options: ['6', '7', '8', '9'],
    correctAnswer: 1,
  ),
];

class DivisionPracticePage extends StatefulWidget {
  DivisionPracticePage({super.key});

  @override
  State<DivisionPracticePage> createState() =>
      _DivisionPracticePageState();
}

class _DivisionPracticePageState
    extends State<DivisionPracticePage> {
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
          divisionQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < divisionQuestions.length - 1) {
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
        ((score / divisionQuestions.length) * 100).round();

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
            '${divisionQuestions.length}.\n\n'
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
    if (!answered) return Colors.white;

    final correct =
        divisionQuestions[currentQuestion].correctAnswer;

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
        divisionQuestions[currentQuestion].correctAnswer;

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
    final question = divisionQuestions[currentQuestion];

    final progress =
        (currentQuestion + 1) / divisionQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        title: const Text(
          'Division Practice',
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
                physics: const BouncingScrollPhysics(),
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
                          '${divisionQuestions.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF74788D),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 9,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
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
                        final icon = optionIcon(index);

                        return GestureDetector(
                          onTap: () => selectAnswer(index),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: optionColor(index),
                              borderRadius:
                                  BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    question.options[index],
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
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
                        padding: const EdgeInsets.all(14),
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
                                  ? Icons.check_circle_rounded
                                  : Icons.info_rounded,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                selectedAnswer ==
                                        question.correctAnswer
                                    ? 'Correct! Great job.'
                                    : 'Not quite. The correct answer '
                                      'is highlighted above.',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
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
                              divisionQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              divisionQuestions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
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