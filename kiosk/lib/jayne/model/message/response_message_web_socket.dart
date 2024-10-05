import 'dart:convert';
import 'package:kiosk/jayne/model/message/response_chat_object_message.dart';

class ResponseMessageWebSocket {
  final ResponseChatObjectMessage? chatObject;

  ResponseMessageWebSocket({
    this.chatObject,
  });

  factory ResponseMessageWebSocket.fromJson(Map<String, dynamic> message) {
    ResponseChatObjectMessage? chatObject;
    if (message['ChatObject'] != null) {
      if (message['ChatObject'] is Map<String, dynamic>) {
        chatObject = ResponseChatObjectMessage.fromJson(message['ChatObject']);
      } else if (message['ChatObject'] is String) {
        final chatObjectString = message['ChatObject'] as String;
        final decodedChatObject = jsonDecode(chatObjectString);
        chatObject = ResponseChatObjectMessage.fromJson(decodedChatObject);
      }
    }
    return ResponseMessageWebSocket(
      chatObject: chatObject,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ChatObject'] = chatObject;
    return data;
  }
}
