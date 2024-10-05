class ResponseQuickReplyMessages {
  final String messageType;
  final String labelMessage;
  final String textMessage;

  ResponseQuickReplyMessages({
    required this.messageType,
    required this.labelMessage,
    required this.textMessage,
  });

  factory ResponseQuickReplyMessages.fromJson(Map<String, dynamic> message) {
    return ResponseQuickReplyMessages(
      messageType: message['type'] ?? "",
      labelMessage: message['label'] ?? "",
      textMessage: message['text'] ?? "",
    );
  }
}