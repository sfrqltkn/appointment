import 'package:appointment/data/repository/users_repository.dart';
import 'package:appointment/providers/login_and_signUp_message/eror_message.dart';
import 'package:appointment/login/widgets/form_field_all.dart';
import 'package:appointment/login/widgets/signin_and_upbutton.dart';
import 'package:appointment/login/view/login_page.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/go_back_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final UsersRepository _userRepo = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            FormFieldAll(
                controller: firstName,
                labelText: LocaleConstants.name,
                icon: const Icon(Icons.person_2_outlined),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: lastName,
                labelText: LocaleConstants.surname,
                icon: const Icon(Icons.group_add_outlined),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: phoneNumber,
                labelText: LocaleConstants.phoneNumber,
                icon: const Icon(Icons.mail_outline),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: email,
                labelText: LocaleConstants.email,
                icon: const Icon(Icons.mail_outline),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: password,
                labelText: LocaleConstants.password,
                icon: const Icon(Icons.lock_person_outlined),
                obscureText: true),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const GoBackButton(),
                SignButton(btnName: LocaleConstants.signUp, func: _signUp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        password.text.isEmpty ||
        email.text.isEmpty) {
      setState(() {
        Provider.of<ErrorMessage>(context, listen: false)
            .changeSignUpMessage("Please fill in all fields");
      });
      return;
    }
    final signUpResult = await _userRepo.signUp(
        firstname: firstName.text,
        lastname: lastName.text,
        phoneNumber: phoneNumber.text,
        email: email.text,
        password: password.text);

    if (signUpResult != null) {
      setState(() {
        Provider.of<ErrorMessage>(context, listen: false)
            .changeSignUpMessage(signUpResult);
      });
    } else {
      Provider.of<ErrorMessage>(context, listen: false).changeSignUpMessage("");
      Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }
}
