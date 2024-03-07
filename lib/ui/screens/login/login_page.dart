import 'package:appointment/ui/compenents/sign_in_up/logo_circle.dart';
import 'package:appointment/ui/screens/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "/";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String erormessageEmpty = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LogoCircleWidget(
                  imageAssets: "assets/images/appLogo.png",
                  radius: 147,
                ),
                const SizedBox(height: 20),
                Text(
                  erormessageEmpty,
                  style: TextStyle(fontSize: 18, color: HexColor("#545454")),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 260,
                  child: LoginForm(
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
      ),
    );
  }
}
