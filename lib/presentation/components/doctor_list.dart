import 'package:flutter/material.dart';
import 'package:smart_med/infra/mock/mock_doctors.dart';
import 'package:smart_med/presentation/doctor_card/doctor_card.dart';
import 'package:smart_med/presentation/views/doctor_details_screen.dart';

Widget DoctorList(BuildContext context) {
  return Column(
    children: mockDoctors
        .map(
          (doctor) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DoctorCard(
              doctor: doctor,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DoctorDetailsScreen(doctorId: doctor.id),
                  ),
                );
              },
            ),
          ),
        )
        .toList(),
  );
}
