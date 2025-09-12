import 'package:flutter/material.dart';

Widget CustomPlusButton() {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Icon(Icons.add, color: Colors.white, size: 20),
  );
}
