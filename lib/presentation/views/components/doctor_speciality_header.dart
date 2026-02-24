import 'package:flutter/material.dart';

Widget DoctorSpecialityHeader() {
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
