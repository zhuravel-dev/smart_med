import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget MakeAppointmentTitle() {
  return Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Make an",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Appointment",
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
        ),

        const SizedBox(height: 30),

      ],
    ),
  );
}
