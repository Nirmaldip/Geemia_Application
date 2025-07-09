import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  final List<String> promoImages = [
    'assets/images/girl.png',
    'assets/images/boy.png',
    'assets/images/boy.png',
    'assets/images/boy.png',
    'assets/images/girl.png',
    'assets/images/boy.png',
    'assets/images/girl.png',
    'assets/images/girl.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF5F1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: promoImages
                      .map((image) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      height: 90,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Hope for more\nlikes?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                "Join the extraordinary community,\ncomplete your profile and make every swipe count. Start your journey now!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to profile or upgrade screen
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text("Complete profile", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
