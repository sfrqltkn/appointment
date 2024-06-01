import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
    required this.btnName,
    required this.func,
  });

  final String btnName;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: ElevatedButton(
        onPressed: () async {
          await func();
        },
        child: Text(
          btnName,
          style: const TextStyle(
            fontSize: 22,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
