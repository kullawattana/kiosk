import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/router/routes_name.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VerificationSuccessPage extends StatelessWidget {
  final String userName;

  const VerificationSuccessPage({
    super.key,
    required this.userName,
  }); // Example user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ResponsiveText(
          content: "jayne.verification_success_page.app_bar".tr(),
          textStyle: JTextTheme.highlightHeader,
        ),
      ),
      body: Center(
        // Center the entire content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveText(
              content: "jayne.verification_success_page.title".tr(),
              textStyle: JTextTheme.highlightHeader,
            ),
            const SizedBox(height: 20),
            Center(
              child: QrImageView(
                data: "https://jaymartstore.com/?srsltid=AfmBOoq8pKz6WmSowi5MhbBmNFO4wBO3KbyxV2-K_ykfyLrc7b2Dqa7M",
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            ResponsiveText(
              content: "jayne.verification_success_page.hello_user_name".tr().replaceAll("{userName}", userName),
              textStyle: JTextTheme.header,
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const ResponsiveImage(
                      'assets/images/back.json',
                      assetType: AssetType.animation,
                      baseWidth: 120,
                    ),
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Row(
                    children: [
                      Container(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: const ResponsiveImage(
                                'assets/images/shopping.json',
                                assetType: AssetType.animation,
                                baseWidth: 120,
                              ),
                              onTap: () {

                              },
                            ),
                            const Text(
                              "ตะกร้าสินค้า",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      Container(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: const ResponsiveImage(
                                'assets/images/chatbot.json',
                                assetType: AssetType.animation,
                                baseWidth: 120,
                              ),
                              onTap: () {
                                context.pushNamed(RouteName.aiAssistantPage.name);
                              },
                            ),
                            const Text(
                              "ปรึกษา AI",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}