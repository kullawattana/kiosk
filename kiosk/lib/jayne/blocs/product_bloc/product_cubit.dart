import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/jayne/blocs/product_bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

}
