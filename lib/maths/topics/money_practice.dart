import 'package:flutter/material.dart';

class MoneyQuestion {
  final String question;
  final List<String> options;
  final int answer;

  MoneyQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class MoneyPracticePage extends StatefulWidget {
  MoneyPracticePage({super.key});

  @override
  State<MoneyPracticePage> createState() => _MoneyPracticePageState();
}

class _MoneyPracticePageState extends State<MoneyPracticePage> {
  final List<MoneyQuestion> questions = [
    MoneyQuestion(
      question: 'How many paise are in ₹1?',
      options: ['10', '50', '100', '1000'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'Which amount means 5 rupees and 50 paise?',
      options: ['₹5.05', '₹5.50', '₹50.05', '₹5.15'],
      answer: 1,
    ),
    MoneyQuestion(
      question: 'What is ₹20 + ₹15?',
      options: ['₹25', '₹30', '₹35', '₹40'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'What is ₹50 − ₹20?',
      options: ['₹20', '₹25', '₹30', '₹35'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'Which amount is greater?',
      options: ['₹25.50', '₹35.50', '₹15.50', '₹20.50'],
      answer: 1,
    ),
    MoneyQuestion(
      question: 'You have ₹100 and spend ₹65. What is your change?',
      options: ['₹25', '₹30', '₹35', '₹45'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'What is ₹10.50 + ₹5.25?',
      options: ['₹15.25', '₹15.50', '₹15.75', '₹16.75'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'What is ₹25.00 − ₹7.50?',
      options: ['₹15.50', '₹17.50', '₹18.50', '₹20.50'],
      answer: 1,
    ),
    MoneyQuestion(
      question: '3 pencils cost ₹10 each. What is the total cost?',
      options: ['₹20', '₹25', '₹30', '₹40'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'Which is equal to ₹10.25?',
      options: [
        '10 rupees and 5 paise',
        '10 rupees and 25 paise',
        '10 rupees and 50 paise',
        '25 rupees and 10 paise',
      ],
      answer: 1,
    ),
    MoneyQuestion(
      question: 'Which amount is the smallest?',
      options: ['₹45.50', '₹40.50', '₹50.40', '₹45.05'],
      answer: 1,
    ),
    MoneyQuestion(
      question: 'A notebook costs ₹35 and a pen costs ₹15. Total?',
      options: ['₹40', '₹45', '₹50', '₹55'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'You pay ₹200 for an item costing ₹125. What change do you get?',
      options: ['₹65', '₹70', '₹75', '₹85'],
      answer: 2,
    ),
    MoneyQuestion(
      question: 'Which is equal to 500 paise?',
      options: ['₹2', '₹3', '₹5', '₹10'],
      answer: 2,
    ),
    MoneyQuestion(
      question: '4 notebooks cost ₹25 each. What is the total?',
      options: ['₹75', '₹90', '₹100', '₹125'],
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
                color: Color(0xFF2E7D32),
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
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _message(percentage),
                textAlign: TextAlign.center,
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

  String _message(int percentage) {
    if (percentage >= 90) {
      return 'Excellent! You understand money very well.';
    }

    if (percentage >= 70) {
      return 'Great work! Keep practising.';
    }

    if (percentage >= 50) {
      return 'Good effort! Review the lesson and try again.';
    }

    return 'Keep learning! Go through the examples once more.';
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

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Money Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
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
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value:
                      (currentQuestion + 1) / questions.length,
                  minHeight: 9,
                  backgroundColor: const Color(0xFFE1E3EC),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(
                    Color(0xFF2E7D32),
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
                    color: const Color(0xFFE0E4EC),
                  ),
                ),
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
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

              const SizedBox(height: 8),

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
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color(0xFFD9DBE6),
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
    final selected = selectedAnswer == index;
    final correct = index == correctAnswer;

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
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  String.fromCharCode(65 + index),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
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