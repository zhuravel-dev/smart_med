import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med_images/smart_med_images.dart';
import 'main_card/main_card.dart';

class MainCardsRow extends StatelessWidget {
  const MainCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 4),
        MainCard(
          color: AppColors.primary,
          doctorType: "Dentistry",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 8,
          categoryImage: SmartMedImages.dentistry,
          onTap: () {},
          doctorAvatars: SmartMedImages.defaultAvatarsDentistry,
          additionalCount: 3,
        ),
        SizedBox(height: 8),
        MainCard(
          color: Colors.white,
          isLight: true,
          doctorType: "Surgery",
          time: "9:00 AM - 5:30 PM",
          doctorsAvailable: 7,
          categoryImage: SmartMedImages.surgery,
          onTap: () {},
          doctorAvatars: SmartMedImages.defaultAvatarsSurgery,
          additionalCount: 2,
        ),
        SizedBox(height: 8),
        MainCard(
          color: const Color(0xff2F6BFF),
          doctorType: "Cardiology",
          time: "10:20 AM - 4:40 PM",
          doctorsAvailable: 12,
          categoryImage: SmartMedImages.cardiology,
          onTap: () {},
          doctorAvatars: SmartMedImages.defaultAvatarsDentistry,
          additionalCount: 6,
        ),
      ],
    );
  }
}
