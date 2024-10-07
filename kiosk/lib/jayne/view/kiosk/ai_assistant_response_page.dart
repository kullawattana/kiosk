import 'package:flutter/material.dart';

class AIAssistantResponsePage extends StatelessWidget {
  const AIAssistantResponsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Semi-transparent background
      body: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button (top-right)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      // Close the assistant
                    },
                  ),
                ],
              ),
              // Avatar and AI Assistant Name
              const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.smart_toy, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'NongJane',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // User's Input
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'รีวิว iPhone 16 ให้ฟังหน่อยครับ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // AI Assistant's Text Response
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'iPhone 16 Pro มาพร้อมกับหน้าจอขนาด 6.3 นิ้ว ซึ่งขยายใหญ่ขึ้นจาก iPhone 15 Pro ที่มีหน้าจออยู่ที่ 6.1 นิ้ว... ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Images (Placeholder)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 40),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Product Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to product details
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('ดูสินค้า', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              // Microphone Button and "Press to Speak" Text
              GestureDetector(
                onTap: () {
                  // Handle voice input
                },
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.mic,
                        size: 36,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'กดเพื่อพูด',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
