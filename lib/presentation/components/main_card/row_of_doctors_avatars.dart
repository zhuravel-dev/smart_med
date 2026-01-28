import 'package:flutter/material.dart';

class RowOfDoctorsAvatars extends StatelessWidget {
  final bool isLight;
  final double avatarRadius;
  final double avatarOffset;
  final Color textColor;
  final List<String> avatars;
  final int maxVisible;
  final int? additionalCount;

  const RowOfDoctorsAvatars({
    super.key,
    required this.isLight,
    required this.avatarRadius,
    required this.avatarOffset,
    required this.textColor,
    required this.avatars,
    this.maxVisible = 8,
    this.additionalCount,
  });

  @override
  Widget build(BuildContext context) {
    final avatarsCount = avatars.length;

    if (avatarsCount == 0) {
      return const SizedBox.shrink();
    }

    final showCounter = avatarsCount > maxVisible;
    final displayCount = showCounter ? maxVisible : avatarsCount;
    final hasAdditional = additionalCount != null;

    final totalWidth =
        (avatarRadius * 2) + (avatarOffset * displayCount) + (hasAdditional ? avatarOffset : 0);

    return SizedBox(
      height: avatarRadius * 2.4,
      width: totalWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < (showCounter ? maxVisible - 1 : avatarsCount); i++)
            Positioned(
              left: i * avatarOffset,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLight ? Colors.white : Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(avatars[i]),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),

          if (showCounter)
            Positioned(
              left: (maxVisible - 1) * avatarOffset,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLight ? Colors.white : Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: isLight ? Colors.grey[200] : Colors.white,
                  child: Text(
                    "+${avatarsCount - maxVisible + 1}",
                    style: TextStyle(
                      color: textColor,
                      fontSize: avatarRadius * 0.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

          if (hasAdditional)
            Positioned(
              left: (showCounter ? maxVisible : avatarsCount) * avatarOffset,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLight ? Colors.white : Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundColor: isLight ? Colors.grey[200] : Color(0xFFF5F5F5),
                  child: Text(
                    "+$additionalCount",
                    style: TextStyle(
                      color: isLight ? textColor : Colors.black87,
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
