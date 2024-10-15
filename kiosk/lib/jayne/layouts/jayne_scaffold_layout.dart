import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/default_color.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/focus_cleaner.dart';
import 'package:kiosk/jayne/layouts/background_gradient.dart';

class JayneScaffoldLayout extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;
  final Widget bottomNavigationBar;
  final Color? backgroundColor;

  const JayneScaffoldLayout({
    super.key,
    required this.body,
    required this.bottomNavigationBar,
    this.backgroundColor,
    required this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return FocusCleaner(
      child: Scaffold(
        backgroundColor: bottomBarBackgroundColor,
        floatingActionButton: floatingActionButton,
        body: BackgroundGradient(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? ColorTheme.neutral.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(
                  layoutRadius,
                ),
              ),
            ),
            child: body,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: bottomNavigationBar,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}