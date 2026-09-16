
import 'package:flutter/material.dart';

class VarnamalaPracticePage extends StatefulWidget {
  const VarnamalaPracticePage({super.key});

  @override
  State<VarnamalaPracticePage> createState() =>
      _VarnamalaPracticePageState();
}

class _VarnamalaPracticePageState
    extends State<VarnamalaPracticePage> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;
  bool answered = false;

  final List<_Question> questions = const [
    _Question(
      'हिन्दी वर्णमाला में इनमें से कौन-सा स्वर है?',
      ['क', 'अ', 'म', 'त'],
      1,
      'अ एक स्वर है।',
    ),
    _Question(
      'इनमें से कौन-सा व्यंजन है?',
      ['आ', 'ई', 'क', 'ऊ'],
      2,
      'क एक व्यंजन है।',
    ),
    _Question(
      '“आम” शब्द किस अक्षर से शुरू होता है?',
      ['अ', 'आ', 'इ', 'उ'],
      1,
      'आम शब्द का पहला अक्षर आ है।',
    ),
    _Question(
      '“अनार” शब्द किस अक्षर से शुरू होता है?',
      ['अ', 'आ', 'क', 'ग'],
      0,
      'अनार शब्द अ से शुरू होता है।',
    ),
    _Question(
      '“कमल” शब्द किस अक्षर से शुरू होता है?',
      ['ग', 'म', 'क', 'प'],
      2,
      'कमल शब्द क से शुरू होता है।',
    ),
    _Question(
      'इनमें से कौन-सा स्वर है?',
      ['च', 'ए', 'ट', 'न'],
      1,
      'ए एक स्वर है।',
    ),
    _Question(
      'इनमें से कौन-सा व्यंजन है?',
      ['ऊ', 'औ', 'ब', 'ई'],
      2,
      'ब एक व्यंजन है।',
    ),
    _Question(
      '“गमला” किस अक्षर से शुरू होता है?',
      ['ग', 'क', 'घ', 'च'],
      0,
      'गमला शब्द ग से शुरू होता है।',
    ),
    _Question(
      'इनमें से कौन-सा स्वर नहीं है?',
      ['अ', 'इ', 'क', 'उ'],
      2,
      'क एक व्यंजन है।',
    ),
    _Question(
      '“म” किस प्रकार का अक्षर है?',
      ['स्वर', 'व्यंजन', 'मात्रा', 'चिह्न'],
      1,
      'म एक व्यंजन है।',
    ),
    _Question(
      '“ई” किस प्रकार का अक्षर है?',
      ['स्वर', 'व्यंजन', 'शब्द', 'मात्रा'],
      0,
      'ई एक स्वर है।',
    ),
    _Question(
      'इनमें से कौन-सा अक्षर “कमल” में आता है?',
      ['क', 'ट', 'फ', 'स'],
      0,
      'कमल में क अक्षर आता है।',
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
      message = 'बहुत बढ़िया! तुम वर्णमाला विशेषज्ञ हो!';
    } else if (percentage >= 70) {
      message = 'शानदार! तुम्हें वर्णमाला अच्छी तरह आती है।';
    } else if (percentage >= 50) {
      message = 'अच्छी कोशिश! थोड़ा और अभ्यास करो।';
    } else {
      message = 'कोई बात नहीं! फिर से सीखो और कोशिश करो।';
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
                color: Color(0xFFE4512E),
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
              backgroundColor: const Color(0xFFE4512E),
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
      backgroundColor: const Color(0xFFFFF8F3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'वर्णमाला अभ्यास',
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
                      color: Color(0xFF766963),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${currentQuestion + 1} / ${questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFE4512E),
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
                  color: const Color(0xFFE4512E),
                  backgroundColor: const Color(0xFFFFDDD2),
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
                  Color border = const Color(0xFFE3DDD9);

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
                                  : const Color(0xFFFFE4DB),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: answered && correct
                                    ? Colors.white
                                    : const Color(0xFFE4512E),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              q.options[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
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
                          const Color(0xFFE4512E),
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

