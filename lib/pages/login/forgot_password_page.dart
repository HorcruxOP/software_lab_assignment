// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:software_lab_assignment/services/functions/auth_functions.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/pages/login/otp_page.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/remember_password_button.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            children: [
              const FarmerEatsText(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 30),
              const RememberPasswordButton(),
              const SizedBox(height: 50),
              CustomTextfield(
                hintText: "Phone Number",
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Number cannot be empty";
                  }
                  if (value.length < 10) {
                    return "Number must be 10 characters long";
                  }
                  return null;
                },
                controller: numberController,
                prefixIcon: const SvgIconWidget(icon: callIcon),
              ),
              const SizedBox(height: 40),
              CustomOrangeButton(
                text: "Send Code",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                   bool isTrue =  await AuthFunctions().forgotPassword(
                      context,
                      numberController.text.trim(),
                    );
                   if(isTrue) {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpPage(),
                      ),
                    );
                   }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
