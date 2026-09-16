
import 'package:flutter/material.dart';

class MatraPracticePage extends StatefulWidget {
  const MatraPracticePage({super.key});

  @override
  State<MatraPracticePage> createState() => _MatraPracticePageState();
}

class _MatraPracticePageState
    extends State<MatraPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      '“का” में कौन-सी मात्रा है?',
      ['ा', 'ि', 'ी', 'ु'],
      0,
      'का में आ की मात्रा (ा) है।',
    ),
    _Question(
      '“कि” में कौन-सी मात्रा है?',
      ['ा', 'ि', 'ी', 'ू'],
      1,
      'कि में इ की मात्रा (ि) है।',
    ),
    _Question(
      '“की” में कौन-सी मात्रा है?',
      ['ु', 'ी', 'े', 'ो'],
      1,
      'की में ई की मात्रा (ी) है।',
    ),
    _Question(
      '“कु” में कौन-सी मात्रा है?',
      ['ू', 'ु', 'ा', 'ै'],
      1,
      'कु में उ की मात्रा (ु) है।',
    ),
    _Question(
      '“कू” में कौन-सी मात्रा है?',
      ['ु', 'े', 'ू', 'ो'],
      2,
      'कू में ऊ की मात्रा (ू) है।',
    ),
    _Question(
      '“केला” शब्द में “के” में कौन-सी मात्रा है?',
      ['े', 'ै', 'ो', 'ौ'],
      0,
      'के में ए की मात्रा (े) है।',
    ),
    _Question(
      '“कैसा” में कौन-सी मात्रा है?',
      ['े', 'ै', 'ो', 'ा'],
      1,
      'कै में ऐ की मात्रा (ै) है।',
    ),
    _Question(
      '“मोर” में “मो” में कौन-सी मात्रा है?',
      ['ा', 'ी', 'ो', 'ौ'],
      2,
      'मो में ओ की मात्रा (ो) है।',
    ),
    _Question(
      '“कौआ” में “कौ” में कौन-सी मात्रा है?',
      ['ो', 'ै', 'ौ', 'े'],
      2,
      'कौ में औ की मात्रा (ौ) है।',
    ),
    _Question(
      '“अंग” में कौन-सा चिह्न है?',
      ['ा', 'ं', 'ी', 'ु'],
      1,
      'अंग में अनुस्वार (ं) है।',
    ),
    _Question(
      '“फूल” में “फू” में कौन-सी मात्रा है?',
      ['ु', 'ू', 'ो', 'े'],
      1,
      'फू में ऊ की मात्रा (ू) है।',
    ),
    _Question(
      '“किताब” शब्द में “कि” में कौन-सी मात्रा है?',
      ['ि', 'ी', 'ु', 'े'],
      0,
      'कि में इ की मात्रा (ि) है।',
    ),
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedAnswer = index;
      answered = true;

      if (index == questions[currentQuestion].answer) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      _showResult();
    }
  }

  void restart() {
    Navigator.pop(context);

    setState(() {
      currentQuestion = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
    });
  }

  void _showResult() {
    final percentage =
        (score / questions.length * 100).round();

    String message;

    if (percentage >= 90) {
      message = 'शानदार! तुम्हें मात्राएँ बहुत अच्छी तरह आती हैं!';
    } else if (percentage >= 70) {
      message = 'बहुत अच्छा! थोड़ा और अभ्यास करो।';
    } else if (percentage >= 50) {
      message = 'अच्छी कोशिश! मात्राओं को फिर से देखो।';
    } else {
      message = 'कोई बात नहीं! फिर से सीखो और अभ्यास करो।';
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        title: const Column(
          children: [
            Icon(
              Icons.emoji_events_rounded,
              color: Color(0xFFFFA000),
              size: 55,
            ),
            SizedBox(height: 8),
            Text(
              'अभ्यास पूरा!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$score / ${questions.length}',
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2879B5),
              ),
            ),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton.icon(
            onPressed: restart,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('फिर से करो'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF2879B5),
            ),
          ),
          TextButton(
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
    final q = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'मात्रा अभ्यास',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'प्रश्न',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF66757D),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${currentQuestion + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2879B5),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 9),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value:
                      (currentQuestion + 1) / questions.length,
                  minHeight: 8,
                  color: const Color(0xFF2879B5),
                  backgroundColor: const Color(0xFFDCEFF9),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Text(
                  q.question,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    height: 1.35,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ...List.generate(
                q.options.length,
                (index) {
                  final correct = index == q.answer;
                  final selected = index == selectedAnswer;

                  Color background = Colors.white;
                  Color border = const Color(0xFFDDE3E7);

                  if (answered && correct) {
                    background = const Color(0xFFE4F5E9);
                    border = const Color(0xFF43A047);
                  } else if (answered && selected) {
                    background = const Color(0xFFFFE5E5);
                    border = const Color(0xFFE53935);
                  }

                  return GestureDetector(
                    onTap: () => selectAnswer(index),
                    child: Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: background,
                        borderRadius:
                            BorderRadius.circular(17),
                        border: Border.all(
                          color: border,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: answered && correct
                                  ? const Color(0xFF43A047)
                                  : const Color(0xFFDFF1FA),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: answered && correct
                                    ? Colors.white
                                    : const Color(0xFF2879B5),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q.options[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          if (answered && correct)
                            const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF43A047),
                            )
                          else if (answered && selected)
                            const Icon(
                              Icons.cancel_rounded,
                              color: Color(0xFFE53935),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              if (answered) ...[
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectedAnswer == q.answer
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFF1E8),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Icon(
                        selectedAnswer == q.answer
                            ? Icons.check_circle_rounded
                            : Icons.info_rounded,
                        color: selectedAnswer == q.answer
                            ? const Color(0xFF2E7D32)
                            : const Color(0xFFE65100),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          q.explanation,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: nextQuestion,
                    icon: Icon(
                      currentQuestion ==
                              questions.length - 1
                          ? Icons.emoji_events_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                    label: Text(
                      currentQuestion ==
                              questions.length - 1
                          ? 'परिणाम देखें'
                          : 'अगला प्रश्न',
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2879B5),
                      foregroundColor: Colors.white,
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

class _Question {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const _Question(
    this.question,
    this.options,
    this.answer,
    this.explanation,
  );
}
