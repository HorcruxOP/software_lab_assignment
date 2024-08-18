// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:software_lab_assignment/services/functions/auth_functions.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/pages/login/login_page.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/remember_password_button.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                "Reset Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 30),
              const RememberPasswordButton(),
              const SizedBox(height: 50),
              CustomTextfield(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  }
                  return null;
                },
                controller: passwordController,
                prefixIcon: const SvgIconWidget(icon: lockIcon),
                hintText: "New Password",
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                hintText: "Confirm New Password",
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Confirm Password cannot be empty";
                  }
                  if (passwordController.text.trim() !=
                      confirmPasswordController.text.trim()) {
                    return "Password didn't match";
                  }
                  return null;
                },
                controller: confirmPasswordController,
                prefixIcon: const SvgIconWidget(icon: lockIcon),
              ),
              const SizedBox(height: 40),
              CustomOrangeButton(
                text: "Submit",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    resetPasswordDetails["password"] =
                        passwordController.text.trim();
                    resetPasswordDetails["cpassword"] =
                        confirmPasswordController.text.trim();
                    bool isTrue = await AuthFunctions().resetPassword(context);
                    if (isTrue) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
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
