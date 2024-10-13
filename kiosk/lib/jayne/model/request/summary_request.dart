class SummaryRequest {
  String? inputText;

  SummaryRequest({
    this.inputText,
  });

  SummaryRequest.fromJson(Map<String, dynamic> json) {
    inputText = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = inputText;
    return data;
  }
}