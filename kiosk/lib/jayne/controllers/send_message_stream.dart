import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';

class SendMessageStream {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<BotResponse> _chatList = [];
  List<BotResponse> get chatList => _chatList;

  final _streamChatController = StreamController<List<BotResponse>>.broadcast();
  Stream<List<BotResponse>> get streamChatMessage => _streamChatController.stream;

  final _streamWebSocket = StreamController<BotResponse>.broadcast();
  Stream<BotResponse> get streamWebSocket => _streamWebSocket.stream;

  static final SendMessageStream _instance = SendMessageStream._internal();

  factory SendMessageStream() {
    return _instance;
  }
  SendMessageStream._internal();

  void clearChatMessage() {
    _streamChatController.add([]);
    _chatList.clear();
  }

  void clearStream() async {
    await _streamChatController.stream.drain();
    await _streamWebSocket.stream.drain();
  }

  void receiveNewMessage({
    required BotResponse messageBody,
    bool isWebsocketDisconnectAndGetChatHistory = false,
  }) {
    _chatList.add(messageBody);
    if (listKey.currentState != null) {
      listKey.currentState?.insertItem(_chatList.length - 1);
    }
    _streamChatController.sink.add(_chatList);
  }

  void disposeStreamChatController() {
    _streamChatController.close();
  }

  void sendDataWebsocket(BotResponse data) {
    _streamWebSocket.sink.add(data);
  }
}
