import 'package:flutter/material.dart';

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
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${selectedDay?.toString().split(' ')[0]} $selectedTime',
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4285F4),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
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
