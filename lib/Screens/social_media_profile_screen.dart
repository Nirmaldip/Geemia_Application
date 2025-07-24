import 'package:flutter/material.dart';

class SocialMediaProfileScreen extends StatelessWidget {
  final bool showDetails = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Top Banner with Profile Image
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/boy.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: MediaQuery.of(context).size.width / 2 - 45,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage("assets/images/boy.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),

          /// User Info
          Text(
            "Dave C. Brown",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "@dave_brown",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "Google Certified UX/UI Designer",
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 10),

          /// Edit Profile + Settings
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("EDIT PROFILE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.black),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(height: 20),

          /// Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat("100", "Post"),
              _buildStat("120", "Photos"),
              _buildStat("10k", "Followers"),
              _buildStat("64", "Following"),
            ],
          ),
          SizedBox(height: 20),

          /// Toggle Tabs (Post / Details)
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text("Post", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Details", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          /// Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  _buildDetailItem("About", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fringilla natoque id aenean."),
                  _buildDetailItem("Display Name", "Jhon Abraham"),
                  _buildDetailItem("Address", "33 street west, subidbazar, Sylhet 3100, Bangladesh"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
