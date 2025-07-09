import 'package:flutter/material.dart';

import 'chat_screen.dart' show ChatScreen;

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget connectionTab() {
    return ListView(
      children: [
        chatTile("Sabila Sayma", "Don't miss to attend the meeting.", "2 min ago", "assets/images/girl.png", 3),
        chatTile("Alex Linderson", "How are you today?", "2 min ago", "assets/images/boy.png", 3),
        chatTile("John Ahraham", "Hey! Can you join the meeting?", "2 min ago", "assets/images/boy.png", 0, hasBell: true),
        chatTile("John Borino", "How are you today?", "2 min ago", "assets/images/boy.png", 5),
        chatTile("Sabila Sayma", "Don't miss to attend the meeting.", "2 min ago", "assets/images/girl.png", 0),
      ],
    );
  }

  Widget chatTile(String name, String msg, String time, String image, int unreadCount, {bool hasBell = false}) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 24),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(msg),
      trailing: hasBell
          ? Icon(Icons.notifications, color: Colors.black)
          : unreadCount > 0
          ? Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Text("$unreadCount", style: TextStyle(color: Colors.white, fontSize: 12)))
          : null,
    );
  }

  Widget matchesTab() {
    return ListView(
      children: [
        matchTile("Sabila Sayma", "Start chatting with Sabila Sayma.", "assets/images/girl.png"),
        matchTile("John Borino", "Do you like John Borino too?", "assets/images/boy.png"),
      ],
    );
  }

  Widget matchTile(String name, String msg, String image) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 24),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(msg),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
    onTap: () {
    // Add your navigation or action here
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ChatScreen()),
    );
    },
    child: Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
    "Start chat",
    style: TextStyle(color: Colors.white, fontSize: 12),
    ),
    ),
    ),

    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('geemia', style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange,
            labelColor: Colors.black,
            tabs: [
              Tab(child: Text("Connection", style: TextStyle(fontWeight: FontWeight.bold))),
              Tab(child: Text("Matches", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                connectionTab(),
                matchesTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.orange), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
