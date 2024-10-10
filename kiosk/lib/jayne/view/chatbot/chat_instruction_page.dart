import 'package:flutter/material.dart';

class ChatInstructionsPage extends StatelessWidget {
  const ChatInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // สีพื้นหลังด้านนอก
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white, // พื้นหลังสีขาวของหน้าจอด้านใน
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            // ฟังก์ชันเมื่อกดปุ่มย้อนกลับ
                          },
                        ),
                        const Icon(Icons.more_horiz, color: Colors.grey), // จุดสามจุดทางขวา
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        'NongJane',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // ข้อความคำอธิบาย
                    const InstructionCard(
                      text: 'Remembers what user said earlier in the conversation',
                    ),
                    const SizedBox(height: 20),
                    const InstructionCard(
                      text: 'Allows user to provide follow-up corrections With Ai',
                    ),
                    const SizedBox(height: 20),
                    const InstructionCard(
                      text: 'Limited knowledge of world and events after 2021',
                    ),
                  ],
                ),
              ),
            ),
          ),
          // ช่องกรอกข้อความด้านล่าง
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white, // พื้นหลังของช่องข้อความ
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Send a message.',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.grey),
                    onPressed: () {
                      // ฟังก์ชันส่งข้อความ
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructionCard extends StatelessWidget {
  final String text;

  const InstructionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100], // สีพื้นหลังของการ์ด
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
        ),
      ),
    );
  }
}
