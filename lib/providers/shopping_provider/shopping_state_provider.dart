import 'package:flutter/material.dart';
import '../../data/model/products_model.dart';

class ShoppingStateProvider with ChangeNotifier {
  final List<Products> shoppingItems = [];

  List<Products> get getShoppingItems {
    return shoppingItems;
  }

  //**********************************************************//
  int totalPrice() {
    int totalItemsPrice =
        (careCount * 550) + (intensiveCount * 450) + (herbalCount * 250);
    return totalItemsPrice;
  }

  //**********************************************************//
  int careCount = 0;
  int intensiveCount = 0;
  int herbalCount = 0;

  void changecareCount(int count) {
    careCount = count;
    notifyListeners();
  }

  void changeintensiveCount(int count) {
    intensiveCount = count;
    notifyListeners();
  }

  void changeherbalCount(int count) {
    herbalCount = count;
    notifyListeners();
  }

  ///**************************************/**************** */ */
  bool isProductWithPrice450Exists() {
    for (var product in shoppingItems) {
      if (product.price == 450) {
        return true;
      }
    }
    return false;
  }

  bool isProductWithPrice550Exists() {
    for (var product in shoppingItems) {
      if (product.price == 550) {
        return true;
      }
    }
    return false;
  }

  bool isProductWithPrice250Exists() {
    for (var product in shoppingItems) {
      if (product.price == 250) {
        return true;
      }
    }
    return false;
  }

  //**********************************************************//
  final List<Products> shoppingCareCreamItems = [];

  final List<Products> shoppingIntensiveItems = [];

  final List<Products> shoppingHerbalItems = [];
}
