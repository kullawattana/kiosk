import 'package:flutter/material.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Added SingleChildScrollView here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50), // Space for the image if needed
                  const ResponsiveImage(
                    "jaymart",
                    assetType: AssetType.image,
                    baseHeight: 25,
                    baseWidth: 25,
                    themeDirectory: "",
                    themeName: ""
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling independently
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        MenuItemWidget(
                          icon: Icons.phone_android,
                          label: 'jayne.home_page.product'.tr(),
                        ),
                        MenuItemWidget(
                          icon: Icons.local_offer,
                          label: 'jayne.home_page.promotion'.tr(),
                        ),
                        MenuItemWidget(
                          icon: Icons.person,
                          label: 'jayne.home_page.verification'.tr(),
                        ),
                        MenuItemWidget(
                          icon: Icons.smart_toy,
                          label: 'jayne.home_page.talk_with_janey'.tr(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
//                 Row(
//                   children: [
//                     LanguageSwitcherButton(imagePath: 'assets/thai_flag.png'),
//                     SizedBox(width: 10),
//                     LanguageSwitcherButton(imagePath: 'assets/uk_flag.png'),
//                   ],
//                 ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO Handle staff call
                          launchUrlString("tel:0123456789");
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.black,
                        ),
                        child: ResponsiveText(
                          content: 'jayne.home_page.call_staff'.tr(),
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class LanguageSwitcherButton extends StatelessWidget {
  final String imagePath;

  const LanguageSwitcherButton({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle language change
      },
      child: Image.asset(
        imagePath,
        width: 40,
        height: 40,
      ),
    );
  }
}
