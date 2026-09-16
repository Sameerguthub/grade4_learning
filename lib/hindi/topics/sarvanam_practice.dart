import 'package:flutter/material.dart';

class SarvanamPracticePage extends StatefulWidget {
  const SarvanamPracticePage({super.key});

  @override
  State<SarvanamPracticePage> createState() => _SarvanamPracticePageState();
}

class _SarvanamPracticePageState extends State<SarvanamPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'इनमें से सर्वनाम शब्द कौन-सा है?',
      'options': ['मोहन', 'मैं', 'किताब', 'मुंबई'],
      'answer': 'मैं',
    },
    {
      'question': '“राधा बाजार गई। ___ फल लाई।” सही शब्द चुनें।',
      'options': ['वह', 'हम', 'तुम', 'मैं'],
      'answer': 'वह',
    },
    {
      'question': '“मैं” किसका उदाहरण है?',
      'options': ['संज्ञा', 'सर्वनाम', 'क्रिया', 'विशेषण'],
      'answer': 'सर्वनाम',
    },
    {
      'question': 'इनमें से कौन-सा शब्द सर्वनाम है?',
      'options': ['वह', 'पेड़', 'स्कूल', 'खेल'],
      'answer': 'वह',
    },
    {
      'question': '“___ स्कूल जा रहे हैं।” कई लोगों के लिए सही शब्द कौन-सा है?',
      'options': ['मैं', 'वे', 'तुम', 'वह'],
      'answer': 'वे',
    },
    {
      'question': '“हम” का प्रयोग किसके लिए किया जाता है?',
      'options': ['अपने लिए और दूसरों के लिए', 'केवल एक व्यक्ति के लिए', 'केवल वस्तु के लिए', 'केवल स्थान के लिए'],
      'answer': 'अपने लिए और दूसरों के लिए',
    },
    {
      'question': '“तुम अच्छे विद्यार्थी हो।” इसमें सर्वनाम कौन-सा है?',
      'options': ['अच्छे', 'विद्यार्थी', 'तुम', 'हो'],
      'answer': 'तुम',
    },
    {
      'question': '“सीमा पढ़ती है। सीमा रोज स्कूल जाती है।” दूसरे वाक्य में सीमा की जगह क्या आ सकता है?',
      'options': ['वह', 'हम', 'मैं', 'तुम'],
      'answer': 'वह',
    },
    {
      'question': 'इनमें से कौन-सा सर्वनाम नहीं है?',
      'options': ['मैं', 'हम', 'कुर्सी', 'वे'],
      'answer': 'कुर्सी',
    },
    {
      'question': '“मैं और राहुल खेल रहे हैं। ___ मैदान में हैं।” सही शब्द चुनें।',
      'options': ['हम', 'वह', 'तुम', 'मैं'],
      'answer': 'हम',
    },
    {
      'question': 'सर्वनाम किसकी जगह प्रयोग होता है?',
      'options': ['क्रिया', 'संज्ञा', 'विशेषण', 'मात्रा'],
      'answer': 'संज्ञा',
    },
    {
      'question': '“वे बच्चे खेल रहे हैं।” इसमें सर्वनाम कौन-सा है?',
      'options': ['बच्चे', 'खेल', 'वे', 'रहे'],
      'answer': 'वे',
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
        title: const Text('बहुत बढ़िया!'),
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
      backgroundColor: const Color(0xFFF3F7FF),
      appBar: AppBar(
        title: const Text('सर्वनाम अभ्यास'),
        backgroundColor: const Color(0xFF4F7CFF),
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
                      backgroundColor: const Color(0xFF4F7CFF),
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
                  style: const TextStyle(
                    fontSize: 17,
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