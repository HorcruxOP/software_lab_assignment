import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/login/login_page.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';

class SignupNavBar extends StatelessWidget {
  final Function()? onTap;
  const SignupNavBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      height: 120,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
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
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
            CustomOrangeButton(
              width: MediaQuery.of(context).size.width * 0.53,
              text: "Continue",
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
