import 'package:flutter/material.dart';

class TensesPracticePage extends StatefulWidget {
  const TensesPracticePage({super.key});

  @override
  State<TensesPracticePage> createState() => _TensesPracticePageState();
}

class _TensesPracticePageState extends State<TensesPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'I ___ to school every day.',
      'options': ['go', 'went', 'am going', 'will go'],
      'answer': 0,
      'explanation': '“Every day” shows a regular action, so we use the simple present tense.'
    },
    {
      'question': 'Look! The children ___ in the park.',
      'options': ['played', 'play', 'are playing', 'will play'],
      'answer': 2,
      'explanation': '“Look!” shows that the action is happening now, so we use the present continuous tense.'
    },
    {
      'question': 'We ___ the zoo last Sunday.',
      'options': ['visit', 'visited', 'are visiting', 'will visit'],
      'answer': 1,
      'explanation': '“Last Sunday” tells us the action happened in the past.'
    },
    {
      'question': 'She ___ a book right now.',
      'options': ['reads', 'read', 'is reading', 'will read'],
      'answer': 2,
      'explanation': '“Right now” tells us the action is happening at this moment.'
    },
    {
      'question': 'I ___ my grandmother tomorrow.',
      'options': ['visited', 'visit', 'am visiting', 'will visit'],
      'answer': 3,
      'explanation': '“Tomorrow” tells us about the future, so “will visit” is correct.'
    },
    {
      'question': 'Rohan ___ cricket every Saturday.',
      'options': ['plays', 'played', 'is playing', 'will play'],
      'answer': 0,
      'explanation': '“Every Saturday” describes a regular habit.'
    },
    {
      'question': 'They ___ dinner when I called them.',
      'options': ['eat', 'were eating', 'will eat', 'eats'],
      'answer': 1,
      'explanation': 'The action was happening at a particular time in the past.'
    },
    {
      'question': 'My father ___ to work yesterday.',
      'options': ['goes', 'is going', 'went', 'will go'],
      'answer': 2,
      'explanation': '“Yesterday” tells us that the action happened in the past.'
    },
    {
      'question': 'The baby ___ now.',
      'options': ['is sleeping', 'slept', 'sleeps yesterday', 'will sleep'],
      'answer': 0,
      'explanation': '“Now” shows that the baby is sleeping at this moment.'
    },
    {
      'question': 'We ___ a new house next year.',
      'options': ['bought', 'buy', 'will buy', 'are bought'],
      'answer': 2,
      'explanation': '“Next year” refers to the future.'
    },
    {
      'question': 'She ___ her homework every evening.',
      'options': ['does', 'did', 'is doing', 'will do'],
      'answer': 0,
      'explanation': '“Every evening” describes a regular habit.'
    },
    {
      'question': 'At 7 o’clock yesterday, I ___ dinner.',
      'options': ['eat', 'ate', 'was eating', 'will eat'],
      'answer': 2,
      'explanation': 'The action was in progress at a specific time in the past.'
    },
    {
      'question': 'They ___ football yesterday.',
      'options': ['play', 'played', 'are playing', 'will play'],
      'answer': 1,
      'explanation': '“Yesterday” requires the simple past tense.'
    },
    {
      'question': 'I ___ you tomorrow.',
      'options': ['called', 'call yesterday', 'will call', 'am called'],
      'answer': 2,
      'explanation': '“Tomorrow” tells us that the action will happen in the future.'
    },
    {
      'question': 'The sun ___ in the east.',
      'options': ['rose', 'is rising', 'rises', 'will rise'],
      'answer': 2,
      'explanation': 'This is a general fact, so we use the simple present tense.'
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

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final options = question['options'] as List<String>;
    final correctAnswer = question['answer'] as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenses Practice'),
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