import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class BookAppointmentButton extends StatelessWidget {
  final DateTime? selectedDay;
  final String? selectedTime;

  const BookAppointmentButton({
    super.key,
    this.selectedDay,
    this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          /*ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${selectedDay?.toString().split(' ')[0]} $selectedTime',
              ),
            ),
          );*/
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(42),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Book Appointment',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
