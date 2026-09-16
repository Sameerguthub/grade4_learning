import 'package:flutter/material.dart';
import 'factors_multiples_practice.dart';

class FactorsMultiplesPage extends StatelessWidget {
  const FactorsMultiplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Factors & Multiples',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 20),

              _section(
                'What are Factors?',
                Icons.account_tree_rounded,
              ),
              _info(
                'A factor is a number that divides another number exactly '
                'without leaving a remainder.',
              ),
              _example(
                'Example',
                'Factors of 12 are 1, 2, 3, 4, 6 and 12.',
              ),

              const SizedBox(height: 20),

              _section(
                'Factor Pairs',
                Icons.compare_arrows_rounded,
              ),
              _info(
                'Two numbers that multiply together to make a number are '
                'called a factor pair.',
              ),
              _factorPairsCard(),

              const SizedBox(height: 20),

              _section(
                'Finding Factors',
                Icons.search_rounded,
              ),
              _findingFactorsCard(),

              const SizedBox(height: 20),

              _section(
                'What are Multiples?',
                Icons.format_list_numbered_rounded,
              ),
              _info(
                'Multiples are the numbers we get when we multiply a number '
                'by 1, 2, 3, 4 and so on.',
              ),
              _multiplesCard(),

              const SizedBox(height: 20),

              _section(
                'Factors vs Multiples',
                Icons.compare_rounded,
              ),
              _comparisonTable(),

              const SizedBox(height: 20),

              _section(
                'Prime Numbers',
                Icons.looks_one_rounded,
              ),
              _info(
                'A prime number has exactly two factors: 1 and the number '
                'itself.',
              ),
              _primeCard(),

              const SizedBox(height: 20),

              _section(
                'Composite Numbers',
                Icons.grid_view_rounded,
              ),
              _info(
                'A composite number has more than two factors.',
              ),
              _compositeCard(),

              const SizedBox(height: 20),

              _section(
                'Prime or Composite?',
                Icons.help_outline_rounded,
              ),
              _primeCompositeExamples(),

              const SizedBox(height: 20),

              _section(
                'Even and Odd Numbers',
                Icons.format_list_bulleted_rounded,
              ),
              _evenOddCard(),

              const SizedBox(height: 20),

              _section(
                'Common Factors',
                Icons.join_inner_rounded,
              ),
              _info(
                'Common factors are factors shared by two or more numbers.',
              ),
              _commonFactorsCard(),

              const SizedBox(height: 20),

              _section(
                'Common Multiples',
                Icons.view_list_rounded,
              ),
              _info(
                'Common multiples are multiples shared by two or more numbers.',
              ),
              _commonMultiplesCard(),

              const SizedBox(height: 20),

              _section(
                'Divisibility Basics',
                Icons.rule_rounded,
              ),
              _divisibilityCard(),

              const SizedBox(height: 20),

              _section(
                'Real-Life Example',
                Icons.shopping_basket_rounded,
              ),
              _realLifeCard(),

              const SizedBox(height: 20),

              _section(
                'Common Mistakes',
                Icons.warning_amber_rounded,
              ),
              _mistakesCard(),

              const SizedBox(height: 20),

