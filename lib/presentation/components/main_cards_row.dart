import 'package:flutter/material.dart';
import 'package:smart_med/infra/constants.dart';
import 'package:smart_med/presentation/components/main_card/main_card.dart';

class MainCardsRow extends StatelessWidget {
  const MainCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainCard(
          color: const Color(0xff2F6BFF),
          doctorType: "Dentistry",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 12,
          avatarImage: dentistry.first,
          onTap: () {},
        ),
        MainCard(
          color: Colors.white,
          isLight: true,
          doctorType: "Surgery",
          time: "9:00 AM - 5:30 PM",
          doctorsAvailable: 8,
          avatarImage: surgery.first,
          onTap: () {},
        ),
        MainCard(
          color: const Color(0xff2F6BFF),
          doctorType: "Cardiology",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 12,
          avatarImage: cardiology.first,
          onTap: () {},
        ),
      ],
    );
  }
}
