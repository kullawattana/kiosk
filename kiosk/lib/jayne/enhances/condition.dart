import 'package:flutter/material.dart';

class Condition extends StatelessWidget {
  final bool condition;
  final WidgetBuilder builder;
  final WidgetBuilder? fallback;

  const Condition({
    super.key,
    required this.condition,
    required this.builder,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) => condition //
      ? builder(context)
      : fallback != null //
          ? fallback!(context)
          : const SizedBox.shrink();
}
