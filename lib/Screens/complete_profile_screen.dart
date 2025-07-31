import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> photoPaths = [
    "assets/images/boy.png",
    "assets/images/girl.png",
    "assets/images/sam.png",
    "assets/images/boy.png",
    "assets/images/girl.png",
    "assets/images/teena.png",
    // Add as many as you want
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildHeader() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                'assets/images/girl.png',
              ), // Replace with real asset
            ),
            Positioned(
              bottom: -5,

              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "50% completed",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Jhon Abraham",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: "About"),
            Tab(text: "Photos"),
            Tab(text: "Location"),
            Tab(text: "Plan"),
          ],
        ),
      ],
    );
  }

  Widget buildAboutTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        InfoItem(title: "Display Name", value: "Jhon Abraham"),
        InfoItem(title: "Email", value: "john@gmail.com"),
        InfoItem(
          title: "Address",
          value: "33 street west subidbazar, sylhet shvashsv",
        ),
        InfoItem(title: "Age", value: "25"),
        InfoItem(title: "Gender", value: "Male"),
        InfoItem(
          title: "Address",
          value: "33 street west subidbazar, sylhet shvashsv",
        ),
      ],
    );
  }

  Widget buildPhotosTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: photoPaths.length + 1, // +1 for the "Add" button
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        if (index < photoPaths.length) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  photoPaths[index],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.close, size: 14),
                ),
              ),
            ],
          );
        } else {
          // Last box is an Add button
          return GestureDetector(
            onTap: () {
              // You can open image picker here
              print("Add new photo");
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add, color: Colors.orange),
            ),
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "geemia",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildHeader(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildAboutTab(),
                buildPhotosTab(),
                const Center(child: Text("Location tab")),
                const Center(child: Text("Plan tab")),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.mic_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
