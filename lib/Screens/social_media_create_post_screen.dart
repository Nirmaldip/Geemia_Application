// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class CreatePostScreen extends StatefulWidget {
//   const CreatePostScreen({super.key});
//
//   @override
//   State<CreatePostScreen> createState() => _CreatePostScreenState();
// }
//
// class _CreatePostScreenState extends State<CreatePostScreen> {
//   final TextEditingController _postController = TextEditingController();
//   File? _selectedMedia;
//   String? _mediaType;
//
//   Future<void> _pickImage() async {
//     final XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         _selectedMedia = File(picked.path);
//         _mediaType = 'image';
//       });
//     }
//   }
//
//   Future<void> _pickVideo() async {
//     final XFile? picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         _selectedMedia = File(picked.path);
//         _mediaType = 'video';
//       });
//     }
//   }
//
//   // Future<void> _pickGIF() async {
//   //   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//   //   if (result != null) {
//   //     setState(() {
//   //       _selectedMedia = File(result.files.single.path!);
//   //       _mediaType = 'gif';
//   //     });
//   //   }
//   // }
//
//   void _openPollScreen() {
//     Navigator.push(context, MaterialPageRoute(builder: (_) => const PollScreen()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Create Post", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Text("Post", style: TextStyle(color: Colors.blue)),
//           )
//         ],
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // User Row
//             Row(
//               children: const [
//                 CircleAvatar(
//                   radius: 22,
//                   backgroundImage: AssetImage("assets/images/user.png"),
//                 ),
//                 SizedBox(width: 12),
//                 Text("Kriston Watson", style: TextStyle(color: Colors.white)),
//               ],
//             ),
//             const SizedBox(height: 12),
//             // Text Input
//             TextField(
//               controller: _postController,
//               maxLines: null,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: "What's on your mind?",
//                 hintStyle: TextStyle(color: Colors.white54),
//                 border: InputBorder.none,
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Media Preview
//             if (_selectedMedia != null)
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: FileImage(_selectedMedia!),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             const SizedBox(height: 16),
//             // Action Buttons Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildActionButton(Icons.photo, "Photo", _pickImage),
//                 _buildActionButton(Icons.videocam, "Video", _pickVideo),
//                 // _buildActionButton(Icons.gif, "GIF", _pickGIF),
//                 _buildActionButton(Icons.camera_alt, "Camera", () {}),
//                 _buildActionButton(Icons.poll, "Poll", _openPollScreen),
//                 _buildActionButton(Icons.videocam_rounded, "Live", () {}),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Icon(icon, color: Colors.white, size: 28),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
//         ],
//       ),
//     );
//   }
// }
//
// class PollScreen extends StatelessWidget {
//   const PollScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Create Poll", style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: const Center(
//         child: Text("Poll screen coming soon!", style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'dart:io';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _postController = TextEditingController();
  File? _selectedMedia;
  String? _mediaType;

  Future<void> _pickImage() async {
    final XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedMedia = File(picked.path);
        _mediaType = 'image';
      });
    }
  }

  Future<void> _pickVideo() async {
    final XFile? picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedMedia = File(picked.path);
        _mediaType = 'video';
      });
    }
  }

  // Future<void> _pickGIF() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     setState(() {
  //       _selectedMedia = File(result.files.single.path!);
  //       _mediaType = 'gif';
  //     });
  //   }
  // }

  void _openPollScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const PollScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create Post", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Post", style: TextStyle(color: Colors.blue)),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // User Row
            Row(
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                SizedBox(width: 12),
                Text("Kriston Watson", style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 12),
            // Text Input
            TextField(
              controller: _postController,
              maxLines: null,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            // Media Preview
            if (_selectedMedia != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_selectedMedia!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            const SizedBox(height: 16),
            // Action Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.photo, "Photo", _pickImage),
                _buildActionButton(Icons.videocam, "Video", _pickVideo),
                // _buildActionButton(Icons.gif, "GIF", _pickGIF),
                _buildActionButton(Icons.camera_alt, "Camera", () {}),
                _buildActionButton(Icons.poll, "Poll", _openPollScreen),
                _buildActionButton(Icons.videocam_rounded, "Live", () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}

class PollScreen extends StatelessWidget {
  const PollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create Poll", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text("Poll screen coming soon!", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
