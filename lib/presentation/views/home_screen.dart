import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'package:smart_med/presentation/components/custom_app_bar/greeting_header.dart';
import 'package:smart_med/presentation/components/doctor_speciality_header.dart';
import 'package:smart_med/presentation/components/medical_check_card.dart';
import 'package:smart_med/presentation/components/speciality_grid.dart';
import 'package:smart_med/presentation/components/tags_row.dart';
import 'package:smart_med/presentation/components/top_doctors_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          children: [
            const SizedBox(height: 6),
            GreetingHeader(
              user: mockUsers[0],
              onNotificationTap: () => print("Notifications tapped"),
            ),
            const SizedBox(height: 20),
            const MedicalCheckCard(),
            const SizedBox(height: 24),
            DoctorSpecialityHeader(),
            const SizedBox(height: 16),
            SpecialityGrid(),
            const SizedBox(height: 24),
            TopDoctorsHeader(),
            const SizedBox(height: 12),
            TagsRow(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
