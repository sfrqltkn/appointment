// ignore: file_names
import 'package:appointment/sign_up/view/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't Have Account? ",
            style: TextStyle(color: HexColor("#524E4E"), fontSize: 16)),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 20,
              color: HexColor("#545454"),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
