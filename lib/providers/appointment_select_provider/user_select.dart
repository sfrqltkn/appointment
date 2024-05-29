import 'package:flutter/material.dart';

class UserSelect with ChangeNotifier {
  bool isSelectPerson = false;
  bool isSelectedOperation = false;
  late String selectedPersonProfileUrl = "";
  late int price = 0;

  void changeSelectPerson(bool personSelect) {
    isSelectPerson = personSelect;
    notifyListeners();
  }

  void changeSelectOperation(bool operationSelect) {
    isSelectedOperation = operationSelect;
    notifyListeners();
  }

  void changePersonUrl(String newUrl) {
    selectedPersonProfileUrl = newUrl;
    notifyListeners();
  }

  void changePrice(int newPrice) {
    price = newPrice;
    notifyListeners();
  }
}
