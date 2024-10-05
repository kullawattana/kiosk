import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_cubit.dart';
import 'package:kiosk/jayne/blocs/application_bloc/application_state.dart';
import 'dart:io';
import 'package:lottie/lottie.dart';

enum AssetType {
  network,
  svg,
  image,
  animation,
}

bool _isFileThemeExist = false;

class ResponsiveImage extends StatelessWidget {
  static const defaultLRatio = 1.3;
  static const defaultMRatio = 1.0;
  static const defaultSRatio = 1.0;

  final dynamic asset;
  final double? baseWidth;
  final double? baseHeight;
  final double lRatio;
  final double mRatio;
  final double sRatio;
  final AssetType? assetType;
  final Color? color;
  final BlendMode colorBlendMode;
  final BoxFit? fit;
  final bool? repeatAnimation;
  final Widget? customWidget;
  final String? themeName;
  final String? themeDirectory;

  const ResponsiveImage(
    this.asset, {
    super.key,
    this.baseWidth,
    this.baseHeight,
    this.lRatio = defaultLRatio,
    this.mRatio = defaultMRatio,
    this.sRatio = defaultSRatio,
    this.assetType = AssetType.image,
    this.color,
    this.colorBlendMode = BlendMode.srcIn,
    this.fit,
    this.repeatAnimation,
    this.customWidget,
    this.themeName,
    this.themeDirectory,
  });

  Future<void> fileThemeIsExist(String asset) async {
    final path = '$themeDirectory/$themeName/$asset';
    _isFileThemeExist = (await File(path).exists()) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    fileThemeIsExist(asset);

    if (asset == '') {
      return const SizedBox();
    }

    return BlocBuilder<ApplicationCubit, ApplicationState>(
      buildWhen: (prev, cur) => !listEquals([
        prev.screenWidth,
        prev.isScreenSizeL,
        prev.isScreenSizeM,
      ], [
        cur.screenWidth,
        cur.isScreenSizeL,
        cur.isScreenSizeM,
      ]),
      builder: (context, state) {
        return SizedBox(
          width: (baseWidth ?? state.screenWidth) *
              (state.isScreenSizeL //
                  ? lRatio
                  : state.isScreenSizeM
                      ? mRatio
                      : sRatio),
          height: baseHeight != null
              ? (baseHeight ?? 0) *
                  (state.isScreenSizeL //
                      ? lRatio
                      : state.isScreenSizeM
                          ? mRatio
                          : sRatio)
              : null,
          child: customWidget ?? _renderAsset(),
        );
      },
    );
  }

  Widget _renderAsset() {
    final localPath = dotenv.get('CHATBOT_IMAGE_PATH');
    switch (assetType) {
      case AssetType.svg:
        if (themeDirectory != null && themeDirectory!.isNotEmpty) {
          if (_isFileThemeExist) {
            return SvgPicture.asset('$themeDirectory/$themeName/$asset');
          } else {
            return SvgPicture.asset("$localPath/$asset");
          }
        } else {
          return SvgPicture.asset("$localPath/$asset");
        }
      case AssetType.image:
        if (themeDirectory != null && themeDirectory!.isNotEmpty) {
          if (_isFileThemeExist) {
            var file = File('$themeDirectory/$themeName/$asset');
            return Image.file(file);
          } else {
            return Image.asset(
              "$localPath/$asset",
              fit: fit ?? BoxFit.fitWidth,
              color: color,
              colorBlendMode: colorBlendMode,
            );
          }
        } else {
          return Image.asset(
            "$localPath/$asset",
            fit: fit ?? BoxFit.fitWidth,
            color: color,
            colorBlendMode: colorBlendMode,
          );
        }
      case AssetType.network:
        return Image.network(
          asset,
          fit: fit ?? BoxFit.fitWidth,
          color: color,
          colorBlendMode: colorBlendMode,
        );
      case AssetType.animation:
        return Lottie.asset(
          asset,
          fit: fit ?? BoxFit.contain,
          repeat: repeatAnimation,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}