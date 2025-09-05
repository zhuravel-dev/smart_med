import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/doctor_list.dart';
import 'package:smart_med/presentation/components/medical_check_card.dart';
import 'package:smart_med/presentation/components/search_field.dart';
import 'package:smart_med/presentation/components/speciality_item.dart';
import 'package:smart_med/presentation/components/tag_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const SizedBox(height: 20),
            SearchField(),
            const SizedBox(height: 20),
            MedicalCheckCard(),
            const SizedBox(height: 24),
            _buildDoctorSpecialityHeader(),
            const SizedBox(height: 16),
            _buildSpecialityGrid(),
            const SizedBox(height: 24),
            _buildTopDoctorsHeader(),
            const SizedBox(height: 12),
            _buildTags(),
            const SizedBox(height: 12),
            DoctorList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 2),
          ),
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person, size: 28, color: Colors.blue),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Good Morning", style: TextStyle(color: Colors.grey)),
            Text(
              "User Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  Widget _buildDoctorSpecialityHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Doctor Speciality",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),
      ],
    );
  }

  Widget _buildSpecialityGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        SpecialityItem(icon: Icons.local_hospital, label: "General"),
        SpecialityItem(icon: Icons.medical_services, label: "Dentist"),
        SpecialityItem(icon: Icons.remove_red_eye, label: "Ophthalm."),
        SpecialityItem(icon: Icons.fastfood, label: "Nutrition"),
        SpecialityItem(icon: Icons.psychology, label: "Neuro"),
        SpecialityItem(icon: Icons.child_care, label: "Pediatric"),
        SpecialityItem(icon: Icons.science, label: "Radiology"),
        SpecialityItem(icon: Icons.more_horiz, label: "More"),
      ],
    );
  }

  Widget _buildTopDoctorsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Top Doctors",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),
      ],
    );
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8,
      children: [
        TagItem("All", selected: true),
        TagItem("General"),
        TagItem("Dentist"),
        TagItem("Nutritionist"),
      ],
    );
  }
}
