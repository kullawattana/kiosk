import 'package:kiosk/jayne/model/message/response_button_message.dart';
import 'package:kiosk/jayne/model/message/response_carousel_columns_detail_message.dart';

class ResponseChatObjectDetailMessage {
  final String? messageType;
  final String? imageUrl;
  final String textMessage;
  final String? labelMessage;
  final bool? isHelpful;
  final List<ResponseCarouselColumnsDetailMessage>? carouselColumnsDetail;
  final List<ResponseButtonMessages>? buttonMessage;
  final String? localFilePathAttachment;

  ResponseChatObjectDetailMessage({
    this.messageType = "",
    this.imageUrl = "",
    this.textMessage = "",
    this.labelMessage = "",
    this.isHelpful = false,
    this.carouselColumnsDetail,
    this.buttonMessage,
    this.localFilePathAttachment,
  });

  factory ResponseChatObjectDetailMessage.fromJson(Map<String, dynamic> message, {String? forceMessageType}) {
    //carousel-template
    if (message['columns'] != null) {
      return ResponseChatObjectDetailMessage(
        messageType: message['type'],
        carouselColumnsDetail: (message['columns'] as List<dynamic>).map((button) => ResponseCarouselColumnsDetailMessage.fromJson(button)).toList(),
      );
    }
    //text-template
    else if (message['buttons'] != null) {
      return ResponseChatObjectDetailMessage(
        messageType: message['type'],
        textMessage: message['text'],
        labelMessage: message['label'],
        isHelpful: message['isHelpful'] ?? false,
        buttonMessage: (message['buttons'] as List<dynamic>).map((button) => ResponseButtonMessages.fromJson(button)).toList(),
      );
    }
    //text
    else {
      return ResponseChatObjectDetailMessage(
        messageType: message['type'],
        imageUrl: message['imgUrl'] ?? "",
        textMessage: message['text'] ?? "",
        labelMessage: message['label'],
        isHelpful: message['isHelpful'] ?? false,
        localFilePathAttachment: message['localFilePathAttachment'] ?? "",
      );
    }
  }
}
