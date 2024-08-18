// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:software_lab_assignment/utils/constants.dart';

class AuthFunctions {
  final String baseUrl = "https://sowlab.com/assignment";
  Future<bool> login(BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/user/login"),
        body: jsonEncode(userLoginDetails),
      );
      var decoded = jsonDecode(response.body);
      if (decoded["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: greenColor,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: orangeColor,
          ),
        );
        return false;
      }
    } catch (e) {
      log('Error: $e');
    }
    return false;
  }

  Future<bool> signUp(BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/user/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(userRegisterDetails),
      );

      var decoded = jsonDecode(response.body);
      if (decoded["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: greenColor,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: orangeColor,
          ),
        );
        return false;
      }
    } catch (e) {
      log('Error: $e');
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/user/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(resetPasswordDetails),
      );

      var decoded = jsonDecode(response.body);
      if (decoded["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: greenColor,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: orangeColor,
          ),
        );
        return false;
      }
    } catch (e) {
      log('Error: $e');
    }
    return false;
  }

  Future<bool> forgotPassword(BuildContext context, String number) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/user/forgot-password"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"mobile": "+1$number"}),
      );

      var decoded = jsonDecode(response.body);
      if (decoded["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: greenColor,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: orangeColor,
          ),
        );
        return false;
      }
    } catch (e) {
      log('Error: $e');
    }
    return false;
  }

  Future<bool> verifyOtp(BuildContext context, String otp) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/user/verify-otp"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"otp": otp}),
      );

      var decoded = jsonDecode(response.body);
      if (decoded["success"] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: greenColor,
          ),
        );
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 750),
            content: Text(
              decoded["message"],
            ),
            backgroundColor: orangeColor,
          ),
        );
        return false;
      }
    } catch (e) {
      log('Error: $e');
    }
    return false;
  }
}
