import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/theme_data.dart';

class MessageTime extends StatelessWidget {
  final DateTime time;

  const MessageTime({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: spaceSmall + 8,
          ),
          child: Text(
            DateFormat("HH:mm").format(time),
            style: JTextTheme.verySmallText.copyWith(
              fontSize: fontSizeVerySmallText,
            ),
          ),
        ),
      ],
    );
  }
}
