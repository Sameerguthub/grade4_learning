import 'package:flutter/material.dart';

class EnvironmentPracticePage extends StatefulWidget {
  const EnvironmentPracticePage({super.key});

  @override
  State<EnvironmentPracticePage> createState() =>
      _EnvironmentPracticePageState();
}

class _EnvironmentPracticePageState
    extends State<EnvironmentPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_EnvironmentQuestion> questions = const [
    _EnvironmentQuestion(
      question: 'What does the environment include?',
      options: [
        'Only plants',
        'Only animals',
        'Living and non-living things around us',
        'Only buildings',
      ],
      answer: 2,
      explanation:
          'The environment includes living things such as plants and animals and non-living things such as air, water, soil and sunlight.',
    ),
    _EnvironmentQuestion(
      question: 'Which of these is a living thing?',
      options: [
        'Rock',
        'Tree',
        'Water',
        'Air',
      ],
      answer: 1,
      explanation:
          'A tree is a living thing because it grows, needs water and nutrients, and carries out life processes.',
    ),
    _EnvironmentQuestion(
      question: 'Which is a non-living part of the environment?',
      options: [
        'Bird',
        'Tree',
        'Soil',
        'Human',
      ],
      answer: 2,
      explanation:
          'Soil is non-living, although it provides support and nutrients for many living things.',
    ),
    _EnvironmentQuestion(
      question: 'Which is an example of a natural environment?',
      options: [
        'Shopping mall',
        'Forest',
        'School building',
        'Bridge',
      ],
      answer: 1,
      explanation:
          'A forest is a natural environment containing plants, animals, soil, water and air.',
    ),
    _EnvironmentQuestion(
      question: 'Which is part of the built environment?',
      options: [
        'Mountain',
        'River',
        'Road',
        'Forest',
      ],
      answer: 2,
      explanation:
          'Roads are made by people, so they are part of the built environment.',
    ),
    _EnvironmentQuestion(
      question: 'What can cause air pollution?',
      options: [
        'Planting trees',
        'Vehicle smoke',
        'Rainwater',
        'Clean air',
      ],
      answer: 1,
      explanation:
          'Smoke and harmful gases from vehicles and other sources can pollute the air.',
    ),
    _EnvironmentQuestion(
      question: 'What should we never throw into rivers?',
      options: [
        'Waste and plastic',
        'Clean water',
        'Fish',
        'Rain',
      ],
      answer: 0,
      explanation:
          'Waste and plastic can pollute water and harm aquatic plants and animals.',
    ),
    _EnvironmentQuestion(
      question: 'What does deforestation mean?',
      options: [
        'Planting trees',
        'Growing crops',
        'Cutting down forests',
        'Cleaning forests',
      ],
      answer: 2,
      explanation:
          'Deforestation means the removal or cutting down of large areas of trees and forests.',
    ),
    _EnvironmentQuestion(
      question: 'Which action helps save water?',
      options: [
        'Leaving taps running',
        'Fixing leaking taps',
        'Wasting drinking water',
        'Keeping water running while brushing',
      ],
      answer: 1,
      explanation:
          'Fixing leaks and turning off taps when water is not needed helps conserve water.',
    ),
    _EnvironmentQuestion(
      question: 'Which of these helps protect forests?',
      options: [
        'Cutting trees unnecessarily',
        'Starting forest fires',
        'Planting and protecting trees',
        'Throwing waste in forests',
      ],
      answer: 2,
      explanation:
          'Planting and protecting trees helps maintain forests and provides habitats for animals.',
    ),
    _EnvironmentQuestion(
      question: 'What are the 3 Rs?',
      options: [
        'Read, Run, Rest',
        'Reduce, Reuse, Recycle',
        'Rain, River, Rock',
        'Repair, Run, Remove',
      ],
      answer: 1,
      explanation:
          'The 3 Rs are Reduce, Reuse and Recycle. They help us reduce waste and protect resources.',
    ),
    _EnvironmentQuestion(
      question: 'Why are trees important?',
      options: [
        'They only provide wood',
        'They provide oxygen and habitats',
        'They create plastic',
        'They pollute water',
      ],
      answer: 1,
      explanation:
          'Trees provide oxygen, shade, food and shelter for many living things.',
    ),
    _EnvironmentQuestion(
      question: 'Which activity can reduce pollution?',
      options: [
        'Burning waste',
        'Throwing plastic everywhere',
        'Walking or cycling',
        'Wasting electricity',
      ],
      answer: 2,
      explanation:
          'Walking and cycling do not produce exhaust fumes and can help reduce air pollution.',
    ),
    _EnvironmentQuestion(
      question: 'Which item can usually be recycled?',
      options: [
        'Some paper',
        'Dirty wastewater',
        'Smoke',
        'Sunlight',
      ],
      answer: 0,
      explanation:
          'Many types of paper can be collected and recycled into new paper products.',
    ),
    _EnvironmentQuestion(
      question: 'Which is a good environmental habit?',
      options: [
        'Throwing garbage on roads',
        'Wasting water',
        'Switching off unused lights',
        'Burning plastic',
      ],
      answer: 2,
      explanation:
          'Switching off unused lights saves electricity and reduces unnecessary energy use.',
    ),
    _EnvironmentQuestion(
      question: 'Which living things depend on trees for shelter?',
      options: [
        'Many birds and animals',
        'Rocks',
        'Clouds',
        'Roads',
      ],
      answer: 0,
      explanation:
          'Many birds, insects and animals use trees for food, shelter and nesting.',
    ),
    _EnvironmentQuestion(
      question: 'What is water pollution?',
      options: [
        'Making water cleaner',
        'Making water dirty or harmful',
        'Freezing water',
        'Boiling water',
      ],
      answer: 1,
      explanation:
          'Water pollution occurs when harmful substances or waste make water dirty or unsafe.',
    ),
    _EnvironmentQuestion(
      question: 'Which action is best for reducing plastic waste?',
      options: [
        'Use disposable plastic for everything',
        'Throw plastic into rivers',
        'Use reusable bags and bottles',
        'Burn plastic',
      ],
      answer: 2,
      explanation:
          'Reusable products can reduce the amount of single-use plastic waste.',
    ),
    _EnvironmentQuestion(
      question: 'Who can help protect the environment?',
      options: [
        'Only scientists',
        'Only governments',
        'Only teachers',
        'Everyone',
      ],
      answer: 3,
      explanation:
          'Everyone can help protect the environment through responsible daily actions.',
    ),
    _EnvironmentQuestion(
      question: 'Why should we keep our surroundings clean?',
      options: [
        'To increase pollution',
        'To protect health and nature',
        'To waste resources',
        'To create more garbage',
      ],
      answer: 1,
      explanation:
          'Clean surroundings help protect people, animals and the environment from waste and pollution.',
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

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
    Navigator.pop(context);
  }

  void _showResult() {
    final percentage = (score / questions.length * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'Excellent! You are an Environment Champion!';
    } else if (percentage >= 70) {
      message = 'Great work! You understand the environment very well.';
    } else if (percentage >= 50) {
      message = 'Good effort! Review the lesson and try again.';
    } else {
      message = 'Keep learning! You can improve with another attempt.';
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
              size: 58,
            ),
            SizedBox(height: 8),
            Text(
              'Practice Complete!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
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
                color: Color(0xFF2E7D32),
              ),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF657067),
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try Again'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
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

  Color _optionColor(int index) {
    if (!answered) return Colors.white;

    if (index == questions[currentQuestion].answer) {
      return const Color(0xFFE8F5E9);
    }

    if (index == selectedAnswer) {
      return const Color(0xFFFFEBEE);
    }

    return Colors.white;
  }

  Color _borderColor(int index) {
    if (!answered) {
      return const Color(0xFFE0E5E1);
    }

    if (index == questions[currentQuestion].answer) {
      return const Color(0xFF43A047);
    }

    if (index == selectedAnswer) {
      return const Color(0xFFE53935);
    }

    return const Color(0xFFE0E5E1);
  }

  IconData? _optionIcon(int index) {
    if (!answered) return null;

    if (index == questions[currentQuestion].answer) {
      return Icons.check_circle_rounded;
    }

    if (index == selectedAnswer) {
      return Icons.cancel_rounded;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF263238),
        title: const Text(
          'Environment Practice',
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
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF59645C),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${currentQuestion + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFDCE8DE),
                  color: const Color(0xFF43A047),
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
                  question.question,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                    color: Color(0xFF263238),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                question.options.length,
                (index) => GestureDetector(
                  onTap: () => selectAnswer(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _optionColor(index),
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(
                        color: _borderColor(index),
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
                            color: answered &&
                                    index == question.answer
                                ? const Color(0xFF43A047)
                                : const Color(0xFFE8F0E9),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: answered &&
                                      index == question.answer
                                  ? Colors.white
                                  : const Color(0xFF4E5A52),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                          ),
                        ),
                        if (_optionIcon(index) != null)
                          Icon(
                            _optionIcon(index),
                            color: index == question.answer
                                ? const Color(0xFF43A047)
                                : const Color(0xFFE53935),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              if (answered) ...[
                const SizedBox(height: 2),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: selectedAnswer == question.answer
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer == question.answer
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: selectedAnswer == question.answer
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFE65100),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          question.explanation,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.45,
                            color: Color(0xFF4F5A51),
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
                      currentQuestion == questions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion == questions.length - 1
                          ? 'See Result'
                          : 'Next Question',
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
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

class _EnvironmentQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _EnvironmentQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}