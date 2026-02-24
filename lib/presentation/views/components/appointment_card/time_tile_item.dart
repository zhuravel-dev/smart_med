import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class TimeTileItem extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeTileItem({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : AppColors.textMedium,
            ),
          ),
        ),
      ),
    );
  }
}
