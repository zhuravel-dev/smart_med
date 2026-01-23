import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/row_of_doctors_avatars.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String doctorType;
  final String time;
  final int doctorsAvailable;
  final VoidCallback? onTap;
  final bool isLight;
  final String avatarImage;

  const MainCard({
    super.key,
    required this.color,
    required this.doctorType,
    required this.time,
    required this.doctorsAvailable,
    required this.avatarImage,
    this.onTap,
    this.isLight = false,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;

    final horizontalMargin = screenWidth * 0.01;
    final padding = screenWidth * 0.05;
    final borderRadius = screenWidth * 0.06;

    final titleSize = screenWidth * 0.045;
    final subtitleSize = screenWidth * 0.035;

    final avatarRadius = screenWidth * 0.055;
    final avatarOffset = avatarRadius * 1.4;

    final textColor = isLight ? Colors.black87 : Colors.white;
    final secondaryTextColor = isLight ? Colors.black54 : Colors.white.withOpacity(0.8);
    final chipColor = isLight ? Colors.grey.withOpacity(0.15) : Colors.white.withOpacity(0.25);
    final borderColor = isLight ? Colors.white : Colors.white;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: horizontalMargin,
      ),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius * 0.9,
                  backgroundImage: AssetImage(avatarImage),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(width: padding * 0.5),
              Expanded(
                child: Text(
                  doctorType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: padding * 0.8,
                  vertical: padding * 0.4,
                ),
                decoration: BoxDecoration(
                  color: chipColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: padding * 0.9),

          Row(
            children: [
              RowOfDoctorsAvatars(
                isLight: isLight,
                avatarRadius: avatarRadius,
                avatarOffset: avatarOffset,
                borderColor: borderColor,
                textColor: textColor,
              ),
              SizedBox(width: padding),
              Expanded(
                child: Text(
                  "$doctorsAvailable Doctor${doctorsAvailable != 1 ? 's' : ''} available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: subtitleSize,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: padding),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Choose Doctor",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: avatarRadius * 2.2,
                  height: avatarRadius * 2.2,
                  decoration: BoxDecoration(
                    color: chipColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
