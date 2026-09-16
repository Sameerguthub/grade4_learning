import 'package:flutter/material.dart';

class FractionQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const FractionQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<FractionQuestion> fractionQuestions = [
  FractionQuestion(
    question: 'In the fraction 3/5, what is the numerator?',
    options: ['3', '5', '8', '2'],
    correctAnswer: 0,
  ),

  FractionQuestion(
    question: 'In the fraction 3/5, what is the denominator?',
    options: ['3', '5', '8', '2'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'Which fraction shows 2 parts out of 7 equal parts?',
    options: ['7/2', '2/7', '2/5', '5/7'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'Which of these is a proper fraction?',
    options: ['7/4', '9/5', '3/8', '6/6'],
    correctAnswer: 2,
  ),

  FractionQuestion(
    question: 'Which of these is an improper fraction?',
    options: ['2/7', '3/8', '5/9', '7/4'],
    correctAnswer: 3,
  ),

  FractionQuestion(
    question: 'Which fraction is equal to 1/2?',
    options: ['2/3', '2/4', '3/4', '4/5'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'Which is greater: 3/5 or 2/5?',
    options: ['3/5', '2/5', 'They are equal', 'Cannot tell'],
    correctAnswer: 0,
  ),

  FractionQuestion(
    question: 'What is 1/5 + 2/5?',
    options: ['2/5', '3/5', '3/10', '1/5'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'What is 4/7 − 2/7?',
    options: ['1/7', '2/7', '3/7', '6/7'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'What is 1/4 of 20?',
    options: ['4', '5', '10', '15'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'What is 3/4 of 20?',
    options: ['5', '10', '15', '18'],
    correctAnswer: 2,
  ),

  FractionQuestion(
    question: 'Which mixed number is equal to 5/4?',
    options: ['1 1/4', '1 2/4', '2 1/4', '4 1/5'],
    correctAnswer: 0,
  ),

  FractionQuestion(
    question: 'How many equal parts are shown by the denominator in 5/8?',
    options: ['5', '8', '13', '3'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'Which fraction is the smallest?',
    options: ['1/2', '1/4', '3/4', '2/4'],
    correctAnswer: 1,
  ),

  FractionQuestion(
    question: 'A pizza is divided into 8 equal slices. Riya eats 3 slices. What fraction did she eat?',
    options: ['3/5', '5/8', '3/8', '8/3'],
    correctAnswer: 2,
  ),
];

class FractionsPracticePage extends StatefulWidget {
  FractionsPracticePage({super.key});

  @override
  State<FractionsPracticePage> createState() =>
      _FractionsPracticePageState();
}

class _FractionsPracticePageState
    extends State<FractionsPracticePage> {
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
          fractionQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion <
        fractionQuestions.length - 1) {
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
        ((score / fractionQuestions.length) * 100).round();

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
            '${fractionQuestions.length}.\n\n'
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
        fractionQuestions[currentQuestion].correctAnswer;

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
        fractionQuestions[currentQuestion].correctAnswer;

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
        fractionQuestions[currentQuestion];

    final progress =
        (currentQuestion + 1) /
            fractionQuestions.length;

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
          'Fractions Practice',
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
                          '${fractionQuestions.length}',
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
                              fractionQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              fractionQuestions.length - 1
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