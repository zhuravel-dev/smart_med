import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class CustomDayButton extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomDayButton({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  String getWeekDay(DateTime date) {
    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekDays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 88,
        width: 56,
        margin: const EdgeInsets.fromLTRB(0, 0, 6, 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.buttonAccent : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              getWeekDay(day),
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.black : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 58,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                day.day.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
