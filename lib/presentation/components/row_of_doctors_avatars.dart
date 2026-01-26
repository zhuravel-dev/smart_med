import 'package:flutter/material.dart';
import 'package:smart_med/infra/constants.dart';

class RowOfDoctorsAvatars extends StatelessWidget {
  final bool isLight;
  final double avatarRadius;
  final double avatarOffset;
  final Color textColor;

  const RowOfDoctorsAvatars({
    super.key,
    required this.isLight,
    required this.avatarRadius,
    required this.avatarOffset,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final avatarsCount = defaultAvatarsNeurosurgery.length;
    final displayCount = avatarsCount.clamp(1, 4);

    return SizedBox(
      height: avatarRadius * 2.4,
      width: avatarOffset * displayCount,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < avatarsCount && i < 3; i++)
            Positioned(
              left: i * avatarOffset,
              top: 0,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(defaultAvatarsNeurosurgery[i]),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
          if (avatarsCount > 3)
            Positioned(
              left: 3 * avatarOffset,
              top: 0,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: isLight ? Colors.grey[200] : Colors.white,
                  child: Text(
                    "+${avatarsCount - 3}",
                    style: TextStyle(
                      color: textColor,
                      fontSize: avatarRadius * 0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
