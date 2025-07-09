import 'package:flutter/material.dart';
import 'congrat_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  @override
  _LocationAccessScreenState createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/title.png',
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Log In',
                style: TextStyle(
                  fontFamily: 'ArgentumSans',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFF8A05),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Map Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Whole content
          SafeArea(
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: TextField(
                    controller: _searchController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'ArgentumSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search your location",
                      hintStyle: TextStyle(
                        fontFamily: 'ArgentumSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(0.5)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    ),
                  ),
                ),

                // Spacer to push button to bottom
                Expanded(child: Container()),

                // Allow Location Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 80),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        _showPermissionPopup(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8A05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Allow Location Access",
                        style: TextStyle(
                          fontFamily: 'ArgentumSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Continue Button (Positioned)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CongratsScreen()),
                  );
                },
                child: Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPermissionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            "Allow Location Access",
            style: TextStyle(
              fontFamily: 'ArgentumSans',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          content: Text(
            "We need your location to find services near you.",
            style: TextStyle(
              fontFamily: 'ArgentumSans',
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              child: Text("Deny", style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8A05),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Allow",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
                // Handle permission grant
              },
            ),
          ],
        );
      },
    );
  }
}
