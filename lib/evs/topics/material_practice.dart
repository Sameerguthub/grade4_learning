import 'package:flutter/material.dart';

class MaterialsPracticePage extends StatefulWidget {
  const MaterialsPracticePage({super.key});

  @override
  State<MaterialsPracticePage> createState() =>
      _MaterialsPracticePageState();
}

class _MaterialsPracticePageState
    extends State<MaterialsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      'What are materials?',
      [
        'Substances used to make objects',
        'Only living things',
        'Only liquids',
        'Only foods',
      ],
      0,
      'Materials are substances from which objects are made.',
    ),
    _Question(
      'Which material is usually hard?',
      [
        'Cotton',
        'Sponge',
        'Stone',
        'Wool',
      ],
      2,
      'Stone is a hard material.',
    ),
    _Question(
      'Which material is soft?',
      [
        'Iron',
        'Cotton',
        'Glass',
        'Stone',
      ],
      1,
      'Cotton is soft and is commonly used to make comfortable clothes.',
    ),
    _Question(
      'Which material is flexible?',
      [
        'Rubber',
        'Stone',
        'Glass',
        'Brick',
      ],
      0,
      'Rubber can bend and stretch, making it flexible.',
    ),
    _Question(
      'Which material is often transparent?',
      [
        'Wood',
        'Metal',
        'Clear glass',
        'Cardboard',
      ],
      2,
      'Clear glass allows light to pass through and objects can usually be seen through it.',
    ),
    _Question(
      'Which material is waterproof?',
      [
        'Some rubber',
        'Tissue paper',
        'Cotton cloth',
        'Newspaper',
      ],
      0,
      'Rubber is generally water-resistant and is used for many waterproof products.',
    ),
    _Question(
      'Which material is commonly used to make windows?',
      [
        'Glass',
        'Wool',
        'Cotton',
        'Paper',
      ],
      0,
      'Glass is commonly used for windows because clear glass allows light to pass through.',
    ),
    _Question(
      'Which material is commonly used for clothes?',
      [
        'Cotton',
        'Stone',
        'Brick',
        'Glass',
      ],
      0,
      'Cotton is a soft material commonly used to make clothing.',
    ),
    _Question(
      'Which material is commonly used for furniture?',
      [
        'Wood',
        'Water',
        'Air',
        'Smoke',
      ],
      0,
      'Wood is strong and can be shaped, making it useful for furniture.',
    ),
    _Question(
      'Which material is used in vehicle tyres?',
      [
        'Paper',
        'Rubber',
        'Glass',
        'Cotton',
      ],
      1,
      'Rubber is flexible and provides useful grip, so it is used for tyres.',
    ),
    _Question(
      'What does waterproof mean?',
      [
        'Allows water through easily',
        'Does not allow water through easily',
        'Always absorbs water',
        'Dissolves in water',
      ],
      1,
      'A waterproof material prevents water from passing through easily.',
    ),
    _Question(
      'Which material can be folded easily?',
      [
        'Paper',
        'Stone',
        'Iron',
        'Glass',
      ],
      0,
      'Paper is light and can be folded easily.',
    ),
    _Question(
      'Which material is usually strong and hard?',
      [
        'Metal',
        'Cotton',
        'Wool',
        'Sponge',
      ],
      0,
      'Many metals are strong and hard and are used for tools and machines.',
    ),
    _Question(
      'Which is a natural material?',
      [
        'Wood',
        'Nylon',
        'Plastic',
        'Synthetic fibre',
      ],
      0,
      'Wood comes from trees and is a natural material.',
    ),
    _Question(
      'Which is a man-made material?',
      [
        'Wood',
        'Wool',
        'Plastic',
        'Cotton',
      ],
      2,
      'Plastic is manufactured by people, so it is a man-made material.',
    ),
    _Question(
      'Why is rubber useful for tyres?',
      [
        'It is flexible and provides grip',
        'It is transparent',
        'It dissolves in water',
        'It is very soft like cotton',
      ],
      0,
      'Rubber is flexible and can provide good grip on roads.',
    ),
    _Question(
      'Which material can often be recycled?',
      [
        'Paper',
        'Smoke',
        'Sunlight',
        'Air',
      ],
      0,
      'Many types of paper can be collected and recycled.',
    ),
    _Question(
      'Why do we choose different materials for different objects?',
      [
        'Because materials have different properties',
        'Because all materials are exactly the same',
        'Because objects choose themselves',
        'Because materials have no properties',
      ],
      0,
      'Materials have different properties, so we select materials according to the job an object needs to do.',
    ),
    _Question(
      'Which material is commonly used for raincoats?',
      [
        'Waterproof material',
        'Paper',
        'Cotton tissue',
        'Unprotected wool',
      ],
      0,
      'Raincoats are made using materials that resist water.',
    ),
    _Question(
      'What is one good way to reduce material waste?',
      [
        'Reuse useful objects',
        'Throw everything away',
        'Use more disposable items',
        'Waste materials',
      ],
      0,
      'Reusing useful objects can reduce waste and save resources.',
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
      message = 'Excellent! You are a Materials Expert!';
    } else if (percentage >= 70) {
      message = 'Great work! You understand materials very well.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the properties of materials.';
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
                color: Color(0xFF5E35B1),
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
              backgroundColor: const Color(0xFF5E35B1),
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
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Materials Practice',
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
                      color: Color(0xFF5E35B1),
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
                  color: const Color(0xFF5E35B1),
                  backgroundColor: const Color(0xFFE1D8F2),
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
                                  : const Color(0xFFEDE7F6),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: answered && correct
                                    ? Colors.white
                                    : const Color(0xFF5E35B1),
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
                      backgroundColor: const Color(0xFF5E35B1),
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