import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';

const baselineHeight = 165.0;
const charsPerLine = 28;
const additionalLineHeight = 27.5;

TextStyle calculateFontSize(
  num screenWidth,
  TextStyle textStyle,
) {
  double fontSize = 0;

  if (screenWidth <= screenSizeS) {
    fontSize = fontSizeDecrease;
  } else if (screenWidth > screenSizeL) {
    fontSize = fontSizeIncrease;
  }
  return textStyle.copyWith(fontSize: textStyle.fontSize! + fontSize);
}

double calculateContentHeight(String? message) {
  return baselineHeight + (message == null ? 0 : ((message.length / charsPerLine).ceil() - 1) * additionalLineHeight);
}

double getResponsiveFontSize(num screenWidth, double fontSize) {
  if (screenWidth <= screenSizeXS) {
    return fontSize + fontSizeDecrease + fontSizeDecrease;
  } else if (screenWidth <= screenSizeS) {
    return fontSize + fontSizeDecrease;
  } else if (screenWidth > screenSizeL) {
    return fontSize + fontSizeIncrease;
  }
  return fontSize;
}
