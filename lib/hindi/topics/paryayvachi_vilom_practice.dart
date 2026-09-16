import 'package:flutter/material.dart';

class ParyayvachiVilomPracticePage extends StatefulWidget {
  const ParyayvachiVilomPracticePage({super.key});

  @override
  State<ParyayvachiVilomPracticePage> createState() =>
      _ParyayvachiVilomPracticePageState();
}

class _ParyayvachiVilomPracticePageState
    extends State<ParyayvachiVilomPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '“सूर्य” का पर्यायवाची शब्द कौन-सा है?',
      'options': ['रवि', 'रात', 'चंद्रमा', 'पृथ्वी'],
      'answer': 'रवि',
    },
    {
      'question': '“जल” का पर्यायवाची शब्द कौन-सा है?',
      'options': ['अग्नि', 'पानी', 'हवा', 'आकाश'],
      'answer': 'पानी',
    },
    {
      'question': '“घर” का पर्यायवाची शब्द कौन-सा है?',
      'options': ['गृह', 'वन', 'नगर', 'सड़क'],
      'answer': 'गृह',
    },
    {
      'question': '“पृथ्वी” का पर्यायवाची शब्द कौन-सा है?',
      'options': ['नभ', 'धरती', 'सूर्य', 'जल'],
      'answer': 'धरती',
    },
    {
      'question': '“आकाश” का पर्यायवाची शब्द कौन-सा है?',
      'options': ['नभ', 'भूमि', 'समुद्र', 'पेड़'],
      'answer': 'नभ',
    },
    {
      'question': '“दिन” का विलोम शब्द क्या है?',
      'options': ['सुबह', 'शाम', 'रात', 'दोपहर'],
      'answer': 'रात',
    },
    {
      'question': '“अच्छा” का विलोम शब्द क्या है?',
      'options': ['सुंदर', 'बुरा', 'सही', 'मीठा'],
      'answer': 'बुरा',
    },
    {
      'question': '“बड़ा” का विलोम शब्द क्या है?',
      'options': ['लंबा', 'छोटा', 'ऊँचा', 'मोटा'],
      'answer': 'छोटा',
    },
    {
      'question': '“ऊपर” का विलोम शब्द क्या है?',
      'options': ['आगे', 'पीछे', 'नीचे', 'पास'],
      'answer': 'नीचे',
    },
    {
      'question': '“नया” का विलोम शब्द क्या है?',
      'options': ['अच्छा', 'पुराना', 'छोटा', 'बड़ा'],
      'answer': 'पुराना',
    },
    {
      'question': 'समान अर्थ वाले शब्दों को क्या कहते हैं?',
      'options': ['विलोम शब्द', 'पर्यायवाची शब्द', 'क्रिया', 'संज्ञा'],
      'answer': 'पर्यायवाची शब्द',
    },
    {
      'question': 'विपरीत अर्थ वाले शब्दों को क्या कहते हैं?',
      'options': ['सर्वनाम', 'पर्यायवाची', 'विलोम शब्द', 'क्रिया'],
      'answer': 'विलोम शब्द',
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
      backgroundColor: const Color(0xFFF7F3FF),
      appBar: AppBar(
        title: const Text('पर्यायवाची और विलोम अभ्यास'),
        backgroundColor: const Color(0xFF7656E8),
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
                      backgroundColor: const Color(0xFF7656E8),
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