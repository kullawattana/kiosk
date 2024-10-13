import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class WidgetSize extends StatefulWidget {
  final Widget child;
  final Function(Size) onWidgetBuilt;
  final Function(Size)? onSizeChanged;

  const WidgetSize({
    super.key,
    required this.onWidgetBuilt,
    required this.child,
    this.onSizeChanged,
  });

  @override
  State<WidgetSize> createState() => _WidgetSizeState();
}

class _WidgetSizeState extends State<WidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(_notifyWidgetBuilt);
    if (widget.onSizeChanged != null) {
      return NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          SchedulerBinding.instance.addPostFrameCallback(_notifySizeChanged);
          return true;
        },
        child: SizeChangedLayoutNotifier(
          child: Container(
            key: widgetKey,
            child: widget.child,
          ),
        ),
      );
    } else {
      return Container(
        key: widgetKey,
        child: widget.child,
      );
    }
  }

  final widgetKey = GlobalKey();
  Size? oldSize;

  void _notifyWidgetBuilt(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onWidgetBuilt(newSize ?? const Size(0, 0));
  }

  void _notifySizeChanged(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final newSize = context.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.onSizeChanged!(newSize ?? const Size(0, 0));
  }
}
