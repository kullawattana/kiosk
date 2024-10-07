import 'package:flutter/material.dart';

class AIAssistantChatPage extends StatelessWidget {
  const AIAssistantChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), // Semi-transparent background
      body: Center(
        child: Container(
          width: 300,
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
              // AI Assistant's "Thinking" Response
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'กำลังคิด...',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Voice Wave Animation Placeholder
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.graphic_eq,
                  color: Colors.white,
                  size: 50,
                ), // Placeholder for the voice wave animation
              ),
            ],
          ),
        ),
      ),
    );
  }
}
