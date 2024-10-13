import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/default_color.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/components/atoms/widget_spacer.dart';
import 'package:kiosk/jayne/components/molecules/events/avatar_circle.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';

class ReceiveMessageWithProfileIcon extends StatelessWidget {
  final String message;
  final String imageName;
  final AssetType assetType;
  final int lineCountMessage;

  const ReceiveMessageWithProfileIcon({
    super.key,
    required this.message,
    this.lineCountMessage = 0,
    required this.imageName,
    required this.assetType,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Condition(
              condition: lineCountMessage < 1,
              builder: (_) => AvatarCircle(
                assetType: assetType,
                imageName: imageName,
              ),
              fallback: (_) => const WidgetSpacer(
                size: spaceLarge,
              ),
            ),
          ),
          Row(
            children: [
              const WidgetSpacer(size: spaceSmall - 2),
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: bubbleMessageColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: ResponsiveText(
                  content: message,
                  textStyle: JTextTheme.body1.copyWith(
                    color: bubbleTextMessageColor,
                    fontFamily: "",
                    fontSize: fontSizeBody1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
