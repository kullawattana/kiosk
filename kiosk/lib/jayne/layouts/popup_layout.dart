import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/components/organisms/loader_organism.dart';
import 'package:kiosk/jayne/enhances/focus_cleaner.dart';
import 'package:kiosk/jayne/layouts/widget_size.dart';

class PopupLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? backButton;
  final double? topPadding;
  final double topDividePadding;
  final double bottomDividePadding;
  final Function(Size)? onChildSizeChanged;

  const PopupLayout({
    super.key,
    required this.title,
    required this.child,
    this.backButton = const PopupCloseButton(),
    this.topPadding,
    this.topDividePadding = spaceBase,
    this.bottomDividePadding = spaceBase,
    this.onChildSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget layout = Column(
      children: [
        WidgetSize(
          onWidgetBuilt: onChildSizeChanged ?? (_) {},
          child: Expanded(
            child: child,
          ),
        ),
      ],
    );

    if (backButton != null) {
      layout = Stack(
        children: [
          backButton!,
          layout,
        ],
      );
    }
    return FocusCleaner(
      child: SizeChangedLayoutNotifier(
        child: CircularProgress(child: layout),
      ),
    );
  }
}

class PopupCloseButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;

  const PopupCloseButton({
    super.key,
    this.icon = const Icon(Icons.close),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: spaceLarge,
      top: spaceLarge,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: icon,
        constraints: const BoxConstraints(
          maxHeight: iconSize30,
        ),
        onPressed: () => onPressed == null ? Navigator.pop(context) : onPressed!(),
      ),
    );
  }
}
