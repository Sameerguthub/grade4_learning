import 'package:flutter/material.dart';

class ForceMotionPracticePage extends StatefulWidget {
  const ForceMotionPracticePage({super.key});

  @override
  State<ForceMotionPracticePage> createState() =>
      _ForceMotionPracticePageState();
}

class _ForceMotionPracticePageState
    extends State<ForceMotionPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      'What is a force?',
      [
        'Only movement',
        'A push or a pull',
        'Only speed',
        'Only gravity',
      ],
      1,
      'A force is a push or a pull.',
    ),
    _Question(
      'Which is an example of a push?',
      [
        'Pulling a drawer',
        'Pushing a door',
        'Pulling a rope',
        'Picking up a bag',
      ],
      1,
      'Pushing a door away from you is an example of a push.',
    ),
    _Question(
      'Which is an example of a pull?',
      [
        'Kicking a ball',
        'Pushing a chair',
        'Pulling a drawer',
        'Pushing a door',
      ],
      2,
      'Pulling a drawer toward you is an example of a pull.',
    ),
    _Question(
      'Which force pulls objects toward Earth?',
      [
        'Friction',
        'Gravity',
        'Light',
        'Sound',
      ],
      1,
      'Gravity pulls objects toward Earth.',
    ),
    _Question(
      'Why does a dropped ball fall to the ground?',
      [
        'Because of gravity',
        'Because of sound',
        'Because of light',
        'Because of colour',
      ],
      0,
      'Earth’s gravity pulls the ball downward.',
    ),
    _Question(
      'What does friction generally do to moving objects?',
      [
        'Always makes them faster',
        'Opposes their motion',
        'Makes them disappear',
        'Creates light',
      ],
      1,
      'Friction opposes motion between surfaces that are rubbing against each other.',
    ),
    _Question(
      'Which force helps a bicycle stop when brakes are applied?',
      [
        'Friction',
        'Sunlight',
        'Magnetism only',
        'Sound',
      ],
      0,
      'Friction between the brake parts and wheel helps slow and stop the bicycle.',
    ),
    _Question(
      'What can a force do to an object?',
      [
        'Change its motion',
        'Always make it disappear',
        'Change it into water',
        'Give it a colour',
      ],
      0,
      'A force can start, stop or change the speed or direction of motion.',
    ),
    _Question(
      'Which can make a stationary ball move?',
      [
        'A push',
        'Silence',
        'Darkness',
        'A shadow',
      ],
      0,
      'A push can make an object that is at rest start moving.',
    ),
    _Question(
      'Which surface usually produces more friction?',
      [
        'Very smooth surface',
        'Rough surface',
        'Ice-like surface',
        'Polished glass only',
      ],
      1,
      'Rough surfaces generally produce more friction than smooth surfaces.',
    ),
    _Question(
      'Why can we walk without continuously slipping?',
      [
        'Because of friction',
        'Because of sunlight',
        'Because of sound',
        'Because of gravity only',
      ],
      0,
      'Friction between our shoes and the ground helps us walk without slipping.',
    ),
    _Question(
      'What can happen when a moving ball is kicked from the side?',
      [
        'Its direction can change',
        'It becomes invisible',
        'It stops existing',
        'It turns into water',
      ],
      0,
      'A force from the side can change the direction of a moving ball.',
    ),
    _Question(
      'Which is a force that can slow down motion?',
      [
        'Friction',
        'Colour',
        'Light',
        'Sound',
      ],
      0,
      'Friction opposes motion and can slow moving objects.',
    ),
    _Question(
      'What does a stronger push generally do to an object?',
      [
        'It can change its motion more',
        'It removes the object',
        'It changes its colour',
        'Nothing can happen',
      ],
      0,
      'A stronger force can cause a greater change in an object’s motion.',
    ),
    _Question(
      'Which force helps us stay on the ground?',
      [
        'Gravity',
        'Sound',
        'Light',
        'Friction alone',
      ],
      0,
      'Gravity pulls us toward Earth and keeps us from floating away.',
    ),
    _Question(
      'What is motion?',
      [
        'A change in position',
        'A colour',
        'A sound',
        'A type of material',
      ],
      0,
      'Motion is a change in the position of an object with time.',
    ),
    _Question(
      'Which object is showing motion?',
      [
        'A parked bicycle',
        'A moving car',
        'A table',
        'A book on a shelf',
      ],
      1,
      'A moving car is changing its position, so it is in motion.',
    ),
    _Question(
      'What happens when brakes are applied to a moving bicycle?',
      [
        'Friction helps slow it down',
        'Gravity disappears',
        'The bicycle becomes weightless',
        'The wheels become invisible',
      ],
      0,
      'Brake friction helps reduce the bicycle’s motion.',
    ),
    _Question(
      'Which action is a pull?',
      [
        'Kicking a ball',
        'Pushing a trolley',
        'Pulling a suitcase',
        'Pushing a chair',
      ],
      2,
      'Pulling a suitcase toward you is a pull.',
    ),
    _Question(
      'Which statement is correct?',
      [
        'Forces can never change motion',
        'A force can change motion',
        'Gravity only works on balls',
        'Friction always makes objects faster',
      ],
      1,
      'Forces can start, stop, speed up, slow down or change the direction of motion.',
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
      _showResult();
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

  void _showResult() {
    final percentage =
        (score / questions.length * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent! You really understand force and motion!';
    } else if (percentage >= 70) {
      message = 'Great work! Keep exploring science.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson once more.';
    } else {
      message = 'Keep practicing. You will get better!';
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
              Icons.emoji_events_rounded,
              color: Color(0xFFFFA000),
              size: 56,
            ),
            SizedBox(height: 8),
            Text(
              'Practice Complete!',
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
                color: Color(0xFFE65100),
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
                color: Color(0xFF68706D),
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
              backgroundColor: const Color(0xFFE65100),
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
      backgroundColor: const Color(0xFFF8F7F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Force & Motion Practice',
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
                      color: Color(0xFF69706D),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${currentQuestion + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFE65100),
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
                  color: const Color(0xFFE65100),
                  backgroundColor: const Color(0xFFFFE0B2),
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
                  final correct =
                      index == q.answer;
                  final selected =
                      index == selectedAnswer;

                  Color background = Colors.white;
                  Color border =
                      const Color(0xFFE0E1DF);

                  if (answered && correct) {
                    background =
                        const Color(0xFFE8F5E9);
                    border =
                        const Color(0xFF43A047);
                  } else if (answered && selected) {
                    background =
                        const Color(0xFFFFEBEE);
                    border =
                        const Color(0xFFE53935);
                  }

                  return GestureDetector(
                    onTap: () => selectAnswer(index),
                    child: Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius:
                            BorderRadius.circular(17),
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
                                  : const Color(0xFFFFF3E0),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(
                                65 + index,
                              ),
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.w800,
                                color:
                                    answered && correct
                                        ? Colors.white
                                        : const Color(
                                            0xFFE65100,
                                          ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q.options[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight:
                                    FontWeight.w600,
                                height: 1.3,
                              ),
                            ),
                          ),
                          if (answered && correct)
                            const Icon(
                              Icons
                                  .check_circle_rounded,
                              color:
                                  Color(0xFF43A047),
                            )
                          else if (answered && selected)
                            const Icon(
                              Icons.cancel_rounded,
                              color:
                                  Color(0xFFE53935),
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
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer == q.answer
                            ? Icons
                                .check_circle_rounded
                            : Icons.info_rounded,
                        color:
                            selectedAnswer == q.answer
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
                            color: Color(0xFF59615E),
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
                      backgroundColor:
                          const Color(0xFFE65100),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16),
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