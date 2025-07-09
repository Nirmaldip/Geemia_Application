import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/splashScreen.dart';



void main() {
  runApp(GeemiaApp());
}

class GeemiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}