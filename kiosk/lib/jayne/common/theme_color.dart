import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';

const fontFamily = [
  "Jayne",
];

final defaultThemeData = ThemeData(
  scaffoldBackgroundColor: colorNeutralWhite,
  primaryColor: colorPrimaryRed,
  dividerColor: colorNeutralLightGrey,
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(
        secondary: colorNeutralGrey,
      )
      .copyWith(
        surface: colorNeutralWhite,
      ),
);

class JTextTheme {
  /// fontWeight: bold,
  /// fontSize: 21,
  static final appBarHeader = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeHeader,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 20,
  static final splashText = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeSplashScreen,
    color: colorNeutralWhite,
    height: fontLineHeight,
  );

  /// fontWeight: bold,
  /// fontSize: 20,
  static final splashTextBold = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeSplashScreen,
    color: colorNeutralWhite,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 16,
  static final content = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeTitle2,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 24,
  static final highlightHeader = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeHighlightHeader,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 21,
  static final header = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeHeader,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: bold,
  /// fontSize: 18,
  static final title1 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeTitle1,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 16,
  static final subtitle1 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeSubtitle1,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 16,
  static final body1 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeBody1,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: bold,
  /// fontSize: 16,
  static final title2 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeTitle2,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: bold,
  /// fontSize: 15,
  static final title3 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeSubtitle2,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: bold,
  /// fontSize: 14,
  static final title4 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightBold,
    fontSize: fontSizeCaption,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 15,
  static final subtitle2 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeSubtitle2,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 14,
  static final captionMedium = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeCaption,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 15,
  static final body2 = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeBody2,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 30,
  static final amount = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeAmount,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 14,
  static final captionRegular = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeCaption,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 10,
  static final verySmallText = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeVerySmallText,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 9,
  static final veryVerySmallText = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeVeryVerySmallText,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: regular,
  /// fontSize: 12,
  static final smallText = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightRegular,
    fontSize: fontSizeSmallText,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 12,
  static final smallTextHighlight = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeSmallText,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );

  /// fontWeight: medium,
  /// fontSize: 11,
  static final bottomNavigationText = TextStyle(
    fontFamily: fontFamily[0],
    fontFamilyFallback: fontFamily,
    fontWeight: fontWeightMedium,
    fontSize: fontSizeBottomNavigation,
    color: colorNeutralBlack,
    height: fontLineHeight,
  );
}

class ColorTheme {
  static final ColorPrimaryTheme primary = ColorPrimaryTheme();
  static final ColorSecondaryTheme secondary = ColorSecondaryTheme();
  static final ColorTertiaryTheme tertiary = ColorTertiaryTheme();
  static final ColorNeutralTheme neutral = ColorNeutralTheme();
  static final ColorErrorTheme error = ColorErrorTheme();
}

class ColorPrimaryTheme {
  final Color red = colorPrimaryRed;
  final Color yellow = colorPrimaryYellow;
}

class ColorSecondaryTheme {
  final Color red = colorSecondaryRed;
  final Color darkRed = colorSecondaryDarkRed;
  final Color shadowRed = colorSecondaryShadowRed;
  final Color lightYellow = colorSecondaryLightYellow;
  final Color darkYellow = colorSecondaryDarkYellow;
  final Color yellow = colorSecondaryYellow;
  final Color goldYellow = colorGoldYellow;
  final Color green = colorSecondaryGreen;
}

class ColorTertiaryTheme {
  final Color blue = colorTertiaryBlue;
  final Color navyBlue = colorTertiaryNavyBlue;
  final Color lightPink = colorTertiaryLightPink;
  final Color pink = colorTertiaryPink;
  final Color green = colorTertiaryGreen;
  final Color lightGreen = colorTertiaryLightGreen;
  final Color brown = colorTertiaryBrown;
  final Color darkBlue = colorTertiaryDarkBlue;
  final Color pinkGrey = colorTertiaryPinkGrey;
  final Color darkYellow = colorTertiaryDarkYellow;
  final Color lightYellow = colorTertiaryLightYellow;
  final Color veryLightYellow = colorTertiaryVeryLightYellow;
  final Color lightGrey = colorTertiaryLightGrey;
  final Color veryLightGrey = colorTertiaryVeryLightGrey;
  final Color red = colorTertiaryRed;
}

class ColorNeutralTheme {
  final Color black = colorNeutralBlack;
  final Color white = colorNeutralWhite;
  final Color darkGrey = colorNeutralDarkGrey;
  final Color grey = colorNeutralGrey;
  final Color lightGrey = colorNeutralLightGrey;
}

class ColorErrorTheme {
  final Color red = colorErrorRed;
  final Color lightRed = colorErrorLightRed;
}
