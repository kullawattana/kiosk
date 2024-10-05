import 'package:kiosk/jayne/model/message/response_carousel_button_detail_message.dart';

class ResponseCarouselColumnsDetailMessage {
  final String title;
  final String description;
  final String imageUrl;
  final List<ResponseCarouselButtonsDetailMessage> carouselButtonDetail;

  ResponseCarouselColumnsDetailMessage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.carouselButtonDetail,
  });

  factory ResponseCarouselColumnsDetailMessage.fromJson(Map<String, dynamic> message) {
    return ResponseCarouselColumnsDetailMessage(
      title: message['title'] ?? "",
      description: message['description'] ?? "",
      imageUrl: message['imgUrl'] ?? "",
      carouselButtonDetail: (message['buttons'] as List<dynamic>)
          .map((button) => ResponseCarouselButtonsDetailMessage.fromJson(button))
          .toList(),
    );
  }
}