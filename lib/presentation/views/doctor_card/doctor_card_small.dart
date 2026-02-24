import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/presentation/views/images/doctor_image.dart';

class DoctorCardSmall extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback? onTap;

  const DoctorCardSmall({super.key, required this.doctor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              DoctorImage(
                doctor: doctor,
                width: 90,
                height: 90,
                borderRadius: 16,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. ${doctor.firstName} ${doctor.lastName}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    //const SizedBox(height: 8),
                    Text(
                      doctor.specialization,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 18, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text("Available today: ${doctor.workingHours}"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Icon(Icons.more_vert, color: Colors.grey[600]),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
