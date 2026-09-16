import 'package:flutter/material.dart';

class DataQuestion {
  final String question;
  final List<String> options;
  final int answer;

  DataQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class DataHandlingPracticePage extends StatefulWidget {
  DataHandlingPracticePage({super.key});

  @override
  State<DataHandlingPracticePage> createState() =>
      _DataHandlingPracticePageState();
}

class _DataHandlingPracticePageState
    extends State<DataHandlingPracticePage> {
  final List<DataQuestion> questions = [
    DataQuestion(
      question: 'What does data mean?',
      options: [
        'A type of food',
        'Collected information',
        'A shape',
        'A colour',
      ],
      answer: 1,
    ),
    DataQuestion(
      question: 'Which is useful for quick counting?',
      options: [
        'Tally marks',
        'A ruler',
        'A clock',
        'A calendar',
      ],
      answer: 0,
    ),
    DataQuestion(
      question: 'What is the maximum of 4, 9, 6, 2?',
      options: ['2', '4', '6', '9'],
      answer: 3,
    ),
    DataQuestion(
      question: 'What is the minimum of 7, 3, 8, 5?',
      options: ['3', '5', '7', '8'],
      answer: 0,
    ),
    DataQuestion(
      question: 'A = 5, B = 8, C = 4. Which has the greatest value?',
      options: ['A', 'B', 'C', 'All are equal'],
      answer: 1,
    ),
    DataQuestion(
      question: 'Monday = 4 books and Tuesday = 6 books. What is the total?',
      options: ['8', '9', '10', '12'],
      answer: 2,
    ),
    DataQuestion(
      question: 'Which graph uses bars to represent data?',
      options: [
        'Bar graph',
        'Clock',
        'Number line',
        'Ruler',
      ],
      answer: 0,
    ),
    DataQuestion(
      question: 'Which is the smallest number?',
      options: ['12', '8', '15', '10'],
      answer: 1,
    ),
    DataQuestion(
      question: 'Riya has 8 books and Aman has 5 books. How many more does Riya have?',
      options: ['2', '3', '4', '5'],
      answer: 1,
    ),
    DataQuestion(
      question: 'If 3 children like apples and 4 like mangoes, how many children are there?',
      options: ['5', '6', '7', '8'],
      answer: 2,
    ),
    DataQuestion(
      question: 'Which one is data?',
      options: [
        'Number of students in a class',
        'A pencil',
        'A chair',
        'A colour only',
      ],
      answer: 0,
    ),
    DataQuestion(
      question: 'A graph shows 2, 5, 7 and 4. What is the maximum?',
      options: ['2', '4', '5', '7'],
      answer: 3,
    ),
    DataQuestion(
      question: 'A graph shows 2, 5, 7 and 4. What is the minimum?',
      options: ['2', '4', '5', '7'],
      answer: 0,
    ),
    DataQuestion(
      question: 'What should you check first when reading a bar graph?',
      options: [
        'The graph scale',
        'The colour of your shirt',
        'The weather',
        'The time',
      ],
      answer: 0,
    ),
    DataQuestion(
      question: 'Books read are 3, 5 and 2. What is the total?',
      options: ['8', '9', '10', '11'],
      answer: 1,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

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
    if (!answered) return;

    if (currentQuestion < questions.length - 1) {
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

  String getMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent! You are a Data Master!';
    } else if (percentage >= 70) {
      return 'Great job! Keep practising!';
    } else if (percentage >= 50) {
      return 'Good effort! Keep learning.';
    } else {
      return 'Keep practising. You will improve!';
    }
  }

  void showResult() {
    final percentage = ((score / questions.length) * 100).round();

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
                Icons.workspace_premium_rounded,
                size: 60,
                color: Colors.amber.shade700,
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
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.indigo.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                getMessage(percentage),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                restartQuiz();
              },
              child: const Text('Try Again'),
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

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text(
          'Data Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Question ${currentQuestion + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${currentQuestion + 1} / ${questions.length}'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 9,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.shade500,
                      Colors.blue.shade400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.bar_chart_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      question.question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ...List.generate(
                question.options.length,
                (index) {
                  final isCorrect =
                      index == question.answer;
                  final isSelected =
                      index == selectedAnswer;

                  Color background = Colors.white;
                  Color border = Colors.grey.shade300;
                  IconData? icon;

                  if (answered && isCorrect) {
                    background = Colors.green.shade100;
                    border = Colors.green;
                    icon = Icons.check_circle_rounded;
                  } else if (answered && isSelected) {
                    background = Colors.red.shade100;
                    border = Colors.red;
                    icon = Icons.cancel_rounded;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => selectAnswer(index),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: border,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Colors.indigo.shade50,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  color: Colors.indigo.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                question.options[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            if (icon != null)
                              Icon(
                                icon,
                                color: isCorrect
                                    ? Colors.green
                                    : Colors.red,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              if (answered)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: selectedAnswer == question.answer
                        ? Colors.green.shade50
                        : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    selectedAnswer == question.answer
                        ? 'Correct! Well done.'
                        : 'Correct answer: ${question.options[question.answer]}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: answered ? nextQuestion : null,
                  icon: Icon(
                    currentQuestion == questions.length - 1
                        ? Icons.flag_rounded
                        : Icons.arrow_forward_rounded,
                  ),
                  label: Text(
                    currentQuestion == questions.length - 1
                        ? 'Finish Practice'
                        : 'Next Question',
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