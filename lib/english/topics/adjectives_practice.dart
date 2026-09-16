import 'package:flutter/material.dart';

class AdjectivesPracticePage extends StatefulWidget {
  const AdjectivesPracticePage({super.key});

  @override
  State<AdjectivesPracticePage> createState() =>
      _AdjectivesPracticePageState();
}

class _AdjectivesPracticePageState extends State<AdjectivesPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which word is the adjective in this sentence?\n'
          '"The red car is fast."',
      'options': [
        'car',
        'red',
        'fast',
        'the',
      ],
      'answer': 1,
      'explanation': '"Red" describes the car, so it is an adjective.',
    },
    {
      'question': 'Choose the adjective in the sentence:\n'
          '"Riya is a clever girl."',
      'options': [
        'Riya',
        'is',
        'clever',
        'girl',
      ],
      'answer': 2,
      'explanation': '"Clever" describes Riya, so it is an adjective.',
    },
    {
      'question': 'Which word describes the noun?\n'
          '"The elephant is a large animal."',
      'options': [
        'elephant',
        'large',
        'animal',
        'is',
      ],
      'answer': 1,
      'explanation': '"Large" tells us about the size of the elephant.',
    },
    {
      'question': 'Choose the correct adjective:\n'
          '"She has a _____ dress."',
      'options': [
        'beautiful',
        'quickly',
        'run',
        'sing',
      ],
      'answer': 0,
      'explanation': '"Beautiful" describes the dress.',
    },
    {
      'question': 'Which word tells us how many?\n'
          '"I have five pencils."',
      'options': [
        'have',
        'pencils',
        'five',
        'I',
      ],
      'answer': 2,
      'explanation': '"Five" tells us how many pencils there are.',
    },
    {
      'question': 'Choose the adjective of colour.',
      'options': [
        'green',
        'tall',
        'clever',
        'three',
      ],
      'answer': 0,
      'explanation': '"Green" is a colour adjective.',
    },
    {
      'question': 'Choose the adjective of size.',
      'options': [
        'kind',
        'small',
        'blue',
        'five',
      ],
      'answer': 1,
      'explanation': '"Small" describes the size of something.',
    },
    {
      'question': 'Choose the adjective of quality.',
      'options': [
        'three',
        'yellow',
        'brave',
        'short',
      ],
      'answer': 2,
      'explanation': '"Brave" describes a quality of a person.',
    },
    {
      'question': 'Which sentence contains an adjective?',
      'options': [
        'The boy runs.',
        'The boy has a blue bag.',
        'The boy runs quickly.',
        'The boy laughed.',
      ],
      'answer': 1,
      'explanation': '"Blue" describes the bag, so the sentence contains an adjective.',
    },
    {
      'question': 'Complete the sentence:\n'
          '"There are _____ apples in the basket."',
      'options': [
        'beautiful',
        'five',
        'quickly',
        'run',
      ],
      'answer': 1,
      'explanation': '"Five" tells us the number of apples.',
    },
    {
      'question': 'Find the adjective:\n'
          '"The little boy is happy."',
      'options': [
        'boy',
        'little',
        'is',
        'the',
      ],
      'answer': 1,
      'explanation': '"Little" describes the boy.',
    },
    {
      'question': 'Which sentence is correct?',
      'options': [
        'She has a red beautiful flower.',
        'She has a beautiful red flower.',
        'She beautiful has a red flower.',
        'She has red a beautiful flower.',
      ],
      'answer': 1,
      'explanation': '"Beautiful red flower" is the correctly arranged phrase.',
    },
    {
      'question': 'Which word is NOT an adjective?',
      'options': [
        'kind',
        'beautiful',
        'run',
        'clever',
      ],
      'answer': 2,
      'explanation': '"Run" is an action word (verb), not an adjective.',
    },
    {
      'question': 'Choose the best adjective:\n'
          '"The _____ sun was shining in the sky."',
      'options': [
        'bright',
        'jump',
        'slowly',
        'eat',
      ],
      'answer': 0,
      'explanation': '"Bright" describes the sun.',
    },
    {
      'question': 'Which adjective describes the shape?',
      'options': [
        'round',
        'kind',
        'seven',
        'green',
      ],
      'answer': 0,
      'explanation': '"Round" describes the shape of something.',
    },
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      _showResult();
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

  void _showResult() {
    final percentage = ((score / questions.length) * 100).round();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                size: 58,
                color: Colors.deepOrange,
              ),
              SizedBox(height: 10),
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
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _getResultMessage(percentage),
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  String _getResultMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent! You are very good at identifying adjectives.';
    }

    if (percentage >= 70) {
      return 'Great job! Keep practising adjectives.';
    }

    if (percentage >= 50) {
      return 'Good effort! Review the lesson and try again.';
    }

    return 'Keep learning! Read the adjectives lesson again and practise.';
  }

  Color _getOptionColor(int index) {
    if (!answered) {
      return Colors.white;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Colors.green.shade50;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Colors.red.shade50;
    }

    return Colors.white;
  }

  Color _getBorderColor(int index) {
    if (!answered) {
      return Colors.grey.shade300;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Colors.green;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Colors.red;
    }

    return Colors.grey.shade300;
  }

  IconData? _getOptionIcon(int index) {
    if (!answered) {
      return null;
    }

    final correctAnswer = questions[currentQuestion]['answer'];

    if (index == correctAnswer) {
      return Icons.check_circle_rounded;
    }

    if (index == selectedAnswer && index != correctAnswer) {
      return Icons.cancel_rounded;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final options = question['options'] as List<String>;
    final correctAnswer = question['answer'] as int;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F3),
      appBar: AppBar(
        title: const Text(
          'Adjectives Practice',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProgressHeader(),

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  question['question'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.45,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                options.length,
                (index) {
                  return _buildOption(
                    index,
                    options[index],
                    correctAnswer,
                  );
                },
              ),

              if (answered) ...[
                const SizedBox(height: 4),
                _buildExplanation(
                  question['explanation'] as String,
                  selectedAnswer == correctAnswer,
                ),
              ],

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: answered ? nextQuestion : null,
                  icon: Icon(
                    currentQuestion == questions.length - 1
                        ? Icons.check_rounded
                        : Icons.arrow_forward_rounded,
                  ),
                  label: Text(
                    currentQuestion == questions.length - 1
                        ? 'Finish'
                        : 'Next Question',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    disabledForegroundColor: Colors.grey.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
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

  Widget _buildProgressHeader() {
    final progress = (currentQuestion + 1) / questions.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE64A19),
            Color(0xFFFF7043),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Question ${currentQuestion + 1} of ${questions.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Score: $score',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    int index,
    String text,
    int correctAnswer,
  ) {
    final icon = _getOptionIcon(index);

    return GestureDetector(
      onTap: () => selectAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: _getOptionColor(index),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _getBorderColor(index),
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: answered
                    ? Colors.transparent
                    : Colors.deepOrange.shade50,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                String.fromCharCode(65 + index),
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),

            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(
                icon,
                color: index == correctAnswer
                    ? Colors.green
                    : Colors.red,
                size: 24,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation(
    String explanation,
    bool isCorrect,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.shade50
            : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isCorrect
              ? Colors.green.shade200
              : Colors.orange.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCorrect
                ? Icons.check_circle_rounded
                : Icons.info_rounded,
            color: isCorrect
                ? Colors.green
                : Colors.orange.shade800,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCorrect ? 'Correct!' : 'Good try!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isCorrect
                        ? Colors.green.shade800
                        : Colors.orange.shade900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  explanation,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}