import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

Widget doctorSpecialityHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Text("Doctor Speciality", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text("See All", style: TextStyle(color: AppColors.primary, fontSize: 14)),
    ],
  );
}
