import 'package:appointment/data/repository/users_repository.dart';
import 'package:appointment/ui/compenents/sign_in_up/form_field_all.dart';
import 'package:appointment/ui/compenents/sign_in_up/signin_and_upbutton.dart';
import 'package:appointment/ui/compenents/sign_in_up/signup_text.dart';
import 'package:appointment/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.updateErrorMessage});
  final Function(String) updateErrorMessage;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final UsersRepository _userRepo = UsersRepository();

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
            SignButton(
              func: _signIn,
              btnName: "Sign In",
            ),
            const SignUpText(),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      widget.updateErrorMessage("Please fill in all fields");
      return;
    }

    final signInResult = await _userRepo.signIn(
        email: emailController.text, password: passwordController.text);
    if (signInResult != null) {
      widget.updateErrorMessage(signInResult);
    } else {
      widget.updateErrorMessage("");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
