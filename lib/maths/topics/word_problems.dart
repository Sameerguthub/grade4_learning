import 'package:flutter/material.dart';
import 'word_problems_practice.dart';

class WordProblemsPage extends StatelessWidget {
  const WordProblemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        title: const Text(
          'Word Problems',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(),

              _section(
                Icons.help_outline_rounded,
                'What is a Word Problem?',
                const Text(
                  'A word problem is a maths question written using words. '
                  'We need to understand the story and decide which '
                  'mathematical operation to use.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),

              _section(
                Icons.looks_one_rounded,
                'Step 1: Read Carefully',
                const Text(
                  'Read the entire question slowly. Find out what is '
                  'happening in the story.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),

              _section(
                Icons.looks_two_rounded,
                'Step 2: Find the Numbers',
                _exampleBox(
                  'Example',
                  'Riya has 25 pencils. Her friend gives her 12 more.\n\n'
                      'Numbers: 25 and 12',
                ),
              ),

              _section(
                Icons.looks_3_rounded,
                'Step 3: Find What is Asked',
                _exampleBox(
                  'Question',
                  'How many pencils does Riya have now?\n\n'
                      'We need to find the total.',
                ),
              ),

              _section(
                Icons.add_circle_outline_rounded,
                'Addition Problems',
                _problem(
                  'There are 24 red balls and 16 blue balls. '
                  'How many balls are there altogether?',
                  '24 + 16 = 40 balls',
                ),
              ),

              _section(
                Icons.remove_circle_outline_rounded,
                'Subtraction Problems',
                _problem(
                  'A shop has 75 notebooks. It sells 28 notebooks. '
                  'How many notebooks are left?',
                  '75 − 28 = 47 notebooks',
                ),
              ),

              _section(
                Icons.close_rounded,
                'Multiplication Problems',
                _problem(
                  'There are 6 boxes. Each box has 8 pencils. '
                  'How many pencils are there altogether?',
                  '6 × 8 = 48 pencils',
                ),
              ),

              _section(
                Icons.horizontal_rule_rounded,
                'Division Problems',
                _problem(
                  '24 chocolates are shared equally among 6 children. '
                  'How many chocolates does each child get?',
                  '24 ÷ 6 = 4 chocolates',
                ),
              ),

              _section(
                Icons.currency_rupee_rounded,
                'Money Problems',
                _problem(
                  'A book costs ₹45 and a pen costs ₹15. '
                  'How much do they cost together?',
                  '₹45 + ₹15 = ₹60',
                ),
              ),

              _section(
                Icons.access_time_rounded,
                'Time Problems',
                _problem(
                  'A class starts at 9:00 AM and ends at 10:00 AM. '
                  'How long is the class?',
                  '1 hour',
                ),
              ),

              _section(
                Icons.straighten_rounded,
                'Measurement Problems',
                _problem(
                  'A rope is 5 metres long. Another rope is 3 metres long. '
                  'What is their total length?',
                  '5 + 3 = 8 metres',
                ),
              ),

              _section(
                Icons.tips_and_updates_rounded,
                'Operation Clue Words',
                Column(
                  children: [
                    _clueRow(
                      'Addition',
                      'altogether, total, in all, more',
                      Icons.add_rounded,
                    ),
                    _clueRow(
                      'Subtraction',
                      'left, difference, fewer, less',
                      Icons.remove_rounded,
                    ),
                    _clueRow(
                      'Multiplication',
                      'each, groups of, times',
                      Icons.close_rounded,
                    ),
                    _clueRow(
                      'Division',
                      'shared equally, each gets, groups',
                      Icons.horizontal_rule_rounded,
                    ),
                  ],
                ),
              ),

              _section(
                Icons.fact_check_rounded,
                'How to Check Your Answer',
                const Text(
                  'Ask yourself:\n\n'
                  '1. Did I use the correct operation?\n'
                  '2. Did I calculate correctly?\n'
                  '3. Does my answer make sense?\n'
                  '4. Did I write the correct unit?',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),

              _section(
                Icons.warning_rounded,
                'Common Mistakes',
                Column(
                  children: [
                    _mistake('Do not choose an operation only because of one word.'),
                    _mistake('Read what the question is actually asking.'),
                    _mistake('Do not forget units such as rupees, metres or kilograms.'),
                    _mistake('Check whether the answer makes sense.'),
                  ],
                ),
              ),

              _section(
                Icons.lightbulb_rounded,
                'Solved Example',
                _exampleBox(
                  'Problem',
                  'A school has 4 classes. Each class has 25 students. '
                  'How many students are there altogether?\n\n'
                  'Step 1: There are 4 groups.\n'
                  'Step 2: Each group has 25 students.\n'
                  'Step 3: Multiply.\n\n'
                  '4 × 25 = 100 students',
                ),
              ),

              _section(
                Icons.check_circle_rounded,
                'Quick Check',
                _exampleBox(
                  'Problem',
                  'A farmer has 50 apples. He sells 18 apples. '
                  'How many apples are left?\n\n'
                  'Answer: 50 − 18 = 32 apples',
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WordProblemsPracticePage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(
                    'Start Practice',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
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

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade500,
            Colors.indigo.shade400,
          ],
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.lightbulb_rounded,
            color: Colors.white,
            size: 55,
          ),
          SizedBox(height: 12),
          Text(
            'Word Problems',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Read the story, choose the operation and solve it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(
    IconData icon,
    String title,
    Widget child,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.deepPurple.shade600,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _exampleBox(String title, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.deepPurple.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _problem(String question, String solution) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.green.shade700,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  solution,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _clueRow(
    String operation,
    String clues,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.deepPurple.shade500,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 105,
            child: Text(
              operation,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Text(clues)),
        ],
      ),
    );
  }

  Widget _mistake(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.close_rounded,
            color: Colors.red.shade400,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}