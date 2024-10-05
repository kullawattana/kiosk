import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Nong Jayne"),
        Text("Remembers what user said \n earlier in the conversation"),
        Text("Allows user to provide. \n follow-up corrections with AI"),
        Text("Limited knowledge of world and events after 2021"),
        Text("กล่องส่งข้อความ")
      ],
    );
  }
}
