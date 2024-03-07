import 'package:appointment/ui/screens/sign/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });
  static const String routeName = "/sign_up";

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
                erormessageEmpty,
                style: TextStyle(fontSize: 18, color: HexColor("#545454")),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 500,
                child: SignUpForm(
                  updateErrorMessage: (String errorMessage) {
                    setState(() {
                      erormessageEmpty = errorMessage;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
