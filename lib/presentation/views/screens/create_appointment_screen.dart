import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/presentation/views/components/appointment_card/appointment_card_item.dart';
import 'doctor_profile_screen_simple.dart';

class CreateAppointmentScreen extends StatelessWidget {
 // final int doctorId;
  final Doctor doctor;

  const CreateAppointmentScreen({super.key, /*required this.doctorId,*/ required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          DoctorProfileScreen(doctor: doctor),
          Align(alignment: Alignment.bottomCenter, child: AppointmentCard()),
        ],
      ),
    );
  }
}
