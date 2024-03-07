import 'package:appointment/ui/compenents/auth_components.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });
  static const String routeName = "/sign_up";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

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
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              AuthForm(
                  controller: firstName,
                  labelText: "First Name",
                  icon: const Icon(Icons.person_2_outlined),
                  obscureText: false),
              const SizedBox(height: 20),
              AuthForm(
                  controller: lastName,
                  labelText: "Last Name",
                  icon: const Icon(Icons.group_add_outlined),
                  obscureText: false),
              const SizedBox(height: 20),
              AuthForm(
                  controller: phoneNumber,
                  labelText: "Phone Number",
                  icon: const Icon(Icons.mail_outline),
                  obscureText: false),
              const SizedBox(height: 20),
              AuthForm(
                  controller: email,
                  labelText: "E-mail",
                  icon: const Icon(Icons.mail_outline),
                  obscureText: false),
              const SizedBox(height: 20),
              AuthForm(
                  controller: password,
                  labelText: "Password",
                  icon: const Icon(Icons.lock_person_outlined),
                  obscureText: true),
              const SizedBox(height: 20),
              signButton("Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
