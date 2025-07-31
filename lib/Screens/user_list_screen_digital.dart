import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> users = [
      {"name": "Ariana Grande", "location": "Stuyosd"},
      {"name": "Ariana Cooper", "location": "Stuyosd"},
      {"name": "Ariana Esther", "location": "Stuyosd"},
      {"name": "Ariana Juanita", "location": "Stuyosd"},
      {"name": "Ariana Flores", "location": "Stuyosd"},
      {"name": "Ariana Henry", "location": "Stuyosd"},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('geemia', style: TextStyle(color: Colors.orange)),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Contact'),
              Tab(text: 'Users'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search user",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const Center(child: Text("Contact List")),
                  ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'), // Placeholder
                        ),
                        title: Text(user["name"]!),
                        subtitle: Text(user["location"]!),
                        trailing: IconButton(
                          icon: const Icon(Icons.video_call, color: Colors.orange),
                          onPressed: () {},
                        ),
                      );
                    },
                  ),
                  const Center(child: Text("History List")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
