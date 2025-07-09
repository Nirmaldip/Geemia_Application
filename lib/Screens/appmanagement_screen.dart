import 'package:flutter/material.dart';

class AppManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("App Management",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: ListView(
         // padding: const EdgeInsets.all(16.0),
        children: [
          Divider(),
          SizedBox(height: 10,),
          buildSectionTitle("Active Features"),
          SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 3, // changed from 4 -> 3
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              featureItem("Digital\nSystem", Icons.remove_circle, Colors.orange, Icons.flash_on),
              featureItem("Social\nMedia", Icons.remove_circle, Colors.orange, Icons.people),
              featureItem("Market", Icons.remove_circle, Colors.orange, Icons.storefront),
              featureItem("iHookup", Icons.remove_circle, Colors.orange, Icons.favorite),
            ],
          ),
          SizedBox(height: 30),
          buildSectionTitle("Freezed Features"),
          SizedBox(height: 15),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              featureItem("Housing", Icons.add_circle, Colors.orange, Icons.home),
              featureItem("Jobs", Icons.add_circle, Colors.orange, Icons.work),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFFFD9A0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget featureItem(
      String title, IconData actionIcon, Color actionColor, IconData mainIcon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF5EC),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(mainIcon, size: 28, color: Colors.orange),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 2),
                ],
              ),
              child: Icon(actionIcon, size: 18, color: actionColor),
            ),
          ),
        ],
      ),
    );
  }
}
