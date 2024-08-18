import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';

class CustomOrangeButton extends StatelessWidget {
  const CustomOrangeButton(
      {super.key, required this.text, this.onTap, this.width, this.height});
  final Function()? onTap;
  final String text;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.065,
        width: width ?? MediaQuery.of(context).size.width * 0.65,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
