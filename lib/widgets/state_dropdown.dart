import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';
import 'package:software_lab_assignment/widgets/svg_icon_widget.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  State<StateDropdown> createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  var selectedState = "";
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      hint: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "State",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
      icon: const SvgIconWidget(
        icon: downIcon,
        padding: 0,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      value: null,
      items: List.generate(
        statesList.length,
        (index) => DropdownMenuItem(
          value: statesList[index],
          child: Text(
            statesList[index],
          ),
        ),
      ),
      onChanged: (value) {
        userRegisterDetails["state"] = value;
      },
    );
  }
}
