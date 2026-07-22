import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget makeAppointmentTitle() {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Make an",
          style: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Appointment",
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
        ),
      ],
    ),
  );
}
