import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/market_search_screen.dart';

import 'market_category_screen.dart';

class MarketFeedScreen extends StatelessWidget {
  const MarketFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MarketCategoryScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MarketSearchScreen()),
              );
            },
          ),


        SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16),
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: List.generate(2, (index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset('assets/images/headphones_one.jpg',
                      // 'assets/images/bag${index + 1}.jpg',
                      height: 200, width: double.infinity, fit: BoxFit.contain),
                ),
                ListTile(
                  title: const Text('Product AAA'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Jarwo Sujono'),
                      SizedBox(height: 4),
                      Text(
                        'Wow, this product is so cool, my mom is very satisfied using this product',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
