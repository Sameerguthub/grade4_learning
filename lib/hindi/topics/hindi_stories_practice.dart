import 'package:flutter/material.dart';

class HindiStoriesPracticePage extends StatefulWidget {
  const HindiStoriesPracticePage({super.key});

  @override
  State<HindiStoriesPracticePage> createState() =>
      _HindiStoriesPracticePageState();
}

class _HindiStoriesPracticePageState
    extends State<HindiStoriesPracticePage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'प्यासा कौआ पानी तक पहुँचने के लिए क्या करता है?',
      'options': [
        'घड़ा तोड़ देता है',
        'कंकड़ घड़े में डालता है',
        'उड़कर चला जाता है',
        'घड़ा छिपा देता है',
      ],
      'answer': 'कंकड़ घड़े में डालता है',
    },
    {
      'question': 'प्यासे कौए की कहानी से क्या सीख मिलती है?',
      'options': [
        'हमेशा सोना चाहिए',
        'जहाँ चाह, वहाँ राह',
        'दूसरों से लड़ना चाहिए',
        'काम नहीं करना चाहिए',
      ],
      'answer': 'जहाँ चाह, वहाँ राह',
    },
    {
      'question': 'लकड़हारे की कुल्हाड़ी कहाँ गिर गई थी?',
      'options': [
        'तालाब में',
        'नदी में',
        'घर में',
        'जंगल में',
      ],
      'answer': 'नदी में',
    },
    {
      'question': 'लकड़हारे ने सोने की कुल्हाड़ी क्यों नहीं ली?',
      'options': [
        'वह भारी थी',
        'वह उसकी नहीं थी',
        'वह बहुत छोटी थी',
        'वह टूट गई थी',
      ],
      'answer': 'वह उसकी नहीं थी',
    },
    {
      'question': 'ईमानदार लकड़हारे की कहानी की सीख क्या है?',
      'options': [
        'ईमानदारी सबसे अच्छी नीति है',
        'हमेशा झूठ बोलना चाहिए',
        'काम नहीं करना चाहिए',
        'दूसरों की चीज लेनी चाहिए',
      ],
      'answer': 'ईमानदारी सबसे अच्छी नीति है',
    },
    {
      'question': 'किसान के कितने बेटे थे?',
      'options': ['दो', 'तीन', 'चार', 'पाँच'],
      'answer': 'चार',
    },
    {
      'question': 'लकड़ियों के गट्ठर को बेटे क्यों नहीं तोड़ पाए?',
      'options': [
        'लकड़ियाँ बहुत छोटी थीं',
        'वे एक साथ बंधी थीं',
        'वे गीली थीं',
        'लकड़ियाँ नहीं थीं',
      ],
      'answer': 'वे एक साथ बंधी थीं',
    },
    {
      'question': 'एकता में बल कहानी की सीख क्या है?',
      'options': [
        'एकता में बल है',
        'अकेले रहना अच्छा है',
        'हमेशा लड़ना चाहिए',
        'काम नहीं करना चाहिए',
      ],
      'answer': 'एकता में बल है',
    },
    {
      'question': 'शेर को किसने जाल से बचाया?',
      'options': ['हाथी', 'चूहा', 'बंदर', 'हिरण'],
      'answer': 'चूहा',
    },
    {
      'question': 'चूहे ने शेर को कैसे बचाया?',
      'options': [
        'जाल काटकर',
        'शेर को उठाकर',
        'शिकारी को बुलाकर',
        'जंगल से भागकर',
      ],
      'answer': 'जाल काटकर',
    },
    {
      'question': 'शेर और चूहे की कहानी से क्या सीख मिलती है?',
      'options': [
        'छोटा व्यक्ति भी बड़ी मदद कर सकता है',
        'केवल बड़े लोग मदद कर सकते हैं',
        'किसी की मदद नहीं करनी चाहिए',
        'जंगल में नहीं जाना चाहिए',
      ],
      'answer': 'छोटा व्यक्ति भी बड़ी मदद कर सकता है',
    },
    {
      'question': 'कहानियाँ पढ़ने से हमें क्या मिल सकता है?',
      'options': [
        'केवल खेल',
        'अच्छी सीख और ज्ञान',
        'केवल नींद',
        'केवल भोजन',
      ],
      'answer': 'अच्छी सीख और ज्ञान',
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
        title: const Text('कहानी अभ्यास पूरा!'),
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
        title: const Text('कहानी अभ्यास'),
        backgroundColor: const Color(0xFFE87535),
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
                      backgroundColor: const Color(0xFFE87535),
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