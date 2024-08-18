import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget({super.key, required this.icon, this.padding});
  final String icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 14),
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
