// import 'package:flutter/material.dart';
//
// class IncomingCallScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/images/girl.png', // blurred background image
//             fit: BoxFit.cover,
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.4),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/girl.png'),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 "Borsha Akther",
//                 style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 "Incoming call",
//                 style: TextStyle(color: Colors.white70, fontSize: 16),
//               ),
//               SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       Icon(Icons.access_time, color: Colors.white),
//                       SizedBox(height: 5),
//                       Text("Remind me", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Icon(Icons.message, color: Colors.white),
//                       SizedBox(height: 5),
//                       Text("Message", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 60),
//               GestureDetector(
//                 onHorizontalDragEnd: (_) {
//                   // Accept call logic here
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
//                   decoration: BoxDecoration(
//                     color: Colors.white24,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Text("Slide to answer", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/app_provider.dart';

class VoiceCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final callData = appProvider.incomingCall ?? {
      "name": "Unknown User",
      "image": "assets/images/girl.png",
      "status": "Voice Call"
    };

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            callData["image"] ?? "assets/images/girl.png",
            fit: BoxFit.cover,
          ),
          Container(color: Colors.black.withOpacity(0.6)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(callData["image"] ?? "assets/images/girl.png"),
              ),
              const SizedBox(height: 20),
              Text(
                callData["name"] ?? "Unknown",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                callData["status"] ?? "Voice Call",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "decline",
                    backgroundColor: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.call_end, size: 30),
                  ),
                  FloatingActionButton(
                    heroTag: "accept",
                    backgroundColor: Colors.green,
                    onPressed: () {
                      // Accept Call
                    },
                    child: const Icon(Icons.call, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
