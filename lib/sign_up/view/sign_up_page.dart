import 'package:appointment/providers/login_and_signUp_message.dart/eror_message.dart';
import 'package:appointment/sign_up/view/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String erormessageEmpty = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              Text(
                Provider.of<ErrorMessage>(context).signUpError,
                style: TextStyle(fontSize: 18, color: HexColor("#545454")),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 500,
                child: SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
