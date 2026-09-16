import 'package:flutter/material.dart';

class LightSoundPracticePage extends StatefulWidget {
  const LightSoundPracticePage({super.key});

  @override
  State<LightSoundPracticePage> createState() =>
      _LightSoundPracticePageState();
}

class _LightSoundPracticePageState
    extends State<LightSoundPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      'What allows us to see objects?',
      [
        'Light',
        'Sound',
        'Water',
        'Wind',
      ],
      0,
      'Light allows our eyes to see objects.',
    ),
    _Question(
      'What is the main natural source of light for Earth?',
      [
        'Bulb',
        'Torch',
        'Sun',
        'Candle',
      ],
      2,
      'The Sun is the main natural source of light for Earth.',
    ),
    _Question(
      'Which is an artificial source of light?',
      [
        'Sun',
        'Stars',
        'Electric bulb',
        'Lightning',
      ],
      2,
      'An electric bulb is made by people and produces artificial light.',
    ),
    _Question(
      'Which object produces its own light?',
      [
        'Book',
        'Chair',
        'Sun',
        'Table',
      ],
      2,
      'The Sun produces its own light, so it is a luminous object.',
    ),
    _Question(
      'Which object does not produce its own light?',
      [
        'Sun',
        'Candle flame',
        'Electric bulb',
        'Book',
      ],
      3,
      'A book does not produce light. We see it when light falls on it.',
    ),
    _Question(
      'Which material allows most light to pass through clearly?',
      [
        'Wood',
        'Clear glass',
        'Cardboard',
        'Metal',
      ],
      1,
      'Clear glass is transparent and allows light to pass through clearly.',
    ),
    _Question(
      'Which material allows some light to pass through?',
      [
        'Frosted glass',
        'Wood',
        'Metal',
        'Brick',
      ],
      0,
      'Frosted glass is translucent and allows some light to pass through.',
    ),
    _Question(
      'Which material blocks light?',
      [
        'Clear glass',
        'Clean water',
        'Wood',
        'Thin plastic',
      ],
      2,
      'Wood is opaque, so it blocks light.',
    ),
    _Question(
      'What is sound produced by?',
      [
        'Vibrations',
        'Colours',
        'Shadows',
        'Light',
      ],
      0,
      'Sound is produced when objects vibrate.',
    ),
    _Question(
      'Which sense organ helps us hear sound?',
      [
        'Eyes',
        'Nose',
        'Ears',
        'Skin',
      ],
      2,
      'Our ears help us hear sounds.',
    ),
    _Question(
      'Which can produce sound?',
      [
        'Vibrating guitar string',
        'Still rock',
        'Glass of water',
        'Shadow',
      ],
      0,
      'A vibrating guitar string produces sound.',
    ),
    _Question(
      'Which is usually a loud sound?',
      [
        'Whisper',
        'Soft rustling',
        'Thunder',
        'Quiet breathing',
      ],
      2,
      'Thunder can produce a very loud sound.',
    ),
    _Question(
      'Which is usually a soft sound?',
      [
        'Explosion',
        'Whisper',
        'Car horn',
        'Thunder',
      ],
      1,
      'A whisper is generally a soft sound.',
    ),
    _Question(
      'What is noise pollution?',
      [
        'Useful music',
        'Unwanted or excessive loud sound',
        'Natural light',
        'Clean air',
      ],
      1,
      'Noise pollution is caused by unwanted or excessive loud sounds.',
    ),
    _Question(
      'Which can help reduce noise pollution?',
      [
        'Unnecessary honking',
        'Very loud music',
        'Keeping sound levels reasonable',
        'Shouting',
      ],
      2,
      'Keeping sound levels reasonable helps reduce unnecessary noise.',
    ),
    _Question(
      'Why do plants need sunlight?',
      [
        'To make food',
        'To make sound',
        'To produce plastic',
        'To make rocks',
      ],
      0,
      'Plants use sunlight as part of the process of making their food.',
    ),
    _Question(
      'Which is a natural sound?',
      [
        'Birdsong',
        'Television',
        'Car horn',
        'Alarm clock',
      ],
      0,
      'Birds produce natural sounds.',
    ),
    _Question(
      'Which is used to provide light during a power cut?',
      [
        'Torch',
        'Whistle',
        'Bell',
        'Drum',
      ],
      0,
      'A torch can provide artificial light when electricity is unavailable.',
    ),
    _Question(
      'Which statement about the Moon is correct?',
      [
        'It is the main source of sunlight',
        'It reflects sunlight',
        'It produces its own sunlight',
        'It is an electric bulb',
      ],
      1,
      'The Moon does not produce its own light. It reflects sunlight.',
    ),
    _Question(
      'Which statement is correct?',
      [
        'Sound is produced by vibrations',
        'Light is produced by all objects',
        'Wood is transparent',
        'Sound helps us see',
      ],
      0,
      'Vibrations can produce sound.',
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
      message = 'Excellent! You really understand light and sound!';
    } else if (percentage >= 70) {
      message = 'Great work! Keep exploring science.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson and try again.';
    } else {
      message = 'Keep practicing. You will improve!';
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
      backgroundColor: const Color(0xFFFFFBF4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Light & Sound Practice',
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
                      color: Color(0xFF68706D),
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
                  final correct = index == q.answer;
                  final selected = index == selectedAnswer;

                  Color background = Colors.white;
                  Color border = const Color(0xFFE0E1DF);

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
                                  : const Color(0xFFFFF3E0),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: answered && correct
                                    ? Colors.white
                                    : const Color(0xFFE65100),
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
                      backgroundColor: const Color(0xFFE65100),
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