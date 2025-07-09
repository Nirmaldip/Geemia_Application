import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/resume_post_screen.dart';

class ResumeCategoryScreen extends StatelessWidget {
  const ResumeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Tech', 'icon': Icons.engineering},
      {'title': 'Education', 'icon': Icons.school},
      {'title': 'Health', 'icon': Icons.health_and_safety},
      {'title': 'Agriculture', 'icon': Icons.agriculture},
      {'title': 'Others', 'icon': Icons.more_horiz},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumes', style: TextStyle(color: Colors.orange)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search resume',
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
          onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResumeListScreen()),);},

    child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: categories.map((cat) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange.shade100,
                        radius: 28,
                        child: Icon(cat['icon'], color: Colors.orange),
                      ),
                      const SizedBox(height: 6),
                      Text(cat['title'], style: const TextStyle(fontWeight: FontWeight.w500))
                    ],
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

