import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Image.asset(
                index == 0
                    ? googleIcon
                    : index == 1
                        ? appleIcon
                        : facebookIcon,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
