import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/layouts/image_filter_blur.dart';

enum PopupSize {
  full,
  big,
  half,
  medium,
  small,
}

extension PopupSizeExtenstion on PopupSize {
  double get heightFactor {
    switch (this) {
      case PopupSize.full:
        return .9;
      case PopupSize.big:
        return .8;
      case PopupSize.half:
        return .65;
      case PopupSize.medium:
        return .4;
      case PopupSize.small:
        return .25;
    }
  }
}

Future<T?> showPopup<T>({
  required BuildContext context,
  required Widget child,
  PopupSize size = PopupSize.medium,
  bool isDismissible = true,
  Color? color,
  double? customSize,
}) =>
    showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: isDismissible,
      builder: (context) => BackdropFilter(
        filter: imageFilterBlur(),
        child: FractionallySizedBox(
          heightFactor: customSize ?? size.heightFactor,
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                color: color ?? ColorTheme.neutral.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(layoutRadius),
                  topRight: Radius.circular(layoutRadius),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
