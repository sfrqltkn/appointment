import 'package:flutter/material.dart';

class ErrorMessage with ChangeNotifier {
  String loginError = "";
  String signUpError = "";
  String forgotError = "";

  void changeLoginMessage(String message) {
    loginError = message;
    notifyListeners();
  }

  void changeSignUpMessage(String message) {
    signUpError = message;
    notifyListeners();
  }

  void changeForgotMessage(String message) {
    forgotError = message;
    notifyListeners();
  }
}
