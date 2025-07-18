import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/accomadation_see_all_screen.dart';
import 'package:geemia_app/Screens/description_screen.dart';
import 'package:geemia_app/Screens/filter_house_screen.dart';
import 'package:geemia_app/Screens/reccommended_see_all_screen.dart';

class HousingDashboard extends StatelessWidget {
  HousingDashboard({super.key});

  final List<Map<String, String>> recommended = [
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
  ];

  final List<Map<String, String>> places = [
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
    {
      'image': 'house_three.png',
      'title': 'Bungalow House',
      'price': '#13.5m',
      'tag': 'SELL',
      'location': 'Phase 1, Lagos',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome home!")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FilterScreen()),
                    );
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _section("Accommodation Near You", recommended, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccommodationSeeAllScreen()),
              );
            }),
            const SizedBox(height: 20),
            _section("Recommended Places", places, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReccommendedSeeAllScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _section(
      String title,
      List<Map<String, String>> data,
      VoidCallback onSeeAll,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(onPressed: onSeeAll, child: const Text("See all")),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final Map<String, String> item = data[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _houseCard(item,context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _houseCard(Map<String, String> item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DescriptionScreen()),
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                'assets/images/${item['image']}',
                height: 100,
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
      ),
    );
  }

}
