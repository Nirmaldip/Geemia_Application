import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background full screen video
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/boy.png'), // Replace with your actual image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top-right small user camera preview
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/girl.png'), // Replace with actual
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom control buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(Icons.volume_up, Colors.white),
                _buildControlButton(Icons.videocam_off, Colors.white),
                _buildControlButton(Icons.mic_off, Colors.white),
                _buildControlButton(Icons.call_end, Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.black.withOpacity(0.6),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
