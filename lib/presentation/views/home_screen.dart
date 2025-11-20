import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'package:smart_med/presentation/components/custom_app_bar.dart';
import 'package:smart_med/presentation/components/doctor_speciality_header.dart';
import 'package:smart_med/presentation/components/medical_check_card.dart';
import 'package:smart_med/presentation/components/search_field.dart';
import 'package:smart_med/presentation/components/speciality_grid.dart';
import 'package:smart_med/presentation/components/tags_row.dart';
import 'package:smart_med/presentation/components/top_doctors_header.dart';
import 'package:smart_med/presentation/components/buttons/notifications_button.dart';

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
            CustomAppBar(
              leading: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(userAvatar[mockUsers[0].id]!),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Good Morning!", style: TextStyle(color: Colors.grey)),
                      Text(
                        "${mockUsers[0].firstName} ${mockUsers[0].lastName}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [notificationButton(onTap: () => print("Notifications tapped"))],
              backgroundColor: Colors.grey[200]!,
            ),

            const SizedBox(height: 20),
            SearchField(),
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
