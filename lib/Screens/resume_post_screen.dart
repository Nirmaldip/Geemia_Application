// screens/resume_list_screen.dart
import 'package:flutter/material.dart';

class ResumeListScreen extends StatelessWidget {
  const ResumeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumes = List.generate(5, (index) => 'Kabil Usman');

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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: resumes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(backgroundImage: AssetImage('assets/avatar.png')),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(resumes[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text('Lorem ipsum dolor sit amet, consectetur...')
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: const [
                      Chip(label: Text('UI/UX Design')),
                      Chip(label: Text('Graphics Design')),
                      Chip(label: Text('HTML/CSS')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      const Text(' 4.9 (23)'),
                      const Spacer(),
                      const Icon(Icons.location_on, size: 18),
                      const Text(' Remote'),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
                        ),
                        child: const Text('\$3k-6k/month', style: TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
