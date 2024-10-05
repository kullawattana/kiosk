import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/default_theme_color.dart';
import 'package:kiosk/jayne/components/atoms/primary_button.dart';
import 'package:kiosk/jayne/utils/condition_functions.dart';

class Button extends StatelessWidget {
  final GlobalKey? containerKey;
  final String label;
  final VoidCallback? action;

  const Button({
    super.key,
    this.containerKey,
    this.label = "",
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    var clicked = false;
    return IntrinsicHeight(
      child: BottomAppBar(
        elevation: 0.0,
        key: containerKey,
        color: pageLayoutBackgroundColor,
        child: Column(
          children: [
            PrimaryButton(
              key: const Key("chat_button"),
              textButton: label,
              onPressed: onCondition<Function>(
                condition: true,
                builder: () => () {
                  if (!clicked) {
                    action;
                    clicked = true;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
