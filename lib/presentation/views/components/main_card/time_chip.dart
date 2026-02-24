import 'package:flutter/material.dart';

class TimeChip extends StatelessWidget {
  final String time;
  final Color backgroundColor;
  final Color textColor;

  const TimeChip({
    super.key,
    required this.time,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
