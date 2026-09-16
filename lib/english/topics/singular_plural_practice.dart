import 'package:flutter/material.dart';

class SingularPluralPracticePage extends StatefulWidget {
  const SingularPluralPracticePage({super.key});

  @override
  State<SingularPluralPracticePage> createState() =>
      _SingularPluralPracticePageState();
}

class _SingularPluralPracticePageState
    extends State<SingularPluralPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the plural of "cat"?',
      'options': ['cats', 'cates', 'caties', 'cat'],
      'answer': 0,
      'explanation': 'Most nouns simply take -s. Cat becomes cats.'
    },
    {
      'question': 'What is the plural of "box"?',
      'options': ['boxs', 'boxes', 'boxies', 'box'],
      'answer': 1,
      'explanation': 'Words ending in x usually take -es.'
    },
    {
      'question': 'What is the plural of "baby"?',
      'options': ['babys', 'babyes', 'babies', 'baby'],
      'answer': 2,
      'explanation': 'Baby changes to babies by changing y to i and adding -es.'
    },
    {
      'question': 'What is the plural of "child"?',
      'options': ['childs', 'children', 'childes', 'childrens'],
      'answer': 1,
      'explanation': 'Child has the irregular plural children.'
    },
    {
      'question': 'What is the plural of "tooth"?',
      'options': ['tooths', 'toothes', 'teeth', 'toothies'],
      'answer': 2,
      'explanation': 'The irregular plural of tooth is teeth.'
    },
    {
      'question': 'Which word is singular?',
      'options': ['books', 'boys', 'apple', 'cars'],
      'answer': 2,
      'explanation': 'Apple names one thing, so it is singular.'
    },
    {
      'question': 'Which word is plural?',
      'options': ['girl', 'dog', 'trees', 'book'],
      'answer': 2,
      'explanation': 'Trees names more than one tree.'
    },
    {
      'question': 'What is the plural of "bus"?',
      'options': ['buses', 'buss', 'busies', 'bus'],
      'answer': 0,
      'explanation': 'Bus ends in s, so we add -es.'
    },
    {
      'question': 'What is the plural of "dish"?',
      'options': ['dishs', 'dishes', 'dishies', 'dish'],
      'answer': 1,
      'explanation': 'Dish ends in sh, so we add -es.'
    },
    {
      'question': 'What is the plural of "man"?',
      'options': ['mans', 'men', 'manes', 'mens'],
      'answer': 1,
      'explanation': 'The irregular plural of man is men.'
    },
    {
      'question': 'What is the plural of "mouse"?',
      'options': ['mouses', 'mice', 'mousees', 'mousies'],
      'answer': 1,
      'explanation': 'The irregular plural of mouse is mice.'
    },
    {
      'question': 'What is the plural of "city"?',
      'options': ['citys', 'cities', 'cityes', 'city'],
      'answer': 1,
      'explanation': 'City changes to cities.'
    },
    {
      'question': 'Choose the correct sentence.',
      'options': [
        'There are three book.',
        'There are three books.',
        'There is three books.',
        'There are three bookes.',
      ],
      'answer': 1,
      'explanation': 'Three means more than one, so we use the plural noun books.'
    },
    {
      'question': 'Choose the correct word: "I have two ___."',
      'options': ['pen', 'pens', 'penes', 'penn'],
      'answer': 1,
      'explanation': 'Two means more than one, so pen becomes pens.'
    },
    {
      'question': 'What is the plural of "woman"?',
      'options': ['womans', 'womanes', 'women', 'womens'],
      'answer': 2,
      'explanation': 'The irregular plural of woman is women.'
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
        title: const Text('Singular & Plural Practice'),
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