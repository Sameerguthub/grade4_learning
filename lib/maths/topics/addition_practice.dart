import 'package:flutter/material.dart';

class AdditionQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const AdditionQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

const List<AdditionQuestion> additionQuestions = [
  AdditionQuestion(
    question: 'What is 25 + 34?',
    options: ['49', '59', '69', '79'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 125 + 234?',
    options: ['349', '359', '359', '369'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 456 + 123?',
    options: ['579', '569', '589', '599'],
    correctAnswer: 0,
  ),
  AdditionQuestion(
    question: 'What is 1,250 + 2,300?',
    options: ['3,450', '3,550', '3,650', '3,750'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 2,345 + 1,234?',
    options: ['3,479', '3,579', '3,679', '3,779'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 999 + 1?',
    options: ['990', '999', '1,000', '1,001'],
    correctAnswer: 2,
  ),
  AdditionQuestion(
    question: 'What is 4,500 + 2,500?',
    options: ['6,000', '7,000', '8,000', '9,000'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 3,275 + 425?',
    options: ['3,600', '3,700', '3,800', '3,900'],
    correctAnswer: 1,
  ),
  AdditionQuestion(
    question: 'What is 5,678 + 1,111?',
    options: ['6,789', '6,799', '6,889', '6,999'],
    correctAnswer: 0,
  ),
  AdditionQuestion(
    question: 'A shop has 245 pencils and gets 125 more. How many pencils are there now?',
    options: ['350', '360', '370', '380'],
    correctAnswer: 2,
  ),
];

class AdditionPracticePage extends StatefulWidget {
  AdditionPracticePage({super.key});

  @override
  State<AdditionPracticePage> createState() => _AdditionPracticePageState();
}

class _AdditionPracticePageState extends State<AdditionPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == additionQuestions[currentQuestion].correctAnswer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < additionQuestions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    final percentage =
        ((score / additionQuestions.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.emoji_events_rounded),
              SizedBox(width: 8),
              Text('Practice Complete'),
            ],
          ),
          content: Text(
            'You scored $score out of ${additionQuestions.length}.\n\n'
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

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
  }

  Color getOptionColor(int index) {
    if (!answered) {
      return Colors.grey.shade200;
    }

    final correct =
        additionQuestions[currentQuestion].correctAnswer;

    if (index == correct) {
      return Colors.green.shade100;
    }

    if (index == selectedAnswer) {
      return Colors.red.shade100;
    }

    return Colors.grey.shade200;
  }

  IconData? getOptionIcon(int index) {
    if (!answered) return null;

    final correct =
        additionQuestions[currentQuestion].correctAnswer;

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
    final question = additionQuestions[currentQuestion];
    final progress =
        (currentQuestion + 1) / additionQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Addition Practice'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
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
                          '${currentQuestion + 1}/${additionQuestions.length}',
                          style: const TextStyle(
                            fontSize: 16,
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

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          question.question,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    ...List.generate(
                      question.options.length,
                      (index) {
                        final icon = getOptionIcon(index);

                        return GestureDetector(
                          onTap: () => selectAnswer(index),
                          child: Container(
                            width: double.infinity,
                            margin:
                                const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: getOptionColor(index),
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
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
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
                                      : 'Not quite. Check the correct answer above.',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              additionQuestions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              additionQuestions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(vertical: 15),
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