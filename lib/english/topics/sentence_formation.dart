import 'package:flutter/material.dart';
import 'sentence_formation_practice.dart';

class SentenceFormationPage extends StatelessWidget {
  const SentenceFormationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Sentence Formation & Writing',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),

              _buildSection(
                icon: Icons.menu_book_rounded,
                title: 'What is a Sentence?',
                color: Colors.blue,
                children: [
                  _buildText(
                    'A sentence is a group of words that makes complete sense. '
                    'A sentence usually begins with a capital letter and ends '
                    'with a full stop, question mark, or exclamation mark.',
                  ),
                  _buildExample(
                    'Example:',
                    'The boy is playing cricket.',
                  ),
                  _buildExample(
                    'Not a complete sentence:',
                    'playing cricket',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.format_align_left_rounded,
                title: 'Parts of a Sentence',
                color: Colors.green,
                children: [
                  _buildText(
                    'A sentence can have a subject and a predicate.',
                  ),
                  _buildExample(
                    'Subject:',
                    'The girl',
                  ),
                  _buildExample(
                    'Predicate:',
                    'is reading a book.',
                  ),
                  _buildExample(
                    'Complete sentence:',
                    'The girl is reading a book.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.swap_horiz_rounded,
                title: 'Arrange Words to Make Sentences',
                color: Colors.orange,
                children: [
                  _buildText(
                    'Sometimes words are given in the wrong order. '
                    'Arrange them correctly to make a meaningful sentence.',
                  ),
                  _buildExample(
                    'Words:',
                    'school / goes / Riya / to',
                  ),
                  _buildExample(
                    'Correct:',
                    'Riya goes to school.',
                  ),
                  _buildExample(
                    'Words:',
                    'playing / children / are / outside',
                  ),
                  _buildExample(
                    'Correct:',
                    'The children are playing outside.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.text_fields_rounded,
                title: 'Capital Letters',
                color: Colors.purple,
                children: [
                  _buildText(
                    'Always begin a sentence with a capital letter. '
                    'Names of people, places, days, months and special names '
                    'also begin with capital letters.',
                  ),
                  _buildExample(
                    'Wrong:',
                    'rahul lives in mumbai.',
                  ),
                  _buildExample(
                    'Correct:',
                    'Rahul lives in Mumbai.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.stop_circle_outlined,
                title: 'Punctuation Marks',
                color: Colors.red,
                children: [
                  _buildText(
                    'Punctuation marks help us understand sentences correctly.',
                  ),
                  _buildBullet(
                    'Full stop (.) — used for a statement.',
                  ),
                  _buildBullet(
                    'Question mark (?) — used for a question.',
                  ),
                  _buildBullet(
                    'Exclamation mark (!) — shows strong feeling.',
                  ),
                  _buildExample(
                    'Statement:',
                    'I like mangoes.',
                  ),
                  _buildExample(
                    'Question:',
                    'Do you like mangoes?',
                  ),
                  _buildExample(
                    'Exclamation:',
                    'What a beautiful flower!',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.help_outline_rounded,
                title: 'Types of Sentences',
                color: Colors.teal,
                children: [
                  _buildBullet(
                    'Statement — tells us something.',
                  ),
                  _buildBullet(
                    'Question — asks something.',
                  ),
                  _buildBullet(
                    'Command — tells someone to do something.',
                  ),
                  _buildBullet(
                    'Exclamation — expresses strong feelings.',
                  ),
                  _buildExample(
                    'Statement:',
                    'The sun is shining.',
                  ),
                  _buildExample(
                    'Question:',
                    'Where do you live?',
                  ),
                  _buildExample(
                    'Command:',
                    'Please open the door.',
                  ),
                  _buildExample(
                    'Exclamation:',
                    'What a wonderful day!',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.link_rounded,
                title: 'Joining Sentences',
                color: Colors.indigo,
                children: [
                  _buildText(
                    'We can join two simple sentences using words such as '
                    'and, but, because, and so.',
                  ),
                  _buildExample(
                    'Two sentences:',
                    'I was hungry. I ate a sandwich.',
                  ),
                  _buildExample(
                    'Joined:',
                    'I was hungry, so I ate a sandwich.',
                  ),
                  _buildExample(
                    'Two sentences:',
                    'Riya is tired. She finished her homework.',
                  ),
                  _buildExample(
                    'Joined:',
                    'Riya is tired, but she finished her homework.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.edit_rounded,
                title: 'Writing Good Sentences',
                color: Colors.deepOrange,
                children: [
                  _buildText(
                    'A good sentence should be clear, meaningful and complete.',
                  ),
                  _buildBullet(
                    'Start with a capital letter.',
                  ),
                  _buildBullet(
                    'Use words in the correct order.',
                  ),
                  _buildBullet(
                    'Make sure the sentence makes complete sense.',
                  ),
                  _buildBullet(
                    'Use the correct punctuation mark.',
                  ),
                  _buildBullet(
                    'Check spelling before finishing.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.description_rounded,
                title: 'Writing a Short Paragraph',
                color: Colors.cyan,
                children: [
                  _buildText(
                    'A paragraph is a group of sentences about one main topic. '
                    'The sentences should be connected and arranged in a '
                    'logical order.',
                  ),
                  _buildExample(
                    'Topic: My School',
                    'My school is a beautiful place. '
                        'It has many classrooms and a large playground. '
                        'My teachers are kind and helpful. '
                        'I enjoy learning and playing with my friends at school.',
                  ),
                ],
              ),

              _buildSection(
                icon: Icons.lightbulb_rounded,
                title: 'Easy Writing Tips',
                color: Colors.amber.shade800,
                children: [
                  _buildBullet(
                    'Think about what you want to say first.',
                  ),
                  _buildBullet(
                    'Use simple and clear words.',
                  ),
                  _buildBullet(
                    'Put words in the correct order.',
                  ),
                  _buildBullet(
                    'Use capital letters and punctuation.',
                  ),
                  _buildBullet(
                    'Read your sentence again after writing it.',
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _buildPracticeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5C6BC0),
            Color(0xFF3949AB),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.edit_note_rounded,
            color: Colors.white,
            size: 42,
          ),
          SizedBox(height: 12),
          Text(
            'Sentence Formation & Writing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Learn to make correct sentences and write clearly.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...children,
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.55,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(
              Icons.circle,
              size: 7,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                height: 1.45,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExample(String label, String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            height: 1.45,
          ),
          children: [
            TextSpan(
              text: '$label\n',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SentenceFormationPracticePage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz_rounded),
        label: const Text(
          'Start Practice',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3949AB),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}