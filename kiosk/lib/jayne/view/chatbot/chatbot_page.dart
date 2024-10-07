import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:kiosk/jayne/repository/amazon_lex_bot_service.dart';
import 'package:uuid/uuid.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  List<types.Message> messages = [];
  final _user = const types.User(id: '1234556');
  final _bot = const types.User(id: "123");
  //id of bot and user doesn't matter here as we have only pair interaction
  final _botService = AmazonLexBotService();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) async {
    setState(() {
      messages.insert(0, message);
    });
    log("${message.toJson()["text"]}");
    List<String> botRes = await _botService.callBot(message.toJson()["text"]);
    for (var m in botRes) {
      setState(() {
        messages.insert(0, botMessageReply(m));
      });
      log("#####$m}");
    }
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

  void _loadMessages() async {
    List<types.Message> messagesList = [];
    Future.delayed(const Duration(milliseconds: 300), () {
      messagesList.add(types.TextMessage(
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "Hello. My name is TUTU- your bot. How can I help you?",
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
        automaticallyImplyLeading: false,
        title: const Text("BOT"),
        backgroundColor: Colors.amber,
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
