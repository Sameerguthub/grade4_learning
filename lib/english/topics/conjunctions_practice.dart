import 'package:flutter/material.dart';

class ConjunctionsPracticePage extends StatefulWidget {
  const ConjunctionsPracticePage({super.key});

  @override
  State<ConjunctionsPracticePage> createState() =>
      _ConjunctionsPracticePageState();
}

class _ConjunctionsPracticePageState
    extends State<ConjunctionsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Riya ___ Priya are sisters.',
      'options': ['and', 'but', 'or', 'because'],
      'answer': 0,
      'explanation': '"And" joins two similar things or people.'
    },
    {
      'question': 'I was tired, ___ I finished my homework.',
      'options': ['or', 'but', 'because', 'so'],
      'answer': 1,
      'explanation': '"But" shows a difference between two ideas.'
    },
    {
      'question': 'Would you like tea ___ coffee?',
      'options': ['and', 'because', 'or', 'so'],
      'answer': 2,
      'explanation': '"Or" is used to give a choice.'
    },
    {
      'question': 'I stayed at home ___ it was raining.',
      'options': ['but', 'because', 'or', 'and'],
      'answer': 1,
      'explanation': '"Because" gives the reason.'
    },
    {
      'question': 'It was very hot, ___ we drank plenty of water.',
      'options': ['so', 'but', 'or', 'and'],
      'answer': 0,
      'explanation': '"So" shows the result of something.'
    },
    {
      'question': 'Sam likes football ___ cricket.',
      'options': ['because', 'and', 'but', 'or'],
      'answer': 1,
      'explanation': '"And" adds another thing.'
    },
    {
      'question': 'The box is small, ___ it is heavy.',
      'options': ['but', 'or', 'so', 'because'],
      'answer': 0,
      'explanation': '"But" joins ideas that are different.'
    },
    {
      'question': 'Hurry up, ___ we will miss the bus.',
      'options': ['and', 'because', 'or', 'so'],
      'answer': 2,
      'explanation': '"Or" is used here to show a possible result or choice.'
    },
    {
      'question': 'She wore a raincoat ___ it was raining.',
      'options': ['because', 'but', 'or', 'and'],
      'answer': 0,
      'explanation': '"Because" explains why she wore the raincoat.'
    },
    {
      'question': 'I was hungry, ___ I ate a sandwich.',
      'options': ['but', 'so', 'or', 'because'],
      'answer': 1,
      'explanation': '"So" shows what happened as a result.'
    },
    {
      'question': 'We can go by bus ___ train.',
      'options': ['because', 'but', 'or', 'so'],
      'answer': 2,
      'explanation': '"Or" gives two choices.'
    },
    {
      'question': 'Maya opened the door ___ walked inside.',
      'options': ['and', 'but', 'because', 'or'],
      'answer': 0,
      'explanation': '"And" joins two actions.'
    },
    {
      'question': 'He studied hard, ___ he passed the test.',
      'options': ['but', 'so', 'or', 'because'],
      'answer': 1,
      'explanation': '"So" shows the result of studying hard.'
    },
    {
      'question': 'I wanted to play outside, ___ it was raining.',
      'options': ['and', 'but', 'or', 'so'],
      'answer': 1,
      'explanation': '"But" shows the contrast between the two ideas.'
    },
    {
      'question': 'We carried umbrellas ___ the weather was rainy.',
      'options': ['because', 'or', 'but', 'and'],
      'answer': 0,
      'explanation': '"Because" gives the reason for carrying umbrellas.'
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

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
            title: const Row(
            children: [
                Icon(Icons.workspace_premium_rounded),
                SizedBox(width: 10),
                Text('Practice Complete'),
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
        );
      },
    );
  }

  void restart() {
    setState(() {
      currentQuestion = 0;
      score = 0;
      answered = false;
      selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final options = question['options'] as List<String>;
    final correctAnswer = question['answer'] as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conjunctions Practice'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestion + 1}/${questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              LinearProgressIndicator(
                value: (currentQuestion + 1) / questions.length,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),

              const SizedBox(height: 24),

              Card(
                elevation: 2,
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
                        border: Border.all(
                          width: 1.5,
                        ),
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

              if (answered) ...[
                const SizedBox(height: 8),
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
            ],
          ),
        ),
      ),
    );
  }
}