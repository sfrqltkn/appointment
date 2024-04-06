import 'package:appointment/data/repository/users_repository.dart';
import 'package:appointment/providers/login_and_signUp_message.dart/eror_message.dart';
import 'package:appointment/ui/compenents/sign_in_up/form_field_all.dart';
import 'package:appointment/ui/compenents/sign_in_up/signin_and_upbutton.dart';
import 'package:appointment/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                labelText: "First Name",
                icon: const Icon(Icons.person_2_outlined),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: lastName,
                labelText: "Last Name",
                icon: const Icon(Icons.group_add_outlined),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: phoneNumber,
                labelText: "Phone Number",
                icon: const Icon(Icons.mail_outline),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: email,
                labelText: "E-mail",
                icon: const Icon(Icons.mail_outline),
                obscureText: false),
            const SizedBox(height: 20),
            FormFieldAll(
                controller: password,
                labelText: "Password",
                icon: const Icon(Icons.lock_person_outlined),
                obscureText: true),
            const SizedBox(height: 40),
            SignButton(btnName: "Sign Up", func: _signUp),
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
            .changeSignUpMessage("Please enter your e-mail address");
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
