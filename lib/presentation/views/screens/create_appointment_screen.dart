import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/views/components/buttons/custom_back_button.dart';
import 'package:smart_med/presentation/views/components/buttons/send_message_button.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar.dart';

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
            child: CustomAppBar(
              backgroundColor: Colors.transparent,
              showBackButton: false,
              leading: customBackButton(onTap: () => Navigator.pop(context)),
              actions: [
                sendMessageButton(onTap: () { print("SendMessageButton tapped"); }),
              ],
              title: null,
              titleWidget: null,
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
