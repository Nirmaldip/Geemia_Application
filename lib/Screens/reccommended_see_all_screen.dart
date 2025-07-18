import 'package:flutter/material.dart';

class ReccommendedSeeAllScreen extends StatelessWidget {
  const ReccommendedSeeAllScreen({super.key});

  final List<Map<String, String>> places = const [
    {
      'image': 'house_one.png',
      'title': 'Single Room',
      'price': '#70,000/month',
      'tag': 'LEASE',
      'location': 'Garban, Abuja',
    },
    {
      'image': 'house_one.png',
      'title': 'Bungalow House',
      'price': '#13.5m',
      'tag': 'SELL',
      'location': 'Phase 1, Lagos',
    },
    {
      'image': 'house_two.png',
      'title': 'Single Room',
      'price': '#70,000/month',
      'tag': 'LEASE',
      'location': 'Garban, Abuja',
    },
    {
      'image': 'house_three.png',
      'title': 'Bungalow House',
      'price': '#13.5m',
      'tag': 'SELL',
      'location': 'Phase 1, Lagos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Places'),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = places[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                  child: Image.asset(
                    'assets/images/${item['image']}',
                    height: 100,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),

                // Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tag & Favorite Icon
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                item['tag']!,
                                style: const TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.favorite_border, size: 16),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['title']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item['location']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['price']!,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
