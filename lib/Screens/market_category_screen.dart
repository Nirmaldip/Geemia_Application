import 'package:flutter/material.dart';

class MarketCategoryScreen extends StatelessWidget {
  const MarketCategoryScreen({super.key});

  final List<String> categories = const [
    'Arts',
    'Beauty',
    'Books',
    'Cooks',
    'Electronics',
    'Fashion',
    'Industrial',
    'Game',
    'Food',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.orange,
        title: const Text('Category', style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select the category you like',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: categories.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categories[index]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Navigate to product listing of that category
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
