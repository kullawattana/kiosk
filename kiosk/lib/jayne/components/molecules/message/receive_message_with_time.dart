import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/default_color.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/components/molecules/message/receive_message_with_profile_icon.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';

class ReceiveMessageWithTimeMolecule extends StatefulWidget {
  final String message;
  final DateTime time;
  final String imageName;
  final int lineCountMessage;
  final AssetType assetType;
  final String receiveMessageName;

  const ReceiveMessageWithTimeMolecule({
    super.key,
    required this.message,
    required this.time,
    required this.imageName,
    this.lineCountMessage = 0,
    required this.assetType,
    required this.receiveMessageName,
  });

  @override
  State<ReceiveMessageWithTimeMolecule> createState() => _ReceiveMessageWithTimeMolecule();
}

class _ReceiveMessageWithTimeMolecule extends State<ReceiveMessageWithTimeMolecule> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: spaceBase,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReceiveMessageWithProfileIcon(
            message: widget.message,
            imageName: widget.imageName,
            lineCountMessage: widget.lineCountMessage,
            assetType: widget.assetType,
          ),
          Container(
            padding: const EdgeInsets.only(
              left: spaceLarge + 20,
              top: spaceSmall - 3,
              bottom: spaceLarge + 1,
            ),
            child: Text(
              "${widget.receiveMessageName} ${DateFormat("HH:mm", "en_US").format(widget.time)}",
              style: JTextTheme.captionRegular.copyWith(
                fontSize: fontSizeVerySmallText,
                color: timerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
