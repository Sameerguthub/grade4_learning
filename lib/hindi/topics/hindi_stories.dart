import 'package:flutter/material.dart';
import 'hindi_stories_practice.dart';

class HindiStoriesPage extends StatelessWidget {
  const HindiStoriesPage({super.key});

  static const List<Map<String, dynamic>> stories = [
    {
      'title': 'प्यासा कौआ',
      'icon': Icons.water_drop,
      'story':
          'एक कौआ बहुत प्यासा था। उसे कहीं पानी नहीं मिला। '
          'आखिर उसे एक घड़ा दिखाई दिया। घड़े में थोड़ा पानी था, '
          'लेकिन उसकी चोंच पानी तक नहीं पहुँच रही थी। '
          'कौए ने घड़े में एक-एक करके कंकड़ डालने शुरू किए। '
          'पानी ऊपर आ गया और कौए ने पानी पी लिया।',
      'moral': 'जहाँ चाह, वहाँ राह।',
    },
    {
      'title': 'ईमानदार लकड़हारा',
      'icon': Icons.forest,
      'story':
          'एक लकड़हारा नदी के किनारे लकड़ी काट रहा था। '
          'अचानक उसकी कुल्हाड़ी नदी में गिर गई। वह बहुत दुखी हुआ। '
          'तभी एक देवदूत उसके पास आया। उसने पहले सोने की कुल्हाड़ी दिखाई, '
          'लेकिन लकड़हारे ने कहा कि यह उसकी कुल्हाड़ी नहीं है। '
          'फिर चाँदी की कुल्हाड़ी दिखाई गई। लकड़हारे ने उसे भी मना कर दिया। '
          'अंत में उसकी लोहे की कुल्हाड़ी मिली। उसकी ईमानदारी देखकर उसे '
          'तीनों कुल्हाड़ियाँ दे दी गईं।',
      'moral': 'ईमानदारी सबसे अच्छी नीति है।',
    },
    {
      'title': 'एकता में बल',
      'icon': Icons.groups,
      'story':
          'एक किसान के चार बेटे थे। वे हमेशा आपस में लड़ते रहते थे। '
          'किसान बहुत परेशान था। एक दिन उसने बेटों को लकड़ियों का एक गट्ठर '
          'दिया और उसे तोड़ने को कहा। किसी से भी गट्ठर नहीं टूटा। '
          'फिर किसान ने लकड़ियाँ अलग-अलग करके दीं। सभी बेटों ने उन्हें '
          'आसानी से तोड़ दिया। किसान ने समझाया कि अगर वे साथ रहेंगे तो '
          'कोई उन्हें आसानी से नहीं हरा सकेगा।',
      'moral': 'एकता में बल है।',
    },
    {
      'title': 'शेर और चूहा',
      'icon': Icons.pets,
      'story':
          'एक दिन एक शेर जंगल में सो रहा था। एक छोटा चूहा खेलते-खेलते '
          'शेर के ऊपर चढ़ गया। शेर ने उसे पकड़ लिया। चूहे ने माफी माँगी '
          'और कहा कि कभी न कभी वह शेर की मदद जरूर करेगा। शेर ने उसे '
          'छोड़ दिया। कुछ दिनों बाद शेर एक शिकारी के जाल में फँस गया। '
          'चूहे ने अपने तेज दाँतों से जाल काट दिया और शेर को आजाद कर दिया।',
      'moral': 'छोटा व्यक्ति भी बड़ी मदद कर सकता है।',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: const Text(
          'कहानियाँ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE87535),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHero(),

            const SizedBox(height: 20),

            const Text(
              'पढ़ो और सीखो',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'छोटी-छोटी कहानियाँ पढ़ो और उनसे अच्छी बातें सीखो।',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 18),

            ...stories.asMap().entries.map(
              (entry) => _storyCard(
                context,
                entry.key + 1,
                entry.value,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5D3),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Color(0xFFE87535),
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'कहानी पढ़ते समय नए शब्दों और कहानी की सीख पर ध्यान दें।',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const HindiStoriesPracticePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.quiz),
                label: const Text(
                  'कहानी अभ्यास',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE87535),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF08A45),
            Color(0xFFD85C2C),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'कहानी की दुनिया',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'पढ़ो • समझो • सीखो',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 5,
            child: CustomPaint(
              size: const Size(145, 125),
              painter: _StoryPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyCard(
    BuildContext context,
    int number,
    Map<String, dynamic> story,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 2),
            color: Color(0x12000000),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StoryReadingPage(
                storyNumber: number,
                story: story,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5D3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  story['icon'],
                  color: const Color(0xFFE87535),
                  size: 30,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'कहानी $number',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      story['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryReadingPage extends StatelessWidget {
  final int storyNumber;
  final Map<String, dynamic> story;

  const StoryReadingPage({
    super.key,
    required this.storyNumber,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        title: Text(story['title']),
        backgroundColor: const Color(0xFFE87535),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF08A45),
                    Color(0xFFD85C2C),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Icon(
                    story['icon'],
                    color: Colors.white,
                    size: 55,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    story['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                story['story'],
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.7,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5D3),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb,
                    color: Color(0xFFE87535),
                    size: 30,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'कहानी की सीख',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          story['moral'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const HindiStoriesPracticePage(),
                    ),
                  );
                },
                icon: const Icon(Icons.quiz),
                label: const Text(
                  'कहानी अभ्यास करें',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE87535),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white;

    // Book
    final leftPage = Path()
      ..moveTo(12, 65)
      ..quadraticBezierTo(45, 52, 70, 67)
      ..lineTo(70, 112)
      ..quadraticBezierTo(42, 98, 12, 112)
      ..close();

    final rightPage = Path()
      ..moveTo(70, 67)
      ..quadraticBezierTo(100, 52, 133, 65)
      ..lineTo(133, 112)
      ..quadraticBezierTo(100, 98, 70, 112)
      ..close();

    canvas.drawPath(leftPage, paint);
    canvas.drawPath(rightPage, paint);

    final linePaint = Paint()
      ..color = const Color(0xFFE87535)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(27, 76),
      const Offset(57, 76),
      linePaint,
    );

    canvas.drawLine(
      const Offset(83, 76),
      const Offset(115, 76),
      linePaint,
    );

    canvas.drawLine(
      const Offset(27, 87),
      const Offset(57, 87),
      linePaint,
    );

    canvas.drawLine(
      const Offset(83, 87),
      const Offset(115, 87),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}