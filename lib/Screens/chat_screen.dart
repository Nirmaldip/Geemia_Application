import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/incoming_call_screen.dart';
import 'package:geemia_app/Screens/vedio_call_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/boy.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jhon Abraham",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Active now", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncomingCallScreen()),
              );
            },
          ),
          SizedBox(width: 5),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoCallScreen()),
              );
            },
          ),
          SizedBox(width: 10),
        ],

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Center(
                    child: Text("Today", style: TextStyle(color: Colors.grey, fontSize: 12))),
                SizedBox(height: 15),

                // Orange Sender Message
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Hello! Jhon abraham", style: TextStyle(color: Colors.white)),
                  ),
                ),

                // Receiver Message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Hello! Nazrul How are you?", style: TextStyle(color: Colors.black)),
                  ),
                ),

                // Orange Sender Message
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("You did your job well!", style: TextStyle(color: Colors.white)),
                  ),
                ),

                // Receiver Message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("Have a great working week!", style: TextStyle(color: Colors.black)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("Hope you like it", style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),

                // Voice Message Mockup
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 10),
                        Container(
                          width: 60,
                          height: 4,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text("0:16", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Chat Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write your message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.attach_file, color: Colors.black),
                SizedBox(width: 10),
                Icon(Icons.mic, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
