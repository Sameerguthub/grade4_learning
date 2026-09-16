import 'package:flutter/material.dart';

class SynonymsAntonymsPracticePage extends StatefulWidget {
  const SynonymsAntonymsPracticePage({super.key});

  @override
  State<SynonymsAntonymsPracticePage> createState() =>
      _SynonymsAntonymsPracticePageState();
}

class _SynonymsAntonymsPracticePageState
    extends State<SynonymsAntonymsPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Choose the synonym of "happy".',
      'options': ['sad', 'joyful', 'angry', 'tired'],
      'answer': 1,
      'explanation': 'Joyful means happy or full of joy.'
    },
    {
      'question': 'Choose the antonym of "hot".',
      'options': ['warm', 'cold', 'boiling', 'heat'],
      'answer': 1,
      'explanation': 'Cold is the opposite of hot.'
    },
    {
      'question': 'Choose the synonym of "big".',
      'options': ['tiny', 'small', 'large', 'short'],
      'answer': 2,
      'explanation': 'Large has a similar meaning to big.'
    },
    {
      'question': 'Choose the antonym of "fast".',
      'options': ['quick', 'speedy', 'slow', 'rapid'],
      'answer': 2,
      'explanation': 'Slow is the opposite of fast.'
    },
    {
      'question': 'Choose the synonym of "smart".',
      'options': ['clever', 'lazy', 'weak', 'sad'],
      'answer': 0,
      'explanation': 'Clever has a similar meaning to smart.'
    },
    {
      'question': 'Choose the antonym of "early".',
      'options': ['quick', 'late', 'soon', 'first'],
      'answer': 1,
      'explanation': 'Late is the opposite of early.'
    },
    {
      'question': 'Choose the synonym of "small".',
      'options': ['huge', 'large', 'little', 'tall'],
      'answer': 2,
      'explanation': 'Little has a similar meaning to small.'
    },
    {
      'question': 'Choose the antonym of "easy".',
      'options': ['simple', 'light', 'difficult', 'quick'],
      'answer': 2,
      'explanation': 'Difficult is the opposite of easy.'
    },
    {
      'question': 'Choose the synonym of "begin".',
      'options': ['finish', 'start', 'stop', 'end'],
      'answer': 1,
      'explanation': 'Start means to begin.'
    },
    {
      'question': 'Choose the antonym of "old".',
      'options': ['young', 'ancient', 'aged', 'past'],
      'answer': 0,
      'explanation': 'Young is the opposite of old when talking about age.'
    },
    {
      'question': 'Choose the synonym of "beautiful".',
      'options': ['ugly', 'pretty', 'dirty', 'rough'],
      'answer': 1,
      'explanation': 'Pretty has a similar meaning to beautiful.'
    },
    {
      'question': 'Choose the antonym of "open".',
      'options': ['wide', 'free', 'closed', 'large'],
      'answer': 2,
      'explanation': 'Closed is the opposite of open.'
    },
    {
      'question': 'Choose the synonym of "quick".',
      'options': ['slow', 'fast', 'late', 'weak'],
      'answer': 1,
      'explanation': 'Fast has a similar meaning to quick.'
    },
    {
      'question': 'Choose the antonym of "strong".',
      'options': ['powerful', 'brave', 'weak', 'healthy'],
      'answer': 2,
      'explanation': 'Weak is the opposite of strong.'
    },
    {
      'question': 'Choose the synonym of "angry".',
      'options': ['furious', 'happy', 'calm', 'sleepy'],
      'answer': 0,
      'explanation': 'Furious means very angry.'
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
        title: const Text('Synonyms & Antonyms Practice'),
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