import 'package:flutter/material.dart';

Widget CustomForwardButton() {
  return Container(
    width: 28,
    height: 28,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 14,
    ),
  );
}
