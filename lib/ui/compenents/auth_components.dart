import 'package:appointment/ui/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogoCircleWidget extends StatelessWidget {
  const LogoCircleWidget({
    super.key,
    required this.imageAssets,
    required this.radius,
  });
  final String imageAssets;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 20),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imageAssets),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String labelText;
  final Icon icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        controller: controller,
        //Text hide
        obscureText: obscureText,
        //automatic correction feature
        autocorrect: !obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: TextStyle(color: HexColor("#545454"), fontSize: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: HexColor("#602E17"), width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide(color: HexColor("#602E17"), width: 3.0),
          ),
        ),
      ),
    );
  }
}

Container signButton(String buttonName) {
  return Container(
    height: 45,
    margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
    child: ElevatedButton(
      onPressed: () async {},
      child: Text(
        buttonName,
        style: const TextStyle(
          fontSize: 22,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

class SignUpOption extends StatelessWidget {
  const SignUpOption({
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
