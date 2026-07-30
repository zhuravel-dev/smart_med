import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_doctors.dart';
import 'package:smart_med/presentation/views/screens/create_appointment_screen.dart';
import 'doctor_card_small.dart';

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    if (mockDoctors.isEmpty) {
      return const Center(
        child: Text("No doctors available"),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemCount: mockDoctors.length,
      itemBuilder: (context, index) {
        final doctor = mockDoctors[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DoctorCardSmall(
            doctor: doctor,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CreateAppointmentScreen(
                    doctor: doctor,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
