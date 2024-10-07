import 'package:flutter/material.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  int selectedIndex = 0; // 0 for "โปรโมชั่น", 1 for "ส่วนลด"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Promotion'),
      ),
      body: Column(
        children: [
          // Sidebar and main content
          Expanded(
            child: Row(
              children: [
                // Sidebar
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  // Show all labels
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: SizedBox.shrink(), // You can replace this with actual icons if needed
                      label: Text('โปรโมชั่น'),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(), // You can replace this with actual icons if needed
                      label: Text('ส่วนลด'),
                    ),
                  ],
                  selectedIconTheme: const IconThemeData(color: Colors.black),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.black),
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                ),
                // Main content: Promotion or Discount content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedIndex == 0 ? 'โปรโมชั่น' : 'ส่วนลด',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Placeholder for promotions or discounts
                        Expanded(
                          child: ListView.builder(
                            itemCount: 3, // Number of promotions/discounts
                            itemBuilder: (context, index) {
                              return Container(
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 16),
                                color: Colors.grey[300], // Placeholder for the image
                                child: const Center(
                                  child: Icon(Icons.image, size: 60), // Image icon placeholder
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Bottom Navigation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Go back action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text('ย้อนกลับ'),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        // Go to cart action
                      },
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.smart_toy),
                      onPressed: () {
                        // AI consultation action
                      },
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
