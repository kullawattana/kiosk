import 'package:flutter/material.dart';

class ChatInstructionsPage extends StatelessWidget {
  const ChatInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Janey',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  InstructionCard(
                    text: 'Remembers what user said earlier in the conversation',
                  ),
                  SizedBox(height: 20),
                  InstructionCard(
                    text: 'Allows user to provide follow-up corrections With AI',
                  ),
                  SizedBox(height: 20),
                  InstructionCard(
                    text: 'Limited knowledge of world and events after 2021',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InstructionCard extends StatelessWidget {
  final String text;

  const InstructionCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
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
