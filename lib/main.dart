import 'package:flutter/material.dart';
import 'package:geemia_app/provider/location_provider.dart';
import 'package:geemia_app/services/place_services.dart';
// import 'package:geemia_app/provider/location_provider.dart';
// import 'package:geemia_app/retrofit/place_service.dart';
import 'package:provider/provider.dart';
import 'package:geemia_app/Screens/splashScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
           create: (_) => LocationProvider(),
           ),

      ],
      child: GeemiaApp(),
    ),
  );
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
