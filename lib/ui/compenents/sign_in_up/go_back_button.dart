import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../login/view/login_page.dart';
import '../../../providers/login_and_signUp_message.dart/eror_message.dart';
import '../../../utils/enums/constant.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
          Provider.of<ErrorMessage>(context, listen: false)
              .changeForgotMessage("");
          Provider.of<ErrorMessage>(context, listen: false)
              .changeSignUpMessage("");
        },
        label: Text(
          LocaleConstants.goBack,
          style: const TextStyle(
            fontSize: 22,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        icon: const Icon(Icons.repeat),
      ),
    );
  }
}
