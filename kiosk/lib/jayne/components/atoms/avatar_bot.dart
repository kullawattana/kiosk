import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:flutter/cupertino.dart';

class AvatarBot extends StatelessWidget {
  final AssetType assetType;
  final String imageName;

  const AvatarBot({
    super.key,
    required this.imageName,
    required this.assetType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveImage(
              imageName,
              assetType: assetType,
              baseHeight: 90,
              baseWidth: 90,
              colorBlendMode: BlendMode.overlay,
              themeDirectory: "",
              themeName: "",
            ),
          ],
        )
      ],
    );
  }
}
