import 'package:flutter/material.dart';

class LoginEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
        child: Image.asset(
          'assets/images/title.png', // your logo path here
          height: 40,
        ),
        // Text("geemia", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold))),
      )),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text("Email address", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: "Your Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              onPressed: () {},
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}