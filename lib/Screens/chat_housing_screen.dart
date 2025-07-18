import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/message_house_screen.dart';
import 'message_screen.dart';

class ChatsScreenHousing extends StatelessWidget {
  const ChatsScreenHousing({super.key});

  final List<Map<String, String>> chats = const [
    {
      'name': 'Sabila Sayma',
      'message': 'Alright. The house is okay by me.',
      'time': '2 min ago',
      'image': 'boy.png',
    },
    {
      'name': 'Alex Linderson',
      'message': 'How are you today?',
      'time': '2 min ago',
      'image': 'girl.png',
    },
    {
      'name': 'John Borino',
      'message': 'When will you be available for the check...',
      'time': '11/02/23',
      'image': 'boy.png',
    },
    {
      'name': 'Sabila Sayma',
      'message': 'I’m already at the location. And you?',
      'time': '19/03/23',
      'image': 'girl.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: chats.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/${item['image']}'),
            ),
            title: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item['message']!),
            trailing: Text(item['time']!, style: const TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MessageForHouseScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
