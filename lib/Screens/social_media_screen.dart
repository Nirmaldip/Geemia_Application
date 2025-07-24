import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/social_media_create_post_screen.dart';
import 'package:geemia_app/Screens/social_media_profile_screen.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top spacing
              const SizedBox(height: 12),

              // Stories
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: const [
                    AddStoryWidget(),
                    StoryAvatarWidget(
                      name: "Samera",
                      imagePath: "assets/images/doll.png",
                    ),
                    StoryAvatarWidget(
                      name: "Julien",
                      imagePath: "assets/images/teena.png",
                    ),
                    StoryAvatarWidget(
                      name: "Mariane",
                      imagePath: "assets/images/sam.png",
                    ),
                    StoryAvatarWidget(
                      name: "Alex",
                      imagePath: "assets/images/doll.png",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Posts
              const PostCard(),
              const PostCard(),
              const PostCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// Bottom Navigation Bar
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.white,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home_outlined),
            IconButton(
              icon: Icon(Icons.add_circle_outline, size: 32),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreatePostScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SocialMediaProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Add Story
class AddStoryWidget extends StatelessWidget {
  const AddStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[400],
          child: const Icon(Icons.add, color: Colors.white),
        ),
        const SizedBox(height: 6),
        const Text("Add Story", style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Story Avatar
class StoryAvatarWidget extends StatelessWidget {
  final String name;
  final String imagePath;

  const StoryAvatarWidget({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
          const SizedBox(height: 6),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Post Card
class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/boy1.png"),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kriston Watson",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "08:39 am",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Caption
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla natoque id aenean.",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 12),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset("assets/images/nature.png"),
            ),

            const SizedBox(height: 12),

            // Actions
            Row(
              children: const [
                Icon(Icons.thumb_up_off_alt, size: 20),
                SizedBox(width: 4),
                Text("1,964"),
                SizedBox(width: 16),
                Icon(Icons.comment_outlined, size: 20),
                SizedBox(width: 4),
                Text("135"),
                SizedBox(width: 16),
                Icon(Icons.share_outlined, size: 20),
                Spacer(),
                Icon(Icons.bookmark_border, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
