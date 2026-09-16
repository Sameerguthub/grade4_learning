import 'package:flutter/material.dart';

class EarthSpacePracticePage extends StatefulWidget {
  const EarthSpacePracticePage({super.key});

  @override
  State<EarthSpacePracticePage> createState() =>
      _EarthSpacePracticePageState();
}

class _EarthSpacePracticePageState
    extends State<EarthSpacePracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      'Which planet do we live on?',
      ['Mars', 'Earth', 'Venus', 'Jupiter'],
      1,
      'We live on Earth, the third planet from the Sun.',
    ),
    _Question(
      'What is the Sun?',
      ['A planet', 'A moon', 'A star', 'A satellite'],
      2,
      'The Sun is a star that gives Earth light and heat.',
    ),
    _Question(
      'Which is Earth’s natural satellite?',
      ['Mars', 'Moon', 'Sun', 'Venus'],
      1,
      'The Moon is the natural satellite of Earth.',
    ),
    _Question(
      'How many planets are in our solar system?',
      ['5', '7', '8', '10'],
      2,
      'There are eight planets in our solar system.',
    ),
    _Question(
      'Which planet is closest to the Sun?',
      ['Earth', 'Mars', 'Mercury', 'Neptune'],
      2,
      'Mercury is the planet closest to the Sun.',
    ),
    _Question(
      'Which planet is known as the Red Planet?',
      ['Mars', 'Venus', 'Saturn', 'Earth'],
      0,
      'Mars is often called the Red Planet because of its reddish surface.',
    ),
    _Question(
      'What causes day and night?',
      [
        'Earth’s rotation',
        'Earth’s colour',
        'The Moon',
        'Clouds',
      ],
      0,
      'Earth’s rotation causes different parts of Earth to face toward or away from the Sun.',
    ),
    _Question(
      'About how long does Earth take to rotate once?',
      ['1 hour', '12 hours', '24 hours', '100 hours'],
      2,
      'Earth takes about 24 hours to complete one rotation.',
    ),
    _Question(
      'What is Earth’s movement around the Sun called?',
      ['Rotation', 'Revolution', 'Reflection', 'Spinning'],
      1,
      'Earth’s movement around the Sun is called revolution.',
    ),
    _Question(
      'About how long does Earth take to orbit the Sun?',
      ['One day', 'One month', 'One year', 'One week'],
      2,
      'Earth takes about 365 days, or one year, to complete one orbit.',
    ),
    _Question(
      'Which object gives Earth most of its light and heat?',
      ['Moon', 'Sun', 'Mars', 'Clouds'],
      1,
      'The Sun provides Earth with light and heat.',
    ),
    _Question(
      'What is the path of a planet around the Sun called?',
      ['Axis', 'Orbit', 'Ring', 'Line'],
      1,
      'The path followed by an object as it moves around another object is called an orbit.',
    ),
    _Question(
      'Does the Moon produce its own light?',
      ['Yes', 'No', 'Only during the day', 'Only in winter'],
      1,
      'The Moon does not make its own light. It reflects sunlight.',
    ),
    _Question(
      'Which planet has large visible rings?',
      ['Saturn', 'Earth', 'Mercury', 'Mars'],
      0,
      'Saturn is famous for its large system of rings.',
    ),
    _Question(
      'Which is the largest planet in our solar system?',
      ['Earth', 'Mars', 'Jupiter', 'Mercury'],
      2,
      'Jupiter is the largest planet in our solar system.',
    ),
    _Question(
      'What do astronauts use to travel into space?',
      ['Bicycle', 'Rocket', 'Boat', 'Train'],
      1,
      'Rockets are used to carry astronauts and equipment into space.',
    ),
    _Question(
      'What is a satellite?',
      [
        'An object that moves around another object',
        'A type of cloud',
        'A star',
        'A mountain',
      ],
      0,
      'A satellite is an object that moves around a larger object.',
    ),
    _Question(
      'Which planet is our home?',
      ['Jupiter', 'Earth', 'Saturn', 'Neptune'],
      1,
      'Earth is our home planet.',
    ),
    _Question(
      'Which of these is a star?',
      ['Moon', 'Earth', 'Sun', 'Mars'],
      2,
      'The Sun is a star.',
    ),
    _Question(
      'What does Earth rotate around?',
      [
        'Its axis',
        'The Moon only',
        'Mars',
        'A mountain',
      ],
      0,
      'Earth rotates around an imaginary line called its axis.',
    ),
  ];

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
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      _result();
    }
  }

  void restart() {
    Navigator.pop(context);

    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
  }

  void _result() {
    final percentage =
        (score / questions.length * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Amazing! You are a Space Explorer!';
    } else if (percentage >= 70) {
      message = 'Great job! You know Earth and space well.';
    } else if (percentage >= 50) {
      message = 'Good effort! Keep exploring and learning.';
    } else {
      message = 'Keep practicing. Your space knowledge will grow!';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: const Column(
          children: [
            Icon(
              Icons.rocket_launch_rounded,
              color: Color(0xFF3949AB),
              size: 55,
            ),
            SizedBox(height: 8),
            Text(
              'Quiz Complete!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w800),
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
                fontWeight: FontWeight.w900,
                color: Color(0xFF3949AB),
              ),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF667178),
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton.icon(
            onPressed: restart,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try Again'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF3949AB),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Earth & Space Practice',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Question',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF657078),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${currentQuestion + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3949AB),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value:
                      (currentQuestion + 1) / questions.length,
                  minHeight: 8,
                  color: const Color(0xFF3949AB),
                  backgroundColor: const Color(0xFFDDE1F5),
                ),
              ),
              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                q.options.length,
                (index) {
                  final correct = index == q.answer;
                  final selected = index == selectedAnswer;

                  Color background = Colors.white;
                  Color border = const Color(0xFFE0E3E8);

                  if (answered && correct) {
                    background = const Color(0xFFE8F5E9);
                    border = const Color(0xFF43A047);
                  } else if (answered && selected) {
                    background = const Color(0xFFFFEBEE);
                    border = const Color(0xFFE53935);
                  }

                  return GestureDetector(
                    onTap: () => selectAnswer(index),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: border,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: answered && correct
                                  ? const Color(0xFF43A047)
                                  : const Color(0xFFE8EAF6),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: answered && correct
                                    ? Colors.white
                                    : const Color(0xFF3949AB),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q.options[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                          ),
                          if (answered && correct)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF43A047),
                            )
                          else if (answered && selected)
                            const Icon(
                              Icons.cancel_rounded,
                              color: Color(0xFFE53935),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              if (answered) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: selectedAnswer == q.answer
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer == q.answer
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: selectedAnswer == q.answer
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFE65100),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          q.explanation,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: Color(0xFF56616A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: nextQuestion,
                    icon: Icon(
                      currentQuestion ==
                              questions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              questions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF3949AB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
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