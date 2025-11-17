import 'package:flutter/material.dart';

Widget TopDoctorsHeader() {
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