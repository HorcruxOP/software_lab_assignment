import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/login/login_page.dart';
import 'package:software_lab_assignment/utils/constants.dart';

class RememberPasswordButton extends StatelessWidget {
  const RememberPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Remember your password?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: const Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: orangeColor,
            ),
          ),
        ),
      ],
    );
  }
}
