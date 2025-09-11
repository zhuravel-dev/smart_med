import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/custom_row_of_days.dart';
import 'package:smart_med/presentation/components/appointment_card/time_tile_row.dart';
import 'appointment_card/book_appointment_button.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  DateTime? _selectedDay;
  String _selectedTime = '09:30';

  final List<String> times = ["08:30", "09:30", "10:30", "11:30"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose available slot:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 16),

          CustomRowOfDays(),

          SizedBox(height: 16),

          TimeTileRow(
            times: times,
            selectedTime: _selectedTime,
            onTimeSelected: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),

          SizedBox(height: 28),

          Center(
            child: BookAppointmentButton(
              selectedDay: _selectedDay,
              selectedTime: _selectedTime,
            ),
          ),
        ],
      ),
    );
  }
}
