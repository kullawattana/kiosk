import 'dart:async';
import 'package:kiosk/jayne/common/app_styles.dart';
import 'package:kiosk/jayne/common/message_type.dart';
import 'package:kiosk/jayne/components/atoms/widget_spacer.dart';
import 'package:kiosk/jayne/controllers/send_message_stream.dart';
import 'package:kiosk/jayne/enhances/condition.dart';
import 'package:kiosk/jayne/enhances/responsive_image.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';

const bool showChangeThemeButton = false;

enum SendMessageButtonState {
  disable,
  enable,
  active,
}

class SendMessageBox extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey containerKey;

  const SendMessageBox({
    super.key,
    required this.scrollController,
    required this.containerKey,
  });

  @override
  State<SendMessageBox> createState() => _SendMessageBoxState();
}

class _SendMessageBoxState extends State<SendMessageBox> {
  SendMessageButtonState isButtonActive = SendMessageButtonState.disable;
  late TextEditingController _messageController;

  Future<void> _sendMessage() async {
    _messageController.clear();
    _gotoBottomPage();
  }

  void _gotoBottomPage() {
    Future.delayed(const Duration(milliseconds: 10), () {
      widget.scrollController.animateTo(
        widget.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 10),
        curve: Curves.linear,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _messageController.addListener(() {});
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sendMessageStream = SendMessageStream();
    return StreamBuilder<List<BotResponse>>(
      stream: sendMessageStream.streamChatMessage,
      builder: (context, snapshot) {
        var messageType = "";
        final messages = snapshot.data;
        if (messages != null && messages.isNotEmpty) {
          messageType = messages.last.messageType ?? "";
        }
        return Condition(
          condition: messageType != LiveChatMessageType.speechToTextConstant,
          builder: (_) => IntrinsicHeight(
            key: widget.containerKey,
            child: Padding(
              padding: const EdgeInsets.only(
                left: spaceBase,
                bottom: spaceLarge,
                top: spaceBase,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sendMessageBox(),
                  _sendMessageButton(),
                  const WidgetSpacer(),
                ],
              ),
            ),
          ),
          fallback: (_) {
            //TODO Show sound wave
            return Container();
          },
        );
      },
    );
  }

  Widget _sendMessageBox() {
    return Expanded(
      child: TextField(
        controller: _messageController,
        maxLength: 1000,
        maxLines: 5,
        minLines: 1,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: "Aa",
          hintStyle: const TextStyle(
            color: disableHintTextColor,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          counterText: "",
          fillColor: colorNeutralWhite.withAlpha(50),
          filled: true,
          isDense: true,
        ),
        style: const TextStyle(
          fontFamily: "",
          fontSize: fontSizeSubtitle1,
          fontWeight: fontWeightRegular,
        ),
      ),
    );
  }

  Widget _sendMessageButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            child: const ResponsiveImage(
              "assets/images/arrow_icon.svg",
              assetType: AssetType.svg,
              baseHeight: 35,
              baseWidth: 35,
              themeName: "",
              themeDirectory: "",
            ),
            onTap: () {
              if (_messageController.text.trim().isNotEmpty) {
                _sendMessage();
              }
            },
          ),
        ),
      ),
    );
  }
}
