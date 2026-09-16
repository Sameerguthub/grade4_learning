import 'package:flutter/material.dart';

class WordProblemQuestion {
  final String question;
  final List<String> options;
  final int answer;

  WordProblemQuestion({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class WordProblemsPracticePage extends StatefulWidget {
  WordProblemsPracticePage({super.key});

  @override
  State<WordProblemsPracticePage> createState() =>
      _WordProblemsPracticePageState();
}

class _WordProblemsPracticePageState
    extends State<WordProblemsPracticePage> {
  final List<WordProblemQuestion> questions = [
    WordProblemQuestion(
      question:
          'Riya has 25 pencils. Her friend gives her 12 more. How many pencils does she have now?',
      options: ['35', '37', '38', '40'],
      answer: 1,
    ),
    WordProblemQuestion(
      question:
          'A shop has 75 notebooks and sells 28. How many notebooks are left?',
      options: ['37', '47', '53', '57'],
      answer: 1,
    ),
    WordProblemQuestion(
      question:
          'There are 6 boxes. Each box has 8 pencils. How many pencils are there?',
      options: ['42', '46', '48', '56'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          '24 chocolates are shared equally among 6 children. How many does each child get?',
      options: ['3', '4', '5', '6'],
      answer: 1,
    ),
    WordProblemQuestion(
      question:
          'A book costs ₹45 and a pen costs ₹15. How much do they cost together?',
      options: ['₹50', '₹55', '₹60', '₹65'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A class starts at 9:00 AM and ends at 10:00 AM. How long is the class?',
      options: ['30 minutes', '1 hour', '2 hours', '3 hours'],
      answer: 1,
    ),
    WordProblemQuestion(
      question:
          'A rope is 5 metres long and another is 3 metres long. What is their total length?',
      options: ['6 m', '7 m', '8 m', '9 m'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A farmer has 50 apples and sells 18. How many apples are left?',
      options: ['28', '30', '32', '38'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'There are 4 classes. Each class has 25 students. How many students are there altogether?',
      options: ['75', '90', '100', '125'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A box contains 36 balls. They are put equally into 4 bags. How many balls are in each bag?',
      options: ['6', '8', '9', '12'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A child saves ₹20 every day for 5 days. How much money does the child save?',
      options: ['₹80', '₹90', '₹100', '₹120'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A school has 125 boys and 138 girls. How many students are there in total?',
      options: ['253', '263', '273', '283'],
      answer: 1,
    ),
    WordProblemQuestion(
      question:
          'A library has 500 books. 125 books are borrowed. How many books remain?',
      options: ['325', '350', '375', '400'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A baker puts 7 cupcakes in each box. How many cupcakes are in 6 boxes?',
      options: ['36', '40', '42', '48'],
      answer: 2,
    ),
    WordProblemQuestion(
      question:
          'A teacher has 40 stickers and shares them equally among 8 children. How many stickers does each child get?',
      options: ['4', '5', '6', '8'],
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
      return 'Excellent! You solved the problems brilliantly!';
    } else if (percentage >= 70) {
      return 'Great job! Your problem-solving skills are growing!';
    } else if (percentage >= 50) {
      return 'Good effort! Keep practising word problems.';
    } else {
      return 'Keep practising. Read each problem carefully.';
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
                  color: Colors.deepPurple.shade600,
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
          'Word Problems Practice',
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
                        Text(
                          '${currentQuestion + 1} / ${questions.length}',
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

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade500,
                      Colors.indigo.shade400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lightbulb_rounded,
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
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose the correct answer',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

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
                                  Colors.deepPurple.shade50,
                              child: Text(
                                String.fromCharCode(65 + index),
                                style: TextStyle(
                                  color: Colors.deepPurple.shade700,
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
                        ? 'Correct! Great work.'
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