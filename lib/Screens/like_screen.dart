import 'package:flutter/material.dart';

class PromoLikesScreen extends StatelessWidget {
  final List<String> userImages = [
    'assets/images/girl.png',
    'assets/images/boy.png',
    'assets/images/girl.png',
    'assets/images/boy.png',
    'assets/images/girl.png',
    'assets/images/boy.png',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontally scrollable user profiles
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: userImages.length,
              separatorBuilder: (_, __) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: index == userImages.length - 1 ? 16 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(userImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.message, size: 16, color: Colors.white),
                          SizedBox(width: 10),
                          Icon(Icons.favorite_border, size: 16, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // User contact info block
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address: jhonabraham20@gmail.com", style: TextStyle(fontSize: 14)),
                SizedBox(height: 6),
                Text("Address: 33 street west suddibazar, sylhet", style: TextStyle(fontSize: 14)),
                SizedBox(height: 6),
                Text("Phone Number: (320) 555-0104", style: TextStyle(fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
