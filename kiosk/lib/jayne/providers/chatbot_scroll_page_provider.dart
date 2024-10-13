import 'package:flutter/material.dart';

class ChatBotScrollPageProvider extends ChangeNotifier {
  double? _scrollPosition;
  double _bottomBarSize = double.infinity;
  double _max = double.infinity;

  double get bottomBarSize => _bottomBarSize;
  bool get showGoToBottomButton => _scrollPosition != null && _scrollPosition! <= (_max - _bottomBarSize);

  /* Updates the size of the bottom bar to the given size. */
  void updateBottomBarSize(double size) {
    _bottomBarSize = size;
  }

  /* Updates the scroll position of the current page to the given position. */
  void updateScrollPosition(double position, double max) {
    if (_scrollPosition != position || _max != max) {
      _scrollPosition = position;
      _max = max;
      notifyListeners();
    }
  }
}
