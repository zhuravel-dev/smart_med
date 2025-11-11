import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/components/custom_back_button.dart';
import 'package:smart_med/presentation/components/send_message_item.dart';
import 'package:smart_med/presentation/components/visit_type_card/visit_type_card_item.dart';

class CreateAppointmentScreen extends StatelessWidget {
  const CreateAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.5),
            child: Image.asset(
              'assets/images/doctors/1.jpg',
              width: double.infinity,
              height: 600,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(context),
                SendMessageItem(),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 260,
                  left: 0,
                  right: 0,
                  child: VisitTypeCard(),
                ),
                AppointmentCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
