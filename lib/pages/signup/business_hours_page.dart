// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:software_lab_assignment/pages/signup/confirmation_page.dart';
import 'package:software_lab_assignment/services/functions/auth_functions.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/bottom_nav_bar.dart';
import 'package:software_lab_assignment/widgets/delivery_timing_widget.dart';
import 'package:software_lab_assignment/widgets/farmer_eats_text.dart';
import 'package:software_lab_assignment/widgets/week_days_select_widget.dart';

class BusinessHoursPage extends StatefulWidget {
  const BusinessHoursPage({super.key});

  @override
  State<BusinessHoursPage> createState() => _BusinessHoursPageState();
}

class _BusinessHoursPageState extends State<BusinessHoursPage> {
  int _index = 0;
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
              "SignUp 4 of 4",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const Text(
              "Business Hours",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 45,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              businessHoursSubtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            const SizedBox(height: 45),
            WeekDaysSelectWidget(
              getIndex: (index) {
                setState(() {
                  _index = index;
                });
              },
            ),
            const SizedBox(height: 35),
            DeliveryTimingWidget(
              weekIndex: _index,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        text: "Signup",
        onTap: () async {
          Map businessHourMap = {
            "mon": businessTimingsWithDays[0]["selectedTimeValue"] ?? [],
            "tue": businessTimingsWithDays[1]["selectedTimeValue"] ?? [],
            "wed": businessTimingsWithDays[2]["selectedTimeValue"] ?? [],
            "thu": businessTimingsWithDays[3]["selectedTimeValue"] ?? [],
            "fri": businessTimingsWithDays[4]["selectedTimeValue"] ?? [],
            "sat": businessTimingsWithDays[5]["selectedTimeValue"] ?? [],
            "sun": businessTimingsWithDays[6]["selectedTimeValue"] ?? [],
          };

          userRegisterDetails["business_hours"] = businessHourMap;

          bool isTrue = await AuthFunctions().signUp(context);
          if (isTrue) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ConfirmationPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
