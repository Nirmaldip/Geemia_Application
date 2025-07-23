import 'package:flutter/material.dart';

class MarketSearchScreen extends StatefulWidget {
  const MarketSearchScreen({super.key});

  @override
  State<MarketSearchScreen> createState() => _MarketSearchScreenState();
}

class _MarketSearchScreenState extends State<MarketSearchScreen> {
  final List<Map<String, dynamic>> products = const [
    {
      'image': 'assets/images/headphones_one.jpg',
      'title': 'Earphone Seconds - Original No Minus',
      'price': '\$500.000',
      'rating': '4.9',
      'sold': '400 Sold'
    },
    {
      'image': 'assets/images/headphones_one.jpg',
      'title': 'Earphone Seconds - Original No Minus',
      'price': '\$500.000',
      'rating': '4.9',
      'sold': '400 Sold'
    },
    {
      'image': 'assets/images/headphones_one.jpg',
      'title': 'Earphone Seconds - Original No Minus',
      'price': '\$500.000',
      'rating': '4.9',
      'sold': '400 Sold'
    },
    {
      'image': 'assets/images/headphones_one.jpg',
      'title': 'Earphone Seconds - Original No Minus',
      'price': '\$500.000',
      'rating': '4.9',
      'sold': '400 Sold'
    },
  ];

  @override
  void initState() {
    super.initState();
    // Show after a delay or conditionally
    Future.delayed(Duration(milliseconds: 500), () {
      _showDiscountDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.white70),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Featured'),
              Tab(text: 'Tech'),
              Tab(text: 'Fashion'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(3, (tabIndex) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product['image'],
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['title'],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              product['price'],
                              style: const TextStyle(color: Colors.orange),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, size: 16, color: Colors.orange),
                                const SizedBox(width: 4),
                                Text(product['rating']),
                                const SizedBox(width: 12),
                                Text(product['sold']),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),);}

        void _showDiscountDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: const Text(
                    "Items reduced to \$0.01",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/headphones_one.jpg', // Replace with your asset
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Earphone JEBOL Seconds\nOriginal No Minus",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "80%   Rp. 200.000",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "\$500.000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("CLOSE"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigate to Buy/Checkout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text("BUY NOW"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
}

