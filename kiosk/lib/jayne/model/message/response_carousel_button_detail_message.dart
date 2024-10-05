class ResponseCarouselButtonsDetailMessage {
  final String messageType;
  final String labelMessage;
  final String textMessage;
  final String? url;

  ResponseCarouselButtonsDetailMessage({
    required this.messageType,
    required this.labelMessage,
    required this.textMessage,
    this.url,
  });

  factory ResponseCarouselButtonsDetailMessage.fromJson(Map<String, dynamic> message) {
    final messageType = message['type'];
    switch (messageType) {
      case "external-url":
        return ResponseCarouselButtonsDetailMessage(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          textMessage: message['text'] ?? "",
          url: message['url'] ?? "",
        );
      case "url":
        return ResponseCarouselButtonsDetailMessage(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          textMessage: message['text'] ?? "",
          url: message['url'] ?? "",
        );
      default:
        return ResponseCarouselButtonsDetailMessage(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          textMessage: message['text'] ?? "",
        );
    }
  }
}
