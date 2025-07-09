import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/dashboard.dart';

// Import your MenuScreen here
import 'menu_screen.dart';

class CongratsScreen extends StatefulWidget {
  @override
  _CongratsScreenState createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/success.png', height: 120),
            SizedBox(height: 24),
            Text(
              "Success!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
