class ResponseMessageStreamController {
  final String actionStatus;

  ResponseMessageStreamController({
    this.actionStatus = "",
  });

  factory ResponseMessageStreamController.fromJson(Map<String, dynamic> message) {
    return ResponseMessageStreamController(
      actionStatus: message['status'] ?? "",
    );
  }
}
