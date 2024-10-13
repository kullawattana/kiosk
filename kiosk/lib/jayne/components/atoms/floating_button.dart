import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/providers/chatbot_scroll_page_provider.dart';
import 'package:provider/provider.dart';

class ScrollJumpFloatingButton extends StatelessWidget {
  final Function() jumpToBottom;

  const ScrollJumpFloatingButton({
    super.key,
    required this.jumpToBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<ChatBotScrollPageProvider, double>(
      selector: (_, newState) => newState.bottomBarSize,
      builder: (context, height, child) {
        return Selector<ChatBotScrollPageProvider, bool>(
          selector: (_, newState) => newState.showGoToBottomButton,
          builder: (context, showGoToBottomButton, child) {
            return showGoToBottomButton
                ? Padding(
                    padding: EdgeInsets.only(bottom: height + 8.0),
                    child: SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: FloatingActionButton(
                        elevation: 4.0,
                        backgroundColor: ColorTheme.neutral.grey.withOpacity(0.8),
                        onPressed: () {
                          jumpToBottom();
                        },
                        child: const Icon(
                          Icons.arrow_downward,
                          size: 15,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        );
      },
    );
  }
}
