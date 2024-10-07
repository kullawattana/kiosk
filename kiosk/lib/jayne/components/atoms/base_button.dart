import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:kiosk/jayne/utils/condition_functions.dart';

const _borderNone = BorderSide(width: 0, style: BorderStyle.none);

class BaseButton extends ElevatedButton {
  late final String textButton;
  final String? tag;
  BaseButton({
    super.key,
    this.tag,
    Color? backgroundColor,
    Color? overlayColor,
    Color? disableBackgroundColor,
    Color? textColor,
    Color? disableTextColor,
    Color? borderColor,
    Color? disableBorderColor,
    bool hasShadow = true,
    TextStyle? textStyle,
    required double minimumWidth,
    required double minimumHeight,
    required this.textButton,
    TextAlign? textAlign,
    Widget? customChild,
    super.onPressed,
    MaterialTapTargetSize? tapTargetSize,
  }) : super(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all<Color>(
              onPressed != null //
                  ? (overlayColor ?? Colors.white30)
                  : Colors.transparent,
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              onPressed != null //
                  ? (backgroundColor ?? Colors.transparent)
                  : disableBackgroundColor ?? Colors.transparent,
            ),
            shadowColor: WidgetStateProperty.all<Color>(
              hasShadow //
                  ? ColorTheme.neutral.black
                  : Colors.transparent,
            ),
            side: WidgetStateProperty.all<BorderSide>(onPressed != null //
                ? borderColor != null
                    ? BorderSide(width: 1, color: borderColor)
                    : _borderNone
                : disableBorderColor != null
                    ? BorderSide(width: 1, color: disableBorderColor)
                    : borderColor != null
                        ? BorderSide(width: 1, color: borderColor)
                        : _borderNone),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(cornerRadiusMax),
                ),
              ),
            ),
            minimumSize: WidgetStateProperty.all<Size>(
              Size(minimumWidth, minimumHeight),
            ),
            tapTargetSize: tapTargetSize,
          ),
          child: customChild ??
              ResponsiveText(
                tag: tag,
                content: textButton,
                textAlign: textAlign,
                textStyle: (textStyle ?? JTextTheme.title1).copyWith(
                  color: onCondition<Color?>(
                    condition: onPressed != null,
                    builder: () => textColor,
                    fallback: () => disableTextColor,
                  ),
                ),
              ),
        );
}
