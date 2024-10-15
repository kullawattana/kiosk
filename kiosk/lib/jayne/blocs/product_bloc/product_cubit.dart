import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  void updateSelectBrand({required String selectBrandName}) {
    emit(state.copyWith(selectBrandName: selectBrandName));
  }

  void updateSelectPrice({required String selectBrandPrice}) {
    emit(state.copyWith(selectBrandName: selectBrandPrice));
  }

  void updateSelectUsage({required String selectUsage}) {
    emit(state.copyWith(selectUsage: selectUsage));
  }

  void updateColorInShoppingCart({required String totalColorInShoppingCart}) {
    emit(state.copyWith(totalColorInShoppingCart: totalColorInShoppingCart));
  }

  void updateMemoryInShoppingCart({required String totalMemoryInShoppingCart}) {
    emit(state.copyWith(totalColorInShoppingCart: totalMemoryInShoppingCart));
  }

  void updateQuantityInShoppingCart({required int totalQuantityInShoppingCart}) {
    emit(state.copyWith(totalQuantityInShoppingCart: totalQuantityInShoppingCart));
  }

  void updateTotalPriceInShoppingCart({required int totalPriceInShoppingCart}) {
    emit(state.copyWith(totalPriceInShoppingCart: totalPriceInShoppingCart));
  }

  void updateTotalShoppingCartList({required List<ShoppingCartInfo> shoppingCartList}) {
    emit(state.copyWith(shoppingCartList: shoppingCartList));
  }

  Future<void> getProductOnAWSBedrock({
    required String inputText,
  }) async {
    try {
      emit(
        state.copyWith(
          status: ProductStatus.init,
        ),
      );
      final response = await ServiceProvider().requestProduct(
        userContent: '',
        botContent: '',
        inputText: inputText,
        minPrice: 1000,
        maxPrice: 99999,
        minDiscountPc: 0,
        minDiscountValue: 0,
        minPoint: 0,
      );
      if (response.isSuccess) {
        var decodedResponse = jsonDecode(response.responseBody);
        final responseApi = BotResponse.fromJson(decodedResponse);
        debugPrint(responseApi.output);
        debugPrint(responseApi.retrievedReferences?[0].content);
        debugPrint(responseApi.retrievedReferences?[0].metadata?.code);
        debugPrint(responseApi.retrievedReferences?[0].metadata?.productUrl);
        List<ProductInfo> productList = [];
        if (responseApi.retrievedReferences != null) {
          for (var reference in responseApi.retrievedReferences!) {
            List<String> images = [];
            images.add(reference.metadata?.image0 ?? "");
            images.add(reference.metadata?.image1 ?? "");
            images.add(reference.metadata?.image2 ?? "");
            ProductInfo product = ProductInfo(
              images: images,
              imageUrl: reference.metadata?.image0 ?? "",
              brandName: '',
              price: reference.metadata?.originalPrice ?? 0.0,
              color: '',
              detail: '',
            );
            productList.add(product);
          }
          emit(
            state.copyWith(
              productInfo: productList,
              status: ProductStatus.successfully,
            ),
          );
        } else {
          emit(
            state.copyWith(
              productInfo: productList,
              status: ProductStatus.fail,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
      emit(
        state.copyWith(
          status: ProductStatus.exception,
        ),
      );
    }
  }
}
