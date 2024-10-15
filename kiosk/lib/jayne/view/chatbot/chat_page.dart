import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:kiosk/jayne/model/response/bot_response.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> messages = [];
  final _user = const types.User(id: '456');
  final _bot = const types.User(id: "123");

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  types.Message botMessageReply(String message) {
    return types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message,
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );
    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) async {
    setState(() {
      messages.insert(0, message);
    });
    log("${message.toJson()["text"]}");
    final response = await ServiceProvider().requestProduct(
      userContent: '',
      botContent: '',
      inputText: '${message.toJson()["text"]}',
      minPrice: 1000,
      maxPrice: 99999,
      minDiscountPc: 0,
      minDiscountValue: 0,
      minPoint: 0,
    );
    if (response.isSuccess) {
      var decodedResponse = jsonDecode(response.responseBody);
      final responseApi = BotResponse.fromJson(decodedResponse);
      debugPrint(responseApi.output);
      setState(() {
        messages.insert(0, botMessageReply(responseApi.output ?? ""));
      });
    }
  }

  void _loadMessages() async {
    List<types.Message> messagesList = [];
    Future.delayed(const Duration(milliseconds: 300), () {
      messagesList.add(types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "greeting_message".tr(),
      ));
      setState(() {
        messages = messagesList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          key: const Key("live_chat_common_app_bar_back_button"),
          icon: const Icon(Icons.arrow_back_sharp),
          color: Colors.black,
          onPressed: (Navigator.canPop(context) //
              ? () => Navigator.maybePop(context)
              : () => Navigator.pop(context)), //app exit
        ),
        title: const Text("Jayne"),
      ),
      body: Chat(
        messages: messages,
        showUserNames: true,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}

