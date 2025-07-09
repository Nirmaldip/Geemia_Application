import 'package:flutter/material.dart';

import 'appmanagement_screen.dart';
import 'dashboard.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your profile image
                  ),
                  SizedBox(width: 20,height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dave C. Brown',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '@DaveCROWN',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),

            // Menu List
            Expanded(
              child: ListView(
                children: [
                  buildMenuItem(context, Icons.person, 'Personal Information', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }),
                  buildMenuItem(context, Icons.apps, 'App Management', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppManagementScreen()),
                    );
                  }),
                  buildMenuItem(context, Icons.privacy_tip, 'Privacy and Safety', () {}),
                  buildMenuItem(context, Icons.security, 'Security', () {}),
                  buildMenuItem(context, Icons.qr_code, 'QR Code', () {}),
                  buildMenuItem(context, Icons.notifications, 'Notification', () {}),
                  buildMenuItem(context, Icons.help_outline, 'Help Center', () {}),
                ],
              ),
            ),
            Divider(),
            // Logout button at bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Log out', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500)),
                onTap: () {
                  // logout function here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black, size: 26),
      title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
