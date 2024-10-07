import 'package:flutter/material.dart';

class VerificationSuccessPage extends StatelessWidget {
  final String userName = "สมร";

  const VerificationSuccessPage({super.key}); // Example user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Verification - success'),
      ),
      body: Center( // Center the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ยืนยันตัวตนเรียบร้อย',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'สวัสดีค่ะ คุณ$userName',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Button to go back to the main page
            ElevatedButton(
              onPressed: () {
                // Navigate back to the main page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text(
                'กลับหน้าหลัก',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
