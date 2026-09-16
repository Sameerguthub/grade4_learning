import 'package:flutter/material.dart';

class VakyaRachnaPracticePage extends StatefulWidget {
  const VakyaRachnaPracticePage({super.key});

  @override
  State<VakyaRachnaPracticePage> createState() =>
      _VakyaRachnaPracticePageState();
}

class _VakyaRachnaPracticePageState
    extends State<VakyaRachnaPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'राम स्कूल जाता है।',
        'स्कूल राम है जाता।',
        'जाता स्कूल राम है।',
        'है राम स्कूल जाता।',
      ],
      'answer': 'राम स्कूल जाता है।',
    },
    {
      'question': 'सही क्रम चुनिए: “आम / खाता / राहुल”',
      'options': [
        'राहुल आम खाता है।',
        'आम राहुल खाता है।',
        'खाता राहुल आम है।',
        'राहुल खाता आम है।',
      ],
      'answer': 'राहुल आम खाता है।',
    },
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'सीमा किताब पढ़ती है।',
        'किताब सीमा पढ़ती है।',
        'पढ़ती सीमा किताब है।',
        'है किताब सीमा पढ़ती।',
      ],
      'answer': 'सीमा किताब पढ़ती है।',
    },
    {
      'question': 'सही क्रम चुनिए: “सुंदर / फूल / है”',
      'options': [
        'फूल सुंदर है।',
        'सुंदर फूल है।',
        'है सुंदर फूल।',
        'फूल है सुंदर।',
      ],
      'answer': 'फूल सुंदर है।',
    },
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'बच्चे मैदान में खेलते हैं।',
        'मैदान बच्चे खेलते हैं में।',
        'खेलते बच्चे मैदान हैं में।',
        'में बच्चे हैं खेलते मैदान।',
      ],
      'answer': 'बच्चे मैदान में खेलते हैं।',
    },
    {
      'question': 'सही क्रम चुनिए: “रही / सीमा / पढ़”',
      'options': [
        'सीमा पढ़ रही है।',
        'पढ़ सीमा रही है।',
        'रही सीमा पढ़ है।',
        'है पढ़ सीमा रही।',
      ],
      'answer': 'सीमा पढ़ रही है।',
    },
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'पक्षी आकाश में उड़ता है।',
        'आकाश पक्षी है उड़ता में।',
        'उड़ता पक्षी आकाश है।',
        'में उड़ता है पक्षी आकाश।',
      ],
      'answer': 'पक्षी आकाश में उड़ता है।',
    },
    {
      'question': 'सही क्रम चुनिए: “पानी / पीता / मोहन”',
      'options': [
        'मोहन पानी पीता है।',
        'पानी मोहन है पीता।',
        'पीता मोहन पानी है।',
        'है मोहन पानी पीता।',
      ],
      'answer': 'मोहन पानी पीता है।',
    },
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'मुझे आम पसंद है।',
        'आम मुझे है पसंद।',
        'पसंद आम है मुझे।',
        'है मुझे पसंद आम।',
      ],
      'answer': 'मुझे आम पसंद है।',
    },
    {
      'question': 'सही क्रम चुनिए: “खेल / बच्चे / रहे / हैं”',
      'options': [
        'बच्चे खेल रहे हैं।',
        'खेल बच्चे हैं रहे।',
        'रहे बच्चे खेल हैं।',
        'हैं बच्चे खेल रहे।',
      ],
      'answer': 'बच्चे खेल रहे हैं।',
    },
    {
      'question': 'वाक्य में शब्द किस प्रकार होने चाहिए?',
      'options': [
        'किसी भी क्रम में',
        'सही क्रम में',
        'केवल उल्टे क्रम में',
        'बिना अर्थ के',
      ],
      'answer': 'सही क्रम में',
    },
    {
      'question': 'सही वाक्य चुनिए।',
      'options': [
        'सूरज सुबह निकलता है।',
        'सुबह सूरज निकलता है।',
        'निकलता सूरज सुबह है।',
        'है सूरज निकलता सुबह।',
      ],
      'answer': 'सुबह सूरज निकलता है।',
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
      backgroundColor: const Color(0xFFF1FAFF),
      appBar: AppBar(
        title: const Text('वाक्य रचना अभ्यास'),
        backgroundColor: const Color(0xFF1597C9),
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
                      backgroundColor: const Color(0xFF1597C9),
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

  Widget _optionButton(
    String option,
    String correctAnswer,
  ) {
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