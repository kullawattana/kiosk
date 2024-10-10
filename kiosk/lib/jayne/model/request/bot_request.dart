class BotRequest {
  String? inputText;
  List<ChatHistory>? chatHistory;
  int? minPrice;
  int? maxPrice;
  int? minDiscountPc;
  int? minDiscountValue;
  int? minPoint;

  BotRequest({
    this.inputText,
    this.chatHistory,
    this.minPrice,
    this.maxPrice,
    this.minDiscountPc,
    this.minDiscountValue,
    this.minPoint,
  });

  BotRequest.fromJson(Map<String, dynamic> json) {
    inputText = json['input_text'];
    if (json['chat_history'] != null) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    }
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    minDiscountPc = json['min_discount_pc'];
    minDiscountValue = json['min_discount_value'];
    minPoint = json['min_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['input_text'] = inputText;
    if (chatHistory != null) {
      data['chat_history'] = chatHistory!.map((v) => v.toJson()).toList();
    }
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['min_discount_pc'] = minDiscountPc;
    data['min_discount_value'] = minDiscountValue;
    data['min_point'] = minPoint;
    return data;
  }
}

class ChatHistory {
  String? role;
  String? content;

  ChatHistory({
    this.role,
    this.content,
  });

  ChatHistory.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }
}
