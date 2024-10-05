import 'package:kiosk/jayne/model/message/response_chat_object_detail_message.dart';
import 'package:kiosk/jayne/model/message/response_quick_reply_message.dart';

class ResponseChatObjectMessage {
  final ResponseChatObjectDetailMessage chatMessage;
  final List<ResponseQuickReplyMessages>? quickReplyMessage;

  ResponseChatObjectMessage({
    required this.chatMessage,
    this.quickReplyMessage,
  });

  factory ResponseChatObjectMessage.fromJson(Map<String, dynamic> message) {
    if (message['quickReplies'] != null) {
      return ResponseChatObjectMessage(
        chatMessage: ResponseChatObjectDetailMessage.fromJson(message['message']),
        quickReplyMessage: (message['quickReplies'] as List<dynamic>).map((message) => ResponseQuickReplyMessages.fromJson(message)).toList(),
      );
    } else if (message['message'] != null) {
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
