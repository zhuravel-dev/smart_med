import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/appointment_card/appointment_card_item.dart';
import 'package:smart_med/presentation/components/custom_app_bar.dart';
import 'package:smart_med/presentation/components/doctor_speciality_header.dart';
import 'package:smart_med/presentation/components/medical_check_card.dart';
import 'package:smart_med/presentation/components/search_field.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            const SizedBox(height: 20),
            SearchField(),
            const SizedBox(height: 20),
            MedicalCheckCard(),
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
