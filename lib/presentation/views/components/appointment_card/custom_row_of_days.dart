import 'package:flutter/material.dart';
import 'custom_day_button.dart';

class CustomRowOfDays extends StatefulWidget {
  const CustomRowOfDays({super.key});

  @override
  State<CustomRowOfDays> createState() => _CustomRowOfDaysState();
}

class _CustomRowOfDaysState extends State<CustomRowOfDays> {
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDays = List.generate(
      7,
      (index) => startDate.add(Duration(days: index)),
    );

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          DateTime day = weekDays[index];
          bool isSelected =
              day.day == selectedDate.day &&
              day.month == selectedDate.month &&
              day.year == selectedDate.year;

          return CustomDayButton(
            day: day,
            isSelected: isSelected,
            onTap: () {
              setState(() {
                selectedDate = day;
              });
            },
          );
        },
      ),
    );
  }
}
