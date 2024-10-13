import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';

class WidgetSpacer extends SizedBox {
  const WidgetSpacer({
    super.key,
    double size = spaceBase,
  }) : super(
          height: size,
          width: size,
        );
}
