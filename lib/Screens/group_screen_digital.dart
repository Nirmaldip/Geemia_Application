import 'package:flutter/material.dart';

void main() {
  runApp(const GeemiaApp());
}

class GeemiaApp extends StatelessWidget {
  const GeemiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geemia Contacts',
      home: const CreateGroupScreen(),
    );
  }
}

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a group')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What is the group title?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter group name',
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GroupContactListScreen(),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupContactListScreen extends StatelessWidget {
  const GroupContactListScreen({super.key});

  final List<String> names = const [
    'Ariana Grande',
    'Ariana Cooper',
    'Ariana Esther',
    'Ariana Juanita',
    'Ariana Flores',
    'Ariana Flores',
    'Ariana Henry',
    'Ariana Marvin'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Family (12)')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          title: Text(names[index]),
          subtitle: const Text('Studydd'),
          trailing: const Icon(Icons.remove_circle_outline, color: Colors.orange),
        ),
      ),
    );
  }
}
