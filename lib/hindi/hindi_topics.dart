import 'package:flutter/material.dart';

import 'topics/varnamala.dart';
import 'topics/matra.dart';
import 'topics/sangya.dart';
import 'topics/sarvanam.dart';
import 'topics/kriya.dart';
import 'topics/ling_vachan.dart';
import 'topics/paryayvachi_vilom.dart';
import 'topics/vakya_rachna.dart';
import 'topics/hindi_stories.dart';

class HindiTopicsPage extends StatelessWidget {
  const HindiTopicsPage({super.key});

  final List<Map<String, dynamic>> topics = const [
    {
      'title': 'वर्णमाला',
      'subtitle': 'स्वर और व्यंजन सीखें',
      'icon': Icons.abc,
      'color': Color(0xFFE87535),
    },
    {
      'title': 'मात्राएँ',
      'subtitle': 'मात्राओं का सही प्रयोग',
      'icon': Icons.text_fields,
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'संज्ञा',
      'subtitle': 'व्यक्ति, स्थान, वस्तु और प्राणी',
      'icon': Icons.person,
      'color': Color(0xFF2196F3),
    },
    {
      'title': 'सर्वनाम',
      'subtitle': 'संज्ञा के स्थान पर आने वाले शब्द',
      'icon': Icons.people,
      'color': Color(0xFF9C27B0),
    },
    {
      'title': 'क्रिया',
      'subtitle': 'काम बताने वाले शब्द',
      'icon': Icons.directions_run,
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'लिंग और वचन',
      'subtitle': 'पुल्लिंग, स्त्रीलिंग और वचन',
      'icon': Icons.compare_arrows,
      'color': Color(0xFFE91E63),
    },
    {
      'title': 'पर्यायवाची और विलोम',
      'subtitle': 'समान और विपरीत अर्थ वाले शब्द',
      'icon': Icons.sync_alt,
      'color': Color(0xFF673AB7),
    },
    {
      'title': 'वाक्य रचना',
      'subtitle': 'सही शब्द क्रम से वाक्य बनाएँ',
      'icon': Icons.format_align_left,
      'color': Color(0xFF00ACC1),
    },
    {
      'title': 'हिंदी कहानियाँ',
      'subtitle': 'रोचक कहानियाँ पढ़ें और सीखें',
      'icon': Icons.menu_book,
      'color': Color(0xFFFF9800),
    },
  ];

  void _openTopic(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const VarnamalaPage();
        break;

      case 1:
        page = const MatraPage();
        break;

      case 2:
        page = const SangyaPage();
        break;

      case 3:
        page = const SarvanamPage();
        break;

      case 4:
        page = const KriyaPage();
        break;

      case 5:
        page = const LingVachanPage();
        break;

      case 6:
        page = const ParyayvachiVilomPage();
        break;

      case 7:
        page = const VakyaRachnaPage();
        break;

      case 8:
        page = const HindiStoriesPage();
        break;

      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      appBar: AppBar(
        title: const Text(
          'हिंदी व्याकरण',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE87535),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFA726),
                    Color(0xFFE87535),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 42,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'हिंदी सीखें!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'पढ़ो, समझो और अभ्यास करो!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'सीखने के विषय',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...List.generate(
              topics.length,
              (index) {
                final topic = topics[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => _openTopic(context, index),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                              color: topic['color'].withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              topic['icon'],
                              color: topic['color'],
                              size: 29,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topic['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  topic['subtitle'],
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xFFFF9800),
                    size: 28,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'टिप: पहले विषय पढ़ो, उदाहरण समझो और फिर Practice करके अपना ज्ञान जाँचो।',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}