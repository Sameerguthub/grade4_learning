import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'time_practice.dart';

class TimePage extends StatelessWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Time',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF3949AB),
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
                'What is Time?',
                Icons.access_time_rounded,
              ),
              _info(
                'Time tells us when something happens and how long it takes. '
                'We use seconds, minutes, hours, days, weeks, months and years '
                'to measure time.',
              ),

              const SizedBox(height: 20),

              _section(
                'Units of Time',
                Icons.schedule_rounded,
              ),
              _unitsCard(),

              const SizedBox(height: 20),

              _section(
                'Important Conversions',
                Icons.sync_alt_rounded,
              ),
              _conversionCard(),

              const SizedBox(height: 20),

              _section(
                'Reading an Analogue Clock',
                Icons.watch_rounded,
              ),
              _info(
                'An analogue clock has two main hands. The short hand shows '
                'the hour and the long hand shows the minutes.',
              ),
              const SizedBox(height: 12),
              _visualCard(
                title: '3:00',
                height: 270,
                painter: ClockPainter(
                  hour: 3,
                  minute: 0,
                ),
              ),

              const SizedBox(height: 20),

              _section(
                'Reading the Minute Hand',
                Icons.schedule_send_rounded,
              ),
              _minuteHandCard(),

              const SizedBox(height: 20),

              _section(
                'Quarter Past, Half Past and Quarter To',
                Icons.timelapse_rounded,
              ),
              _quarterTimeCard(),

              const SizedBox(height: 20),

              _section(
                'AM and PM',
                Icons.wb_sunny_outlined,
              ),
              _amPmCard(),

              const SizedBox(height: 20),

              _section(
                '12-Hour Clock',
                Icons.access_time_filled_rounded,
              ),
              _12HourCard(),

              const SizedBox(height: 20),

              _section(
                '24-Hour Clock',
                Icons.more_time_rounded,
              ),
              _24HourCard(),

              const SizedBox(height: 20),

              _section(
                'Converting 12-Hour to 24-Hour',
                Icons.compare_arrows_rounded,
              ),
              _timeConversionCard(),

              const SizedBox(height: 20),

              _section(
                'Finding Duration',
                Icons.timelapse_rounded,
              ),
              _durationCard(),

              const SizedBox(height: 20),

              _section(
                'Elapsed Time',
                Icons.forward_rounded,
              ),
              _elapsedTimeCard(),

              const SizedBox(height: 20),

              _section(
                'Calendar',
                Icons.calendar_month_rounded,
              ),
              _calendarCard(),

              const SizedBox(height: 20),

              _section(
                'Days in a Month',
                Icons.date_range_rounded,
              ),
              _daysMonthCard(),

              const SizedBox(height: 20),

              _section(
                'Leap Year',
                Icons.event_available_rounded,
              ),
              _leapYearCard(),

              const SizedBox(height: 20),

              _section(
                'Time in Real Life',
                Icons.public_rounded,
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
                        builder: (_) => TimePracticePage(),
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
                    backgroundColor: const Color(0xFF3949AB),
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
            Color(0xFF3949AB),
            Color(0xFF5C6BC0),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.access_time_rounded,
            color: Colors.white,
            size: 44,
          ),
          SizedBox(height: 10),
          Text(
            'Time',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Learn clocks, AM and PM, 24-hour time, duration, calendars and more.',
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
            color: const Color(0xFF3949AB),
            size: 27,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 21,
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

  Widget _unitsCard() {
    return _box(
      const Column(
        children: [
          _TimeUnit(
            value: '60 seconds',
            unit: '1 minute',
          ),
          _TimeUnit(
            value: '60 minutes',
            unit: '1 hour',
          ),
          _TimeUnit(
            value: '24 hours',
            unit: '1 day',
          ),
          _TimeUnit(
            value: '7 days',
            unit: '1 week',
          ),
          _TimeUnit(
            value: '12 months',
            unit: '1 year',
          ),
        ],
      ),
    );
  }

  Widget _conversionCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remember these:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
          SizedBox(height: 12),
          Text('1 minute = 60 seconds'),
          SizedBox(height: 7),
          Text('1 hour = 60 minutes'),
          SizedBox(height: 7),
          Text('1 day = 24 hours'),
          SizedBox(height: 7),
          Text('1 week = 7 days'),
          SizedBox(height: 7),
          Text('1 year = 12 months'),
          SizedBox(height: 7),
          Text('1 year = 365 days'),
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
              color: Color(0xFF3949AB),
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

  Widget _minuteHandCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Each number on the clock represents 5 minutes.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text('1 → 5 minutes'),
          SizedBox(height: 6),
          Text('2 → 10 minutes'),
          SizedBox(height: 6),
          Text('3 → 15 minutes'),
          SizedBox(height: 6),
          Text('6 → 30 minutes'),
          SizedBox(height: 6),
          Text('9 → 45 minutes'),
          SizedBox(height: 6),
          Text('12 → 60 minutes'),
        ],
      ),
    );
  }

  Widget _quarterTimeCard() {
    return _box(
      const Column(
        children: [
          _SpecialTime(
            time: '3:15',
            meaning: 'Quarter past 3',
          ),
          _SpecialTime(
            time: '3:30',
            meaning: 'Half past 3',
          ),
          _SpecialTime(
            time: '3:45',
            meaning: 'Quarter to 4',
          ),
        ],
      ),
    );
  }

  Widget _amPmCard() {
    return _box(
      const Column(
        children: [
          Text(
            'AM',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Midnight to before noon',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Divider(),
          SizedBox(height: 15),
          Text(
            'PM',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Noon to before midnight',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _12HourCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Examples:',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text('7:00 AM → Morning'),
          SizedBox(height: 7),
          Text('12:00 PM → Noon'),
          SizedBox(height: 7),
          Text('4:30 PM → Afternoon'),
          SizedBox(height: 7),
          Text('9:00 PM → Night'),
          SizedBox(height: 7),
          Text('12:00 AM → Midnight'),
        ],
      ),
    );
  }

  Widget _24HourCard() {
    return _box(
      const Column(
        children: [
          Text(
            'The 24-hour clock counts from 00:00 to 23:59.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 15),
          _TimeConversion(
            twelve: '1:00 PM',
            twentyFour: '13:00',
          ),
          _TimeConversion(
            twelve: '6:00 PM',
            twentyFour: '18:00',
          ),
          _TimeConversion(
            twelve: '9:00 PM',
            twentyFour: '21:00',
          ),
        ],
      ),
    );
  }

  Widget _timeConversionCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'For PM times after 12 PM, add 12 to the hour.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '2:00 PM → 2 + 12 = 14:00',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 8),
          Text(
            '5:30 PM → 5 + 12 = 17:30',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 8),
          Text(
            '9:45 PM → 9 + 12 = 21:45',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _durationCard() {
    return _box(
      const Column(
        children: [
          Text(
            'Movie starts at 2:00 PM',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 7),
          Text(
            'Movie ends at 4:00 PM',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 12),
          Text(
            'Duration = 2 hours',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _elapsedTimeCard() {
    return _box(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Start: 9:15 AM',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 7),
          Text(
            'End: 10:00 AM',
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 12),
          Text(
            'From 9:15 to 10:00 = 45 minutes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _calendarCard() {
    return _box(
      Column(
        children: [
          const Text(
            'Example Calendar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
          const SizedBox(height: 15),
          _calendarGrid(),
        ],
      ),
    );
  }

  Widget _calendarGrid() {
    const days = [
      'M',
      'T',
      'W',
      'T',
      'F',
      'S',
      'S',
    ];

    return Column(
      children: [
        Row(
          children: days
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3949AB),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
        for (int row = 0; row < 4; row++)
          Row(
            children: List.generate(
              7,
              (column) {
                final day = row * 7 + column + 1;

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: day == 15
                          ? const Color(0xFFE8EAF6)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      '$day',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _daysMonthCard() {
    return _box(
      const Column(
        children: [
          _MonthRow(month: 'January', days: '31 days'),
          _MonthRow(month: 'February', days: '28 or 29 days'),
          _MonthRow(month: 'March', days: '31 days'),
          _MonthRow(month: 'April', days: '30 days'),
          _MonthRow(month: 'May', days: '31 days'),
          _MonthRow(month: 'June', days: '30 days'),
          _MonthRow(month: 'July', days: '31 days'),
        ],
      ),
    );
  }

  Widget _leapYearCard() {
    return _box(
      const Column(
        children: [
          Text(
            'A leap year has 366 days.',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'February has 29 days in a leap year.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Example: 2024 was a leap year.',
            style: TextStyle(fontSize: 16),
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
          _RealLifeRow(
            icon: Icons.school_rounded,
            text: 'School starts at a particular time.',
          ),
          _RealLifeRow(
            icon: Icons.directions_bus_rounded,
            text: 'We check time before catching a bus.',
          ),
          _RealLifeRow(
            icon: Icons.sports_soccer_rounded,
            text: 'Sports matches have a fixed duration.',
          ),
          _RealLifeRow(
            icon: Icons.restaurant_rounded,
            text: 'We use time to plan meals and activities.',
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
            'Remember: 60 minutes = 1 hour.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'The short hand shows hours and the long hand shows minutes.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '12:00 PM is noon, while 12:00 AM is midnight.',
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
            '1. How many minutes are in 2 hours?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 120 minutes',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '2. What time is quarter past 4?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 4:15',
            style: TextStyle(
              color: Color(0xFF287D3C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          Text(
            '3. How many days are in a week?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Answer: 7 days',
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

class ClockPainter extends CustomPainter {
  final int hour;
  final int minute;

  ClockPainter({
    required this.hour,
    required this.minute,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = math.min(
      size.width,
      size.height,
    ) *
        0.38;

    final outerPaint = Paint()
      ..color = const Color(0xFF3949AB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final tickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2;

    canvas.drawCircle(
      center,
      radius,
      outerPaint,
    );

    for (int i = 0; i < 60; i++) {
      final angle = (i * 6 - 90) * math.pi / 180;

      final outer = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      final tickLength = i % 5 == 0 ? 13.0 : 6.0;

      final inner = Offset(
        center.dx +
            (radius - tickLength) * math.cos(angle),
        center.dy +
            (radius - tickLength) * math.sin(angle),
      );

      canvas.drawLine(
        inner,
        outer,
        tickPaint,
      );
    }

    for (int number = 1; number <= 12; number++) {
      final angle =
          (number * 30 - 90) * math.pi / 180;

      final position = Offset(
        center.dx +
            radius * 0.76 * math.cos(angle),
        center.dy +
            radius * 0.76 * math.sin(angle),
      );

      final painter = TextPainter(
        text: TextSpan(
          text: '$number',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        textDirection: TextDirection.ltr,
      );

      painter.layout();

      painter.paint(
        canvas,
        Offset(
          position.dx - painter.width / 2,
          position.dy - painter.height / 2,
        ),
      );
    }

    final minuteAngle =
        (minute * 6 - 90) * math.pi / 180;

    final hourAngle =
        (((hour % 12) * 30) +
                (minute * 0.5) -
                90) *
            math.pi /
            180;

    final hourEnd = Offset(
      center.dx +
          radius * 0.50 * math.cos(hourAngle),
      center.dy +
          radius * 0.50 * math.sin(hourAngle),
    );

    final minuteEnd = Offset(
      center.dx +
          radius * 0.68 * math.cos(minuteAngle),
      center.dy +
          radius * 0.68 * math.sin(minuteAngle),
    );

    final hourPaint = Paint()
      ..color = const Color(0xFF3949AB)
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    final minutePaint = Paint()
      ..color = const Color(0xFFFF7043)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      center,
      hourEnd,
      hourPaint,
    );

    canvas.drawLine(
      center,
      minuteEnd,
      minutePaint,
    );

    canvas.drawCircle(
      center,
      6,
      Paint()..color = Colors.black87,
    );
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.hour != hour ||
        oldDelegate.minute != minute;
  }
}

class _TimeUnit extends StatelessWidget {
  final String value;
  final String unit;

  const _TimeUnit({
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3949AB),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialTime extends StatelessWidget {
  final String time;
  final String meaning;

  const _SpecialTime({
    required this.time,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3949AB),
              ),
            ),
          ),
          Expanded(
            child: Text(
              meaning,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeConversion extends StatelessWidget {
  final String twelve;
  final String twentyFour;

  const _TimeConversion({
    required this.twelve,
    required this.twentyFour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              twelve,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Color(0xFF3949AB),
          ),
          Expanded(
            child: Text(
              twentyFour,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3949AB),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthRow extends StatelessWidget {
  final String month;
  final String days;

  const _MonthRow({
    required this.month,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              month,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            days,
            style: const TextStyle(
              color: Color(0xFF3949AB),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _RealLifeRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RealLifeRow({
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
            color: const Color(0xFF3949AB),
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