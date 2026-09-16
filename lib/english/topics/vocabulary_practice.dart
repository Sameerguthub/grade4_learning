import 'package:flutter/material.dart';

class VocabularyPracticePage extends StatefulWidget {
  const VocabularyPracticePage({super.key});

  @override
  State<VocabularyPracticePage> createState() =>
      _VocabularyPracticePageState();
}

class _VocabularyPracticePageState
    extends State<VocabularyPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What does "enormous" mean?',
      'options': ['Very small', 'Very large', 'Very quiet', 'Very young'],
      'answer': 1,
      'explanation': 'Enormous means very large or huge.'
    },
    {
      'question': 'What does "brave" mean?',
      'options': [
        'Easily frightened',
        'Very lazy',
        'Not easily afraid',
        'Always angry'
      ],
      'answer': 2,
      'explanation': 'A brave person is not easily afraid.'
    },
    {
      'question': 'What does "silent" mean?',
      'options': [
        'Making a lot of noise',
        'Without sound',
        'Very bright',
        'Very fast'
      ],
      'answer': 1,
      'explanation': 'Silent means without sound or noise.'
    },
    {
      'question': 'Which word means "to keep safe"?',
      'options': ['Protect', 'Create', 'Explore', 'Discover'],
      'answer': 0,
      'explanation': 'Protect means to keep someone or something safe.'
    },
    {
      'question': 'What does "curious" mean?',
      'options': [
        'Wanting to know something',
        'Feeling sleepy',
        'Being very noisy',
        'Being angry'
      ],
      'answer': 0,
      'explanation': 'A curious person wants to know or learn something.'
    },
    {
      'question': 'Which word means "very old"?',
      'options': ['Modern', 'Ancient', 'Tiny', 'Rapid'],
      'answer': 1,
      'explanation': 'Ancient means very old.'
    },
    {
      'question': 'What does "polite" mean?',
      'options': [
        'Rude',
        'Respectful and well-mannered',
        'Lazy',
        'Noisy'
      ],
      'answer': 1,
      'explanation': 'A polite person behaves respectfully.'
    },
    {
      'question': 'Which word means "to make something new"?',
      'options': ['Create', 'Protect', 'Observe', 'Prepare'],
      'answer': 0,
      'explanation': 'Create means to make something new.'
    },
    {
      'question': 'What does "rapid" mean?',
      'options': ['Slow', 'Fast', 'Quiet', 'Small'],
      'answer': 1,
      'explanation': 'Rapid means very fast.'
    },
    {
      'question': 'What does "discover" mean?',
      'options': [
        'To lose something',
        'To find something',
        'To break something',
        'To hide something'
      ],
      'answer': 1,
      'explanation': 'Discover means to find something for the first time.'
    },
    {
      'question': 'Which word describes someone who tells the truth?',
      'options': ['Honest', 'Angry', 'Nervous', 'Silent'],
      'answer': 0,
      'explanation': 'An honest person tells the truth.'
    },
    {
      'question': 'What does "prepare" mean?',
      'options': [
        'To get ready',
        'To run away',
        'To forget',
        'To sleep'
      ],
      'answer': 0,
      'explanation': 'Prepare means to get ready for something.'
    },
    {
      'question': 'Which word means "very small"?',
      'options': ['Huge', 'Tiny', 'Ancient', 'Famous'],
      'answer': 1,
      'explanation': 'Tiny means very small.'
    },
    {
      'question': 'What does "famous" mean?',
      'options': [
        'Known by many people',
        'Unknown to everyone',
        'Very small',
        'Very quiet'
      ],
      'answer': 0,
      'explanation': 'Famous means known by many people.'
    },
    {
      'question': 'Which word means "to watch carefully"?',
      'options': ['Observe', 'Create', 'Protect', 'Prepare'],
      'answer': 0,
      'explanation': 'Observe means to watch or look at something carefully.'
    },
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        answered = false;
        selectedAnswer = null;
      });
    } else {
      _showResult();
    }
  }

  void restart() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      answered = false;
      selectedAnswer = null;
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.workspace_premium_rounded),
            SizedBox(width: 10),
            Expanded(child: Text('Practice Complete')),
          ],
        ),
        content: Text(
          'Your score is $score out of ${questions.length}.',
          style: const TextStyle(fontSize: 17),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              restart();
            },
            child: const Text('Try Again'),
          ),
          ElevatedButton(
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
    final question = questions[currentQuestion];
    final options = question['options'] as List<String>;
    final correctAnswer = question['answer'] as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary Practice'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _progressHeader(),

              const SizedBox(height: 24),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    question['question'],
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(options.length, (index) {
                final isCorrect = index == correctAnswer;
                final isSelected = index == selectedAnswer;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => selectAnswer(index),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              options[index],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (answered && isCorrect)
                            const Icon(Icons.check_circle_rounded),
                          if (answered && isSelected && !isCorrect)
                            const Icon(Icons.cancel_rounded),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              if (answered) _feedback(question, correctAnswer),
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${currentQuestion + 1}/${questions.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Score: $score',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: (currentQuestion + 1) / questions.length,
          minHeight: 8,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }

  Widget _feedback(Map<String, dynamic> question, int correctAnswer) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  selectedAnswer == correctAnswer
                      ? Icons.check_circle_rounded
                      : Icons.info_rounded,
                  size: 26,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedAnswer == correctAnswer
                        ? 'Correct! ${question['explanation']}'
                        : 'Not quite. ${question['explanation']}',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: nextQuestion,
            child: Text(
              currentQuestion == questions.length - 1
                  ? 'See Result'
                  : 'Next Question',
            ),
          ),
        ),
      ],
    );
  }
}