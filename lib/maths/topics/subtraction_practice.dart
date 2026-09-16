import 'package:flutter/material.dart';

class SubtractionQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const SubtractionQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<SubtractionQuestion> subtractionQuestions = [
  SubtractionQuestion(
    question: 'What is 45 − 23?',
    options: ['12', '22', '32', '42'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 100 − 45?',
    options: ['45', '50', '55', '65'],
    correctAnswer: 2,
  ),
  SubtractionQuestion(
    question: 'What is 786 − 245?',
    options: ['531', '541', '551', '561'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 5,432 − 2,111?',
    options: ['3,221', '3,321', '3,421', '3,521'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 4,532 − 1,768?',
    options: ['2,664', '2,764', '2,864', '2,964'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 5,000 − 2,347?',
    options: ['2,553', '2,653', '2,753', '2,853'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 7,000 − 2,500?',
    options: ['4,000', '4,500', '5,000', '5,500'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 9,999 − 999?',
    options: ['8,000', '8,500', '9,000', '9,100'],
    correctAnswer: 2,
  ),
  SubtractionQuestion(
    question: 'What is 8,450 − 3,275?',
    options: ['5,075', '5,175', '5,275', '5,375'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What is 10,000 − 4,567?',
    options: ['5,333', '5,433', '5,533', '5,633'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'A shop has 850 pencils. It sells 275 pencils. How many are left?',
    options: ['575', '585', '595', '605'],
    correctAnswer: 0,
  ),
  SubtractionQuestion(
    question: 'Riya has ₹500 and spends ₹175. How much money is left?',
    options: ['₹225', '₹325', '₹375', '₹425'],
    correctAnswer: 1,
  ),
  SubtractionQuestion(
    question: 'What number must be added to 250 to get 600?',
    options: ['250', '300', '350', '400'],
    correctAnswer: 2,
  ),
  SubtractionQuestion(
    question: 'The difference between 900 and 675 is:',
    options: ['125', '200', '225', '275'],
    correctAnswer: 2,
  ),
  SubtractionQuestion(
    question: 'Which equation is correct?',
    options: [
      '875 − 325 = 450',
      '875 − 325 = 550',
      '875 − 325 = 650',
      '875 − 325 = 750',
    ],
    correctAnswer: 1,
  ),
];

class SubtractionPracticePage extends StatefulWidget {
  SubtractionPracticePage({super.key});

  @override
  State<SubtractionPracticePage> createState() =>
      _SubtractionPracticePageState();
}

class _SubtractionPracticePageState
    extends State<SubtractionPracticePage> {
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
          subtractionQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion <
        subtractionQuestions.length - 1) {
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
        ((score / subtractionQuestions.length) * 100).round();

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
            '${subtractionQuestions.length}.\n\n'
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
        subtractionQuestions[currentQuestion].correctAnswer;

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
        subtractionQuestions[currentQuestion].correctAnswer;

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
        subtractionQuestions[currentQuestion];

    final progress =
        (currentQuestion + 1) /
            subtractionQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FC),
        elevation: 0,
        title: const Text(
          'Subtraction Practice',
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
                          '${subtractionQuestions.length}',
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
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(18),
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
                                        question
                                            .correctAnswer
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
                              subtractionQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              subtractionQuestions.length - 1
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