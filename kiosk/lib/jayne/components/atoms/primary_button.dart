import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/components/atoms/base_button.dart';

class PrimaryButton extends BaseButton {
  PrimaryButton({
    super.key,
    super.tag,
    required super.textButton,
    super.onPressed,
    double? minimumWidth,
  }) : super(
          minimumWidth: minimumWidth ?? 300,
          minimumHeight: 54,
          hasShadow: true,
          backgroundColor: ColorTheme.primary.red,
          overlayColor: ColorTheme.secondary.darkRed,
          textColor: ColorTheme.neutral.white,
          disableBackgroundColor: ColorTheme.tertiary.pink,
          disableTextColor: ColorTheme.tertiary.pinkGrey,
        );
}
