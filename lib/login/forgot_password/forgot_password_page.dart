import 'package:appointment/login/widgets/form_field_all.dart';
import 'package:appointment/sign_up/widgets/go_back_button.dart';
import 'package:appointment/login/widgets/signin_and_upbutton.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../providers/login_and_signUp_message/eror_message.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleConstants.resetMessage,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          FormFieldAll(
              controller: emailController,
              labelText: LocaleConstants.email,
              icon: const Icon(Icons.person_2_outlined),
              obscureText: false),
          const SizedBox(height: 5),
          Text(
            Provider.of<ErrorMessage>(context).forgotError,
            style: TextStyle(fontSize: 18, color: HexColor("#545454")),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          SignButton(btnName: LocaleConstants.resetButton, func: resetPassword),
          const SizedBox(height: 20),
          const GoBackButton(),
        ],
      ),
    );
  }

  Future resetPassword() async {
    if (emailController.text.isEmpty) {
      setState(() {
        Provider.of<ErrorMessage>(context, listen: false)
            .changeForgotMessage("Please enter your e-mail address");
      });
      return;
    }
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Future.delayed(const Duration(seconds: 5));
      Navigator.of(context).popUntil((route) => route.isFirst);
      setState(() {
        Provider.of<ErrorMessage>(context, listen: false)
            .changeForgotMessage("");
      });
    } catch (e) {
      // print("Hata: $e");
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            return setState(() {
              Provider.of<ErrorMessage>(context, listen: false)
                  .changeForgotMessage('Incorrectly formatted Email address');
            });
          case 'network-request-failed':
            return setState(() {
              Provider.of<ErrorMessage>(context, listen: false)
                  .changeForgotMessage('Internet Connection Problem');
            });
          default:
            return setState(() {
              Provider.of<ErrorMessage>(context, listen: false)
                  .changeForgotMessage('An unexpected error occurred');
            });
        }
      } else {
        return setState(() {
          Provider.of<ErrorMessage>(context, listen: false)
              .changeForgotMessage('An unexpected error occurred');
        });
      }
    }
  }
}
