import 'package:flutter/material.dart';

class SocialMediaProfileScreen extends StatefulWidget {
  const SocialMediaProfileScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<SocialMediaProfileScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Section - Banner and Avatar
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/girl.png'), // Banner Image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40, // Adjust based on status bar height
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                ),
              ),


              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/girl.png'), // Profile Pic
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Name and Bio
          const Text("Dave C. Brown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("@dave_brown",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 4),
          const Text("Google Certified UX/UI Designer",
              style: TextStyle(fontSize: 14)),

          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color(0xfff3f3f3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text("EDIT PROFILE"),
          ),

          const SizedBox(height: 16),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildStat("100", "Post"),
                buildStat("120", "Photos"),
                buildStat("10k", "Followers"),
                buildStat("64", "Following"),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tabs
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(text: "Post"),
              Tab(text: "Details"),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Post tab
                Center(child: Text("Posts will appear here")),
                // Details tab
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                      SizedBox(height: 16),

                      Text("Display Name", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Jhon Abraham"),
                      SizedBox(height: 16),

                      Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("35 street west subidbazar, sylhet, shahjalal"),
                      SizedBox(height: 16),

                      Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Male"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
