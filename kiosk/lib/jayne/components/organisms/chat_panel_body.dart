import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/common/action.dart';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/message_type.dart';
import 'package:kiosk/jayne/common/theme_color.dart';
import 'package:kiosk/jayne/components/atoms/typing_animation.dart';
import 'package:kiosk/jayne/components/atoms/widget_spacer.dart';
import 'package:kiosk/jayne/components/molecules/message/receive_message_with_time.dart';
import 'package:kiosk/jayne/components/molecules/message/send_message.dart';
import 'package:kiosk/jayne/controllers/send_message_stream.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:kiosk/jayne/enhances/responsive_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';
import 'package:kiosk/jayne/view/chatbot/chat_instruction_page.dart';

class ChatPanelBody extends StatefulWidget {
  final BuildContext liveChatContext;
  final ScrollController scrollController;
  final GlobalKey containerKey;

  const ChatPanelBody({
    required this.liveChatContext,
    required this.containerKey,
    required this.scrollController,
    super.key,
  });

  @override
  State<ChatPanelBody> createState() => _ChatPanelBodyState();
}

class _ChatPanelBodyState extends State<ChatPanelBody> with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    rebuildAllChildren(context);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {}

  @override
  void dispose() {
    widget.scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildPage();
  }

  Widget _buildPage() {
    final sendMessageStream = SendMessageStream();
    return RefreshIndicator(
      onRefresh: _loadMoreMessages,
      color: ColorTheme.primary.red,
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<BotResponse>>(
              stream: sendMessageStream.streamChatMessage,
              builder: (context, snapshot) {
                final renderMessages = snapshot.data;
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return Center(child: CircularProgressIndicator(color: ColorTheme.error.red));
                // } else if (snapshot.hasError || (!snapshot.hasData || snapshot.data!.isEmpty)) {
                //   return const SizedBox.shrink();
                // }
                return AnimatedList(
                  reverse: false,
                  key: sendMessageStream.listKey,
                  controller: widget.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  initialItemCount: renderMessages?.length ?? 0,
                  itemBuilder: (context, index, animation) {
                    if (index == 0) {
                      // Display "No more chat history" message
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: ResponsiveText(
                          content: "chatbot.view.chat_panel_body.no_more_chat_history".tr(),
                          textStyle: JTextTheme.captionRegular.copyWith(
                            color: ColorTheme.primary.red,
                          ),
                        ),
                      );
                    } else {
                      // Adjust the index for messages
                      if (index >= 0 && index < (renderMessages!.length)) {
                        return _showChatMessage(
                          liveChatContext: widget.liveChatContext,
                          context: context,
                          messageIndex: index,
                          animation: animation,
                          renderMessages: renderMessages,
                          avatarImage: botProfileIconImage,
                          receiveMessageName: botName,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadMoreMessages() async {}

  void _jumpToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    });
  }


  Widget _showChatMessage({
    required BuildContext liveChatContext,
    required BuildContext context,
    required int messageIndex,
    required Animation<double> animation,
    required List<BotResponse> renderMessages,
    required String avatarImage,
    required String receiveMessageName,
  }) {
    _jumpToBottom();
    return _buildResponseMessage(
      liveChatContext: liveChatContext,
      context: context,
      animation: animation,
      message: renderMessages[messageIndex],
      avatarImage: avatarImage,
      receiveMessageName: receiveMessageName,
      index: messageIndex,
    );
  }
}

Widget _buildResponseMessage({
  required BuildContext liveChatContext,
  required Animation<double> animation,
  required BotResponse message,
  required int index,
  required String avatarImage,
  required String receiveMessageName,
  required BuildContext context,
}) {
  final sendMessageStream = SendMessageStream();
  if (message.output != null) {
    switch (message.messageType) {
      case LiveChatMessageType.botStartMessageConstant:
        return const ChatInstructionsPage();
      case LiveChatMessageType.receiveTextConstant:
        return ReceiveMessageWithTimeMolecule(
          message: message.output ?? "",
          imageName: avatarImage,
          receiveMessageName: receiveMessageName,
          time: DateTime.now(),
          assetType: AssetType.image,
        );
      case LiveChatMessageType.sendTextMessageConstant:
        return _sendTextMessage(
          animation: animation,
          message: message,
          index: index,
        );
      case LiveChatMessageType.botTypingMessageConstant:
        return Stack(
          children: [
            TypingAnimation(
              typingController: sendMessageStream,
              imageName: botProfileIconImage,
              assetType: AssetType.image,
            ),
            const WidgetSpacer(
              size: 90,
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  } else {
    return const SizedBox.shrink();
  }
}

Widget _sendTextMessage({
  required Animation<double> animation,
  required BotResponse message,
  required int index,
}) {
  final labelMessage = message.output;
  if (labelMessage != null) {
    if (labelMessage.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(
          right: spaceLarge,
          bottom: spaceSmall,
          top: spaceSmall,
        ),
        child: SendMessage(
          time: DateTime.now(),
          message: message.output ?? "",
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          right: spaceLarge,
          bottom: spaceSmall,
          top: spaceSmall,
        ),
        child: SendMessage(
          time: DateTime.now(),
          message: message.output ?? "",
        ),
      );
    }
  } else {
    return Padding(
      padding: const EdgeInsets.only(
        right: spaceLarge,
        bottom: spaceSmall,
        top: spaceSmall,
      ),
      child: SendMessage(
        time: DateTime.now(),
        message: message.output ?? "",
      ),
    );
  }
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}