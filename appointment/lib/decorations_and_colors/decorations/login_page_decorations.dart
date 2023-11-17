import 'package:appointment/decorations_and_colors/colors/login_page_colors.dart';
import 'package:flutter/material.dart';

///------Button Container Decorations-------/////
class ContainerBoxDecorations {
  static BoxDecoration buttonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.blueGrey,
    );
  }
}

///-----Login Page And Sign_Up Page Text Form Field Decorations------/////
class InputDecorationBuilder {
  static const double borderRadius = 15.0; // Sabit bir değer olarak tanımlandı

  static InputDecoration textFormDecorationMail() {
    return InputDecoration(
      labelText: "E-mail",
      labelStyle: const TextStyle(
          color: MainColors.outlineAndInputBorderColor, fontSize: 18),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
            width: 3, color: MainColors.outlineAndInputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: MainColors.outlineAndInputBorderColor,
        ),
      ),
    );
  }

  static InputDecoration textFormDecorationPassword(bool isObscure) {
    return InputDecoration(
      labelText: "şifre",
      labelStyle: const TextStyle(
        color: MainColors.outlineAndInputBorderColor,
        fontSize: 18,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          width: 3,
          color: MainColors.outlineAndInputBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: MainColors.outlineAndInputBorderColor,
        ),
      ),
      // obscureText özelliği ile şifreyi gizlemek veya göstermek için
      suffixIcon: IconButton(
        icon: Icon(
          isObscure ? Icons.visibility : Icons.visibility_off,
          color: MainColors.outlineAndInputBorderColor,
        ),
        onPressed: () {
          // Toggle işlemi: true ise false, false ise true yapar
          // Yani, şu anki durumun tersini alır.
          isObscure = !isObscure;
        },
      ),
    );
  }
}

///--------- Login Forgot And Account Button Decorations---------/////
buildTextButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(
        color: MainColors.mainHeaderTextColor,
        decoration: TextDecoration.underline,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
