import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
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
            // Button to go back to the main page
            ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteName.homePage.name);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: ResponsiveText(
                content: 'jayne.common.back_to_home_page'.tr(),
                textStyle: JTextTheme.subtitle1.copyWith(
                  color: colorNeutralWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}