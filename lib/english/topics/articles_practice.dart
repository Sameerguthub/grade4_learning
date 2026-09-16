import 'package:flutter/material.dart';

class ArticlesPracticePage extends StatefulWidget {
  const ArticlesPracticePage({super.key});

  @override
  State<ArticlesPracticePage> createState() =>
      _ArticlesPracticePageState();
}

class _ArticlesPracticePageState
    extends State<ArticlesPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = [
    _Question(
      'Choose the correct article: ___ apple',
      ['a', 'an', 'the', 'no article'],
      1,
      'Apple begins with a vowel sound, so we use an.',
    ),
    _Question(
      'Choose the correct article: ___ dog',
      ['an', 'a', 'the', 'no article'],
      1,
      'Dog begins with a consonant sound, so we use a.',
    ),
    _Question(
      'Choose the correct article: ___ elephant',
      ['a', 'an', 'the', 'no article'],
      1,
      'Elephant begins with a vowel sound.',
    ),
    _Question(
      'Choose the correct article: ___ book',
      ['an', 'a', 'the', 'no article'],
      1,
      'Book begins with a consonant sound.',
    ),
    _Question(
      'I saw ___ bird in the garden.',
      ['a', 'an', 'the', 'no article'],
      0,
      'We are mentioning one non-specific bird for the first time.',
    ),
    _Question(
      'She ate ___ orange.',
      ['a', 'an', 'the', 'no article'],
      1,
      'Orange begins with a vowel sound.',
    ),
    _Question(
      '___ sun gives us light.',
      ['A', 'An', 'The', 'No article'],
      2,
      'The sun is a specific and unique object.',
    ),
    _Question(
      'He is ___ teacher.',
      ['an', 'a', 'the', 'no article'],
      1,
      'Teacher begins with a consonant sound.',
    ),
    _Question(
      'She has ___ umbrella.',
      ['a', 'an', 'the', 'no article'],
      1,
      'Umbrella begins with a vowel sound.',
    ),
    _Question(
      'Please give me ___ book on the table.',
      ['a', 'an', 'the', 'no article'],
      2,
      'We know which book because it is on the table.',
    ),
    _Question(
      'Which sentence is correct?',
      [
        'I saw an dog.',
        'I saw a dog.',
        'I saw a apple.',
        'I saw an book.',
      ],
      1,
      'Dog begins with a consonant sound, so a dog is correct.',
    ),
    _Question(
      'Which sentence is correct?',
      [
        'She has a orange.',
        'She has an orange.',
        'She has an pencil.',
        'She has a elephant.',
      ],
      1,
      'Orange begins with a vowel sound, so an orange is correct.',
    ),
    _Question(
      'Choose the correct article: ___ hour',
      ['a', 'an', 'the', 'no article'],
      1,
      'Hour begins with a vowel sound because the h is silent.',
    ),
    _Question(
      'Choose the correct article: ___ university',
      ['a', 'an', 'the', 'no article'],
      0,
      'University begins with a /y/ sound, which is a consonant sound.',
    ),
    _Question(
      'Which article is used for a particular or specific noun?',
      ['A', 'AN', 'THE', 'None'],
      2,
      'The is used when we mean a particular or specific noun.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return _resultScreen();
    }

    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F1),
      appBar: AppBar(
        title: const Text(
          'Articles Practice',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
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
                  color: Colors.purple,
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
              color: Colors.purple,
            ),
            const SizedBox(width: 8),
            const Text(
              'Articles Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'Score: $score',
              style: const TextStyle(
                color: Colors.purple,
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
            backgroundColor: Colors.purple.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation(
              Colors.purple,
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
      background = Colors.purple.shade50;
      border = Colors.purple;
      iconColor = Colors.purple;
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
          backgroundColor: Colors.purple,
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
        ? 'Excellent! You really understand articles.'
        : percentage >= 70
            ? 'Great job! Keep practising.'
            : percentage >= 50
                ? 'Good effort! Review the lesson and try again.'
                : 'Keep learning! Read the lesson again and retry.';

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F1),
      appBar: AppBar(
        title: const Text(
          'Articles Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
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
                color: Colors.purple,
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
              _scoreCard(percentage),
              const SizedBox(height: 24),
              _button(
                'Try Again',
                Icons.refresh_rounded,
                () {
                  setState(() {
                    currentQuestion = 0;
                    score = 0;
                    selectedAnswer = null;
                    answered = false;
                  });
                },
              ),
              const SizedBox(height: 12),
              _outlineButton(
                'Back to Articles',
                Icons.arrow_back_rounded,
                () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scoreCard(int percentage) {
    return Container(
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
              color: Colors.purple,
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
    );
  }

  Widget _button(
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(
    String text,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.purple,
          side: const BorderSide(color: Colors.purple),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
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