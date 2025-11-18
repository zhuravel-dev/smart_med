import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/components/custom_back_button.dart';
import 'package:smart_med/presentation/components/send_message_item.dart';

class CreateAppointmentScreen extends StatelessWidget {
  final int doctorId;

  const CreateAppointmentScreen({
    super.key,
    required this.doctorId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/doctors/$doctorId.jpg',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(context),
                  SendMessageItem(),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: AppointmentCard(),
          ),
        ],
      ),
    );
  }
}
