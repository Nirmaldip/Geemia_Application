import 'package:flutter/material.dart';

class AccommodationSeeAllScreen extends StatelessWidget {
  const AccommodationSeeAllScreen({super.key});

  final List<Map<String, String>> accommodations = const [
    {
      'image': 'house_one.png',
      'title': '2-Bedroom Flat',
      'price': '#120,000/month',
      'tag': 'RENT',
      'location': 'Garban, Abuja',
    },
    {
      'image': 'house_two.png',
      'title': 'Duplex House',
      'price': '#2.5m',
      'tag': 'BUY',
      'location': 'Isolo, Lagos',
    },
    {
      'image': 'house_two.png',
      'title': 'Duplex House',
      'price': '#2.5m',
      'tag': 'BUY',
      'location': 'Isolo, Lagos',
    },
    {
      'image': 'house_two.png',
      'title': 'Duplex House',
      'price': '#2.5m',
      'tag': 'BUY',
      'location': 'Isolo, Lagos',
    },
    {
      'image': 'house_two.png',
      'title': 'Duplex House',
      'price': '#2.5m',
      'tag': 'BUY',
      'location': 'Isolo, Lagos',
    },
    {
      'image': 'house_two.png',
      'title': 'Duplex House',
      'price': '#2.5m',
      'tag': 'BUY',
      'location': 'Isolo, Lagos',
    },
    // add more entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accommodation Near You")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: accommodations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final item = accommodations[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      'assets/images/${item['image']}',
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(item['location']!, style: const TextStyle(fontSize: 12)),
                        const SizedBox(height: 4),
                        Text(item['price']!, style: const TextStyle(color: Colors.orange)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
