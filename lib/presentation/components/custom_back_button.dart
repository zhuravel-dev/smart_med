import 'package:flutter/material.dart';

Widget CustomBackButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      padding: const EdgeInsets.all(8),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 24,
      ),
    ),
  );
}
