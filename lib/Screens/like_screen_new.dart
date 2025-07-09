import 'package:flutter/material.dart';

class LikesYouScreen extends StatelessWidget {
  final List<Map<String, String>> likes = [
    {
      "name": "Linda",
      "age": "23",
      "image": "assets/images/girl1.png",
    },
    {
      "name": "Mott",
      "age": "22",
      "image": "assets/images/girl2.png",
    },
    {
      "name": "Sana",
      "age": "24",
      "image": "assets/images/girl3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Likes you", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cards Scroll
            Container(
              height: 260,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: likes.length,
                separatorBuilder: (_, __) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final user = likes[index];
                  return Container(
                    width: 180,
                    margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index == likes.length - 1 ? 16 : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(user['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${user['name']}, ${user['age']}",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.clear, color: Colors.red),
                                    radius: 16,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.favorite, color: Colors.green),
                                    radius: 16,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.chat_bubble, color: Colors.blue),
                                    radius: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // Contact Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoRow("Email Address", "jhonabraham20@gmail.com"),
                  SizedBox(height: 10),
                  infoRow("Address", "33 street west subidbazar, sylhet"),
                  SizedBox(height: 10),
                  infoRow("Phone Number", "(320) 555-0104"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.black87, fontSize: 14)),
      ],
    );
  }
}
