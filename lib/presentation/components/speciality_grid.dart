import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/speciality_item.dart';

Widget SpecialityGrid() {
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