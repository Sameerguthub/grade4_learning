import 'package:flutter/material.dart';

class LingVachanPracticePage extends StatefulWidget {
  const LingVachanPracticePage({super.key});

  @override
  State<LingVachanPracticePage> createState() =>
      _LingVachanPracticePageState();
}

class _LingVachanPracticePageState
    extends State<LingVachanPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': '“लड़का” का स्त्रीलिंग क्या है?',
      'options': ['लड़की', 'लड़के', 'बच्ची', 'रानी'],
      'answer': 'लड़की',
    },
    {
      'question': '“राजा” का स्त्रीलिंग क्या है?',
      'options': ['राजी', 'रानी', 'राजकुमारी', 'रानीजी'],
      'answer': 'रानी',
    },
    {
      'question': '“घोड़ा” का स्त्रीलिंग क्या है?',
      'options': ['घोड़ी', 'घोड़े', 'घोड़ा', 'घोड़ीया'],
      'answer': 'घोड़ी',
    },
    {
      'question': '“लड़की” कौन-से लिंग का शब्द है?',
      'options': ['पुल्लिंग', 'स्त्रीलिंग', 'बहुवचन', 'क्रिया'],
      'answer': 'स्त्रीलिंग',
    },
    {
      'question': '“लड़का” कौन-से लिंग का शब्द है?',
      'options': ['स्त्रीलिंग', 'पुल्लिंग', 'बहुवचन', 'सर्वनाम'],
      'answer': 'पुल्लिंग',
    },
    {
      'question': '“लड़का” का बहुवचन क्या है?',
      'options': ['लड़की', 'लड़कों', 'लड़के', 'लड़कियाँ'],
      'answer': 'लड़के',
    },
    {
      'question': '“किताब” का बहुवचन क्या है?',
      'options': ['किताबी', 'किताबें', 'किताबों', 'किताबा'],
      'answer': 'किताबें',
    },
    {
      'question': '“बच्चे” किस वचन का उदाहरण है?',
      'options': ['एकवचन', 'बहुवचन', 'पुल्लिंग', 'स्त्रीलिंग'],
      'answer': 'बहुवचन',
    },
    {
      'question': '“एक बच्चा” किस वचन में है?',
      'options': ['बहुवचन', 'एकवचन', 'स्त्रीलिंग', 'सर्वनाम'],
      'answer': 'एकवचन',
    },
    {
      'question': 'वचन से किसका पता चलता है?',
      'options': ['काम', 'एक या अनेक', 'रंग', 'स्थान'],
      'answer': 'एक या अनेक',
    },
    {
      'question': 'लिंग से किसका पता चलता है?',
      'options': ['एक या अनेक', 'काम', 'पुरुष या स्त्री', 'स्थान'],
      'answer': 'पुरुष या स्त्री',
    },
    {
      'question': '“शेरनी” का पुल्लिंग क्या है?',
      'options': ['शेरा', 'शेर', 'शेरों', 'शेरनी'],
      'answer': 'शेर',
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
      backgroundColor: const Color(0xFFFFF5FA),
      appBar: AppBar(
        title: const Text('लिंग और वचन अभ्यास'),
        backgroundColor: const Color(0xFFD94F8A),
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
                      backgroundColor: const Color(0xFFD94F8A),
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