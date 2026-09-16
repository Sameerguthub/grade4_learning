
import 'package:flutter/material.dart';

class NounsPracticePage extends StatefulWidget {
  const NounsPracticePage({super.key});

  @override
  State<NounsPracticePage> createState() => _NounsPracticePageState();
}

class _NounsPracticePageState extends State<NounsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_NounQuestion> questions = [
    _NounQuestion(
      question: 'Which word is a noun?',
      options: ['run', 'school', 'quickly', 'beautiful'],
      answer: 1,
      explanation: 'School is a place, so it is a noun.',
    ),
    _NounQuestion(
      question: 'Which word names a person?',
      options: ['teacher', 'garden', 'tiger', 'pencil'],
      answer: 0,
      explanation: 'Teacher names a person.',
    ),
    _NounQuestion(
      question: 'Which word is an animal?',
      options: ['jump', 'lion', 'happy', 'slowly'],
      answer: 1,
      explanation: 'Lion is the name of an animal.',
    ),
    _NounQuestion(
      question: 'Which word is a thing?',
      options: ['bicycle', 'Mumbai', 'doctor', 'elephant'],
      answer: 0,
      explanation: 'Bicycle is the name of a thing.',
    ),
    _NounQuestion(
      question: 'Which is a proper noun?',
      options: ['city', 'boy', 'Mumbai', 'school'],
      answer: 2,
      explanation: 'Mumbai is the special name of a particular city.',
    ),
    _NounQuestion(
      question: 'Which word is a common noun?',
      options: ['Riya', 'India', 'Monday', 'girl'],
      answer: 3,
      explanation: 'Girl is a general name, so it is a common noun.',
    ),
    _NounQuestion(
      question: 'Find the noun: "The cat is sleeping."',
      options: ['the', 'cat', 'is', 'sleeping'],
      answer: 1,
      explanation: 'Cat names an animal.',
    ),
    _NounQuestion(
      question: 'Find the nouns: "Rohan has a book."',
      options: [
        'Rohan and book',
        'has and a',
        'book only',
        'Rohan only',
      ],
      answer: 0,
      explanation: 'Rohan names a person and book names a thing.',
    ),
    _NounQuestion(
      question: 'Which word is a place?',
      options: ['hospital', 'doctor', 'medicine', 'help'],
      answer: 0,
      explanation: 'Hospital is a place.',
    ),
    _NounQuestion(
      question: 'Which sentence contains a proper noun?',
      options: [
        'The boy is running.',
        'The dog is barking.',
        'A city is busy.',
        'Rahul is reading.',
      ],
      answer: 3,
      explanation: 'Rahul is the special name of a person.',
    ),
    _NounQuestion(
      question: 'Which word is NOT a noun?',
      options: ['apple', 'teacher', 'quickly', 'park'],
      answer: 2,
      explanation: 'Quickly tells us how something happens. It is not a noun.',
    ),
    _NounQuestion(
      question: 'Which is the proper noun for "country"?',
      options: ['India', 'country', 'place', 'land'],
      answer: 0,
      explanation: 'India is the proper name of a country.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Nouns Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _progressHeader(),
              const SizedBox(height: 18),

              Text(
                'Question ${currentQuestion + 1} of ${questions.length}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                question.options.length,
                (index) => _answerButton(
                  index: index,
                  text: question.options[index],
                  correct: question.answer == index,
                ),
              ),

              if (answered) ...[
                const SizedBox(height: 12),
                _explanation(question),
              ],

              const SizedBox(height: 20),

              if (answered)
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: _nextQuestion,
                    icon: Icon(
                      currentQuestion == questions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion == questions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
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

  Widget _progressHeader() {
    final progress = (currentQuestion + (answered ? 1 : 0)) / questions.length;

    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.quiz_rounded,
              color: Colors.indigo,
            ),
            const SizedBox(width: 8),
            const Text(
              'Nouns Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            minHeight: 9,
            backgroundColor: Colors.indigo.withOpacity(0.10),
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.indigo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _answerButton({
    required int index,
    required String text,
    required bool correct,
  }) {
    Color background = Colors.white;
    Color border = Colors.grey.shade300;
    Color iconColor = Colors.grey.shade500;
    IconData icon = Icons.radio_button_unchecked_rounded;

    if (answered && correct) {
      background = Colors.green.shade50;
      border = Colors.green;
      iconColor = Colors.green;
      icon = Icons.check_circle_rounded;
    } else if (answered &&
        selectedAnswer == index &&
        !correct) {
      background = Colors.red.shade50;
      border = Colors.red;
      iconColor = Colors.red;
      icon = Icons.cancel_rounded;
    } else if (selectedAnswer == index) {
      background = Colors.indigo.shade50;
      border = Colors.indigo;
      iconColor = Colors.indigo;
      icon = Icons.radio_button_checked_rounded;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: answered ? null : () => _selectAnswer(index),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: border,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 25,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _explanation(_NounQuestion question) {
    final isCorrect = selectedAnswer == question.answer;

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
            color: isCorrect ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isCorrect
                  ? 'Correct! ${question.explanation}'
                  : 'Not quite. ${question.explanation}',
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectAnswer(int index) {
    final question = questions[currentQuestion];

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == question.answer) {
        score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      currentQuestion++;
      selectedAnswer = null;
      answered = false;
    });
  }

  Widget _resultScreen() {
    final percentage = ((score / questions.length) * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent work! You really understand nouns.';
    } else if (percentage >= 70) {
      message = 'Great job! Keep practising to become even better.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson and try again.';
    } else {
      message = 'Keep learning! Read the lesson once more and retry.';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Nouns Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 90),
          child: Column(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  size: 65,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Practice Complete!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Your Score',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$score / ${questions.length}',
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$percentage%',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      currentQuestion = 0;
                      score = 0;
                      selectedAnswer = null;
                      answered = false;
                    });
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text(
                    'Back to Nouns',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    side: const BorderSide(
                      color: Colors.indigo,
                    ),
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
}

class _NounQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _NounQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}
