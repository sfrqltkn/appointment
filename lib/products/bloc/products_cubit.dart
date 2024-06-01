import 'package:appointment/products/bloc/products_state.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/products_model.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsState(data: []));

  var collectionUrl =
      FirebaseFirestore.instance.collection(CollectionKeys.products.value);
  var productList = <Products>[];

  Future<dynamic> getProducts() async {
    emit(state.copyWith(isLoading: true));
    var querySnapshot = await collectionUrl.get();
    var documents = querySnapshot.docs;

    productList.clear();

    for (var document in documents) {
      var key = document.id;
      var data = document.data();
      var product = Products.fromJson(data, key);
      productList.add(product);
    }
    emit(state.copyWith(data: productList, isLoading: false));
  }
}
