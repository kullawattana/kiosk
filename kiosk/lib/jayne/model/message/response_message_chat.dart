class ResponseMessageChat {
  String messageId;
  DateTime nextDateTime;

  ResponseMessageChat({
    this.messageId = "",
    required this.nextDateTime,
  });

  factory ResponseMessageChat.fromJson(Map<String, dynamic> message) {
    return ResponseMessageChat(
      messageId: message['messageId'] ?? "",
      nextDateTime: message['nextDateTime'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageId'] = messageId;
    data['nextDateTime'] = nextDateTime;
    return data;
  }
}
