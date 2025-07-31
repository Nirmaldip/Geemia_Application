import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/dms_details_screen_digital.dart';
import 'package:geemia_app/Screens/housing_screen.dart';
import 'package:geemia_app/Screens/job_screen.dart';
import 'package:geemia_app/Screens/market_feed_screen.dart';
import 'package:geemia_app/Screens/social_media_screen.dart';

import 'hooke_up_screen.dart' show IHookupScreen, SwipeScreen;
import 'menu_screen.dart';
import 'message_screen.dart' show ConnectionScreen, MessagesScreen;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuScreen(), // Drawer added
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          automaticallyImplyLeading: false, // avoid default back button
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder:
                            (context) => IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed:
                                  () => Scaffold.of(context).openDrawer(),
                            ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'geemia',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.notifications_none,
                        size: 28,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE5CC),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Search services",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Search Bar
              SizedBox(height: 30),

              // Services Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9,
                children: [
                  serviceItem(
                    "Digital System",
                    Icons.laptop,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DmsDetailScreen(),
                        ),
                      );
                    },
                  ),
                  serviceItem(
                    "Social Media",
                    Icons.people,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SocialMediaScreen(),
                        ),
                      );
                    },
                  ),
                  serviceItem(
                    "Jobs",
                    Icons.work,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeemiaHomeScreen(),
                        ),
                      );
                    },
                  ),

                  serviceItem(
                    "iHookup",
                    Icons.favorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IHookupScreen(),
                        ),
                      );
                    },
                  ),

                  serviceItem(
                    "Market",
                    Icons.shopping_cart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarketFeedScreen(),
                        ),
                      );
                    },
                  ),

                  serviceItem(
                    "Housing",
                    Icons.home,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HousingScreen(),
                        ),
                      );
                    },
                  ),
                  serviceItem("Wallet", Icons.account_balance_wallet),
                  serviceItem("Recording", Icons.mic),
                ],
              ),

              SizedBox(height: 30),

              // Notification Banner
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yay! You have a new message.",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "2 hours ago",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Offer Banner
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Grab your great offer Today!",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceItem(String title, IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.orange),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                title,
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
