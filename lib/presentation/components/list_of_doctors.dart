import 'package:flutter/material.dart';
import 'package:smart_med/infra/mock/mock_doctors.dart';
import 'package:smart_med/presentation/doctor_card/doctor_card_small.dart';
import 'package:smart_med/presentation/views/create_appointment_screen.dart';

class ListOfDoctors extends StatelessWidget {
  const ListOfDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    if (mockDoctors.isEmpty) {
      return const Center(child: Text("No doctors available"));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: mockDoctors.length,
      itemBuilder: (context, index) {
        final doctor = mockDoctors[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: DoctorCardSmall(
            doctor: doctor,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CreateAppointmentScreen(doctorId: doctor.id),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
