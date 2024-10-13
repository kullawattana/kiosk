import 'package:flutter/material.dart';

class FocusCleaner extends StatelessWidget {
  final Widget child;

  const FocusCleaner({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.clearFocus(),
      child: child,
    );
  }
}

extension BuildContextFocus on BuildContext {
  void clearFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
