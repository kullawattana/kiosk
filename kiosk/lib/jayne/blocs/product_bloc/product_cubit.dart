import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';
import 'package:kiosk/jayne/repository/service_provider.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  Future<void> getProduct({
    required String inputText,
  }) async {
    try {
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
            ProductInfo product = ProductInfo(
              imageUrl: reference.metadata?.image0 ?? "",
              brandName: '',
              cost: reference.metadata?.originalPrice ?? 0.0,
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
