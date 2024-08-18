import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';

class DeliveryTimingWidget extends StatefulWidget {
  const DeliveryTimingWidget({super.key, required this.weekIndex});
  final int weekIndex;

  @override
  State<DeliveryTimingWidget> createState() => _DeliveryTimingWidgetState();
}

class _DeliveryTimingWidgetState extends State<DeliveryTimingWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 10,
      children: List.generate(
        deliveryTimings.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              businessTimingsWithDays[widget.weekIndex]["selectedTime"][index] =
                  !businessTimingsWithDays[widget.weekIndex]["selectedTime"]
                      [index];
              if (businessTimingsWithDays[widget.weekIndex]["selectedTimeValue"]
                  .contains(deliveryTimings[index])) {
                int elementIndex = businessTimingsWithDays[widget.weekIndex]
                        ["selectedTimeValue"]
                    .indexWhere((element) => element == deliveryTimings[index]);
                businessTimingsWithDays[widget.weekIndex]["selectedTimeValue"]
                    .removeAt(elementIndex);
              } else {
                businessTimingsWithDays[widget.weekIndex]["selectedTimeValue"]
                    .add(deliveryTimings[index]);
              }
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.42,
            height: 60,
            decoration: BoxDecoration(
              color: businessTimingsWithDays[widget.weekIndex]["selectedTime"]
                      [index]
                  ? yellowColor
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                deliveryTimings[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
