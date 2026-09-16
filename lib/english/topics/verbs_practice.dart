import 'package:flutter/material.dart';

class VerbsPracticePage extends StatefulWidget {
  const VerbsPracticePage({super.key});

  @override
  State<VerbsPracticePage> createState() => _VerbsPracticePageState();
}

class _VerbsPracticePageState extends State<VerbsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      'Which word is a verb?',
      ['blue', 'run', 'school', 'happy'],
      1,
      'Run is an action word, so it is a verb.',
    ),
    _Question(
      'Find the verb: "The boy jumps high."',
      ['boy', 'jumps', 'high', 'the'],
      1,
      'Jumps tells us what the boy does.',
    ),
    _Question(
      'Find the verb: "She reads a book."',
      ['She', 'reads', 'book', 'a'],
      1,
      'Reads tells us the action performed by She.',
    ),
    _Question(
      'Which word shows an action?',
      ['beautiful', 'quick', 'swim', 'school'],
      2,
      'Swim is an action.',
    ),
    _Question(
      'Choose the correct verb: "Birds ___ in the sky."',
      ['fly', 'blue', 'happy', 'book'],
      0,
      'Birds fly in the sky.',
    ),
    _Question(
      'Choose the correct verb: "The children ___ football."',
      ['football', 'play', 'green', 'children'],
      1,
      'Play tells us what the children do.',
    ),
    _Question(
      'Which sentence contains a verb?',
      [
        'The red ball.',
        'A beautiful garden.',
        'The dog runs.',
        'A tall tree.',
      ],
      2,
      'Runs is the verb in "The dog runs."',
    ),
    _Question(
      'What is the past form of "play"?',
      ['playing', 'plays', 'played', 'will play'],
      2,
      'The past form of play is played.',
    ),
    _Question(
      'What is the past form of "walk"?',
      ['walks', 'walking', 'walked', 'will walk'],
      2,
      'The past form of walk is walked.',
    ),
    _Question(
      'Choose the future form: "I ___ tomorrow."',
      ['played', 'play', 'will play', 'playing'],
      2,
      'Will play tells us the action will happen in the future.',
    ),
    _Question(
      'Choose the helping verb: "She ___ reading."',
      ['is', 'book', 'red', 'quickly'],
      0,
      'Is helps the main verb reading.',
    ),
    _Question(
      'Choose the correct sentence.',
      [
        'He are running.',
        'He is running.',
        'He am running.',
        'He be running.',
      ],
      1,
      'He is the correct subject for the helping verb is.',
    ),
    _Question(
      'Which word is a verb in "They are playing outside"?',
      ['They', 'are', 'playing', 'outside'],
      2,
      'Playing is the main action verb.',
    ),
    _Question(
      'Which word tells about an ability?',
      ['can', 'red', 'table', 'slowly'],
      0,
      'Can is a helping verb that can show ability.',
    ),
    _Question(
      'Which sentence uses a verb correctly?',
      [
        'The bird fly yesterday.',
        'The bird flew yesterday.',
        'The bird flying yesterday.',
        'The bird blue yesterday.',
      ],
      1,
      'Flew is the past form of fly.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      appBar: AppBar(
        title: const Text(
          'Verbs Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
                  color: Colors.teal,
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
                      backgroundColor: Colors.teal,
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
              color: Colors.teal,
            ),
            const SizedBox(width: 8),
            const Text(
              'Verbs Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.teal,
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
            backgroundColor: Colors.teal.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation(
              Colors.teal,
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
      background = Colors.teal.shade50;
      border = Colors.teal;
      iconColor = Colors.teal;
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
        ? 'Excellent! You really understand verbs.'
        : percentage >= 70
            ? 'Great job! Keep practising.'
            : percentage >= 50
                ? 'Good effort! Review the lesson and try again.'
                : 'Keep learning! Read the lesson again and retry.';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F6),
      appBar: AppBar(
        title: const Text(
          'Verbs Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
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
                  color: Colors.teal.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.workspace_premium_rounded,
                  size: 65,
                  color: Colors.teal,
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
                        color: Colors.teal,
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
                    backgroundColor: Colors.teal,
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
                    'Back to Verbs',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    side: const BorderSide(
                      color: Colors.teal,
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