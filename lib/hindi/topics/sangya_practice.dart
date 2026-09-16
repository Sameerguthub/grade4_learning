import 'package:flutter/material.dart';

class SangyaPracticePage extends StatefulWidget {
  const SangyaPracticePage({super.key});

  @override
  State<SangyaPracticePage> createState() => _SangyaPracticePageState();
}

class _SangyaPracticePageState extends State<SangyaPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'इनमें से संज्ञा शब्द कौन-सा है?',
      'options': ['दौड़ना', 'राम', 'जल्दी', 'सुंदर'],
      'answer': 'राम',
    },
    {
      'question': '“मुंबई” किसका नाम है?',
      'options': ['व्यक्ति', 'स्थान', 'वस्तु', 'प्राणी'],
      'answer': 'स्थान',
    },
    {
      'question': 'इनमें से वस्तु कौन-सी है?',
      'options': ['किताब', 'सीमा', 'दिल्ली', 'घोड़ा'],
      'answer': 'किताब',
    },
    {
      'question': '“शेर” किस प्रकार की संज्ञा है?',
      'options': ['स्थान', 'वस्तु', 'प्राणी', 'व्यक्ति'],
      'answer': 'प्राणी',
    },
    {
      'question': '“अध्यापक” किसका नाम बताता है?',
      'options': ['व्यक्ति', 'स्थान', 'वस्तु', 'प्राणी'],
      'answer': 'व्यक्ति',
    },
    {
      'question': 'इनमें से स्थान कौन-सा है?',
      'options': ['पेंसिल', 'भारत', 'बिल्ली', 'मोहन'],
      'answer': 'भारत',
    },
    {
      'question': '“गेंद” किस प्रकार की संज्ञा है?',
      'options': ['प्राणी', 'व्यक्ति', 'वस्तु', 'स्थान'],
      'answer': 'वस्तु',
    },
    {
      'question': 'इनमें से प्राणी कौन-सा है?',
      'options': ['स्कूल', 'कुत्ता', 'मेज', 'रीना'],
      'answer': 'कुत्ता',
    },
    {
      'question': '“सीमा” किस प्रकार की संज्ञा है?',
      'options': ['व्यक्ति', 'स्थान', 'वस्तु', 'प्राणी'],
      'answer': 'व्यक्ति',
    },
    {
      'question': '“पार्क” किसका नाम है?',
      'options': ['व्यक्ति', 'प्राणी', 'स्थान', 'वस्तु'],
      'answer': 'स्थान',
    },
    {
      'question': 'इनमें से कौन-सा संज्ञा शब्द है?',
      'options': ['खेलना', 'लाल', 'पेड़', 'धीरे'],
      'answer': 'पेड़',
    },
    {
      'question': '“बिल्ली” किस प्रकार की संज्ञा है?',
      'options': ['वस्तु', 'स्थान', 'प्राणी', 'व्यक्ति'],
      'answer': 'प्राणी',
    },
  ];

  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;

  void selectAnswer(String answer) {
    if (selectedAnswer != null) return;

    setState(() {
      selectedAnswer = answer;

      if (answer == questions[currentQuestion]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
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
      builder: (_) => AlertDialog(
        title: const Text('अभ्यास पूरा!'),
        content: Text(
          'आपका स्कोर है $score / ${questions.length}',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestion = 0;
                score = 0;
                selectedAnswer = null;
              });
            },
            child: const Text('फिर से करें'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('बंद करें'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text('संज्ञा अभ्यास'),
        backgroundColor: const Color(0xFFFF8A3D),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (currentQuestion + 1) / questions.length,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(height: 12),

              Text(
                'प्रश्न ${currentQuestion + 1} / ${questions.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  question['question'],
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    ...List<String>.from(question['options']).map(
                      (option) => _optionButton(
                        option,
                        question['answer'],
                      ),
                    ),
                  ],
                ),
              ),

              if (selectedAnswer != null)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: nextQuestion,
                    child: Text(
                      currentQuestion == questions.length - 1
                          ? 'परिणाम देखें'
                          : 'अगला प्रश्न',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionButton(String option, String correctAnswer) {
    final bool selected = selectedAnswer == option;
    final bool correct = option == correctAnswer;

    Color background = Colors.white;

    if (selectedAnswer != null) {
      if (correct) {
        background = const Color(0xFFDDF5E3);
      } else if (selected) {
        background = const Color(0xFFFFDCDC);
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => selectAnswer(option),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.radio_button_unchecked),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}