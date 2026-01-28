import 'package:flutter/material.dart';
import 'package:smart_med/infra/constants.dart';
import 'package:smart_med/presentation/components/main_card/main_card.dart';

class MainCardsRow extends StatelessWidget {
  const MainCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 4),
        MainCard(
          color: const Color(0xff2F6BFF),
          doctorType: "Dentistry",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 8,
          categoryImage: dentistry.first,
          onTap: () {},
          doctorAvatars: defaultAvatarsDentistry,
          additionalCount: 3,
        ),
        MainCard(
          color: Colors.white,
          isLight: true,
          doctorType: "Surgery",
          time: "9:00 AM - 5:30 PM",
          doctorsAvailable: 7,
          categoryImage: surgery.first,
          onTap: () {},
          doctorAvatars: defaultAvatarsSurgery,
          additionalCount: 2,
        ),
        MainCard(
          color: const Color(0xff2F6BFF),
          doctorType: "Cardiology",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 12,
          categoryImage: cardiology.first,
          onTap: () {},
          doctorAvatars: defaultAvatarsSurgery,
          additionalCount: 6,
        ),
      ],
    );
  }
}
