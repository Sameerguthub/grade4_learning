import 'package:flutter/material.dart';

class FactorsMultiplesQuestion {
  final String question;
  final List<String> options;
  final int answer;

  FactorsMultiplesQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class FactorsMultiplesPracticePage extends StatefulWidget {
  FactorsMultiplesPracticePage({super.key});

  @override
  State<FactorsMultiplesPracticePage> createState() =>
      _FactorsMultiplesPracticePageState();
}

class _FactorsMultiplesPracticePageState
    extends State<FactorsMultiplesPracticePage> {
  final List<FactorsMultiplesQuestion> questions = [
    FactorsMultiplesQuestion(
      question: 'Which is a factor of 12?',
      options: ['5', '6', '7', '11'],
      answer: 1,
    ),
    FactorsMultiplesQuestion(
      question: 'Which is a multiple of 5?',
      options: ['12', '17', '25', '31'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which list contains all the factors of 10?',
      options: [
        '1, 2, 5, 10',
        '1, 5, 10, 20',
        '2, 4, 5, 10',
        '1, 2, 10, 20',
      ],
      answer: 0,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is prime?',
      options: ['9', '12', '13', '15'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is composite?',
      options: ['2', '3', '7', '9'],
      answer: 3,
    ),
    FactorsMultiplesQuestion(
      question: 'What is the first multiple of 8?',
      options: ['0', '1', '8', '16'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which is a factor pair of 18?',
      options: [
        '2 and 9',
        '3 and 7',
        '4 and 5',
        '6 and 4',
      ],
      answer: 0,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is a common factor of 12 and 18?',
      options: ['4', '5', '6', '9'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is a common multiple of 3 and 4?',
      options: ['8', '10', '12', '15'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is even?',
      options: ['7', '11', '14', '19'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is odd?',
      options: ['10', '16', '22', '25'],
      answer: 3,
    ),
    FactorsMultiplesQuestion(
      question: 'What is the greatest factor of 15?',
      options: ['3', '5', '10', '15'],
      answer: 3,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is divisible by 5?',
      options: ['22', '31', '40', '43'],
      answer: 2,
    ),
    FactorsMultiplesQuestion(
      question: 'Which number is divisible by 10?',
      options: ['25', '30', '35', '42'],
      answer: 1,
    ),
    FactorsMultiplesQuestion(
      question: 'What are the first three multiples of 6?',
      options: [
        '1, 2, 3',
        '6, 12, 18',
        '6, 10, 16',
        '2, 6, 12',
      ],
      answer: 1,
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
                color: Color(0xFF00897B),
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
                  color: Color(0xFF00897B),
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
      return 'Excellent! You understand factors and multiples very well.';
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
          'Factors & Multiples Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: Color(0xFF00897B),
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
                    Color(0xFF00897B),
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
                    backgroundColor: const Color(0xFF00897B),
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
                  color: const Color(0xFFE7F6F3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  String.fromCharCode(65 + index),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00897B),
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