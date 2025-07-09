import 'package:flutter/material.dart';

class IncomingCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/girl.png', // blurred background image
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/girl.png'),
              ),
              SizedBox(height: 16),
              Text(
                "Borsha Akther",
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Incoming call",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(height: 5),
                      Text("Remind me", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.message, color: Colors.white),
                      SizedBox(height: 5),
                      Text("Message", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
              GestureDetector(
                onHorizontalDragEnd: (_) {
                  // Accept call logic here
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Slide to answer", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
