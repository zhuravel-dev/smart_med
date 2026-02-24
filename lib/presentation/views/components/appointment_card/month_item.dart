import 'package:flutter/material.dart';

Widget monthItem() {
  return Row(
    children: [
      const Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey),
      const SizedBox(width: 8),
      const Text(
        'April 2025',
        style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
      ),
      const SizedBox(width: 8),
      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    ],
  );
}
