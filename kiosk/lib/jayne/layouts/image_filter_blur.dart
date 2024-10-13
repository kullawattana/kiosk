import 'dart:ui';

enum KeptBlur {
  base,
  large,
  veryLarge,
}

extension BlurExtension on KeptBlur {
  double get sigma {
    switch (this) {
      case KeptBlur.veryLarge:
        return 20;
      case KeptBlur.large:
        return 10;
      case KeptBlur.base:
        return 2;
      default:
        return 0;
    }
  }
}

ImageFilter imageFilterBlur([KeptBlur blur = KeptBlur.veryLarge]) => ImageFilter.blur(
      sigmaX: blur.sigma,
      sigmaY: blur.sigma,
    );
