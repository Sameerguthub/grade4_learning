import 'package:flutter/material.dart';

class PronounsPracticePage extends StatefulWidget {
  const PronounsPracticePage({super.key});

  @override
  State<PronounsPracticePage> createState() =>
      _PronounsPracticePageState();
}

class _PronounsPracticePageState
    extends State<PronounsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      'Which word is a pronoun?',
      ['Rohan', 'he', 'school', 'book'],
      1,
      'He is a pronoun used instead of the name of a male person.',
    ),
    _Question(
      'Choose the correct pronoun: Riya is happy. ___ is smiling.',
      ['He', 'She', 'They', 'It'],
      1,
      'She is used for a female person.',
    ),
    _Question(
      'Choose the correct pronoun: Rahul is my brother. ___ is kind.',
      ['She', 'It', 'He', 'We'],
      2,
      'He is used for a male person.',
    ),
    _Question(
      'Choose the correct pronoun: The dog is hungry. ___ wants food.',
      ['He', 'They', 'It', 'We'],
      2,
      'It can be used for an animal when its gender is not specified.',
    ),
    _Question(
      'Choose the correct pronoun: Riya and I are friends. ___ play together.',
      ['We', 'He', 'She', 'It'],
      0,
      'We means the speaker and one or more other people.',
    ),
    _Question(
      'Choose the correct pronoun: The boys are playing. ___ are happy.',
      ['He', 'She', 'It', 'They'],
      3,
      'They is used for two or more people.',
    ),
    _Question(
      'Which pronoun is used for yourself?',
      ['I', 'They', 'She', 'It'],
      0,
      'I is used when we talk about ourselves.',
    ),
    _Question(
      'Which pronoun can be used when speaking to someone?',
      ['You', 'He', 'She', 'They'],
      0,
      'You is used when talking to one or more people.',
    ),
    _Question(
      'Find the pronoun: "Aman said he was tired."',
      ['Aman', 'said', 'he', 'tired'],
      2,
      'He replaces the noun Aman.',
    ),
    _Question(
      'Find the pronoun: "They went to the market."',
      ['went', 'market', 'to', 'They'],
      3,
      'They is the pronoun in the sentence.',
    ),
    _Question(
      'Which sentence uses a pronoun correctly?',
      [
        'Riya is happy. He is smiling.',
        'Rahul is kind. She helps me.',
        'Riya is happy. She is smiling.',
        'The boys is happy. They is playing.',
      ],
      2,
      'Riya is female, so the correct pronoun is She.',
    ),
    _Question(
      'Replace "Rahul" with a pronoun: Rahul is reading.',
      ['She', 'He', 'It', 'They'],
      1,
      'Rahul is a male name, so we use He.',
    ),
    _Question(
      'Replace "the girls" with a pronoun.',
      ['He', 'She', 'It', 'They'],
      3,
      'Girls means more than one person, so we use They.',
    ),
    _Question(
      'Replace "my sister and I" with a pronoun.',
      ['They', 'We', 'She', 'It'],
      1,
      'My sister and I means the speaker plus another person: We.',
    ),
    _Question(
      'Which pronoun can replace "the bicycle"?',
      ['They', 'He', 'It', 'We'],
      2,
      'A bicycle is a thing, so It can replace it.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Pronouns Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _progress(),
              const SizedBox(height: 20),

              Text(
                'Question ${currentQuestion + 1} of ${questions.length}',
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    height: 1.45,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                q.options.length,
                (index) => _answer(
                  index,
                  q.options[index],
                  q.answer,
                ),
              ),

              if (answered) ...[
                const SizedBox(height: 5),
                _explanation(q),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: _next,
                    icon: Icon(
                      currentQuestion == questions.length - 1
                          ? Icons.workspace_premium_rounded
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
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _progress() {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.quiz_rounded,
              color: Colors.deepPurple,
            ),
            const SizedBox(width: 8),
            const Text(
              'Pronouns Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: (currentQuestion + (answered ? 1 : 0)) /
                questions.length,
            minHeight: 9,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation(
              Colors.deepPurple,
            ),
          ),
        ),
      ],
    );
  }

  Widget _answer(
    int index,
    String text,
    int correctIndex,
  ) {
    bool isCorrect = index == correctIndex;
    bool isSelected = selectedAnswer == index;

    Color background = Colors.white;
    Color border = Colors.grey.shade300;
    IconData icon = Icons.radio_button_unchecked_rounded;
    Color iconColor = Colors.grey;

    if (answered && isCorrect) {
      background = Colors.green.shade50;
      border = Colors.green;
      icon = Icons.check_circle_rounded;
      iconColor = Colors.green;
    } else if (answered && isSelected && !isCorrect) {
      background = Colors.red.shade50;
      border = Colors.red;
      icon = Icons.cancel_rounded;
      iconColor = Colors.red;
    } else if (isSelected) {
      background = Colors.deepPurple.shade50;
      border = Colors.deepPurple;
      icon = Icons.radio_button_checked_rounded;
      iconColor = Colors.deepPurple;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: answered
            ? null
            : () {
                setState(() {
                  selectedAnswer = index;
                  answered = true;

                  if (index == correctIndex) {
                    score++;
                  }
                });
              },
        child: Container(
          padding: const EdgeInsets.all(16),
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
    );
  }

  Widget _explanation(_Question q) {
    final correct = selectedAnswer == q.answer;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: correct
            ? Colors.green.shade50
            : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            correct
                ? Icons.check_circle_rounded
                : Icons.info_rounded,
            color: correct ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              correct
                  ? 'Correct! ${q.explanation}'
                  : 'Not quite. ${q.explanation}',
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

  void _next() {
    setState(() {
      currentQuestion++;
      selectedAnswer = null;
      answered = false;
    });
  }

  Widget _resultScreen() {
    final percentage =
        ((score / questions.length) * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent! You have mastered pronouns.';
    } else if (percentage >= 70) {
      message = 'Great job! Keep practising.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson once more.';
    } else {
      message = 'Keep learning and try the quiz again.';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Pronouns Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
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
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  size: 65,
                  color: Colors.deepPurple,
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
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 5),
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
                    backgroundColor: Colors.deepPurple,
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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text(
                    'Back to Pronouns',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(
                      color: Colors.deepPurple,
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

class _Question {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _Question(
    this.question,
    this.options,
    this.answer,
    this.explanation,
  );
}