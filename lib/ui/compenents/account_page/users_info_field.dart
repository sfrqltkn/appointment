import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField({
    super.key,
    required this.userController,
    required this.userData,
    required this.userDatatext,
    required this.labelText,
  });

  final String userData;
  final String userDatatext;
  final String labelText;
  final TextEditingController userController;

  @override
  Widget build(BuildContext context) {
    userController.text = userData;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        controller: userController,
        style: const TextStyle(
          fontSize: 22,
        ),
        decoration: InputDecoration(
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
