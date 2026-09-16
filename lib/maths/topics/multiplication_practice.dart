import 'package:flutter/material.dart';

class MultiplicationQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const MultiplicationQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<MultiplicationQuestion> multiplicationQuestions = [
  MultiplicationQuestion(
    question: 'What is 7 × 6?',
    options: ['36', '42', '48', '56'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 8 × 9?',
    options: ['63', '72', '81', '90'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 24 × 3?',
    options: ['62', '72', '82', '92'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 125 × 4?',
    options: ['400', '450', '500', '550'],
    correctAnswer: 2,
  ),
  MultiplicationQuestion(
    question: 'What is 23 × 14?',
    options: ['302', '312', '322', '332'],
    correctAnswer: 2,
  ),
  MultiplicationQuestion(
    question: 'What is 45 × 10?',
    options: ['45', '450', '4,500', '40,500'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 36 × 100?',
    options: ['360', '3,600', '36,000', '360,000'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 8 × 0?',
    options: ['0', '1', '8', '80'],
    correctAnswer: 0,
  ),
  MultiplicationQuestion(
    question: 'What is 9 × 1?',
    options: ['0', '1', '9', '10'],
    correctAnswer: 2,
  ),
  MultiplicationQuestion(
    question: 'Which gives the same answer as 6 × 7?',
    options: ['6 + 7', '7 × 6', '7 + 6', '6 − 7'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'There are 5 boxes with 18 pencils in each. How many pencils?',
    options: ['80', '90', '100', '110'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 32 × 5?',
    options: ['150', '160', '170', '180'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 205 × 3?',
    options: ['605', '615', '625', '635'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'What is 42 × 2?',
    options: ['74', '84', '94', '104'],
    correctAnswer: 1,
  ),
  MultiplicationQuestion(
    question: 'A classroom has 8 rows with 12 students in each row. How many students?',
    options: ['86', '96', '106', '116'],
    correctAnswer: 1,
  ),
];

class MultiplicationPracticePage extends StatefulWidget {
  MultiplicationPracticePage({super.key});

  @override
  State<MultiplicationPracticePage> createState() =>
      _MultiplicationPracticePageState();
}

class _MultiplicationPracticePageState
    extends State<MultiplicationPracticePage> {
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
          multiplicationQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion <
        multiplicationQuestions.length - 1) {
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
        ((score / multiplicationQuestions.length) * 100).round();

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
            '${multiplicationQuestions.length}.\n\n'
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
        multiplicationQuestions[currentQuestion].correctAnswer;

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
        multiplicationQuestions[currentQuestion].correctAnswer;

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
        multiplicationQuestions[currentQuestion];

    final progress =
        (currentQuestion + 1) /
            multiplicationQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        title: const Text(
          'Multiplication Practice',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          '${multiplicationQuestions.length}',
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
                          fontSize: 21,
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
                                  Icon(icon, size: 24),
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
                              multiplicationQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              multiplicationQuestions.length - 1
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