import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:software_lab_assignment/widgets/custom_textfield.dart';

class OtpWidget extends StatefulWidget {
  final ValueChanged<String> onOtpChanged;
  const OtpWidget({super.key, required this.onOtpChanged});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  void _updateOtpValue() {
    String otpValue = _controllers.map((controller) => controller.text).join();
    widget.onOtpChanged(otpValue);
  }

  final List<FocusNode> _focusNodes = List.generate(
    5,
    (_) => FocusNode(),
  );
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => CustomTextfield(
          focusNode: _focusNodes[index],
          controller: _controllers[index],
          onChanged: (value) {
            if (value.length == 1 || value.isEmpty) {
              if (value.isNotEmpty) {
                if (index < 4) {
                  _focusNodes[index + 1].requestFocus();
                } else {
                  _focusNodes[index].unfocus();
                }
              }

              _updateOtpValue();
            }
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          textAlign: TextAlign.center,
          width: 60,
        ),
      ),
    );
  }
}
