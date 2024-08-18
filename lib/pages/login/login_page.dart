// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/signup/confirmation_page.dart';
import 'package:software_lab_assignment/services/functions/auth_functions.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/create_account_button.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/forget_button.dart';
import 'package:software_lab_assignment/widgets/social_buttons.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                "Welcome back!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    "New here?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  CreateAccountButton(),
                ],
              ),
              const SizedBox(height: 50),
              CustomTextfield(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
                  RegExp regex = RegExp(regexPattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const SvgIconWidget(icon: emailIcon),
                hintText: "Email Address",
              ),
              const SizedBox(height: 30),
              CustomTextfield(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  }
                  return null;
                },
                obscureText: true,
                prefixIcon: const SvgIconWidget(icon: lockIcon),
                hintText: "Password",
                suffixIcon: const ForgetButton(),
              ),
              const SizedBox(height: 40),
              CustomOrangeButton(
                text: "Login",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    userLoginDetails["email"] = emailController.text.trim();
                    userLoginDetails["password"] =
                        passwordController.text.trim();
                    bool isTrue = await AuthFunctions().login(context);
                    if (isTrue) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfirmationPage(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "or login with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
