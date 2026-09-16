import 'package:flutter/material.dart';
import 'measurement_practice.dart';

class MeasurementPage extends StatelessWidget {
  const MeasurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Measurement',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF7043),
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
                'What is Measurement?',
                Icons.straighten_rounded,
              ),
              _info(
                'Measurement tells us how long, heavy, or how much something '
                'is. We use standard units so everyone can understand the '
                'same measurement.',
              ),

              const SizedBox(height: 20),

              _section(
                'Length',
                Icons.straighten_rounded,
              ),
              _info(
                'Length tells us how long or how tall something is.',
              ),
              _lengthUnits(),

              const SizedBox(height: 20),

              _section(
                'Length Conversion',
                Icons.swap_horiz_rounded,
              ),
              _lengthConversion(),

              const SizedBox(height: 20),

              _section(
                'See Length Visually',
                Icons.linear_scale_rounded,
              ),
              _visualCard(
                title: 'A 10 cm ruler',
                height: 145,
                painter: RulerPainter(),
              ),

              const SizedBox(height: 20),

              _section(
                'Mass',
                Icons.monitor_weight_rounded,
              ),
              _info(
                'Mass tells us how heavy something is. We commonly use '
                'grams and kilograms.',
              ),
              _massCard(),

              const SizedBox(height: 20),

              _section(
                'Mass Conversion',
                Icons.swap_vert_rounded,
              ),
              _massConversion(),

              const SizedBox(height: 20),

              _section(
                'Capacity',
                Icons.local_drink_rounded,
              ),
              _info(
                'Capacity tells us how much liquid a container can hold. '
                'We commonly use millilitres and litres.',
              ),
              _capacityCard(),

              const SizedBox(height: 20),

              _section(
                'Capacity Conversion',
                Icons.water_drop_rounded,
              ),
              _capacityConversion(),

              const SizedBox(height: 20),

              _section(
                'Perimeter',
                Icons.crop_square_rounded,
              ),
              _info(
                'Perimeter is the total distance around the outside of a '
                'shape.',
              ),
              _perimeterCard(),

              const SizedBox(height: 20),

              _section(
                'Perimeter of a Rectangle',
                Icons.rectangle_outlined,
              ),
              _rectanglePerimeter(),

              const SizedBox(height: 20),

              _section(
                'Area',
                Icons.grid_on_rounded,
              ),
              _info(
                'Area tells us how much surface is covered inside a shape. '
                'For a rectangle, area = length × width.',
              ),
              _areaCard(),

              const SizedBox(height: 20),

              _section(
                'Estimation',
                Icons.lightbulb_outline_rounded,
              ),
              _estimationCard(),

              const SizedBox(height: 20),

              _section(
                'Which Unit Should We Use?',
                Icons.help_outline_rounded,
              ),
              _unitChoiceCard(),

              const SizedBox(height: 20),

              _section(
                'Measurement in Real Life',
                Icons.home_rounded,
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
                        builder: (_) => MeasurementPracticePage(),
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
                    backgroundColor: const Color(0xFFFF7043),
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
            Color(0xFFFF7043),
            Color(0xFFFF8A65),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.straighten_rounded,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(height: 10),
          Text(
            'Measurement',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn length, mass, capacity, perimeter, area and unit conversions.',
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
            color: const Color(0xFFFF7043),
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

  Widget _lengthUnits() {
    return _box(
      const Column(
        children: [
          _UnitRow(
            unit: 'Millimetre',
            symbol: 'mm',
            use: 'Very small lengths',
          ),
          _UnitRow(
            unit: 'Centimetre',
            symbol: 'cm',
            use: 'Small objects',
          ),
          _UnitRow(
            unit: 'Metre',
            symbol: 'm',
            use: 'Room or person height',
          ),
          _UnitRow(
            unit: 'Kilometre',
            symbol: 'km',
            use: 'Long distances',
          ),
        ],
      ),
    );
  }

  Widget _lengthConversion() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Important conversions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
          SizedBox(height: 12),
          Text(
            '10 mm = 1 cm',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 7),
          Text(
            '100 cm = 1 m',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 7),
          Text(
            '1000 m = 1 km',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 14),
          Text(
            'Example: 3 m = 300 cm',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
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
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
          const SizedBox(height: 10),
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

  Widget _massCard() {
    return _box(
      const Column(
        children: [
          _UnitRow(
            unit: 'Gram',
            symbol: 'g',
            use: 'Light objects',
          ),
          _UnitRow(
            unit: 'Kilogram',
            symbol: 'kg',
            use: 'Heavier objects',
          ),
          SizedBox(height: 8),
          Text(
            '1000 g = 1 kg',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
        ],
      ),
    );
  }

  Widget _massConversion() {
    return _box(
      const Column(
        children: [
          Text(
            '2 kg = 2000 g',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '5 kg = 5000 g',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '3000 g = 3 kg',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _capacityCard() {
    return _box(
      const Column(
        children: [
          Icon(
            Icons.local_drink_rounded,
            size: 45,
            color: Color(0xFFFF7043),
          ),
          SizedBox(height: 10),
          Text(
            '1000 mL = 1 L',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Millilitres are useful for smaller amounts of liquid.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 7),
          Text(
            'Litres are useful for larger amounts.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _capacityConversion() {
    return _box(
      const Column(
        children: [
          Text(
            '2 L = 2000 mL',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '5 L = 5000 mL',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '3000 mL = 3 L',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _perimeterCard() {
    return _box(
      Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CustomPaint(
              painter: PerimeterRectanglePainter(),
            ),
          ),
          const Text(
            'Perimeter = distance around the shape',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rectanglePerimeter() {
    return _box(
      const Column(
        children: [
          Text(
            'Length = 8 cm',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 6),
          Text(
            'Width = 3 cm',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 12),
          Text(
            'Perimeter = 2 × (length + width)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '= 2 × (8 + 3)',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '= 22 cm',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF287D3C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _areaCard() {
    return _box(
      Column(
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: CustomPaint(
              painter: AreaGridPainter(),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Area = length × width',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'For a 5 cm × 3 cm rectangle:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'Area = 15 cm²',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _estimationCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimation means finding a close answer.',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'A classroom door might be about 2 metres tall.',
          ),
          SizedBox(height: 8),
          Text(
            'A pencil might be about 15 centimetres long.',
          ),
          SizedBox(height: 8),
          Text(
            'A water bottle might hold about 1 litre.',
          ),
        ],
      ),
    );
  }

  Widget _unitChoiceCard() {
    return _box(
      const Column(
        children: [
          _ChoiceRow(
            object: 'Pencil',
            unit: 'cm',
            icon: Icons.edit_rounded,
          ),
          _ChoiceRow(
            object: 'Road distance',
            unit: 'km',
            icon: Icons.route_rounded,
          ),
          _ChoiceRow(
            object: 'Rice bag',
            unit: 'kg',
            icon: Icons.shopping_bag_rounded,
          ),
          _ChoiceRow(
            object: 'Water tank',
            unit: 'L',
            icon: Icons.water_rounded,
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
          _BulletRow(
            icon: Icons.straighten_rounded,
            text: 'Measure the length of a table in centimetres or metres.',
          ),
          _BulletRow(
            icon: Icons.monitor_weight_rounded,
            text: 'Measure the mass of vegetables in grams or kilograms.',
          ),
          _BulletRow(
            icon: Icons.local_drink_rounded,
            text: 'Measure milk in millilitres or litres.',
          ),
          _BulletRow(
            icon: Icons.home_rounded,
            text: 'Measure the perimeter of a room.',
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
            'Do not confuse cm and m.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '100 cm = 1 m',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Do not confuse g and kg.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '1000 g = 1 kg',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Remember: perimeter goes around, area covers inside.',
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
            '1. How many centimetres are in 1 metre?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 100 cm',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '2. How many grams are in 1 kilogram?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 1000 g',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '3. What is the perimeter of a 5 cm square?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 20 cm',
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

class _UnitRow extends StatelessWidget {
  final String unit;
  final String symbol;
  final String use;

  const _UnitRow({
    required this.unit,
    required this.symbol,
    required this.use,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE9E2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              symbol,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7043),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              unit,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              use,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceRow extends StatelessWidget {
  final String object;
  final String unit;
  final IconData icon;

  const _ChoiceRow({
    required this.object,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFFF7043),
            size: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              object,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF7043),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BulletRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 23,
            color: const Color(0xFFFF7043),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFFFF7043)
      ..strokeWidth = 3;

    final tickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2;

    const left = 20.0;
    final width = size.width - 40;
    const y = 70.0;

    canvas.drawLine(
      const Offset(left, y),
      Offset(left + width, y),
      linePaint,
    );

    for (int i = 0; i <= 10; i++) {
      final x = left + (width / 10) * i;

      canvas.drawLine(
        Offset(x, y),
        Offset(x, y - (i % 5 == 0 ? 28 : 18)),
        tickPaint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: '$i',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y + 10),
      );
    }
  }

  @override
  bool shouldRepaint(covariant RulerPainter oldDelegate) => false;
}

class PerimeterRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.65,
      height: size.height * 0.55,
    );

    canvas.drawRect(rect, paint);

    _label(
      canvas,
      '8 cm',
      Offset(rect.center.dx, rect.top - 25),
    );

    _label(
      canvas,
      '3 cm',
      Offset(rect.right + 25, rect.center.dy),
    );
  }

  void _label(Canvas canvas, String text, Offset center) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFF7043),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    painter.layout();

    painter.paint(
      canvas,
      Offset(
        center.dx - painter.width / 2,
        center.dy - painter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant PerimeterRectanglePainter oldDelegate) {
    return false;
  }
}

class AreaGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = 5;
    final rows = 3;

    final cell = (size.width - 50) / grid;
    final totalWidth = cell * grid;
    final totalHeight = cell * rows;

    final left = (size.width - totalWidth) / 2;
    final top = (size.height - totalHeight) / 2;

    final fillPaint = Paint()
      ..color = const Color(0xFFFFE9E2)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = const Color(0xFFFF7043)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < grid; col++) {
        final rect = Rect.fromLTWH(
          left + col * cell,
          top + row * cell,
          cell,
          cell,
        );

        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant AreaGridPainter oldDelegate) => false;
}