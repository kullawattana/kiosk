import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String imageName;
  final AssetType assetType;

  const AvatarCircle({
    super.key,
    required this.imageName,
    required this.assetType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: ResponsiveImage(
          imageName,
          assetType: assetType,
          baseHeight: 25,
          baseWidth: 25,
          colorBlendMode: BlendMode.overlay,
          themeDirectory: "",
          themeName: "",
        ),
      ),
    );
  }
}
