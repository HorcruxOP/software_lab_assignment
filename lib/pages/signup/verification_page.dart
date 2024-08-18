import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/pages/signup/business_hours_page.dart';
import 'package:software_lab_assignment/widgets/bottom_nav_bar.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String file = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            const FarmerEatsText(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Text(
              "SignUp 3 of 4",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const Text(
              "Verification",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 45,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              verificationSubtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Attach proof of registration",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    setState(() {
                      file = result!.files.single.name;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: orangeColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: SvgIconWidget(
                        icon: cameraIcon,
                        padding: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            if (file.isNotEmpty)
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        file,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          file = "";
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        text: "Continue",
        onTap: () {
          if (file.isNotEmpty) {
            userRegisterDetails["registration_proof"] = file;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BusinessHoursPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 750),
                backgroundColor: Colors.red,
                content: Text("Add a proof"),
              ),
            );
          }
        },
      ),
    );
  }
}
