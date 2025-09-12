import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/components/custom_back_button.dart';
import 'package:smart_med/presentation/doctor_card/doctor_card.dart';
import 'package:smart_med/presentation/components/visit_type_card/visit_type_card_item.dart';
import 'package:smart_med/presentation/doctor_card/doctor_card_item.dart';
import 'package:smart_med/presentation/doctor_card/doctor_rating.dart';
import 'package:smart_med/presentation/components/send_message_item.dart';


class PersonalAppointmentScreen extends StatelessWidget {
  const PersonalAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(context),
                      SendMessageItem(),
                    ],
                  ),
                ),
                const Spacer(),
              ],
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
      ),
    );
  }
}

