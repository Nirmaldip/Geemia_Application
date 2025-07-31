import 'package:flutter/material.dart';

class GroupContactScreen extends StatelessWidget {
  const GroupContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('geemia'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Group'),
              Tab(text: 'All Contact'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GroupTab(),
            AllContactTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateGroupScreen()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class GroupTab extends StatelessWidget {
  const GroupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Group',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              GroupItem(title: 'Family', count: 12),
              GroupItem(title: 'Friend', count: 12),
              GroupItem(title: 'Work', count: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class GroupItem extends StatelessWidget {
  final String title;
  final int count;

  const GroupItem({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title ($count)'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Navigate to contact list inside group
      },
    );
  }
}

class AllContactTab extends StatelessWidget {
  const AllContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {'name': 'Ariana Grande', 'role': 'Studyadd'},
      {'name': 'Ariana Cooper', 'role': 'Studyadd'},
      {'name': 'Ariana Esther', 'role': 'Studyadd'},
      {'name': 'Ariana Juanita', 'role': 'Studyadd'},
    ];

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Contact',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text(contact['name']![0]),
                ),
                title: Text(contact['name']!),
                subtitle: Text(contact['role']!),
                trailing: const Icon(Icons.call, color: Colors.orange),
                onTap: () {
                  // Initiate call here
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a group"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("What is the group title?"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter group name',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // Save group logic here
                  Navigator.pop(context);
                },
                child: const Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
