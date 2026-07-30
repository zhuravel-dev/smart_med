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
    final weekDays = List.generate(7, (index) => startDate.add(Duration(days: index)));

    return SizedBox(
      height: 110,
      child: Row(
        children: weekDays.map((day) {
          final isSelected =
              day.day == selectedDate.day &&
              day.month == selectedDate.month &&
              day.year == selectedDate.year;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomDayButton(
                  day: day,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      selectedDate = day;
                    });
                  },
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
