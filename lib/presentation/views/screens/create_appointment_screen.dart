import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/presentation/views/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/views/components/top_card.dart';
import 'doctor_profile_screen.dart';

class CreateAppointmentScreen extends StatelessWidget {
  final Doctor doctor;

  const CreateAppointmentScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final profileHeight = screenHeight * 0.56;
    final overlap = screenHeight * 0.12;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: profileHeight,
            child: DoctorProfileScreen(doctor: doctor),
          ),

          Positioned(
            top: profileHeight - overlap,
            left: 0,
            right: 0,
            bottom: 0,
            child: TopCard(doctor: doctor),
          ),

          Positioned(left: 0, right: 0, bottom: 0, child: AppointmentCard()),
        ],
      ),
    );
  }
}
