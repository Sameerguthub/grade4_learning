import 'package:flutter/material.dart';

class AdverbsPracticePage extends StatefulWidget {
  const AdverbsPracticePage({super.key});

  @override
  State<AdverbsPracticePage> createState() => _AdverbsPracticePageState();
}

class _AdverbsPracticePageState
    extends State<AdverbsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      'Which word is an adverb?',
      ['beautiful', 'quickly', 'school', 'green'],
      1,
      'Quickly tells us how an action happens.',
    ),
    _Question(
      'Find the adverb: "The boy runs quickly."',
      ['boy', 'runs', 'quickly', 'the'],
      2,
      'Quickly tells us how the boy runs.',
    ),
    _Question(
      'Find the adverb: "She arrived yesterday."',
      ['she', 'arrived', 'yesterday', 'none'],
      2,
      'Yesterday tells us when she arrived.',
    ),
    _Question(
      'Which word tells us where?',
      ['outside', 'beautiful', 'five', 'happy'],
      0,
      'Outside tells us where something happens.',
    ),
    _Question(
      'Choose the adverb: "The turtle walks ___."',
      ['slowly', 'green', 'turtle', 'slow'],
      0,
      'Slowly tells us how the turtle walks.',
    ),
    _Question(
      'Choose the adverb: "I ___ brush my teeth."',
      ['always', 'blue', 'brush', 'teeth'],
      0,
      'Always tells us how often the action happens.',
    ),
    _Question(
      'Which word tells us when?',
      ['tomorrow', 'outside', 'quickly', 'beautiful'],
      0,
      'Tomorrow tells us when something will happen.',
    ),
    _Question(
      'Which sentence contains an adverb?',
      [
        'The red ball.',
        'The boy is tall.',
        'The boy runs quickly.',
        'A beautiful flower.',
      ],
      2,
      'Quickly is the adverb in the sentence.',
    ),
    _Question(
      'Find the adverb: "The baby slept quietly."',
      ['baby', 'slept', 'quietly', 'the'],
      2,
      'Quietly tells us how the baby slept.',
    ),
    _Question(
      'Which adverb means "not ever"?',
      ['always', 'often', 'never', 'usually'],
      2,
      'Never means not ever.',
    ),
    _Question(
      'Choose the correct adverb: "They played ___."',
      ['happily', 'happy', 'happiness', 'happier'],
      0,
      'Happily tells us how they played.',
    ),
    _Question(
      'Which word tells us how often?',
      ['often', 'there', 'tomorrow', 'slowly'],
      0,
      'Often tells us frequency.',
    ),
    _Question(
      'Choose the correct sentence.',
      [
        'She sings beautiful.',
        'She sings beautifully.',
        'She beautifully is sing.',
        'She sing beauty.',
      ],
      1,
      'Beautifully correctly tells us how she sings.',
    ),
    _Question(
      'Find the adverb: "The children are playing outside."',
      ['children', 'playing', 'outside', 'are'],
      2,
      'Outside tells us where they are playing.',
    ),
    _Question(
      'Which word is NOT an adverb?',
      ['slowly', 'quickly', 'green', 'always'],
      2,
      'Green is an adjective, not an adverb.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF),
      appBar: AppBar(
        title: const Text(
          'Adverbs Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                  color: Colors.blue,
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
                      backgroundColor: Colors.blue,
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
              color: Colors.blue,
            ),
            const SizedBox(width: 8),
            const Text(
              'Adverbs Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.blue,
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
            backgroundColor: Colors.blue.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation(
              Colors.blue,
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
      background = Colors.blue.shade50;
      border = Colors.blue;
      iconColor = Colors.blue;
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
        ? 'Excellent! You really understand adverbs.'
        : percentage >= 70
            ? 'Great job! Keep practising.'
            : percentage >= 50
                ? 'Good effort! Review the lesson and try again.'
                : 'Keep learning! Read the lesson again and retry.';

    return Scaffold(
      backgroundColor: const Color(0xFFF3F8FF),
      appBar: AppBar(
        title: const Text(
          'Adverbs Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
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
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  size: 65,
                  color: Colors.blue,
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
                        color: Colors.blue,
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
                    backgroundColor: Colors.blue,
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
                    'Back to Adverbs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(
                      color: Colors.blue,
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