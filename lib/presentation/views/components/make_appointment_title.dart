import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget makeTitle({
  required String firstText,
  String? secondText,
  double firstFontSize = 28,
  double secondFontSize = 32,
  FontWeight firstFontWeight = FontWeight.w500,
  FontWeight secondFontWeight = FontWeight.w700,
  double spacing = 4,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: GoogleFonts.montserrat(fontSize: firstFontSize, fontWeight: firstFontWeight),
        ),
        SizedBox(height: spacing),
        if (secondText != null)
          Text(
            secondText,
            style: GoogleFonts.montserrat(
              fontSize: secondFontSize,
              fontWeight: secondFontWeight,
              height: 1.1,
            ),
          ),
      ],
    ),
  );
}
