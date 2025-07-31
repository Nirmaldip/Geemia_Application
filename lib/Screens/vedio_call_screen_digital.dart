import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  int _tabIndex = 0;

  final List<String> tabs = ['Connecting', 'Calling', 'Live'];

  void _nextTab() {
    setState(() {
      _tabIndex = (_tabIndex + 1) % tabs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget callContent;
    if (_tabIndex == 0) {
      callContent = _buildCallState("Eniola Mercy", "connecting…", null);
    } else if (_tabIndex == 1) {
      callContent = _buildCallState("Eniola Mercy", "Calling...", "00:32");
    } else {
      callContent = _buildLiveCall("Eniola Mercy", "Content writer", "00:02:52");
    }

    return Scaffold(
      body: GestureDetector(
        onTap: _nextTab, // simulate switching tabs on tap
        child: Stack(
          fit: StackFit.expand,
          children: [
            callContent,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomControls(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallState(String name, String status, String? timer) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/user1.jpg"), // Replace with network or actual image
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              status,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            if (timer != null)
              Text(
                timer,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveCall(String name, String title, String time) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/user2.jpg"), // Replace with live feed or actual image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontSize: 20, color: Colors.white)),
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.white70)),
              Text(time, style: const TextStyle(fontSize: 12, color: Colors.orangeAccent)),
            ],
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/user1.jpg"),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFFFA726),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: const [
          _CallActionButton(icon: Icons.star, label: "Effect"),
          _CallActionButton(icon: Icons.mic_off, label: "Mute"),
          _CallActionButton(icon: Icons.cameraswitch, label: "Flip"),
          _CallActionButton(icon: Icons.call_end, label: "End", isDanger: true),
          _CallActionButton(icon: Icons.videocam, label: "Camera On"),
          _CallActionButton(icon: Icons.volume_up, label: "Speaker"),
        ],
      ),
    );
  }
}

class _CallActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDanger;

  const _CallActionButton({
    required this.icon,
    required this.label,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isDanger ? Colors.red : Colors.white,
          child: Icon(icon, color: isDanger ? Colors.white : Colors.orange),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.white)),
      ],
    );
  }
}
