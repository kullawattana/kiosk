class ProductResponse {
  final String? productName;
  final String? brand;
  final String? code;
  final String? originalPrice;
  final String? discountedPrice;
  final String? discount;
  final int? point;
  final String? firstImagesUrl;
  final String? secondImageUrl;
  final String? thirdImageUrl;
  final String? detailProduct;
  final String? productUrl;

  ProductResponse({
    this.productName,
    this.brand,
    this.code,
    this.originalPrice,
    this.discountedPrice,
    this.discount,
    this.point,
    this.firstImagesUrl,
    this.secondImageUrl,
    this.thirdImageUrl,
    this.detailProduct,
    this.productUrl,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      productName: json['name'],
      brand: json['brand'],
      code: json['code'],
      originalPrice: json['original_price'],
      discountedPrice: json['discounted_price'],
      discount: json['discount'],
      point: json['point'],
      firstImagesUrl: json['images_0'],
      secondImageUrl: json['images_1'],
      thirdImageUrl: json['images_2'],
      detailProduct: json['detail'],
      productUrl: json['product_url'],
    );
  }
}