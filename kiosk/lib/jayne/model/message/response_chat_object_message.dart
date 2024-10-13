import 'package:kiosk/jayne/model/message/response_chat_object_detail_message.dart';

class ResponseChatObjectMessage {
  final ResponseChatObjectDetailMessage chatMessage;

  ResponseChatObjectMessage({
    required this.chatMessage,
  });

  factory ResponseChatObjectMessage.fromJson(Map<String, dynamic> message) {
    if (message['message'] != null) {
      return ResponseChatObjectMessage(
        chatMessage: ResponseChatObjectDetailMessage.fromJson(message['message']),
      );
    } else {
      return ResponseChatObjectMessage(
        chatMessage: ResponseChatObjectDetailMessage.fromJson(message),
      );
    }
  }
}
