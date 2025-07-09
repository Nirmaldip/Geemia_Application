import 'package:flutter/material.dart';

class JobPostScreen extends StatelessWidget {
  const JobPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Job Post',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title
            const TextField(
              decoration: InputDecoration(
                labelText: 'Job title',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Describe your need',
                labelStyle: const TextStyle(color: Colors.grey),
                alignLabelWithHint: true,
                border: borderStyle,
                contentPadding: const EdgeInsets.all(12),
                helperText: '0/4000 Characters',
                helperStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Drag or upload need images not more than 10mb",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'How would you like to pay the service provider?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            // Radio Options
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Fixed rate'),
                    value: 'fixed',
                    groupValue: 'fixed',
                    onChanged: (val) {},
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Hourly rate'),
                    value: 'hourly',
                    groupValue: '',
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Pricing Input
            const TextField(
              decoration: InputDecoration(
                labelText: 'Pricing',
                labelStyle: TextStyle(color: Colors.grey),
                prefixText: '₦',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Location Inputs (State + Location)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'State',
                      prefixIcon: const Icon(Icons.location_city),
                      border: borderStyle,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      prefixIcon: const Icon(Icons.location_on),
                      border: borderStyle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Post Job Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFFFF8A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Post Job',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
