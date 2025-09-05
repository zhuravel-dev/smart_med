import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback? onTap;

  const DoctorCard({super.key, required this.doctor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${doctor.firstName} ${doctor.lastName}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(
                        doctor.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                doctor.specialization,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.work_outline, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text("${doctor.experienceYears} years experience"),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.people_alt_outlined,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text("${doctor.patientsCount} patients"),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.schedule, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text("Working hours: ${doctor.workingHours}"),
                ],
              ),
              const SizedBox(height: 12),

              Text(
                "About me:",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                doctor.aboutMe,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Icon(
                    Icons.comment_outlined,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text("${doctor.reviews.length} reviews"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
