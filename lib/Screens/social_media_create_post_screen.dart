import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String visibility = "Public";
  TextEditingController postTextController = TextEditingController();
  File? selectedMedia;
  final ImagePicker _picker = ImagePicker();

  Future<void> _addPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => selectedMedia = File(image.path));
    }
  }

  Future<void> _takeVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() => selectedMedia = File(video.path));
    }
  }

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() => selectedMedia = File(result.files.single.path!));
    }
  }

  void _setBackground() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Set Background selected')));
  }

  void _addGif() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('GIF Picker')));
  }

  void _startLiveVideo() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Live Video Started')));
  }

  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() => selectedMedia = File(photo.path));
    }
  }

  void _createPoll() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Poll Creation')));
  }

  void _submitPost() {
    String text = postTextController.text.trim();
    if (text.isEmpty && selectedMedia == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please write or attach something')));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Post submitted')));
  }

  @override
  Widget build(BuildContext context) {
    List<_PostOption> options = [
      _PostOption(icon: Icons.image_outlined, label: 'Add Photo', onTap: _addPhoto),
      _PostOption(icon: Icons.videocam_outlined, label: 'Take Video', onTap: _takeVideo),
      _PostOption(icon: Icons.insert_drive_file_outlined, label: 'Document', onTap: _pickDocument),
      _PostOption(icon: Icons.format_paint_outlined, label: 'Background', onTap: _setBackground),
      _PostOption(icon: Icons.gif_box_outlined, label: 'GIF', onTap: _addGif),
      _PostOption(icon: Icons.videocam, label: 'Live Video', onTap: _startLiveVideo),
      _PostOption(icon: Icons.photo_camera_outlined, label: 'Camera', onTap: _openCamera),
      _PostOption(icon: Icons.poll_outlined, label: 'Poll', onTap: _createPoll),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(icon: Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: Text('Create a post', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: Text("Post", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Profile + Dropdown
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/user.png'), radius: 22),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: visibility,
                  underline: SizedBox(),
                  items: ["Public", "Private"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) => setState(() => visibility = value!),
                )
              ],
            ),

            SizedBox(height: 12),

            /// TextField
            TextField(
              controller: postTextController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "What's on your mind?",
                border: InputBorder.none,
              ),
            ),

            if (selectedMedia != null) ...[
              SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: selectedMedia!.path.endsWith(".mp4")
                    ? Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.orange.shade100,
                  child: Icon(Icons.videocam, size: 60, color: Colors.orange),
                )
                    : Image.file(selectedMedia!, height: 180, fit: BoxFit.cover),
              ),
            ],

            SizedBox(height: 24),

            /// Features Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: options.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (_, index) {
                final item = options[index];
                return InkWell(
                  onTap: item.onTap,
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon, color: Colors.orange, size: 28),
                      ),
                      SizedBox(height: 6),
                      Text(item.label, style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PostOption {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  _PostOption({required this.icon, required this.label, required this.onTap});
}
