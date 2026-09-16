import 'package:flutter/material.dart';

class MeasurementQuestion {
  final String question;
  final List<String> options;
  final int answer;

  MeasurementQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class MeasurementPracticePage extends StatefulWidget {
  MeasurementPracticePage({super.key});

  @override
  State<MeasurementPracticePage> createState() =>
      _MeasurementPracticePageState();
}

class _MeasurementPracticePageState
    extends State<MeasurementPracticePage> {
  final List<MeasurementQuestion> questions = [
    MeasurementQuestion(
      question: 'How many centimetres are in 1 metre?',
      options: ['10 cm', '50 cm', '100 cm', '1000 cm'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'How many millimetres are in 1 centimetre?',
      options: ['5 mm', '10 mm', '50 mm', '100 mm'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'Which unit is best for measuring the distance between two cities?',
      options: ['cm', 'mm', 'm', 'km'],
      answer: 3,
    ),
    MeasurementQuestion(
      question: 'How many grams are in 1 kilogram?',
      options: ['100 g', '500 g', '1000 g', '10 g'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'Which unit is best for the mass of a school bag?',
      options: ['kg', 'mm', 'mL', 'cm'],
      answer: 0,
    ),
    MeasurementQuestion(
      question: 'How many millilitres are in 1 litre?',
      options: ['100 mL', '500 mL', '1000 mL', '10 mL'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'Which unit is best for measuring a glass of water?',
      options: ['km', 'mL', 'kg', 'm'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'What is the perimeter of a square with each side 5 cm?',
      options: ['10 cm', '15 cm', '20 cm', '25 cm'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'A rectangle is 6 cm long and 4 cm wide. What is its perimeter?',
      options: ['10 cm', '20 cm', '24 cm', '14 cm'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'A rectangle is 5 cm long and 3 cm wide. What is its area?',
      options: ['8 cm²', '15 cm²', '16 cm²', '20 cm²'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'Which is equal to 3 metres?',
      options: ['30 cm', '300 cm', '3000 cm', '3 cm'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'Which is equal to 2 kilograms?',
      options: ['200 g', '2000 g', '20 g', '20,000 g'],
      answer: 1,
    ),
    MeasurementQuestion(
      question: 'Which is equal to 4 litres?',
      options: ['400 mL', '40 mL', '4000 mL', '40,000 mL'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'Which unit would you use to measure the length of a pencil?',
      options: ['km', 'kg', 'cm', 'L'],
      answer: 2,
    ),
    MeasurementQuestion(
      question: 'Which statement is correct?',
      options: [
        'Area goes around a shape',
        'Perimeter covers the inside',
        'Perimeter goes around a shape',
        'Area and perimeter are always the same',
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
                color: Color(0xFFFF7043),
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
                  color: Color(0xFFFF7043),
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
      return 'Excellent! You understand measurement very well.';
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
          'Measurement Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF7043),
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
                      color: Color(0xFFFF7043),
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
                    Color(0xFFFF7043),
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
                    backgroundColor: const Color(0xFFFF7043),
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
                  color: const Color(0xFFFFE9E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  String.fromCharCode(65 + index),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7043),
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