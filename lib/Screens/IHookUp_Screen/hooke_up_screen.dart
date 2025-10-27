// // import 'package:flutter/material.dart';
// // import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// // import 'package:geemia_app/Screens/like_profile.dart';
// // import 'package:geemia_app/Screens/like_screen.dart';
// //
// // class IHookupScreen extends StatefulWidget {
// //   @override
// //   _IHookupScreenState createState() => _IHookupScreenState();
// // }
// //
// // class _IHookupScreenState extends State<IHookupScreen> {
// //   final List<Map<String, String>> cards = [
// //     {"name": "Kalvin, 23", "image": "assets/images/girl.png"},
// //     {"name": "Kallina, 23", "image": "assets/images/boy.png"},
// //     {"name": "Alex, 25", "image": "assets/images/girl.png"},
// //     {"name": "Sarah, 24", "image": "assets/images/boy.png"},
// //   ];
// //
// //   int _selectedIndex = 0;
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //
// //     // Navigate based on tapped index
// //     switch (index) {
// //       case 0:
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
// //         break;
// //       case 1:
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => LayersScreen()));
// //         break;
// //       case 2:
// //         Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
// //         break;
// //     }
// //   }break
// //
// //   Widget buildCard(Map<String, String> data) {
// //     return Card(
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //       child: Stack(
// //         children: [
// //           ClipRRect(
// //             borderRadius: BorderRadius.circular(20),
// //             child: Image.asset(
// //               data['image']!,
// //               fit: BoxFit.cover,
// //               width: double.infinity,
// //               height: double.infinity,
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 80,
// //             left: 20,
// //             child: Text(
// //               data['name']!,
// //               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 50,
// //             left: 20,
// //             child: Row(
// //               children: [
// //                 Icon(Icons.location_on, color: Colors.white, size: 18),
// //                 SizedBox(width: 5),
// //                 Text("Abuja - 20 kms away", style: TextStyle(color: Colors.white)),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 20,
// //             left: 20,
// //             child: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //               decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
// //               child: Text("Active Now", style: TextStyle(color: Colors.white)),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('geemia', style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
// //         centerTitle: true,
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: Icon(Icons.arrow_back_ios, color: Colors.black),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.favorite_border, color: Colors.black),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => LikesScreen()),
// //               );
// //             },
// //           ),
// //           SizedBox(width: 10),
// //           IconButton(
// //             icon: Icon(Icons.settings, color: Colors.black),
// //             onPressed: () {
// //               // Add settings screen navigation here if needed
// //             },
// //           ),
// //           SizedBox(width: 10),
// //         ],
// //
// //       ),
// //       body: Column(
// //         children: [
// //           SizedBox(height: 10),
// //           ElevatedButton(
// //             onPressed: () {},
// //             child: Text("iHookup"),  // <-- Static title as you want
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.orange.shade200,
// //               foregroundColor: Colors.black,
// //               shape: StadiumBorder(),
// //             ),
// //           ),
// //           Expanded(
// //             child: CardSwiper(
// //               cardsCount: cards.length,
// //               cardBuilder: (context, index, percentX, percentY) => buildCard(cards[index]),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 20.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 Icon(Icons.thumb_down, color: Colors.red, size: 40),
// //                 Icon(Icons.thumb_up, color: Colors.green, size: 40),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: [
// //           BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
// //           BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.orange), label: ''),
// //           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:geemia_app/Screens/chat_screen.dart';
// import 'package:geemia_app/Screens/like_profile.dart';
// import 'package:geemia_app/Screens/like_screen.dart';
//
// class IHookupScreen extends StatefulWidget {
//   @override
//   _IHookupScreenState createState() => _IHookupScreenState();
// }
//
// class _IHookupScreenState extends State<IHookupScreen> {
//   final List<Map<String, String>> cards = [
//     {"name": "Kalvin, 23", "image": "assets/images/girl.png"},
//     {"name": "Kallina, 23", "image": "assets/images/boy.png"},
//     {"name": "Alex, 25", "image": "assets/images/girl.png"},
//     {"name": "Sarah, 24", "image": "assets/images/boy.png"},
//   ];
//
//   int _selectedIndex = 1; // Current screen is iHookup, middle index
//
//   void _onItemTapped(int index) {
//     if (index == _selectedIndex) return; // Avoid redundant navigation
//
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     switch (index) {
//       case 0:
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
//         break;
//       case 1:
//       // You're already on iHookup screen
//         break;
//       case 2:
//         Navigator.push(context, MaterialPageRoute(builder: (context) => LikesScreen()));
//         break;
//     }
//   }
//
//   Widget buildCard(Map<String, String> data) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset(
//               data['image']!,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//           ),
//           Positioned(
//             bottom: 80,
//             left: 20,
//             child: Text(
//               data['name']!,
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//           ),
//           Positioned(
//             bottom: 50,
//             left: 20,
//             child: Row(
//               children: [
//                 Icon(Icons.location_on, color: Colors.white, size: 18),
//                 SizedBox(width: 5),
//                 Text("Abuja - 20 kms away", style: TextStyle(color: Colors.white)),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
//               child: Text("Active Now", style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('geemia', style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context); // This will navigate back
//           },
//           child: const Icon(Icons.arrow_back_ios, color: Colors.black),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border, color: Colors.black),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LikesScreen()),
//               );
//             },
//           ),
//           SizedBox(width: 10),
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {
//               // Add settings navigation if required
//             },
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text("iHookup"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange.shade200,
//               foregroundColor: Colors.black,
//               shape: StadiumBorder(),
//             ),
//           ),
//           Expanded(
//             child: CardSwiper(
//               cardsCount: cards.length,
//               cardBuilder: (context, index, percentX, percentY) => buildCard(cards[index]),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(Icons.thumb_down, color: Colors.red, size: 40),
//                 Icon(Icons.thumb_up, color: Colors.green, size: 40),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.orange), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:geemia_app/Screens/like_profile.dart';
import 'package:provider/provider.dart';
import 'package:geemia_app/Screens/IHookUp_Screen/chat_screen.dart';
import 'package:geemia_app/Screens/IHookUp_Screen/like_screen.dart';
import 'package:geemia_app/provider/app_provider.dart';

class IHookupScreen extends StatefulWidget {
  @override
  _IHookupScreenState createState() => _IHookupScreenState();
}

class _IHookupScreenState extends State<IHookupScreen> {
  int _selectedIndex = 1; // Current screen is iHookup, middle index

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AppProvider>(context, listen: false).fetchHookupCards());
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LikesScreenHookUp()));
        break;
    }
  }

  Widget buildCard(Map<String, dynamic> data) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: data['image'] != null
                ? Image.network(
              data['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
                : Container(color: Colors.grey),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            child: Text(
              data['name'] ?? '',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 18),
                SizedBox(width: 5),
                Text(
                  data['location'] ?? "Unknown",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          if (data['status'] != null)
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(data['status'],
                    style: TextStyle(color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('geemia',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikesScreenHookUp()),
              );
            },
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.loadingCards) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.cards.isEmpty) {
            return Center(child: Text("No cards available"));
          }
          return Column(
            children: [
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text("iHookup"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200,
                  foregroundColor: Colors.black,
                  shape: StadiumBorder(),
                ),
              ),
              Expanded(
                child: CardSwiper(
                  cardsCount: provider.cards.length,
                  cardBuilder: (context, index, percentX, percentY) =>
                      buildCard(provider.cards[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.thumb_down, color: Colors.red, size: 40),
                    Icon(Icons.thumb_up, color: Colors.green, size: 40),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.layers, color: Colors.orange), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
