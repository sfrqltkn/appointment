// ignore: file_names
import 'package:appointment/sign_up/view/sign_up_page.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../providers/login_and_signUp_message.dart/eror_message.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleConstants.signUpMessage,
            style: TextStyle(color: HexColor("#524E4E"), fontSize: 16)),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
            Provider.of<ErrorMessage>(context, listen: false)
                .changeLoginMessage("");
          },
          child: Text(
            LocaleConstants.signUp,
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
