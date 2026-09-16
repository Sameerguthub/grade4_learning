import 'package:flutter/material.dart';

import 'topics/nouns.dart';
import 'topics/pronouns.dart';
import 'topics/verbs.dart';
import 'topics/adjectives.dart';
import 'topics/adverbs.dart';
import 'topics/articles.dart';
import 'topics/prepositions.dart';
import 'topics/conjunctions.dart';
import 'topics/tenses.dart';
import 'topics/singular_plural.dart';

import 'topics/synonyms_antonyms.dart';
import 'topics/vocabulary.dart';
import 'topics/reading_comprehension.dart';
import 'topics/sentence_formation.dart';

class EnglishTopicsPage extends StatelessWidget {
  const EnglishTopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      {
        'title': 'Nouns',
        'subtitle': 'Names of people, places, animals and things',
        'icon': Icons.person_rounded,
        'color': Colors.blue,
        'page': const NounsPage(),
      },
      {
        'title': 'Pronouns',
        'subtitle': 'Words used instead of nouns',
        'icon': Icons.people_alt_rounded,
        'color': Colors.green,
        'page': const PronounsPage(),
      },
      {
        'title': 'Verbs',
        'subtitle': 'Words that show actions or states',
        'icon': Icons.directions_run_rounded,
        'color': Colors.orange,
        'page': const VerbsPage(),
      },
      {
        'title': 'Adjectives',
        'subtitle': 'Words that describe nouns',
        'icon': Icons.star_rounded,
        'color': Colors.purple,
        'page': const AdjectivesPage(),
      },
      {
        'title': 'Adverbs',
        'subtitle': 'Words that describe actions',
        'icon': Icons.speed_rounded,
        'color': Colors.red,
        'page': const AdverbsPage(),
      },
      {
        'title': 'Articles',
        'subtitle': 'Learn how to use a, an and the',
        'icon': Icons.article_rounded,
        'color': Colors.teal,
        'page': const ArticlesPage(),
      },
      {
        'title': 'Prepositions',
        'subtitle': 'Words that show position or relation',
        'icon': Icons.place_rounded,
        'color': Colors.indigo,
        'page': const PrepositionsPage(),
      },
      {
        'title': 'Conjunctions',
        'subtitle': 'Words that join words and sentences',
        'icon': Icons.link_rounded,
        'color': Colors.deepOrange,
        'page': const ConjunctionsPage(),
      },
      {
        'title': 'Tenses',
        'subtitle': 'Learn present, past and future actions',
        'icon': Icons.schedule_rounded,
        'color': Colors.cyan,
        'page': const TensesPage(),
      },
      {
        'title': 'Singular & Plural',
        'subtitle': 'Learn one and more than one',
        'icon': Icons.filter_1_rounded,
        'color': Colors.brown,
        'page': const SingularPluralPage(),
      },
    
      {
        'title': 'Synonyms & Antonyms',
        'subtitle': 'Similar and opposite meaning words',
        'icon': Icons.sync_alt_rounded,
        'color': Colors.deepPurple,
        'page': const SynonymsAntonymsPage(),
      },
      {
        'title': 'Vocabulary',
        'subtitle': 'Learn useful English words',
        'icon': Icons.auto_awesome_rounded,
        'color': Colors.amber,
        'page': const VocabularyPage(),
      },
      {
        'title': 'Reading Comprehension',
        'subtitle': 'Read passages and answer questions',
        'icon': Icons.menu_book_rounded,
        'color': Colors.lightBlue,
        'page': const ReadingComprehensionPage(),
      },
      {
        'title': 'Sentence Formation & Writing',
        'subtitle': 'Build sentences and write clearly',
        'icon': Icons.edit_note_rounded,
        'color': Colors.blueGrey,
        'page': const SentenceFormationPage(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'English Topics',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];

            return _buildTopicCard(
              context,
              index: index,
              title: topic['title'] as String,
              subtitle: topic['subtitle'] as String,
              icon: topic['icon'] as IconData,
              color: topic['color'] as Color,
              page: topic['page'] as Widget,
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopicCard(
    BuildContext context, {
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => page,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 29,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}. $title',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: Colors.black54,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}