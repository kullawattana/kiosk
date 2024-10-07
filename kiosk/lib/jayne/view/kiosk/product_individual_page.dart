import 'package:flutter/material.dart';

class ProductIndividualPage extends StatefulWidget {
  const ProductIndividualPage({super.key});

  @override
  _ProductIndividualPageState createState() => _ProductIndividualPageState();
}

class _ProductIndividualPageState extends State<ProductIndividualPage> {
  int quantity = 1;
  String selectedColor = 'สีดำ';
  String selectedStorage = '256 GB';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product - Individual Page (Press Buy)'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row - Image and Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Section
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, size: 100), // Placeholder for image
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text('1/4'),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Product Info Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('iPhone 16', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text('฿30,000', style: TextStyle(fontSize: 20, color: Colors.black)),
                      const SizedBox(height: 20),
                      const Text('สี', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ColorButton(
                            colorName: 'สีดำ',
                            isSelected: selectedColor == 'สีดำ',
                            onTap: () => setState(() => selectedColor = 'สีดำ'),
                          ),
                          ColorButton(
                            colorName: 'สีขาว',
                            isSelected: selectedColor == 'สีขาว',
                            onTap: () => setState(() => selectedColor = 'สีขาว'),
                          ),
                          ColorButton(
                            colorName: 'สีม่วง',
                            isSelected: selectedColor == 'สีม่วง',
                            onTap: () => setState(() => selectedColor = 'สีม่วง'),
                          ),
                          ColorButton(
                            colorName: 'สีน้ำตาล',
                            isSelected: selectedColor == 'สีน้ำตาล',
                            onTap: () => setState(() => selectedColor = 'สีน้ำตาล'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('หน่วยความจำ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          StorageButton(
                            storage: '256 GB',
                            isSelected: selectedStorage == '256 GB',
                            onTap: () => setState(() => selectedStorage = '256 GB'),
                          ),
                          StorageButton(
                            storage: '512 GB',
                            isSelected: selectedStorage == '512 GB',
                            onTap: () => setState(() => selectedStorage = '512 GB'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Quantity selector
                      Row(
                        children: [
                          const Text('จำนวน', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          IconButton(
                            onPressed: () => setState(() => quantity = quantity > 1 ? quantity - 1 : 1),
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$quantity', style: const TextStyle(fontSize: 18)),
                          IconButton(
                            onPressed: () => setState(() => quantity++),
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Action for 'Buy' button
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: const Text('สั่งซื้อ', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Product Description Section
            const Text(
              'คุณสมบัติ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ควบคุมเต็มตัวด้วยตัวควบคุมกล้อง',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'ตัวควบคุมกล้องให้คุณมีวิธีที่ง่ายขึ้นในการเข้าถึงเครื่องมือของกล้องได้อย่างรวดเร็ว',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            // Placeholder for more description
            const Text('XXXXX', style: TextStyle(fontSize: 16)),
            const Text('XXXXXXXXXXXXXXXXXXXXXXXXXXXX', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text('XXXXX', style: TextStyle(fontSize: 16)),
            const Text('XXXXXXXXXXXXXXXXXXXXXXXXXXXX', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Action for 'Back' button
              },
              child: const Text('ย้อนกลับ', style: TextStyle(fontSize: 18)),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Action for 'Cart' button
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // Action for 'Consult AI' button
                  },
                  icon: const Icon(Icons.support_agent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Color Selection
class ColorButton extends StatelessWidget {
  final String colorName;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorButton({
    super.key,
    required this.colorName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          colorName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// Custom Widget for Storage Selection
class StorageButton extends StatelessWidget {
  final String storage;
  final bool isSelected;
  final VoidCallback onTap;

  const StorageButton({
    super.key,
    required this.storage,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          storage,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
