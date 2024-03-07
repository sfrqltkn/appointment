import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class FormFieldAll
 extends StatelessWidget {
  const FormFieldAll
  ({
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
