import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final Map<String, List<String>> galleryData = {
    'Bedroom': [
      'assets/images/kitchen.png',
      'assets/images/kitchen_one.png',
      'assets/images/kitchen_one.png',
    ],
    'Bathroom': [
      'assets/images/kitchen.png',
      'assets/images/kitchen_one.png',
    ],
    'Outside View': [
      'assets/images/kitchen.png',
      'assets/images/kitchen_one.png',
    ],
    'Kitchen': [
      'assets/images/kitchen.png',
      'assets/images/kitchen_three.png',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        leading: BackButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: galleryData.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Navigate to full screen category
                    },
                    child: Text('See all'),
                  )
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (_, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(entry.value[index], width: 120, fit: BoxFit.cover),
                  ),
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}
