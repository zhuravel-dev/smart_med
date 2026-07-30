import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/doctor_screen_app_bar.dart';
import 'package:smart_med/presentation/views/doctor/doctor_rating_badge.dart';

class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileScreen({
    super.key,
    required this.doctor,
  });

  static const double heroHeight = 420;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: const Color(0xFFE8F0FB),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: heroHeight + statusBarHeight,
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.scale(
                scale: 1.1,
                alignment: const Alignment(-1, -1),
                child: Image.asset(
                  doctor.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SafeArea(
            child: SizedBox(
              height: heroHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DoctorScreenAppBar(),

                    const SizedBox(height: 32),

                    DoctorRatingBadge(
                      rating: doctor.rating,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "Dr. ${doctor.firstName}\n${doctor.lastName}",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      doctor.specialization,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}