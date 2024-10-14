import 'package:equatable/equatable.dart';

enum ProductStatus {
  init,
  successfully,
  fail,
  exception,
}

class ProductState extends Equatable {
  final ProductStatus status;
  final List<ProductInfo>? productInfo;
  final String detailPromotion;
  final int totalCost;
  final int totalCostWithDiscount;

  const ProductState({
    this.status = ProductStatus.init,
    this.productInfo = const [],
    this.detailPromotion = "",
    this.totalCost = 0,
    this.totalCostWithDiscount = 0,
  });

  ProductState copyWith({
    ProductStatus? status,
    List<ProductInfo>? productInfo,
    String? detailPromotion,
    int? totalCost,
    int? totalCostWithDiscount,
  }) {
    return ProductState(
      status: status ?? this.status,
      productInfo: productInfo ?? this.productInfo,
      detailPromotion: detailPromotion ?? this.detailPromotion,
      totalCostWithDiscount: totalCostWithDiscount ?? this.totalCostWithDiscount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        productInfo,
        detailPromotion,
        totalCostWithDiscount,
      ];
}

class ProductInfo {
  final String imageUrl;
  final String brandName;
  final double cost;
  final String color;
  final String detail;

  ProductInfo({
    required this.imageUrl,
    required this.brandName,
    required this.cost,
    required this.color,
    required this.detail,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        imageUrl: json['image_url'],
        brandName: json['brand_name'],
        cost: json['cost'],
        color: json['color'],
        detail: json['detail'],
      );
}
