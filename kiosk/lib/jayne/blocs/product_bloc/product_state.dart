import 'package:equatable/equatable.dart';

enum ProductStatus {
  init,
}
class ProductState extends Equatable {
  final ProductStatus status;

  const ProductState({
    this.status = ProductStatus.init,
  });

  ProductState copyWith({
    ProductStatus? status,
  }) {
    return ProductState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
