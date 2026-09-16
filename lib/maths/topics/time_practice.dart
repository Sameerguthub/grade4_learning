import 'package:flutter/material.dart';

class TimeQuestion {
  final String question;
  final List<String> options;
  final int answer;

  TimeQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class TimePracticePage extends StatefulWidget {
  TimePracticePage({super.key});

  @override
  State<TimePracticePage> createState() => _TimePracticePageState();
}

class _TimePracticePageState extends State<TimePracticePage> {
  final List<TimeQuestion> questions = [
    TimeQuestion(
      question: 'How many minutes are there in 1 hour?',
      options: ['30', '45', '60', '100'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'How many seconds are there in 1 minute?',
      options: ['30', '60', '100', '120'],
      answer: 1,
    ),
    TimeQuestion(
      question: 'What time is shown when the hour hand is at 3 and the minute hand is at 12?',
      options: ['3:00', '12:03', '3:30', '12:30'],
      answer: 0,
    ),
    TimeQuestion(
      question: 'What is half past 4?',
      options: ['4:15', '4:30', '4:45', '5:30'],
      answer: 1,
    ),
    TimeQuestion(
      question: 'What is quarter past 7?',
      options: ['7:15', '7:30', '7:45', '8:15'],
      answer: 0,
    ),
    TimeQuestion(
      question: 'What is quarter to 9?',
      options: ['9:15', '8:15', '8:45', '9:45'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'Which time is in the morning?',
      options: ['7:00 AM', '7:00 PM', '11:00 PM', '12:00 AM'],
      answer: 0,
    ),
    TimeQuestion(
      question: 'What does PM mean?',
      options: [
        'Before noon',
        'After noon',
        'Before midnight only',
        'Morning'
      ],
      answer: 1,
    ),
    TimeQuestion(
      question: 'Convert 2 hours into minutes.',
      options: ['60 minutes', '90 minutes', '120 minutes', '200 minutes'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'Convert 180 minutes into hours.',
      options: ['2 hours', '3 hours', '4 hours', '5 hours'],
      answer: 1,
    ),
    TimeQuestion(
      question: 'What is 14:00 in 12-hour format?',
      options: ['2:00 AM', '4:00 PM', '2:00 PM', '12:00 PM'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'What is 8:30 PM in 24-hour format?',
      options: ['08:30', '18:30', '20:30', '22:30'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'A movie starts at 5:00 PM and ends at 7:00 PM. How long is it?',
      options: ['1 hour', '2 hours', '3 hours', '4 hours'],
      answer: 1,
    ),
    TimeQuestion(
      question: 'School starts at 8:00 AM. You arrive at 7:30 AM. How early are you?',
      options: ['15 minutes', '20 minutes', '30 minutes', '1 hour'],
      answer: 2,
    ),
    TimeQuestion(
      question: 'How many days are there in a week?',
      options: ['5', '6', '7', '8'],
      answer: 2,
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
              const SizedBox(height: 12),
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
              const SizedBox(height: 8),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                getMessage(percentage),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
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

  String getMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent! You are a Time Master!';
    } else if (percentage >= 70) {
      return 'Great job! Keep practising!';
    } else if (percentage >= 50) {
      return 'Good effort! A little more practice will help.';
    } else {
      return 'Keep learning! You can do better next time.';
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

  Color getOptionColor(int index) {
    if (!answered) {
      return Colors.white;
    }

    if (index == questions[currentQuestion].answer) {
      return Colors.green.shade100;
    }

    if (index == selectedAnswer) {
      return Colors.red.shade100;
    }

    return Colors.white;
  }

  Color getBorderColor(int index) {
    if (!answered) {
      return Colors.grey.shade300;
    }

    if (index == questions[currentQuestion].answer) {
      return Colors.green;
    }

    if (index == selectedAnswer) {
      return Colors.red;
    }

    return Colors.grey.shade300;
  }

  IconData? getOptionIcon(int index) {
    if (!answered) return null;

    if (index == questions[currentQuestion].answer) {
      return Icons.check_circle_rounded;
    }

    if (index == selectedAnswer) {
      return Icons.cancel_rounded;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text(
          'Time Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress section
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Question ${currentQuestion + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${currentQuestion + 1} / ${questions.length}',
                          style: TextStyle(
                            color: Colors.indigo.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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

              const SizedBox(height: 20),

              // Question card
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.shade500,
                      Colors.blue.shade400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.20),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      question.question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Choose the correct answer',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Options
              ...List.generate(
                question.options.length,
                (index) {
                  final icon = getOptionIcon(index);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => selectAnswer(index),
                      borderRadius: BorderRadius.circular(18),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 17,
                        ),
                        decoration: BoxDecoration(
                          color: getOptionColor(index),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: getBorderColor(index),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo.shade50,
                              ),
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.shade700,
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
                                color: index == question.answer
                                    ? Colors.green
                                    : Colors.red,
                                size: 27,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              // Explanation after answering
              if (answered)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedAnswer == question.answer
                        ? Colors.green.shade50
                        : Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: selectedAnswer == question.answer
                          ? Colors.green.shade200
                          : Colors.orange.shade200,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer == question.answer
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: selectedAnswer == question.answer
                            ? Colors.green.shade700
                            : Colors.orange.shade700,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          selectedAnswer == question.answer
                              ? 'Correct! Well done.'
                              : 'The correct answer is: '
                                  '${question.options[question.answer]}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              // Next button
              SizedBox(
                height: 56,
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
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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