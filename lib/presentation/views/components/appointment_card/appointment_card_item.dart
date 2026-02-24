import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/appointment_card/select_available_slot_item.dart';
import 'package:smart_med/presentation/views/components/appointment_card/time_tile_row.dart';
import 'book_appointment_button.dart';
import 'custom_row_of_days.dart';
import 'month_item.dart';

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
        height: MediaQuery.sizeOf(context).height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
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
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectAvailableSlotTextItem(),
                    monthItem(),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomRowOfDays(),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TimeTileRow(
                  times: times,
                  selectedTime: _selectedTime,
                  onTimeSelected: (time) {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                ),
              ),

              const SizedBox(height: 22),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BookAppointmentButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
