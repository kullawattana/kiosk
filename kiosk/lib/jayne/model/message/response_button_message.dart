class ResponseButtonMessages {
  final String messageType;
  final String labelMessage;
  final String? textMessage;
  final String? url;

  ResponseButtonMessages({
    required this.messageType,
    required this.labelMessage,
    this.textMessage,
    this.url,
  });

  factory ResponseButtonMessages.fromJson(Map<String, dynamic> message) {
    switch (message['type']) {
      case "url":
        return ResponseButtonMessages(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          url: message['url'] ?? "",
        );
      case "external-url":
        return ResponseButtonMessages(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          url: message['url'] ?? "",
        );
      default:
        return ResponseButtonMessages(
          messageType: message['type'] ?? "",
          labelMessage: message['label'] ?? "",
          textMessage: message['text'] ?? "",
        );
    }
  }
}