              _section(
                'Quick Check',
                Icons.check_circle_outline_rounded,
              ),
              _quickCheck(),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FactorsMultiplesPracticePage(),
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
                    backgroundColor: const Color(0xFF00897B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF00897B),
            Color(0xFF26A69A),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.account_tree_rounded,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(height: 10),
          Text(
            'Factors & Multiples',
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn factors, multiples, prime numbers, common factors and more.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF00897B),
            size: 27,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info(String text) {
    return _box(
      Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _example(String title, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6F3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF00897B),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _box(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE0E4EC),
        ),
      ),
      child: child,
    );
  }

  Widget _factorPairsCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Factor pairs of 12',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 18),
          _pairRow('1 × 12', '12'),
          _pairRow('2 × 6', '12'),
          _pairRow('3 × 4', '12'),
        ],
      ),
    );
  }

  Widget _pairRow(String expression, String result) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            expression,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 15),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Color(0xFF00897B),
          ),
          const SizedBox(width: 15),
          Text(
            result,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _findingFactorsCard() {
    return _box(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Find the factors of 18:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text('1 × 18 = 18'),
          SizedBox(height: 6),
          Text('2 × 9 = 18'),
          SizedBox(height: 6),
          Text('3 × 6 = 18'),
          SizedBox(height: 12),
          Text(
            'Therefore:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Factors = 1, 2, 3, 6, 9, 18',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _multiplesCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Multiples of 5',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: const [
              _NumberChip('5'),
              _NumberChip('10'),
              _NumberChip('15'),
              _NumberChip('20'),
              _NumberChip('25'),
              _NumberChip('30'),
              _NumberChip('35'),
              _NumberChip('40'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _comparisonTable() {
    return _box(
      Table(
        border: TableBorder.all(
          color: const Color(0xFFD9DDE7),
        ),
        children: const [
          TableRow(
            decoration: BoxDecoration(
              color: Color(0xFFE7F6F3),
            ),
            children: [
              _Cell('Factors'),
              _Cell('Multiples'),
            ],
          ),
          TableRow(
            children: [
              _Cell('Divide exactly'),
              _Cell('Multiply'),
            ],
          ),
          TableRow(
            children: [
              _Cell('Usually smaller or equal'),
              _Cell('Usually greater or equal'),
            ],
          ),
          TableRow(
            children: [
              _Cell('Finite for a number'),
              _Cell('Infinite'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _primeCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Example: 7',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Factors of 7:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            '1 and 7',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Exactly two factors → Prime number',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF00897B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _compositeCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Example: 12',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Factors:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 7),
          const Text(
            '1, 2, 3, 4, 6, 12',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'More than two factors → Composite number',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF00897B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _primeCompositeExamples() {
    return _box(
      const Column(
        children: [
          _TypeRow(
            number: '2',
            type: 'Prime',
          ),
          _TypeRow(
            number: '5',
            type: 'Prime',
          ),
          _TypeRow(
            number: '9',
            type: 'Composite',
          ),
          _TypeRow(
            number: '11',
            type: 'Prime',
          ),
          _TypeRow(
            number: '15',
            type: 'Composite',
          ),
        ],
      ),
    );
  }

  Widget _evenOddCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Even Numbers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '2, 4, 6, 8, 10, 12...',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 18),
          const Divider(),
          const SizedBox(height: 12),
          const Text(
            'Odd Numbers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '1, 3, 5, 7, 9, 11...',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _commonFactorsCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Example: 12 and 18',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Factors of 12:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('1, 2, 3, 4, 6, 12'),
          SizedBox(height: 10),
          Text(
            'Factors of 18:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('1, 2, 3, 6, 9, 18'),
          SizedBox(height: 10),
          Text(
            'Common factors: 1, 2, 3, 6',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonMultiplesCard() {
    return _box(
      const Column(
        children: [
          Text(
            'Multiples of 3',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 6),
          Text('3, 6, 9, 12, 15, 18, 21...'),
          SizedBox(height: 15),
          Text(
            'Multiples of 4',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 6),
          Text('4, 8, 12, 16, 20, 24...'),
          SizedBox(height: 15),
          Text(
            'Common multiples:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF00897B),
            ),
          ),
          SizedBox(height: 6),
          Text(
            '12, 24, 36...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divisibilityCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RuleRow(
            number: '2',
            rule: 'Last digit is 0, 2, 4, 6 or 8',
          ),
          _RuleRow(
            number: '5',
            rule: 'Last digit is 0 or 5',
          ),
          _RuleRow(
            number: '10',
            rule: 'Last digit is 0',
          ),
        ],
      ),
    );
  }

  Widget _realLifeCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A teacher has 24 pencils.',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'She wants to put them into equal groups.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            'Possible group sizes include:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 7),
          Text(
            '1, 2, 3, 4, 6, 8, 12 and 24',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF00897B),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'These are factors of 24.',
          ),
        ],
      ),
    );
  }

  Widget _mistakesCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Incorrect: Factors of 12 are 1, 2, 3, 6.',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Correct: Include 4 and 12 too.',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Remember: 1 is a factor of every whole number.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Remember: 0 is not a factor of any number.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _quickCheck() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1. What are the factors of 10?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 1, 2, 5, 10',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '2. Is 13 prime or composite?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: Prime',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '3. Write the first five multiples of 4.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 4, 8, 12, 16, 20',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _NumberChip extends StatelessWidget {
  final String number;

  const _NumberChip(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        number,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF00897B),
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;

  const _Cell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TypeRow extends StatelessWidget {
  final String number;
  final String type;

  const _TypeRow({
    required this.number,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00897B),
              ),
            ),
          ),
          Expanded(
            child: Text(
              type,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}

class _RuleRow extends StatelessWidget {
  final String number;
  final String rule;

  const _RuleRow({
    required this.number,
    required this.rule,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFE7F6F3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF00897B),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              rule,
              style: const TextStyle(
                fontSize: 16,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}