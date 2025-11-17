import 'package:flutter/material.dart';

Widget DoctorRating() {
  return Row(
    children: [
      const Icon(Icons.star, color: Colors.amber, size: 16),
      const SizedBox(width: 4),
      const Text(
        '5.0 rating',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    ],
  );
}
