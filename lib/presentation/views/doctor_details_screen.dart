import 'package:flutter/material.dart';
import 'package:smart_med/infra/mock/mock_doctors.dart';
import 'package:smart_med/presentation/components/doctor_card.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final int doctorId;

  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final doctor = mockDoctors.firstWhere((doc) => doc.id == doctorId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${doctor.firstName} ${doctor.lastName}"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCard(doctor: doctor),
              const SizedBox(height: 20),
              Text(
                "About Me",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                doctor.aboutMe,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.schedule, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    "Working hours: ${doctor.workingHours}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.people, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    "Patients: ${doctor.patientsCount}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Reviews",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...doctor.reviews.map(
                (review) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(review),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
