import 'package:flutter/material.dart';

class PrepositionsPracticePage extends StatefulWidget {
  const PrepositionsPracticePage({super.key});

  @override
  State<PrepositionsPracticePage> createState() =>
      _PrepositionsPracticePageState();
}

class _PrepositionsPracticePageState
    extends State<PrepositionsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      'The book is ___ the table.',
      ['in', 'on', 'under', 'between'],
      1,
      'The book touches the surface of the table, so we use on.',
    ),
    _Question(
      'The cat is ___ the chair.',
      ['under', 'on', 'at', 'to'],
      0,
      'Under means below something.',
    ),
    _Question(
      'The pencils are ___ the box.',
      ['in', 'on', 'above', 'from'],
      0,
      'In means inside something.',
    ),
    _Question(
      'The ball is ___ the two boxes.',
      ['above', 'between', 'from', 'at'],
      1,
      'Between is used when something is in the middle of two things.',
    ),
    _Question(
      'The fan is ___ my head.',
      ['under', 'above', 'into', 'from'],
      1,
      'Above means higher than something.',
    ),
    _Question(
      'We will meet ___ 7 o’clock.',
      ['on', 'in', 'at', 'from'],
      2,
      'At is used for an exact time.',
    ),
    _Question(
      'We have a test ___ Monday.',
      ['at', 'on', 'in', 'to'],
      1,
      'On is used with days.',
    ),
    _Question(
      'My birthday is ___ July.',
      ['at', 'on', 'in', 'from'],
      2,
      'In is used with months.',
    ),
    _Question(
      'We went ___ school.',
      ['from', 'to', 'under', 'between'],
      1,
      'To shows direction towards a place.',
    ),
    _Question(
      'She came ___ Mumbai.',
      ['to', 'from', 'on', 'above'],
      1,
      'From shows the place where someone or something comes from.',
    ),
    _Question(
      'The children walked ___ the tunnel.',
      ['through', 'at', 'on', 'under'],
      0,
      'Through means moving from one side to the other inside something.',
    ),
    _Question(
      'The bag is ___ the chair.',
      ['beside', 'into', 'from', 'at'],
      0,
      'Beside means next to something.',
    ),
    _Question(
      'Which sentence uses a preposition correctly?',
      [
        'The cat is under the table.',
        'The cat is table under.',
        'The cat under is table.',
        'Under cat the table is.',
      ],
      0,
      'Under correctly shows the relationship between the cat and table.',
    ),
    _Question(
      'Which word is a preposition?',
      ['quickly', 'beautiful', 'under', 'happy'],
      2,
      'Under shows the position of one thing in relation to another.',
    ),
    _Question(
      'Which preposition is used for an exact time?',
      ['in', 'on', 'at', 'from'],
      2,
      'At is used for exact times such as at 5 o’clock.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        title: const Text(
          'Prepositions Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                  color: Colors.green,
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
                _nextButton(),
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
              color: Colors.green,
            ),
            const SizedBox(width: 8),
            const Text(
              'Prepositions Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.green,
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
            backgroundColor: Colors.green.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation(
              Colors.green,
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
    final correct = index == correctIndex;
    final selected = selectedAnswer == index;

    Color background = Colors.white;
    Color border = Colors.grey.shade300;
    Color iconColor = Colors.grey;
    IconData icon = Icons.radio_button_unchecked_rounded;

    if (answered && correct) {
      background = Colors.green.shade50;
      border = Colors.green;
      iconColor = Colors.green;
      icon = Icons.check_circle_rounded;
    } else if (answered && selected && !correct) {
      background = Colors.red.shade50;
      border = Colors.red;
      iconColor = Colors.red;
      icon = Icons.cancel_rounded;
    } else if (selected) {
      background = Colors.green.shade50;
      border = Colors.green;
      iconColor = Colors.green;
      icon = Icons.radio_button_checked_rounded;
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

  Widget _nextButton() {
    return SizedBox(
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
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
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

    final message = percentage >= 90
        ? 'Excellent! You really understand prepositions.'
        : percentage >= 70
            ? 'Great job! Keep practising.'
            : percentage >= 50
                ? 'Good effort! Review the lesson and try again.'
                : 'Keep learning! Read the lesson again and retry.';

    return Scaffold(
      backgroundColor: const Color(0xFFF3FAF8),
      appBar: AppBar(
        title: const Text(
          'Prepositions Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 90),
          child: Column(
            children: [
              const Icon(
                Icons.workspace_premium_rounded,
                size: 100,
                color: Colors.green,
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
                        color: Colors.green,
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
                    backgroundColor: Colors.green,
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
                    'Back to Prepositions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(
                      color: Colors.green,
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