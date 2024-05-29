import 'package:appointment/data/repository/users_repository.dart';
import 'package:appointment/manager/manager_page.dart';
import 'package:appointment/login/forgot_password/forgot_password_page.dart';
import 'package:appointment/providers/login_and_signUp_message/eror_message.dart';
import 'package:appointment/login/widgets/form_field_all.dart';
import 'package:appointment/login/widgets/signin_and_upbutton.dart';
import 'package:appointment/sign_up/widgets/signup_text.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

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
                labelText: LocaleConstants.email,
                icon: const Icon(Icons.person_2_outlined),
                obscureText: false),
            const SizedBox(height: 15),
            FormFieldAll(
                controller: passwordController,
                labelText: LocaleConstants.password,
                icon: const Icon(Icons.lock_outline),
                obscureText: true),
            const SizedBox(height: 25),
            SignButton(
              func: _signIn,
              btnName: LocaleConstants.signButton,
            ),
            const SizedBox(height: 30),
            GestureDetector(
              child: Text(
                LocaleConstants.passwordForgot,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: HexColor("#545454"),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ));
              },
            ),
            const SignUpText(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Provider.of<ErrorMessage>(context, listen: false)
          .changeLoginMessage("Please fill in all fields");
      return;
    }

    final signInResult = await _userRepo.signIn(
        email: emailController.text, password: passwordController.text);
    if (signInResult != null) {
      Provider.of<ErrorMessage>(context, listen: false)
          .changeLoginMessage(signInResult);
    } else {
      Provider.of<ErrorMessage>(context, listen: false).changeLoginMessage("");

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const ManagerPage(currentIndex: 0)),
      );
    }
  }
}
