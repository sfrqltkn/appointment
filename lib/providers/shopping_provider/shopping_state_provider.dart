import 'package:flutter/material.dart';
import '../../data/model/products_model.dart';

class ShoppingStateProvider with ChangeNotifier {
  final List<Products> shoppingItems = [];

  void removeProductsWithPrice(int price) {
    shoppingItems.removeWhere((product) => product.price == price);
    notifyListeners();
  }
  //**********************************************************//

  bool isCheckOutState() {
    int value = totalPrice();
    if (value == 0) {
      return false;
    }
    return true;
  }

  //**********************************************************//
  int totalPrice() {
    int totalItemsPrice = (careCount * 550) +
        (intensiveCount * 450) +
        (herbalCount * 250) +
        (kriyoCount * 300) +
        (manukaCount * 400) +
        (eyelinerCount * 350);
    return totalItemsPrice;
  }

  //**********************************************************//
  int careCount = 0;
  int intensiveCount = 0;
  int herbalCount = 0;
  int kriyoCount = 0;
  int manukaCount = 0;
  int eyelinerCount = 0;

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

  void changeKriyoCount(int count) {
    kriyoCount = count;
    notifyListeners();
  }

  void changeManukaCount(int count) {
    manukaCount = count;
    notifyListeners();
  }

  void changeEyelinerCount(int count) {
    eyelinerCount = count;
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

  bool isProductWithPrice350Exists() {
    for (var product in shoppingItems) {
      if (product.price == 350) {
        return true;
      }
    }
    return false;
  }

  bool isProductWithPrice400Exists() {
    for (var product in shoppingItems) {
      if (product.price == 400) {
        return true;
      }
    }
    return false;
  }

  bool isProductWithPrice300Exists() {
    for (var product in shoppingItems) {
      if (product.price == 300) {
        return true;
      }
    }
    return false;
  }

  //**********************************************************//
  final List<Products> shoppingCareCreamItems = [];

  final List<Products> shoppingIntensiveItems = [];

  final List<Products> shoppingHerbalItems = [];

  final List<Products> shoppingKriyoItems = [];

  final List<Products> shoppingEyelinerItems = [];

  final List<Products> shoppingManukaItems = [];
}
