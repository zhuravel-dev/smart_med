import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/custom_row_of_days.dart';
import 'package:smart_med/presentation/components/appointment_card/month_item.dart';
import 'package:smart_med/presentation/components/appointment_card/select_available_slot_item.dart';
import 'package:smart_med/presentation/components/appointment_card/time_tile_row.dart';
import 'book_appointment_button.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String _selectedTime = '09:30';

  final List<String> times = ["08:30", "09:30", "10:30", "11:30"];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectAvailableSlotItem(),
                  MonthItem(),
                ],
              ),
              const SizedBox(height: 20),
              CustomRowOfDays(),
              const SizedBox(height: 20),
              TimeTileRow(
                times: times,
                selectedTime: _selectedTime,
                onTimeSelected: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
              const SizedBox(height: 20),
              BookAppointmentButton(),
            ],
          ),
        ),
      ),
    );
  }
}
