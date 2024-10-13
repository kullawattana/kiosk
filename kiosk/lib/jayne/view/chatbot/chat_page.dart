import 'dart:async';
import 'package:kiosk/jayne/common/default_color.dart';
import 'package:kiosk/jayne/components/atoms/floating_button.dart';
import 'package:kiosk/jayne/components/molecules/message/send_message.dart';
import 'package:kiosk/jayne/components/organisms/chat_panel_body.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatPage> with WidgetsBindingObserver {
  final scrollController = ScrollController();
  final containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {}

  void _jumpToBottom() {
    void scroll() {
      const duration = Duration(milliseconds: 100);
      final targetPosition = scrollController.position.maxScrollExtent;
      const step = 500.0;
      final newOffset = (scrollController.offset + step).clamp(0.0, targetPosition);
      scrollController.animateTo(
        newOffset,
        duration: duration,
        curve: Curves.linear,
      );
      if (newOffset < targetPosition) {
        Timer(duration, scroll);
      }
    }
    scroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageLayoutBackgroundColor,
      floatingActionButton: ScrollJumpFloatingButton(
        jumpToBottom: () {
          setState(() {
            _jumpToBottom();
          });
        },
      ),
      body: ChatPanelBody(
        liveChatContext: context,
        scrollController: scrollController,
        containerKey: containerKey,
      ),
      bottomNavigationBar: SendMessage(
        message: '',
        time: DateTime.now(),
      ),
    );
  }
}
