import 'package:appointment/data/model/products_model.dart';


class ProductsState {
  final bool isLoading;
  final List<Products>? data;

  ProductsState({this.isLoading = false, required this.data});

  ProductsState copyWith(
      {bool? isLoading, List<Products>? data}) {
    return ProductsState(
        data: data ?? this.data, isLoading: isLoading ?? this.isLoading);
  }
}