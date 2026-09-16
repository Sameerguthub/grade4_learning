import 'package:flutter/material.dart';

class NumberQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const NumberQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}


// =====================================================================
// NUMBERS QUESTIONS
// =====================================================================

const List<NumberQuestion> numberQuestions = [

  NumberQuestion(
    question: 'What is the place value of 7 in 3,742?',
    options: [
      '7',
      '70',
      '700',
      '7,000',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'Which number is the greatest?',
    options: [
      '4,567',
      '5,476',
      '4,765',
      '5,467',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'What is the expanded form of 5,326?',
    options: [
      '5,000 + 300 + 20 + 6',
      '5,000 + 30 + 20 + 6',
      '500 + 300 + 20 + 6',
      '5,000 + 300 + 2 + 6',
    ],
    correctAnswer: 0,
  ),

  NumberQuestion(
    question: 'Which number comes after 9,999?',
    options: [
      '9,998',
      '10,000',
      '10,001',
      '9,990',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'What is the place value of 6 in 6,482?',
    options: [
      '6',
      '60',
      '600',
      '6,000',
    ],
    correctAnswer: 3,
  ),

  NumberQuestion(
    question: 'Which number is the smallest?',
    options: [
      '3,245',
      '2,999',
      '3,024',
      '2,909',
    ],
    correctAnswer: 3,
  ),

  NumberQuestion(
    question: 'How do we write 7,405 in words?',
    options: [
      'Seven thousand forty-five',
      'Seven thousand four hundred five',
      'Seven hundred four five',
      'Seven thousand four hundred fifty',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'What is 4,000 + 500 + 30 + 8?',
    options: [
      '4,358',
      '4,538',
      '4,583',
      '4,305',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'Which symbol makes this statement correct? 6,245 __ 6,425',
    options: [
      '>',
      '<',
      '=',
      '+',
    ],
    correctAnswer: 1,
  ),

  NumberQuestion(
    question: 'How many thousands are there in 8,765?',
    options: [
      '8',
      '80',
      '800',
      '8,000',
    ],
    correctAnswer: 0,
  ),
];


// =====================================================================
// PRACTICE SCREEN
// =====================================================================

class NumbersPracticePage extends StatefulWidget {
  const NumbersPracticePage({super.key});

  @override
  State<NumbersPracticePage> createState() =>
      _NumbersPracticePageState();
}

class _NumbersPracticePageState
    extends State<NumbersPracticePage> {

  int currentQuestion = 0;

  int score = 0;

  int? selectedAnswer;

  bool answered = false;


  // ===================================================================
  // SELECT ANSWER
  // ===================================================================

  void selectAnswer(int answerIndex) {

    if (answered) {
      return;
    }

    setState(() {
      selectedAnswer = answerIndex;
      answered = true;

      if (
        answerIndex ==
        numberQuestions[currentQuestion].correctAnswer
      ) {
        score++;
      }
    });
  }


  // ===================================================================
  // NEXT QUESTION
  // ===================================================================

  void nextQuestion() {

    if (!answered) {
      return;
    }

    if (currentQuestion <
        numberQuestions.length - 1) {

      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answered = false;
      });

    } else {

      _showResult();
    }
  }


  // ===================================================================
  // RESULT
  // ===================================================================

  void _showResult() {

    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (context) {

        final percentage =
            ((score / numberQuestions.length) * 100)
                .round();

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),

          title: const Text(
            'Practice Complete!',
            textAlign: TextAlign.center,

            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Color(0xFF20243A),
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              Container(
                width: 75,
                height: 75,

                decoration: const BoxDecoration(
                  color: Color(0xFFEEF0FF),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.emoji_events_rounded,
                  color: Color(0xFF5B5FEF),
                  size: 42,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                '$score / ${numberQuestions.length}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF5B5FEF),
                ),
              ),

              const SizedBox(height: 5),

              Text(
                '$percentage% correct',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF74788D),
                ),
              ),
            ],
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },

              child: const Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {
                  currentQuestion = 0;
                  score = 0;
                  selectedAnswer = null;
                  answered = false;
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF5B5FEF),
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Try Again',
              ),
            ),
          ],
        );
      },
    );
  }


  // ===================================================================
  // ANSWER COLOR
  // ===================================================================

  Color _optionBackground(int index) {

    if (!answered) {
      return Colors.white;
    }

    final correct =
        numberQuestions[currentQuestion]
            .correctAnswer;

    if (index == correct) {
      return const Color(0xFFE8F7EF);
    }

    if (
      index == selectedAnswer &&
      index != correct
    ) {
      return const Color(0xFFFFEEEE);
    }

    return Colors.white;
  }


  Color _optionBorder(int index) {

    if (!answered) {
      return const Color(0xFFE1E3EB);
    }

    final correct =
        numberQuestions[currentQuestion]
            .correctAnswer;

    if (index == correct) {
      return const Color(0xFF22B573);
    }

    if (
      index == selectedAnswer &&
      index != correct
    ) {
      return const Color(0xFFE05252);
    }

    return const Color(0xFFE1E3EB);
  }


  // ===================================================================
  // BUILD
  // ===================================================================

  @override
  Widget build(BuildContext context) {

    final question =
        numberQuestions[currentQuestion];

    final totalQuestions =
        numberQuestions.length;

    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFF7F9FC),

        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },

          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF20243A),
          ),
        ),

        title: const Text(
          'Numbers Practice',
          style: TextStyle(
            color: Color(0xFF20243A),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            // =========================================================
            // PROGRESS
            // =========================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        'Question ${currentQuestion + 1} of $totalQuestions',

                        style: const TextStyle(
                          color: Color(0xFF303448),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      Text(
                        'Score: $score',

                        style: const TextStyle(
                          color: Color(0xFF5B5FEF),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 9),

                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10),

                    child: LinearProgressIndicator(
                      value:
                          (currentQuestion + 1) /
                          totalQuestions,

                      minHeight: 8,

                      backgroundColor:
                          const Color(0xFFE3E5F0),

                      color:
                          const Color(0xFF5B5FEF),
                    ),
                  ),
                ],
              ),
            ),

            // =========================================================
            // QUESTION AREA
            // =========================================================

            Expanded(
              child: SingleChildScrollView(
                physics:
                    const BouncingScrollPhysics(),

                padding:
                    const EdgeInsets.fromLTRB(
                  20,
                  18,
                  20,
                  20,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // QUESTION CARD

                    Container(
                      width: double.infinity,

                      padding:
                          const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(22),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Container(
                            width: 45,
                            height: 45,

                            decoration:
                                BoxDecoration(
                              color:
                                  const Color(
                                0xFFEEF0FF,
                              ),

                              borderRadius:
                                  BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: const Icon(
                              Icons.help_outline_rounded,
                              color:
                                  Color(0xFF5B5FEF),
                              size: 27,
                            ),
                          ),

                          const SizedBox(height: 18),

                          Text(
                            question.question,

                            style: const TextStyle(
                              color:
                                  Color(0xFF20243A),
                              fontSize: 19,
                              height: 1.4,
                              fontWeight:
                                  FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'Choose the correct answer:',
                      style: TextStyle(
                        color: Color(0xFF74788D),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // =================================================
                    // OPTIONS
                    // =================================================

                    ...List.generate(
                      question.options.length,
                      (index) {

                        final option =
                            question.options[index];

                        final isCorrect =
                            index ==
                            question.correctAnswer;

                        final isSelected =
                            index ==
                            selectedAnswer;

                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 10,
                          ),

                          child: InkWell(
                            onTap: () {
                              selectAnswer(index);
                            },

                            borderRadius:
                                BorderRadius.circular(
                              16,
                            ),

                            child: AnimatedContainer(
                              duration:
                                  const Duration(
                                milliseconds: 200,
                              ),

                              width: double.infinity,

                              padding:
                                  const EdgeInsets.all(
                                15,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    _optionBackground(
                                  index,
                                ),

                                borderRadius:
                                    BorderRadius.circular(
                                  16,
                                ),

                                border:
                                    Border.all(
                                  color:
                                      _optionBorder(
                                    index,
                                  ),

                                  width:
                                      isSelected ||
                                      (answered &&
                                          isCorrect)
                                          ? 1.5
                                          : 1,
                                ),
                              ),

                              child: Row(
                                children: [

                                  Container(
                                    width: 32,
                                    height: 32,

                                    decoration:
                                        BoxDecoration(
                                      color:
                                          const Color(
                                        0xFFF3F4FA,
                                      ),

                                      shape:
                                          BoxShape.circle,
                                    ),

                                    child: Center(
                                      child: Text(
                                        String.fromCharCode(
                                          65 + index,
                                        ),

                                        style:
                                            const TextStyle(
                                          color:
                                              Color(
                                            0xFF5B5FEF,
                                          ),

                                          fontSize: 13,

                                          fontWeight:
                                              FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 12,
                                  ),

                                  Expanded(
                                    child: Text(
                                      option,

                                      style:
                                          const TextStyle(
                                        color:
                                            Color(
                                          0xFF303448,
                                        ),

                                        fontSize: 14,

                                        fontWeight:
                                            FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  if (answered &&
                                      isCorrect)
                                    const Icon(
                                      Icons
                                          .check_circle_rounded,
                                      color:
                                          Color(
                                        0xFF22B573,
                                      ),
                                      size: 22,
                                    ),

                                  if (answered &&
                                      isSelected &&
                                      !isCorrect)
                                    const Icon(
                                      Icons
                                          .cancel_rounded,
                                      color:
                                          Color(
                                        0xFFE05252,
                                      ),
                                      size: 22,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    // =================================================
                    // FEEDBACK
                    // =================================================

                    if (answered)
                      Container(
                        width: double.infinity,

                        margin:
                            const EdgeInsets.only(
                          top: 4,
                        ),

                        padding:
                            const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: selectedAnswer ==
                                  question.correctAnswer
                              ? const Color(
                                  0xFFE8F7EF,
                                )
                              : const Color(
                                  0xFFFFEEEE,
                                ),

                          borderRadius:
                              BorderRadius.circular(
                            15,
                          ),
                        ),

                        child: Row(
                          children: [

                            Icon(
                              selectedAnswer ==
                                      question
                                          .correctAnswer
                                  ? Icons
                                      .check_circle_rounded
                                  : Icons
                                      .info_rounded,

                              color:
                                  selectedAnswer ==
                                          question
                                              .correctAnswer
                                      ? const Color(
                                          0xFF22B573,
                                        )
                                      : const Color(
                                          0xFFE05252,
                                        ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                selectedAnswer ==
                                        question
                                            .correctAnswer
                                    ? 'Correct! Great job!'
                                    : 'Not quite. The correct answer is ${question.options[question.correctAnswer]}.',

                                style:
                                    const TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                      FontWeight.w700,
                                  color:
                                      Color(0xFF303448),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // =========================================================
            // NEXT BUTTON
            // =========================================================

            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                15,
              ),

              decoration: const BoxDecoration(
                color: Colors.white,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton(
                  onPressed:
                      answered ? nextQuestion : null,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF5B5FEF),

                    disabledBackgroundColor:
                        const Color(0xFFD7D9E5),

                    foregroundColor: Colors.white,

                    disabledForegroundColor:
                        const Color(0xFF888B99),

                    elevation: 0,

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),

                  child: Text(
                    currentQuestion ==
                            totalQuestions - 1
                        ? 'See Result'
                        : 'Next Question',

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight:
                          FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}