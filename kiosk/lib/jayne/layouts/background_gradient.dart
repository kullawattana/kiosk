import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/default_color.dart';
import 'package:kiosk/jayne/common/theme_color.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;

  const BackgroundGradient({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appBarColor,
            appBarColor,
            ColorTheme.neutral.white,
          ],
          stops: const [
            0.1,
            0.5,
            0.6,
          ],
        ),
      ),
      child: child,
    );
  }
}