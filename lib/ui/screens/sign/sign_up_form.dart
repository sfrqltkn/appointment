import 'package:appointment/ui/compenents/widgets/form_field_all.dart';
import 'package:appointment/ui/compenents/widgets/signin_and_upbutton.dart';
import 'package:flutter/material.dart';

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

  late String erormessageEmpty = "";
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
            const SizedBox(height: 20),
            const SignButton(btnName: "Sign Up")
          ],
        ),
      ),
    );
  }
}
