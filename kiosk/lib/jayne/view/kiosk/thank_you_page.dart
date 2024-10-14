import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: ResponsiveText(
          content: 'jayne.thank_you_page.app_bar'.tr(),
          textStyle: JTextTheme.highlightHeader,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ResponsiveImage(
                'assets/images/jaymart.png',
                assetType: AssetType.image,
                baseHeight: 200,
                baseWidth: 200,
                themeDirectory: "",
                themeName: "",
              ),
              const SizedBox(height: 70),
              ResponsiveText(
                content: 'jayne.thank_you_page.message'.tr(),
                textStyle: JTextTheme.highlightHeader,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // TODO Navigate back to the main page
                  context.pushNamed(RouteName.homePage.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: ResponsiveText(
                  content: 'jayne.common.back_to_home_page'.tr(),
                  textStyle: JTextTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
