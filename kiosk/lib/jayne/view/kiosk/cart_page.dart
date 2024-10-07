import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Example cart data
  int iphone16Quantity = 1;
  int iphone16ProQuantity = 2;
  int totalPrice = 100000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Title
            const Text(
              'ตะกร้าสินค้า',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Product 1: iPhone 16
            buildCartItem(
              productName: 'iPhone 16',
              color: 'สีดำ',
              storage: 'หน่วยความจำ 256 GB',
              price: 30000,
              quantity: iphone16Quantity,
              onRemove: () {
                setState(() {
                  iphone16Quantity = 0;
                  totalPrice -= 30000;
                });
              },
              onDecrease: () {
                if (iphone16Quantity > 1) {
                  setState(() {
                    iphone16Quantity--;
                    totalPrice -= 30000;
                  });
                }
              },
              onIncrease: () {
                setState(() {
                  iphone16Quantity++;
                  totalPrice += 30000;
                });
              },
            ),
            const SizedBox(height: 10),

            // Product 2: iPhone 16 Pro
            buildCartItem(
              productName: 'iPhone 16 Pro',
              color: 'สีรุ้ง',
              storage: 'หน่วยความจำ 1 TB',
              price: 70000,
              quantity: iphone16ProQuantity,
              onRemove: () {
                setState(() {
                  iphone16ProQuantity = 0;
                  totalPrice -= (70000 * iphone16ProQuantity);
                });
              },
              onDecrease: () {
                if (iphone16ProQuantity > 1) {
                  setState(() {
                    iphone16ProQuantity--;
                    totalPrice -= 70000;
                  });
                }
              },
              onIncrease: () {
                setState(() {
                  iphone16ProQuantity++;
                  totalPrice += 70000;
                });
              },
            ),
            const SizedBox(height: 20),

            // Promotion Section
            const Text(
              'โปรโมชั่น',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Promotion Item
            buildPromotionItem(
              title: 'iPhone 16 Pro แถม airpod air 2',
              details: ['airpod air 2 ฟรี + ประกัน 2 ปี', 'ข้าวมันไก่ทอดพิเศษจากร้านเซฟหอย'],
              onRemove: () {
                // Remove promotion logic here
              },
            ),
            const SizedBox(height: 20),
            // Price Summary Section
            buildPriceSummary(totalPrice),
            const SizedBox(height: 20),
            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Go back
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text('ย้อนกลับ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Confirm purchase
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text('ยืนยัน'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build Cart Item Widget
  Widget buildCartItem({
    required String productName,
    required String color,
    required String storage,
    required int price,
    required int quantity,
    required VoidCallback onRemove,
    required VoidCallback onDecrease,
    required VoidCallback onIncrease,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 40), // Placeholder for product image
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(color),
                    Text(storage),
                    Row(
                      children: [
                        const Text('จำนวน'),
                        IconButton(icon: const Icon(Icons.remove), onPressed: onDecrease),
                        Text('$quantity'),
                        IconButton(icon: const Icon(Icons.add), onPressed: onIncrease),
                        const Spacer(),
                        Text('฿ $price'),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build Promotion Item Widget
  Widget buildPromotionItem({
    required String title,
    required List<String> details,
    required VoidCallback onRemove,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: onRemove,
              ),
            ],
          ),
          ...details.map((detail) => Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail),
                    const Text('X 1'),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // Build Price Summary Widget
  Widget buildPriceSummary(int totalPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('ราคาสินค้ารวม', style: TextStyle(fontSize: 16)),
            Text('฿ $totalPrice', style: const TextStyle(fontSize: 16)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ส่วนลด', style: TextStyle(fontSize: 16)),
            Text('฿ 0', style: TextStyle(fontSize: 16)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('รวมยอดสั่งซื้อ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('฿ $totalPrice', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
