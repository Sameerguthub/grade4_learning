import 'package:flutter/material.dart';

class SentenceFormationPracticePage extends StatefulWidget {
  const SentenceFormationPracticePage({super.key});

  @override
  State<SentenceFormationPracticePage> createState() =>
      _SentenceFormationPracticePageState();
}

class _SentenceFormationPracticePageState
    extends State<SentenceFormationPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Choose the correctly formed sentence.',
      'options': [
        'Playing Rahul cricket is.',
        'Rahul is playing cricket.',
        'Is Rahul cricket playing.',
        'Cricket playing Rahul is.',
      ],
      'answer': 1,
      'explanation':
          'The correct order is: Rahul + is + playing + cricket.',
    },
    {
      'question': 'Which sentence starts correctly?',
      'options': [
        'the sun is shining.',
        'The sun is shining.',
        'the Sun is shining.',
        'sun The is shining.',
      ],
      'answer': 1,
      'explanation':
          'A sentence should begin with a capital letter.',
    },
    {
      'question': 'Choose the correct punctuation mark: "Where are you going___"',
      'options': [
        '.',
        ',',
        '?',
        '!',
      ],
      'answer': 2,
      'explanation':
          'A question ends with a question mark.',
    },
    {
      'question': 'Arrange the words: "to / school / goes / Riya"',
      'options': [
        'To school Riya goes.',
        'Riya goes to school.',
        'Goes Riya school to.',
        'School goes Riya to.',
      ],
      'answer': 1,
      'explanation':
          'The meaningful sentence is "Riya goes to school."',
    },
    {
      'question': 'Which sentence is complete?',
      'options': [
        'Running in the park.',
        'The boy.',
        'The boy is running in the park.',
        'In the park running.',
      ],
      'answer': 2,
      'explanation':
          'A complete sentence expresses a complete thought.',
    },
    {
      'question': 'Choose the correct sentence.',
      'options': [
        'My mother cook food.',
        'My mother cooks food.',
        'My mother cooking food.',
        'My mother food cooks.',
      ],
      'answer': 1,
      'explanation':
          'For "My mother", the correct verb is "cooks".',
    },
    {
      'question': 'Which sentence is a question?',
      'options': [
        'I have a new book.',
        'Please close the door.',
        'What is your name?',
        'What a beautiful day!',
      ],
      'answer': 2,
      'explanation':
          '"What is your name?" asks something, so it is a question.',
    },
    {
      'question': 'Which sentence is a command?',
      'options': [
        'The dog is sleeping.',
        'Where is my bag?',
        'Please open the window.',
        'What a big house!',
      ],
      'answer': 2,
      'explanation':
          'A command tells someone to do something.',
    },
    {
      'question': 'Choose the correct sentence.',
      'options': [
        'I like apples but I do not like bananas.',
        'I apples like but bananas do not.',
        'But I like apples bananas.',
        'I like but apples bananas.',
      ],
      'answer': 0,
      'explanation':
          'The words are correctly arranged and "but" joins the two ideas.',
    },
    {
      'question': 'Choose the best joining word: "I was hungry, ___ I ate lunch."',
      'options': [
        'but',
        'so',
        'or',
        'and',
      ],
      'answer': 1,
      'explanation':
          '"So" shows the result of being hungry.',
    },
    {
      'question': 'Which sentence uses capital letters correctly?',
      'options': [
        'rahul lives in Mumbai.',
        'Rahul lives in mumbai.',
        'Rahul lives in Mumbai.',
        'rahul lives in mumbai.',
      ],
      'answer': 2,
      'explanation':
          'Rahul is a name and Mumbai is a place, so both need capital letters.',
    },
    {
      'question': 'Which sentence shows strong feeling?',
      'options': [
        'The flowers are beautiful.',
        'Are the flowers beautiful?',
        'What beautiful flowers!',
        'Please water the flowers.',
      ],
      'answer': 2,
      'explanation':
          'An exclamation mark is used to show strong feeling.',
    },
    {
      'question': 'Which is the best opening for a paragraph about your school?',
      'options': [
        'School.',
        'My school is a wonderful place to learn.',
        'Learning.',
        'There.',
      ],
      'answer': 1,
      'explanation':
          'A good paragraph should begin with a clear sentence about its topic.',
    },
    {
      'question': 'Which sentence is written correctly?',
      'options': [
        'I like reading books',
        'i like reading books.',
        'I like reading books.',
        'I Like Reading Books.',
      ],
      'answer': 2,
      'explanation':
          'The sentence begins with a capital letter and ends with a full stop.',
    },
    {
      'question': 'Choose the best sentence for a short paragraph about a pet.',
      'options': [
        'Pet dog.',
        'My dog Bruno is friendly and loves to play with me.',
        'Playing dog.',
        'Dog because.',
      ],
      'answer': 1,
      'explanation':
          'A good sentence gives complete information and makes sense.',
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
                color: Colors.amber,
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
                  color: Color(0xFF3949AB),
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
              const SizedBox(height: 10),
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
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  String _getResultMessage(int percentage) {
    if (percentage >= 90) {
      return 'Excellent work! You are very good at forming sentences and writing.';
    } else if (percentage >= 70) {
      return 'Great job! Keep practising to become even better.';
    } else if (percentage >= 50) {
      return 'Good effort! Review the lesson and try again.';
    } else {
      return 'Keep learning! Read the lesson once more and practise again.';
    }
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
    if (!answered) return null;

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
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Sentence Formation Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
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
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                options.length,
                (index) => _buildOption(
                  index,
                  options[index],
                  correctAnswer,
                ),
              ),

              if (answered) ...[
                const SizedBox(height: 14),
                _buildExplanation(
                  question['explanation'],
                  selectedAnswer == correctAnswer,
                ),
              ],

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 54,
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
                    backgroundColor: const Color(0xFF3949AB),
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
            Color(0xFF5C6BC0),
            Color(0xFF3949AB),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.edit_note_rounded,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Question ${currentQuestion + 1} of ${questions.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
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
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: answered
                    ? Colors.transparent
                    : const Color(0xFFEEF0FF),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                String.fromCharCode(65 + index),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3949AB),
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
            color: isCorrect ? Colors.green : Colors.orange.shade800,
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