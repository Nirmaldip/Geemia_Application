import 'package:flutter/material.dart';

class MessageForHouseScreen extends StatelessWidget {
  const MessageForHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/boy.png'),
              radius: 16,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Jhon Abraham',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Active now', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.orange),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildChatBubble("Hello! Jhon abraham", true, "09:25 AM"),
          _buildChatBubble("Hello! Nazrul How are you?", false, "09:25 AM"),
          _buildImageMessage('assets/images/house_one.png'),
          _buildImageMessage('assets/images/house_three.png'),
          _buildTextMessageWithCaption(
            "These are some views of the house. I can send more if you wish to see more.",
            "09:25 AM",
          ),
          _buildChatBubble(
              "If you can send more, I will appreciate that. Thanks.", true, "09:25 AM"),
          const Spacer(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message, bool isSender, String time) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.orange : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildImageMessage(String assetPath) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(assetPath, width: 180, height: 120, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTextMessageWithCaption(String message, String time) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.emoji_emotions, color: Colors.grey),
            const SizedBox(width: 8),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write your message",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: Colors.orange)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic, color: Colors.orange)),
          ],
        ),
      ),
    );
  }
}
