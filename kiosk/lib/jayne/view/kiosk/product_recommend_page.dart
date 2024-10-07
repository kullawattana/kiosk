import 'package:flutter/material.dart';

class ProductRecommendPage extends StatelessWidget {
  const ProductRecommendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Side Menu
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      child: const Column(
                        children: [
                          MenuItem(label: 'แนะนำ', isSelected: true),
                          MenuItem(label: 'มือถือ'),
                          MenuItem(label: 'แท็บเล็ต'),
                          MenuItem(label: 'โน้ตบุ๊ค'),
                          MenuItem(label: 'สมาร์ทวอทช์'),
                          MenuItem(label: 'หูฟัง'),
                          MenuItem(label: 'อุปกรณ์เสริม'),
                        ],
                      ),
                    ),
                  ),

                  // Product Grid
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'สินค้าแนะนำ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: 6, // Number of products
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  name: index < 3 ? 'iPhone ${16 + index}' : 'XXX',
                                  price: index < 3 ? '${30000 + (5000 * index)}' : 'XXXX',
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
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Back action
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
                      BottomActionButton(
                        icon: Icons.shopping_cart,
                        label: 'ตะกร้าสินค้า',
                        onPressed: () {
                          // Cart action
                        },
                      ),
                      const SizedBox(width: 10),
                      BottomActionButton(
                        icon: Icons.smart_toy,
                        label: 'ปรึกษา AI',
                        onPressed: () {
                          // AI consultation action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const MenuItem({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          // Handle category selection
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.grey[200],
            child: const Icon(Icons.image, size: 40, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontSize: 16)),
          Text('฿ $price', style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              // Handle add to cart
            },
          ),
        ],
      ),
    );
  }
}

class BottomActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const BottomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(150, 50),
      ),
      icon: Icon(icon, color: Colors.black),
      label: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}