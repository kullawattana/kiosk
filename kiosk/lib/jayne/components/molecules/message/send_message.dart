import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/default_theme_color.dart';
import 'package:kiosk/jayne/common/theme_data.dart';
import 'package:kiosk/jayne/components/atoms/message_time.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/enhances/widget_spacer.dart';

class SendMessage extends StatelessWidget {
  final String message;
  final DateTime time;

  const SendMessage({
    super.key,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
              padding: const EdgeInsets.all(spaceBase - 1),
              decoration: BoxDecoration(
                color: ColorTheme.primary.yellow,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: ResponsiveText(
                content: message,
                textStyle: JTextTheme.body2.copyWith(
                  color: bubbleTextMessageColor,
                  fontSize: fontSizeBody1,
                ),
              ),
            ),
          ],
        ),
        const WidgetSpacer(
          size: spaceSmall - 4,
        ),
        MessageTime(time: time)
      ],
    );
  }
}
