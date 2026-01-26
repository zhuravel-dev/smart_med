import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/main_card/time_chip.dart';
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

    final avatarRadius = screenWidth * 0.055;
    final avatarOffset = avatarRadius * 1.4;

    final textColor = isLight ? Colors.black87 : Colors.white;
    final chipColor = isLight ? Colors.grey.withOpacity(0.15) : Colors.white.withOpacity(0.25);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: horizontalMargin),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(38)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: avatarRadius * 0.9,
                  backgroundImage: AssetImage(avatarImage),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  doctorType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: textColor),
                ),
              ),
              const SizedBox(width: 8),
              TimeChip(time: time, backgroundColor: chipColor, textColor: textColor),
            ],
          ),

          SizedBox(height: 26),

          Row(
            children: [
              RowOfDoctorsAvatars(
                isLight: isLight,
                avatarRadius: avatarRadius,
                avatarOffset: avatarOffset,
                textColor: textColor,
              ),
              SizedBox(width: 26),
              /*Expanded(
                child: Text(
                  "$doctorsAvailable Doctor${doctorsAvailable != 1 ? 's' : ''} available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ),*/
            ],
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "$doctorsAvailable Doctor${doctorsAvailable != 1 ? 's' : ''} available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: avatarRadius * 2.2,
                  height: avatarRadius * 2.2,
                  decoration: BoxDecoration(color: chipColor, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward, color: textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
