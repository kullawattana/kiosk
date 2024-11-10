import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiosk/jayne/components/atoms/widget_spacer.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/router/routes_name.dart';

class WelcomeKioskPage extends StatelessWidget {
  const WelcomeKioskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ResponsiveImage(
              'assets/images/jaymart.png',
              assetType: AssetType.image,
              baseHeight: 80,
              baseWidth: 80,
              themeDirectory: "",
              themeName: "",
            ),
            const ResponsiveImage(
              'assets/images/retail.json',
              assetType: AssetType.animation,
              baseWidth: 500,
            ),
            const WidgetSpacer(),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: "${"Welcome to Kiosk (One stop service)"}   ",
                    style: const TextStyle(color: Colors.grey),
                    children: [ //
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed(RouteName.homePage.name);
                          },
                        text: 'click here',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}