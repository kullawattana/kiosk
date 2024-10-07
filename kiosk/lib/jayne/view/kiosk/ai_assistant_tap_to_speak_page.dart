import 'package:flutter/material.dart';

class AIAssistantTapToSpeakPage extends StatelessWidget {
  const AIAssistantTapToSpeakPage({super.key});

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
              
              // Avatar and Greeting
              Column(
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.smart_toy, size: 40, color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  // Name
                  const Text(
                    'NongJane',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  
                  // Greeting message
                  const Text(
                    'สวัสดีค่ะ ให้เจนช่วยอะไรดีคะคุณลูกค้า',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Voice Wave Animation
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
            ],
          ),
        ),
      ),
    );
  }
}
