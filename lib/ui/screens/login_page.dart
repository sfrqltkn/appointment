import 'package:appointment/ui/compenents/auth_components.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "/";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LogoCircleWidget(
                    imageAssets: "assets/images/appLogo.png", radius: 147),
                Text(
                  erormessageEmpty,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                AuthForm(
                    controller: emailController,
                    labelText: "Enter Email",
                    icon: const Icon(Icons.person_2_outlined),
                    obscureText: false),
                const SizedBox(height: 10),
                AuthForm(
                    controller: passwordController,
                    labelText: "Enter Password",
                    icon: const Icon(Icons.lock_outline),
                    obscureText: true),
                const SizedBox(height: 20),
                signButton("Log In"),
                const SignUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
