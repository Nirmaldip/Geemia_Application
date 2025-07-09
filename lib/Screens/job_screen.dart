import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/job_detailed_screen.dart';
import 'package:geemia_app/Screens/job_post_screen.dart';
import 'package:geemia_app/Screens/resume_listing.dart';

class GeemiaHomeScreen extends StatefulWidget {
  const GeemiaHomeScreen({super.key});

  @override
  State<GeemiaHomeScreen> createState() => _GeemiaHomeScreenState();
}

class _GeemiaHomeScreenState extends State<GeemiaHomeScreen> {
  bool isGigsSelected = true;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.settings, 'label': 'Tech'},
    {'icon': Icons.school, 'label': 'Education'},
    {'icon': Icons.health_and_safety, 'label': 'Health'},
    {'icon': Icons.agriculture, 'label': 'Agriculture'},
    {'icon': Icons.more_horiz, 'label': 'Others'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("geemia", style: TextStyle(color: Colors.orange, fontSize: 24)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Column(
        children: [
          ToggleButtons(
            borderRadius: BorderRadius.circular(8),
            isSelected: [isGigsSelected, !isGigsSelected],
            onPressed: (index) {
              setState(() => isGigsSelected = index == 0);
            },
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text('Gigs', style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text('Resumes', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: isGigsSelected ? "Search gigs" : "Search resume",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: isGigsSelected ? _buildCategoriesGrid() : _buildGigsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: categories.map((item) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange.withOpacity(0.2),
                child: Icon(item['icon'], color: Colors.orange, size: 28),
              ),
              const SizedBox(height: 8),
              Text(item['label'], style: const TextStyle(fontSize: 14)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGigsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2, // Replace with your dynamic data
      itemBuilder: (context, index) {
        return _buildJobCard();
      },
    );
  }

  Widget _buildJobCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResumeCategoryScreen()),);},

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Junior Graphic and Product Designer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Objectus Technologies, LLC", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Row(
              children: const [
                CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/100')),
                SizedBox(width: 4),
                CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/101')),
                SizedBox(width: 4),
                CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://i.pravatar.cc/102')),
                SizedBox(width: 6),
                Text("+3 applied", style: TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [Colors.purple, Colors.orange]),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsScreen()),);},
                      child: const Text("Remote", style: TextStyle(color: Colors.white, fontSize: 12))),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobPostScreen()),);},
                      child: const Text("\$3k-6k/month", style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
