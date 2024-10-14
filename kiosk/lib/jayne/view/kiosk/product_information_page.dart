import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class ProductInformationPage extends StatefulWidget {
  const ProductInformationPage({super.key});

  @override
  State<ProductInformationPage> createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  int quantity = 1;
  String selectedColor = 'สีดำ';
  String selectedStorage = '256 GB';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ResponsiveText(
          content: "jayne.product_individual_page.app_bar".tr(),
          textStyle: JTextTheme.title1,
        ),
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
                      ResponsiveText(
                        content: 'jayne.product_individual_page.memory'.tr(),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
                          ResponsiveText(
                            content: 'jayne.product_individual_page.number_of_quantity'.tr(),
                            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
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
                          // TODO Action for 'Buy' button
                          context.pushNamed(RouteName.shoppingCartPage.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: const ResponsiveText(
                          content: 'สั่งซื้อ',
                          textStyle: TextStyle(fontSize: 18),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Product Description Section
            const ResponsiveText(
              content: 'คุณสมบัติ',
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ResponsiveText(
              content: 'ควบคุมเต็มตัวด้วยตัวควบคุมกล้อง',
              textStyle: TextStyle(fontSize: 16),
            ),
            ResponsiveText(
              content: 'ตัวควบคุมกล้องให้คุณมีวิธีที่ง่ายขึ้นในการเข้าถึงเครื่องมือของกล้องได้อย่างรวดเร็ว',
              textStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // TODO Go back action
                context.pop();
              },
              child: ResponsiveText(
                content: "jayne.common.back".tr(),
                textStyle: JTextTheme.captionMedium,
              ),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO Action for 'Cart' button
                        context.pushNamed(RouteName.shoppingCartPage.name);
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
                    // TODO Action for 'Consult AI' button
                    context.goNamed(RouteName.aiAssistantPage.name);
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
