class ProductRequest {
  final String? message;

  ProductRequest({
    this.message,
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) {
    return ProductRequest(
      message: json['message'],
    );
  }
}