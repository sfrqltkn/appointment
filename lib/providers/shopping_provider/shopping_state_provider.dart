import 'package:flutter/material.dart';
import '../../data/model/products_model.dart';

class ShoppingStateProvider with ChangeNotifier {
  int productCount = 1;
  final List<Products> _shoppingItems = [];

  List<Products> get getShoppingItems {
    return _shoppingItems;
  }

  void changeProductCount(int count) {
    productCount = count;
    notifyListeners();
  }

  void removeOneItem({required int index}) {
    if (index >= 0 && index < _shoppingItems.length) {
      _shoppingItems.removeAt(index);
      notifyListeners();
    }
  }

  void addProduct(Products product) {
    _shoppingItems.add(product);
    notifyListeners();
  }
}