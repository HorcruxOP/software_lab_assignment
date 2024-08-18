import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/signup/farm_info_page.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/signup_nav_bar.dart';
import 'package:software_lab_assignment/widgets/social_buttons.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            children: [
              const FarmerEatsText(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                "SignUp 1 of 4",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              const SocialButtons(),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "or signup with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                hintText: "Full Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
                controller: nameController,
                prefixIcon: const SvgIconWidget(icon: personIcon),
              ),
              const SizedBox(height: 15),
              CustomTextfield(
                hintText: "Email Addeess",
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
                prefixIcon: const SvgIconWidget(icon: emailIcon),
              ),
              const SizedBox(height: 15),
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
              const SizedBox(height: 15),
              CustomTextfield(
                  hintText: "Password",
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
                  prefixIcon: const SvgIconWidget(icon: lockIcon)),
              const SizedBox(height: 15),
              CustomTextfield(
                  hintText: "Re-enter Password",
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
                  prefixIcon: const SvgIconWidget(icon: lockIcon)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SignupNavBar(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            userRegisterDetails["email"] = emailController.text.trim();
            userRegisterDetails["password"] = passwordController.text.trim();
            userRegisterDetails["phone"] = "+1${numberController.text.trim()}";
            userRegisterDetails["full_name"] = nameController.text.trim();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FarmInfoPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
