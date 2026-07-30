import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/appointment_card/select_available_slot_item.dart';
import 'package:smart_med/presentation/views/components/appointment_card/time_tile_row.dart';
import 'book_appointment_button.dart';
import 'custom_row_of_days.dart';
import 'month_item.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  String _selectedTime = '09:30';

  final List<String> times = ["08:30", "09:30", "10:30", "11:30"];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      constraints: BoxConstraints(maxHeight: height * 0.48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [selectAvailableSlotTextItem(), monthItem()],
              ),

              const SizedBox(height: 18),

              const CustomRowOfDays(),

              const SizedBox(height: 16),

              TimeTileRow(
                times: times,
                selectedTime: _selectedTime,
                onTimeSelected: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),

              const SizedBox(height: 24),

              const BookAppointmentButton(),
            ],
          ),
        ),
      ),
    );
  }
}
