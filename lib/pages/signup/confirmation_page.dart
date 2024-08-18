import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/login/login_page.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Column(
            children: [
              Icon(
                Icons.check_rounded,
                size: 100,
                color: greenColor,
              ),
              Text(
                "You're all done!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Hang tight! We are cureently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          CustomOrangeButton(
            text: "Got it!",
            width: double.infinity,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
