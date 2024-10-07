import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class VerificationSuccessPage extends StatelessWidget {
  final String userName = "สมร";

  const VerificationSuccessPage({super.key}); // Example user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("jayne.verification_success_page.app_bar".tr()),
      ),
      body: Center(
        // Center the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "jayne.verification_success_page.title".tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "jayne.verification_success_page.hello_user_name".tr().replaceAll("{userName}", userName),
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
              child: Text(
                'jayne.verification_success_page.back_to_home_page'.tr(),
                style: const TextStyle(
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
