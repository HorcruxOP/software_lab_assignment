import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/pages/signup/verification_page.dart';
import 'package:software_lab_assignment/widgets/bottom_nav_bar.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/state_dropdown.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class FarmInfoPage extends StatefulWidget {
  const FarmInfoPage({super.key});

  @override
  State<FarmInfoPage> createState() => _FarmInfoPageState();
}

class _FarmInfoPageState extends State<FarmInfoPage> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController informalNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                "SignUp 2 of 4",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const Text(
                "Farm Info",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 45),
              CustomTextfield(
                hintText: "Business Name",
                controller: businessNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
                prefixIcon: const SvgIconWidget(icon: businessNameIcon),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hintText: "Informal Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
                controller: informalNameController,
                prefixIcon: const SvgIconWidget(icon: smileIcon),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hintText: "Street Address",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Address cannot be empty";
                  }
                  return null;
                },
                controller: addressController,
                prefixIcon: const SvgIconWidget(icon: houseIcon),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                hintText: "City",
                controller: cityController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "City cannot be empty";
                  }
                  return null;
                },
                prefixIcon: const SvgIconWidget(icon: locationIcon),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 60,
                      child: StateDropdown(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 5,
                    child: CustomTextfield(
                      keyboardType: TextInputType.number,
                      controller: zipCodeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Zip cannot be empty";
                        }
                        if (value.length != 5) {
                          return "Zip must be 10 characters long";
                        }
                        return null;
                      },
                      hintText: "Enter Zipcode",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        text: "Continue",
        onTap: () {
          if (_formKey.currentState!.validate()) {
            userRegisterDetails["business_name"] =
                businessNameController.text.trim();
            userRegisterDetails["informal_name"] =
                informalNameController.text.trim();
            userRegisterDetails["address"] = addressController.text.trim();
            userRegisterDetails["city"] = cityController.text.trim();
            userRegisterDetails["zip_code"] = zipCodeController.text.trim();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VerificationPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
