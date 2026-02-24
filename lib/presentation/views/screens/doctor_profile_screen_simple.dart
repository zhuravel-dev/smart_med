import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med_images/smart_med_images.dart';

class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final avatar = SmartMedImages
        .defaultAvatarsSurgery[doctor.id % SmartMedImages.defaultAvatarsSurgery.length];

    const heroHeight = 420.0;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFE8F0FB),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: heroHeight + statusBarHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(avatar),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heroHeight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _CircleButton(
                                    icon: Icons.chevron_left,
                                    onTap: () => Navigator.pop(context),
                                  ),
                                  Row(
                                    children: [
                                      _CircleButton(icon: Icons.phone_outlined, onTap: () {}),
                                      const SizedBox(width: 10),
                                      _CircleButton(
                                        icon: Icons.chat_bubble_outline_rounded,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 32),

                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 16,
                                      color: Color(0xFFFFC107),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${doctor.rating} rating",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              Text(
                                "Dr. ${doctor.firstName}\n${doctor.lastName}",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  height: 1.15,
                                  color: Color(0xFF1A1A2E),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                doctor.specialization,
                                style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight - heroHeight),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 16,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 24),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _InfoItem(
                                    title: "Experience",
                                    value: "${doctor.experienceYears} yrs",
                                  ),
                                  _Divider(),
                                  _InfoItem(
                                    title: "Patients",
                                    value: doctor.patientsCount.toString(),
                                  ),
                                  _Divider(),
                                  _InfoItem(
                                    title: "Reviews",
                                    value: doctor.reviews.length.toString(),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Divider(color: Colors.grey.shade100, height: 1),
                            ),

                            const SizedBox(height: 20),
                            const SizedBox(height: 28),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF1A1A2E)),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 36, width: 1, color: Colors.grey.shade200);
  }
}
