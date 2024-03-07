import 'package:appointment/ui/compenents/widgets/form_field_all.dart';
import 'package:appointment/ui/compenents/widgets/signin_and_upbutton.dart';
import 'package:appointment/ui/compenents/widgets/signup_text.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            FormFieldAll(
                controller: emailController,
                labelText: "Email",
                icon: const Icon(Icons.person_2_outlined),
                obscureText: false),
            const SizedBox(height: 15),
            FormFieldAll(
                controller: passwordController,
                labelText: "Password",
                icon: const Icon(Icons.lock_outline),
                obscureText: true),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const SizedBox(height: 10),
            const SignButton(
              btnName: "Sign In",
            ),
            const SignUpText(),
          ],
        ),
      ),
    );
  }
}
