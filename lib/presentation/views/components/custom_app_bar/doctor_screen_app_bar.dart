import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/buttons/circle_button.dart';

class DoctorScreenAppBar extends StatelessWidget {
  const DoctorScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(
          icon: Icons.chevron_left,
          onTap: () => Navigator.pop(context),
        ),
        Row(
          children: [
            CircleButton(icon: Icons.phone_outlined, onTap: () {}),
            const SizedBox(width: 10),
            CircleButton(
              icon: Icons.chat_bubble_outline_rounded,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
