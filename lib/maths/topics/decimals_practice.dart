import 'package:flutter/material.dart';

class DecimalQuestion {
  final String question;
  final List<String> options;
  final int answer;

  DecimalQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class DecimalsPracticePage extends StatefulWidget {
  DecimalsPracticePage({super.key});

  @override
  State<DecimalsPracticePage> createState() =>
      _DecimalsPracticePageState();
}

class _DecimalsPracticePageState
    extends State<DecimalsPracticePage> {
  final List<DecimalQuestion> questions = [
    DecimalQuestion(
      question: 'What is the place value of 5 in 3.52?',
      options: [
        'Ones',
        'Tenths',
        'Hundredths',
        'Tens',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which decimal means 7 tenths?',
      options: [
        '0.07',
        '0.7',
        '7.0',
        '0.17',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which is greater?',
      options: [
        '0.4',
        '0.9',
        '0.2',
        '0.1',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'What is 0.3 + 0.4?',
      options: [
        '0.5',
        '0.6',
        '0.7',
        '0.8',
      ],
      answer: 2,
    ),
    DecimalQuestion(
      question: 'What is 0.8 - 0.3?',
      options: [
        '0.3',
        '0.4',
        '0.5',
        '0.6',
      ],
      answer: 2,
    ),
    DecimalQuestion(
      question: 'Which fraction is equal to 0.25?',
      options: [
        '25/10',
        '25/100',
        '2/5',
        '1/5',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which is greater: 0.45 or 0.54?',
      options: [
        '0.45',
        '0.54',
        'They are equal',
        'Cannot compare',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which decimal is equal to 0.5?',
      options: [
        '0.05',
        '0.50',
        '0.15',
        '5.00',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'What is 2.30 + 1.25?',
      options: [
        '3.45',
        '3.55',
        '3.65',
        '3.25',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'What is 5.80 - 2.35?',
      options: [
        '3.35',
        '3.45',
        '3.55',
        '4.45',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which is the smallest?',
      options: [
        '0.75',
        '0.25',
        '0.50',
        '0.90',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'What is the value of 6 in 4.67?',
      options: [
        'Six ones',
        'Six tenths',
        'Six hundredths',
        'Six tens',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'Which is the correct order from smallest to greatest?',
      options: [
        '0.7, 0.2, 0.5',
        '0.2, 0.5, 0.7',
        '0.5, 0.7, 0.2',
        '0.7, 0.5, 0.2',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: '₹25.50 means:',
      options: [
        '25 rupees and 5 paise',
        '25 rupees and 50 paise',
        '250 rupees',
        '5 rupees and 25 paise',
      ],
      answer: 1,
    ),
    DecimalQuestion(
      question: 'What is 1.5 + 2.25?',
      options: [
        '3.25',
        '3.50',
        '3.75',
        '4.25',
      ],
      answer: 2,
    ),
  ];

  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;

  void selectAnswer(int index) {
    if (selectedAnswer != null) return;

    setState(() {
      selectedAnswer = index;

      if (index == questions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (selectedAnswer == null) return;

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    final percentage =
        ((score / questions.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                size: 58,
                color: Color(0xFF6C63FF),
              ),
              SizedBox(height: 8),
              Text(
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
                  color: Color(0xFF6C63FF),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _getMessage(percentage),
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
                _restart();
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

  String _getMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent work! You understand decimals very well.';
    } else if (percentage >= 70) {
      return 'Great job! Keep practising to become even stronger.';
    } else if (percentage >= 50) {
      return 'Good effort! Review the lesson and try again.';
    } else {
      return 'Keep learning! Practise the examples once more.';
    }
  }

  void _restart() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress =
        (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Decimals Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
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
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
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
                  backgroundColor: const Color(0xFFE1E3EC),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF6C63FF),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFE3E6EF),
                  ),
                ),
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ...List.generate(
                question.options.length,
                (index) => _answerButton(
                  index,
                  question.options[index],
                  question.answer,
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      selectedAnswer == null ? null : nextQuestion,
                  icon: Icon(
                    currentQuestion == questions.length - 1
                        ? Icons.check_rounded
                        : Icons.arrow_forward_rounded,
                  ),
                  label: Text(
                    currentQuestion == questions.length - 1
                        ? 'Finish'
                        : 'Next',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color(0xFFD9DBE6),
                    disabledForegroundColor:
                        const Color(0xFF7A7D88),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
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

  Widget _answerButton(
    int index,
    String text,
    int correctAnswer,
  ) {
    final bool selected = selectedAnswer == index;
    final bool correct = index == correctAnswer;

    Color background = Colors.white;
    Color border = const Color(0xFFDDE0EA);
    Color textColor = Colors.black87;
    IconData? trailingIcon;

    if (selectedAnswer != null) {
      if (correct) {
        background = const Color(0xFFE7F7EC);
        border = const Color(0xFF2E9B4F);
        textColor = const Color(0xFF207A3B);
        trailingIcon = Icons.check_circle_rounded;
      } else if (selected) {
        background = const Color(0xFFFFE8E8);
        border = const Color(0xFFD93025);
        textColor = const Color(0xFFB3261E);
        trailingIcon = Icons.cancel_rounded;
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => selectAnswer(index),
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: border,
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
                  color: const Color(0xFFF0EEFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  String.fromCharCode(65 + index),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6C63FF),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: textColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}