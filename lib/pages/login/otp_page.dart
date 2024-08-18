// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/login/reset_password_page.dart';
import 'package:software_lab_assignment/services/functions/auth_functions.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/otp_widget.dart';
import 'package:software_lab_assignment/widgets/remember_password_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            const FarmerEatsText(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Text(
              "Verify OTP",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 30),
            const RememberPasswordButton(),
            const SizedBox(height: 50),
            OtpWidget(
              onOtpChanged: (otp) {
                setState(() {
                  this.otp = otp;
                });
              },
            ),
            const SizedBox(height: 40),
            CustomOrangeButton(
              text: "Submit",
              onTap: () async {
                if (otp.length == 5) {
                 bool isTrue = await AuthFunctions().verifyOtp(context, otp);
                 if(isTrue){
                  resetPasswordDetails["token"] = otp;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordPage(),
                    ),
                  );
                 }
                  
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 750),
                      content: Text(
                        "Invalid Otp",
                      ),
                      backgroundColor: orangeColor,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              child: const Text(
                "Resend Code",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
