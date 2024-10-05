import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/model/message/response_message_chat.dart';
import 'package:kiosk/jayne/model/message/response_message_stream_controller.dart';
import 'package:kiosk/jayne/model/message/response_message_web_socket.dart';

class SendMessageStream {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<ResponseMessageChat> _chatSwitchingMessageList = [];
  List<ResponseMessageWebSocket> _chatList = [];
  List<ResponseMessageWebSocket> get chatList => _chatList;
  List<ResponseMessageChat> get chatSwitchingMessageList => _chatSwitchingMessageList;

  final _streamChatController = StreamController<List<ResponseMessageWebSocket>>.broadcast();
  Stream<List<ResponseMessageWebSocket>> get streamChatMessage => _streamChatController.stream;

  final _streamWebSocket = StreamController<ResponseMessageStreamController>.broadcast();
  Stream<ResponseMessageStreamController> get streamWebSocket => _streamWebSocket.stream;

  static final SendMessageStream _instance = SendMessageStream._internal();

  factory SendMessageStream() {
    return _instance;
  }
  SendMessageStream._internal();

  void clearChatMessage() {
    _streamChatController.add([]);
    _chatList.clear();
    _chatSwitchingMessageList.clear();
  }

  void clearStream() async {
    await _streamChatController.stream.drain();
    await _streamWebSocket.stream.drain();
  }

  void receiveNewMessage({
    required ResponseMessageWebSocket messageBody,
    bool isWebsocketDisconnectAndGetChatHistory = false,
  }) {
    _chatList.add(messageBody);
    if (listKey.currentState != null) {
      listKey.currentState?.insertItem(_chatList.length - 1);
    }
    _streamChatController.sink.add(_chatList);
  }

  void clearQuickReplyMessage() {
    if (_chatList.isNotEmpty) {
      _chatList[_chatList.length - 1].chatObject?.quickReplyMessage?.clear();
    }
  }

  void receiveNewHistoryMessage({
    required ResponseMessageWebSocket messageBody,
  }) {
    final sendMessageStream = SendMessageStream();
    _chatList.insert(0, messageBody);
    if (listKey.currentState != null) {
      listKey.currentState?.insertItem(0);
    }
    _streamChatController.sink.add(_chatList);
    //sendMessageStream.getCacheMessage();
  }

  void disposeStreamChatController() {
    _streamChatController.close();
  }

  void sendDataWebsocket(ResponseMessageStreamController data) {
    _streamWebSocket.sink.add(data);
  }
}
