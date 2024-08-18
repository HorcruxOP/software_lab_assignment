import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/pages/login/forgot_password_page.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage(),
          ),
        );
      },
      child: const Text(
        "Forgot?",
        style: TextStyle(
          fontSize: 16,
          color: orangeColor,
        ),
      ),
    );
  }
}
