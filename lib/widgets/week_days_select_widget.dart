
import 'package:flutter/material.dart';
import 'package:software_lab_assignment/utils/constants.dart';

class WeekDaysSelectWidget extends StatefulWidget {
  const WeekDaysSelectWidget({super.key, required this.getIndex});
  final Function(int) getIndex;

  @override
  State<WeekDaysSelectWidget> createState() => _WeekDaysSelectWidgetState();
}

class _WeekDaysSelectWidgetState extends State<WeekDaysSelectWidget> {
  int selectedDayIndex = 0;
  Color? _getBoxColor(bool? condition) {
    if (condition == null) {
      return Colors.white;
    } else if (condition == true) {
      return orangeColor;
    } else {
      return Colors.grey.shade300;
    }
  }

  Color? _getTextColor(bool? condition) {
    if (condition == false) {
      return Colors.black;
    } else if (condition == true) {
      return Colors.white;
    } else {
      return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        weekDays.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedDayIndex != index) {
                  if (businessTimingsWithDays[selectedDayIndex]["selectedTime"]
                      .contains(true)) {
                    businessTimingsWithDays[selectedDayIndex]["daySelected"] =
                        false;
                  } else {
                    businessTimingsWithDays[selectedDayIndex]["daySelected"] =
                        null;
                  }
                }
                selectedDayIndex = index;
                widget.getIndex(index);
                businessTimingsWithDays[index]["daySelected"] = true;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color:
                    _getBoxColor(businessTimingsWithDays[index]["daySelected"]),
                borderRadius: BorderRadius.circular(10),
                border: businessTimingsWithDays[index]["daySelected"] == null
                    ? Border.all(color: Colors.grey.shade300)
                    : null,
              ),
              child: Center(
                child: Text(
                  weekDays[index],
                  style: TextStyle(
                    color: _getTextColor(
                        businessTimingsWithDays[index]["daySelected"]),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
