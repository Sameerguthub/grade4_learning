import 'package:flutter/material.dart';

class ReadingComprehensionPracticePage extends StatefulWidget {
  const ReadingComprehensionPracticePage({super.key});

  @override
  State<ReadingComprehensionPracticePage> createState() =>
      _ReadingComprehensionPracticePageState();
}

class _ReadingComprehensionPracticePageState
    extends State<ReadingComprehensionPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  bool answered = false;
  int? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'passage':
          'Maya loved visiting her grandmother during the holidays. Her grandmother lived in a small village surrounded by green fields. Every morning, Maya helped her grandmother water the plants in the garden. In the evening, they sat outside and watched the birds.',
      'question': 'Where did Maya\'s grandmother live?',
      'options': [
        'In a large city',
        'In a small village',
        'Near the sea',
        'In a school'
      ],
      'answer': 1,
      'explanation': 'The passage says that her grandmother lived in a small village.'
    },
    {
      'passage':
          'Rohan woke up early because he wanted to watch the sunrise. He went to the terrace with his father. The sky slowly changed from dark to orange. Rohan thought the sunrise was beautiful.',
      'question': 'Why did Rohan wake up early?',
      'options': [
        'To play football',
        'To watch the sunrise',
        'To go to school',
        'To eat breakfast'
      ],
      'answer': 1,
      'explanation': 'Rohan woke up early because he wanted to watch the sunrise.'
    },
    {
      'passage':
          'A little bird built its nest in a tree near Anaya\'s window. Every morning, Anaya watched the bird bring small pieces of grass to the nest. After a few days, the nest was ready.',
      'question': 'What did the bird use to build the nest?',
      'options': [
        'Small pieces of grass',
        'Stones',
        'Leaves from a book',
        'Paper bags'
      ],
      'answer': 0,
      'explanation': 'The passage says that the bird brought small pieces of grass.'
    },
    {
      'passage':
          'Kabir found a wallet on the road while walking home. He did not keep it. Instead, he gave it to a police officer nearby. The officer thanked Kabir for being honest.',
      'question': 'Why did the police officer thank Kabir?',
      'options': [
        'Because Kabir ran quickly',
        'Because Kabir was honest',
        'Because Kabir found a book',
        'Because Kabir was late'
      ],
      'answer': 1,
      'explanation': 'Kabir gave the wallet to the police officer instead of keeping it, showing that he was honest.'
    },
    {
      'passage':
          'The school garden looked dry after several hot days. The students decided to help. They brought water and carefully watered the plants. After a few days, the plants looked fresh and green again.',
      'question': 'Why did the students water the plants?',
      'options': [
        'The plants were too tall',
        'The garden was dry',
        'They wanted to remove the plants',
        'They wanted to play'
      ],
      'answer': 1,
      'explanation': 'The garden looked dry after several hot days, so the students watered the plants.'
    },
    {
      'passage':
          'Neha received a small packet of seeds from her teacher. She planted them in a pot and placed the pot near a sunny window. She watered the soil every day. After two weeks, tiny green leaves appeared.',
      'question': 'Where did Neha keep the pot?',
      'options': [
        'Under her bed',
        'Near a sunny window',
        'Inside a cupboard',
        'On the road'
      ],
      'answer': 1,
      'explanation': 'Neha placed the pot near a sunny window.'
    },
    {
      'passage':
          'Arjun was reading a book when the lights suddenly went out. He waited for a few minutes, but the electricity did not return. His mother gave him a torch, so he continued reading.',
      'question': 'What did Arjun use to continue reading?',
      'options': ['A candle', 'A phone', 'A torch', 'A lamp'],
      'answer': 2,
      'explanation': 'His mother gave him a torch.'
    },
    {
      'passage':
          'On Saturday, the children visited a nature park. They saw deer, butterflies and many colourful birds. Their guide asked them not to disturb the animals. The children quietly watched the animals from a safe distance.',
      'question': 'What did the guide ask the children to do?',
      'options': [
        'Feed the animals',
        'Disturb the animals',
        'Not disturb the animals',
        'Take the animals home'
      ],
      'answer': 2,
      'explanation': 'The guide asked them not to disturb the animals.'
    },
    {
      'passage':
          'Meera wanted to make a birthday card for her brother. She took a sheet of paper and folded it carefully. Then she decorated it with coloured pencils and wrote a kind message inside.',
      'question': 'What did Meera make?',
      'options': [
        'A toy',
        'A birthday card',
        'A notebook',
        'A painting'
      ],
      'answer': 1,
      'explanation': 'Meera made a birthday card for her brother.'
    },
    {
      'passage':
          'The rain had stopped, and the children went outside. Small puddles of water were shining in the sunlight. The children wore their boots and carefully jumped over the puddles.',
      'question': 'What happened before the children went outside?',
      'options': [
        'It started snowing',
        'The rain stopped',
        'The sun disappeared',
        'They went to school'
      ],
      'answer': 1,
      'explanation': 'The passage begins by saying that the rain had stopped.'
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
        title: const Text('Reading Practice'),
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

              const SizedBox(height: 20),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.menu_book_rounded),
                          SizedBox(width: 8),
                          Text(
                            'Read the Passage',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        question['passage'],
                        style: const TextStyle(
                          fontSize: 15.5,
                          height: 1.55,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    question['question'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

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
                              style: const TextStyle(fontSize: 16),
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                ),
                const SizedBox(height: 16),
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