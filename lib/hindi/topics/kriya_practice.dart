import 'package:flutter/material.dart';

class KriyaPracticePage extends StatefulWidget {
  const KriyaPracticePage({super.key});

  @override
  State<KriyaPracticePage> createState() => _KriyaPracticePageState();
}

class _KriyaPracticePageState extends State<KriyaPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'इनमें से क्रिया शब्द कौन-सा है?',
      'options': ['मोहन', 'सुंदर', 'दौड़ना', 'मुंबई'],
      'answer': 'दौड़ना',
    },
    {
      'question': '“सीमा किताब पढ़ती है।” इसमें क्रिया कौन-सी है?',
      'options': ['सीमा', 'किताब', 'पढ़ती है', 'है'],
      'answer': 'पढ़ती है',
    },
    {
      'question': 'इनमें से कौन-सा काम बताता है?',
      'options': ['लिखना', 'किताब', 'लाल', 'स्कूल'],
      'answer': 'लिखना',
    },
    {
      'question': '“बच्चे खेलते हैं।” इसमें क्रिया है —',
      'options': ['बच्चे', 'खेलते हैं', 'हैं', 'कोई नहीं'],
      'answer': 'खेलते हैं',
    },
    {
      'question': '“राहुल खाना खाता है।” क्रिया कौन-सी है?',
      'options': ['राहुल', 'खाना', 'खाता है', 'है'],
      'answer': 'खाता है',
    },
    {
      'question': 'इनमें से कौन-सा क्रिया शब्द है?',
      'options': ['सोना', 'बिस्तर', 'रात', 'कमरा'],
      'answer': 'सोना',
    },
    {
      'question': '“मोहन पत्र लिखता है।” इसमें क्रिया कौन-सी है?',
      'options': ['मोहन', 'पत्र', 'लिखता है', 'है'],
      'answer': 'लिखता है',
    },
    {
      'question': '“बच्चे मैदान में दौड़ते हैं।” क्रिया है —',
      'options': ['बच्चे', 'मैदान', 'दौड़ते हैं', 'में'],
      'answer': 'दौड़ते हैं',
    },
    {
      'question': 'क्रिया किसका बोध कराती है?',
      'options': ['नाम', 'काम या कार्य', 'स्थान', 'रंग'],
      'answer': 'काम या कार्य',
    },
    {
      'question': 'इनमें से कौन-सा क्रिया नहीं है?',
      'options': ['खेलना', 'पढ़ना', 'कुर्सी', 'चलना'],
      'answer': 'कुर्सी',
    },
    {
      'question': '“पक्षी उड़ता है।” इसमें क्रिया कौन-सी है?',
      'options': ['पक्षी', 'उड़ता है', 'है', 'कोई नहीं'],
      'answer': 'उड़ता है',
    },
    {
      'question': 'इनमें से काम बताने वाला शब्द चुनें।',
      'options': ['घर', 'खेलना', 'सुंदर', 'राम'],
      'answer': 'खेलना',
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
      backgroundColor: const Color(0xFFF3FFF7),
      appBar: AppBar(
        title: const Text('क्रिया अभ्यास'),
        backgroundColor: const Color(0xFF35A66F),
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
                    fontSize: 20,
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF35A66F),
                      foregroundColor: Colors.white,
                    ),
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
              Icon(
                selectedAnswer != null && correct
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: selectedAnswer != null && correct
                    ? const Color(0xFF2E9B52)
                    : Colors.black54,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}