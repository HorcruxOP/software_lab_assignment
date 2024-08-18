import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/custom_orange_button.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 120,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const SvgIconWidget(icon: backIcon)),
            CustomOrangeButton(
              width: MediaQuery.of(context).size.width * 0.53,
              text: text,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
