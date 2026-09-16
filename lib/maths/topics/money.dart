import 'package:flutter/material.dart';
import 'money_practice.dart';

class MoneyPage extends StatelessWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Money',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
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
                'What is Money?',
                Icons.currency_rupee_rounded,
              ),
              _info(
                'Money is used to buy things and pay for services. '
                'In India, our currency is the Indian Rupee.',
              ),

              const SizedBox(height: 20),

              _section(
                'Rupees and Paise',
                Icons.account_balance_wallet_rounded,
              ),
              _info(
                'One rupee is equal to 100 paise. We use a decimal point '
                'to separate rupees and paise.',
              ),
              _rupeesPaiseCard(),

              const SizedBox(height: 20),

              _section(
                'Reading Money',
                Icons.record_voice_over_rounded,
              ),
              _readingMoneyCard(),

              const SizedBox(height: 20),

              _section(
                'Money Visual',
                Icons.payments_rounded,
              ),
              _visualCard(
                title: '₹50',
                height: 150,
                painter: NotePainter(),
              ),

              const SizedBox(height: 20),

              _section(
                'Common Notes and Coins',
                Icons.account_balance_rounded,
              ),
              _notesCoinsCard(),

              const SizedBox(height: 20),

              _section(
                'Adding Money',
                Icons.add_circle_outline_rounded,
              ),
              _additionCard(),

              const SizedBox(height: 20),

              _section(
                'Subtracting Money',
                Icons.remove_circle_outline_rounded,
              ),
              _subtractionCard(),

              const SizedBox(height: 20),

              _section(
                'Comparing Money',
                Icons.compare_rounded,
              ),
              _comparisonCard(),

              const SizedBox(height: 20),

              _section(
                'Making Change',
                Icons.change_circle_rounded,
              ),
              _changeCard(),

              const SizedBox(height: 20),

              _section(
                'Multiplying Money',
                Icons.close_rounded,
              ),
              _multiplicationCard(),

              const SizedBox(height: 20),

              _section(
                'Money and Decimals',
                Icons.calculate_rounded,
              ),
              _decimalMoneyCard(),

              const SizedBox(height: 20),

              _section(
                'Real-Life Shopping',
                Icons.shopping_cart_rounded,
              ),
              _shoppingCard(),

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
                        builder: (_) => MoneyPracticePage(),
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
                    backgroundColor: const Color(0xFF2E7D32),
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
            Color(0xFF2E7D32),
            Color(0xFF43A047),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.currency_rupee_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 10),
          Text(
            'Money',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn rupees, paise, shopping, change, addition and subtraction of money.',
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
            color: const Color(0xFF2E7D32),
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

  Widget _rupeesPaiseCard() {
    return _box(
      Column(
        children: const [
          Text(
            '₹1 = 100 paise',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 14),
          Text(
            '₹5.50 = 5 rupees and 50 paise',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '₹10.25 = 10 rupees and 25 paise',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _readingMoneyCard() {
    return _box(
      const Column(
        children: [
          _MoneyRow(
            amount: '₹25',
            meaning: 'Twenty-five rupees',
          ),
          _MoneyRow(
            amount: '₹10.50',
            meaning: 'Ten rupees and fifty paise',
          ),
          _MoneyRow(
            amount: '₹75.25',
            meaning: 'Seventy-five rupees and twenty-five paise',
          ),
          _MoneyRow(
            amount: '₹100.00',
            meaning: 'One hundred rupees',
          ),
        ],
      ),
    );
  }

  Widget _visualCard({
    required String title,
    required double height,
    required CustomPainter painter,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: height,
            width: double.infinity,
            child: CustomPaint(
              painter: painter,
            ),
          ),
        ],
      ),
    );
  }

  Widget _notesCoinsCard() {
    return _box(
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: const [
          _MoneyChip('₹1'),
          _MoneyChip('₹2'),
          _MoneyChip('₹5'),
          _MoneyChip('₹10'),
          _MoneyChip('₹20'),
          _MoneyChip('₹50'),
          _MoneyChip('₹100'),
          _MoneyChip('₹200'),
          _MoneyChip('₹500'),
        ],
      ),
    );
  }

  Widget _additionCard() {
    return _box(
      const Column(
        children: [
          Text(
            '₹25.50 + ₹10.25',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '= ₹35.75',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Line up the decimal points before adding.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _subtractionCard() {
    return _box(
      const Column(
        children: [
          Text(
            '₹50.00 − ₹18.50',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '= ₹31.50',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }

  Widget _comparisonCard() {
    return _box(
      const Column(
        children: [
          Text(
            '₹75.50 > ₹65.50',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '₹40.25 < ₹45.25',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Compare rupees first. If they are equal, compare paise.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _changeCard() {
    return _box(
      const Column(
        children: [
          Text(
            'You have ₹100.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You buy a book for ₹65.',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 10),
          Text(
            'Change = ₹100 − ₹65',
            style: TextStyle(fontSize: 19),
          ),
          SizedBox(height: 8),
          Text(
            'Change = ₹35',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }

  Widget _multiplicationCard() {
    return _box(
      const Column(
        children: [
          Text(
            '3 pencils cost ₹15 each.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '3 × ₹15 = ₹45',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'So, 3 pencils cost ₹45 altogether.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _decimalMoneyCard() {
    return _box(
      const Column(
        children: [
          Text(
            '₹12.50',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '12 rupees + 50 paise',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 14),
          Text(
            '₹12.50 = ₹12.5 = ₹12.500',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shoppingCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ShoppingRow(
            item: 'Notebook',
            price: '₹35',
          ),
          _ShoppingRow(
            item: 'Pencil box',
            price: '₹75',
          ),
          _ShoppingRow(
            item: 'Water bottle',
            price: '₹120',
          ),
          Divider(height: 24),
          Text(
            'Total = ₹230',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
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
            'Remember: ₹1 = 100 paise.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Always line up decimal points when adding or subtracting money.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '₹5.50 is not the same as ₹5.05.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
            '1. How many paise are in ₹5?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 500 paise',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '2. What is ₹20 + ₹15?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: ₹35',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '3. You pay ₹100 for something costing ₹72. What is the change?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: ₹28',
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

class _MoneyChip extends StatelessWidget {
  final String amount;

  const _MoneyChip(this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      padding: const EdgeInsets.symmetric(vertical: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFA5D6A7),
        ),
      ),
      child: Text(
        amount,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E7D32),
        ),
      ),
    );
  }
}

class _MoneyRow extends StatelessWidget {
  final String amount;
  final String meaning;

  const _MoneyRow({
    required this.amount,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              amount,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
          ),
          Expanded(
            child: Text(
              meaning,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShoppingRow extends StatelessWidget {
  final String item;
  final String price;

  const _ShoppingRow({
    required this.item,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }
}

class NotePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width * 0.72;
    final height = size.height * 0.62;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );

    final fill = Paint()
      ..color = const Color(0xFFE8F5E9)
      ..style = PaintingStyle.fill;

    final border = Paint()
      ..color = const Color(0xFF2E7D32)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(12),
      ),
      fill,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        const Radius.circular(12),
      ),
      border,
    );

    final circlePaint = Paint()
      ..color = const Color(0xFF2E7D32)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(
      rect.center,
      height * 0.28,
      circlePaint,
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '₹50',
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E7D32),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        rect.center.dx - textPainter.width / 2,
        rect.center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant NotePainter oldDelegate) => false;
}