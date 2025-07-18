import 'package:flutter/material.dart';
import 'housing_dashboard.dart';

class ChooseHousingBottomSheet extends StatelessWidget {
  const ChooseHousingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Buy',
        'desc': 'Choose from 100+ available listings',
        'icon': Icons.shopping_cart_outlined,
      },
      {
        'title': 'Rent',
        'desc': 'Choose from 60+ available listings',
        'icon': Icons.key_rounded,
      },
      {
        'title': 'Sell',
        'desc': 'Choose from 40+ available listings',
        'icon': Icons.sell_outlined,
      },
      {
        'title': 'Lease',
        'desc': 'Choose from 200+ available listings',
        'icon': Icons.house_outlined,
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Icon(Icons.drag_handle, size: 30, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What are you looking for?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Choose a service here which can be changed later on',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Cards list
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final Map<String, dynamic> item = items[index];
                return Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: Icon(
                      item['icon'] as IconData,
                      color: Colors.orange,
                    ),
                    title: Text(item['title'] as String),
                    subtitle: Text(item['desc'] as String),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HousingDashboard(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
