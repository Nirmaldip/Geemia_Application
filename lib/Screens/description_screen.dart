import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/chat_housing_screen.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duplex House'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/house_two.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Title and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Duplex House',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text('BUY'),
                  backgroundColor: Colors.orange,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '#2.5m',
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non urna at orci accumsan sollicitudin. Aliquam erat volutpat.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Facilities
            const Text(
              'Facilities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 10,
              children: const [
                FacilityItem(title: 'Potable Water'),
                FacilityItem(title: 'Bathroom'),
                FacilityItem(title: 'Furnished'),
                FacilityItem(title: 'House Cleaners'),
                FacilityItem(title: 'Security'),
                FacilityItem(title: 'Eco-Friendly'),
                FacilityItem(title: 'Generator'),
                FacilityItem(title: 'Parking Lot'),
              ],
            ),
            const SizedBox(height: 24),

            // Map Placeholder
            const Text(
              'Location on Map',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text('Map Placeholder'),
            ),
            const SizedBox(height: 24),

            // Gallery Preview
            const Text(
              'Gallery',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  galleryImage('house_two.png'),
                  galleryImage('house_one.png'),
                  galleryImage('house_three.png'),
                  galleryImage('house_one.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Send Message Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatsScreenHousing()),
                  );
                },
                child: const Text(
                  'Send Message',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget galleryImage(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/$name',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final String title;

  const FacilityItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, size: 16, color: Colors.orange),
        const SizedBox(width: 4),
        Text(title, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
