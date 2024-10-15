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
  final String selectBrandName;
  final int selectPrice;
  final String selectUsage;

  const ProductState({
    this.status = ProductStatus.init,
    this.productInfo = const [],
    this.detailPromotion = "",
    this.totalCost = 0,
    this.totalCostWithDiscount = 0,
    this.selectBrandName = "",
    this.selectPrice = 0,
    this.selectUsage = "",
  });

  ProductState copyWith({
    ProductStatus? status,
    List<ProductInfo>? productInfo,
    String? detailPromotion,
    int? totalCost,
    int? totalCostWithDiscount,
    String? selectBrandName,
    int? selectPrice,
    String? selectUsage,
  }) {
    return ProductState(
      status: status ?? this.status,
      productInfo: productInfo ?? this.productInfo,
      detailPromotion: detailPromotion ?? this.detailPromotion,
      totalCostWithDiscount: totalCostWithDiscount ?? this.totalCostWithDiscount,
      selectBrandName: selectBrandName ?? this.selectBrandName,
      selectPrice: selectPrice ?? this.selectPrice,
      selectUsage: selectUsage ?? this.selectUsage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        productInfo,
        detailPromotion,
        totalCostWithDiscount,
        selectBrandName,
        selectPrice,
        selectUsage,
      ];
}

class ProductInfo {
  final List<String> images;
  final String imageUrl;
  final String brandName;
  final double price;
  final String color;
  final String detail;

  ProductInfo({
    required this.images,
    required this.imageUrl,
    required this.brandName,
    required this.price,
    required this.color,
    required this.detail,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) => ProductInfo(
        images: json['images'],
        imageUrl: json['image_url'],
        brandName: json['brand_name'],
        price: json['price'],
        color: json['color'],
        detail: json['detail'],
      );
}

class ShoppingCartList {
  final List<ShoppingCartInfo> shoppingCartList;

  ShoppingCartList ({
    required this.shoppingCartList,
  });

  factory ShoppingCartList.fromJson(Map<String, dynamic> json) => ShoppingCartList(
    shoppingCartList: json['shoppingCartList'],
  );
}

class ShoppingCartInfo {
  final String imageUrl;
  final String brandName;
  final String storage;
  final int quantity;
  final double price;
  final String color;

  ShoppingCartInfo({
    required this.imageUrl,
    required this.brandName,
    required this.storage,
    required this.quantity,
    required this.price,
    required this.color,
  });

  factory ShoppingCartInfo.fromJson(Map<String, dynamic> json) => ShoppingCartInfo(
    imageUrl: json['imageUrl'],
    brandName: json['brand_name'],
    storage: json['storage'],
    quantity: json['quantity'],
    price: json['price'],
    color: json['color'],
  );
}
