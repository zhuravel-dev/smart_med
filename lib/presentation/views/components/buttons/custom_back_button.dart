import 'package:flutter/material.dart';

Widget customBackButton({required VoidCallback onTap, double size = 42.0}) {
  return SizedBox(
    width: size,
    height: size,
    child: InkWell(
      borderRadius: BorderRadius.circular(size / 2),
      onTap: onTap,
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 0))],
          ),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: size * 0.45, color: Colors.black87),
        ),
      ),
    ),
  );
}
