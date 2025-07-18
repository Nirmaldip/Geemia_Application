import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search
            TextField(
              decoration: InputDecoration(
                hintText: "Search location",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Services
            const Text("Services", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: ["Buy", "Sell", "Rent", "Lease"]
                  .map((e) => _chip(e))
                  .toList(),
            ),

            const SizedBox(height: 24),

            // Price Range
            const Text("Price Range", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            RangeSlider(
              values: const RangeValues(20000, 100000),
              min: 0,
              max: 200000,
              divisions: 20,
              labels: const RangeLabels("20k", "100k"),
              onChanged: (RangeValues values) {},
            ),

            const SizedBox(height: 24),

            // Home Type
            const Text("Home type", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: ["Flat", "Duplex", "Bungalow", "Single Room"]
                  .map((e) => _chip(e))
                  .toList(),
            ),

            const SizedBox(height: 24),

            // Renting Duration
            const Text("Renting Duration", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: ["Daily", "Monthly", "Yearly"]
                  .map((e) => _chip(e))
                  .toList(),
            ),

            const SizedBox(height: 24),

            // Facilities
            const Text("Facilities", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: [
                "Water",
                "Bathroom",
                "Furnished",
                "Parking",
                "House Cleaners",
                "Security",
                "Eco-Friendly",
                "Generator",
                "Gym",
              ].map((e) => _chip(e)).toList(),
            ),

            const SizedBox(height: 32),

            // Notification toggle
            Row(
              children: [
                Switch(value: true, onChanged: (_) {}),
                const SizedBox(width: 10),
                const Expanded(child: Text("Turn on notification for search")),
              ],
            ),

            const SizedBox(height: 20),

            // Apply Filter Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Apply Filter"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
