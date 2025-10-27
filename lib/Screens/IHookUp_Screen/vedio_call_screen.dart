// import 'package:flutter/material.dart';
//
// class VideoCallScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background full screen video
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/boy.png'), // Replace with your actual image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // Top-right small user camera preview
//           Positioned(
//             top: 40,
//             right: 20,
//             child: Container(
//               width: 100,
//               height: 140,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/girl.png'), // Replace with actual
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//
//           // Bottom control buttons
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildControlButton(Icons.volume_up, Colors.white),
//                 _buildControlButton(Icons.videocam_off, Colors.white),
//                 _buildControlButton(Icons.mic_off, Colors.white),
//                 _buildControlButton(Icons.call_end, Colors.red),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildControlButton(IconData icon, Color color) {
//     return CircleAvatar(
//       radius: 28,
//       backgroundColor: Colors.black.withOpacity(0.6),
//       child: Icon(icon, color: color, size: 28),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final videoData = appProvider.videoCall ?? {
      "name": "Unknown User",
      "remoteImage": "assets/images/boy.png",
      "localImage": "assets/images/girl.png",
    };

    return Scaffold(
      body: Stack(
        children: [
          // Remote user video
          Positioned.fill(
            child: Image.asset(
              videoData["remoteImage"] ?? "assets/images/boy.png",
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Container(color: Colors.black.withOpacity(0.2)),

          // Top bar with name
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoData["name"] ?? "Unknown",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text("Video Call", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          // Local preview
          Positioned(
            right: 20,
            bottom: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                videoData["localImage"] ?? "assets/images/girl.png",
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Bottom controls
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "mute",
                  backgroundColor: Colors.white24,
                  onPressed: () {},
                  child: const Icon(Icons.mic_off, color: Colors.white, size: 28),
                ),
                FloatingActionButton(
                  heroTag: "end",
                  backgroundColor: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.call_end, size: 30),
                ),
                FloatingActionButton(
                  heroTag: "switch",
                  backgroundColor: Colors.white24,
                  onPressed: () {},
                  child: const Icon(Icons.switch_camera, color: Colors.white, size: 28),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
