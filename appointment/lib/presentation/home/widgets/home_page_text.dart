// Burası hoş geldiniz mesaj fonksiyonu
// ignore: camel_case_types, unused_element
import 'package:flutter/material.dart';

import '../../../decorations_and_colors/colors/login_page_colors.dart';

class Homepagetext extends StatelessWidget {
  const Homepagetext();

  @override
  Widget build(BuildContext context) {
    return const Text(
      " Merhaba, \n HoşGeldiniz",
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: MainColors.headerAndForgotAccountColor),
    );
  }
}