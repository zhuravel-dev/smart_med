import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/main_card/row_of_doctors_avatars.dart';
import 'package:smart_med/presentation/views/components/main_card/time_chip.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String doctorType;
  final String time;
  final int doctorsAvailable;
  final VoidCallback? onTap;
  final bool isLight;
  final String categoryImage;
  final List<String> doctorAvatars;
  final int additionalCount;

  const MainCard({
    super.key,
    required this.color,
    required this.doctorType,
    required this.time,
    required this.doctorsAvailable,
    required this.categoryImage,
    required this.doctorAvatars,
    this.onTap,
    this.isLight = false,
    required this.additionalCount,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;

    final horizontalMargin = screenWidth * 0.01;

    final avatarRadius = screenWidth * 0.06;
    final avatarOffset = avatarRadius * 1.5;

    final textColor = isLight ? Colors.black87 : Colors.white;
    final chipColor = isLight ? Colors.grey.withOpacity(0.15) : Colors.white.withOpacity(0.15);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: horizontalMargin),
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
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
                  backgroundImage: AssetImage(categoryImage),
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

          SizedBox(height: 30),

          Row(
            children: [
              RowOfDoctorsAvatars(
                isLight: isLight,
                avatarRadius: avatarRadius,
                avatarOffset: avatarOffset,
                textColor: textColor,
                avatars: doctorAvatars,
                additionalCount: additionalCount,
              ),
            ],
          ),

          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "$doctorsAvailable Doctor${doctorsAvailable != 1 ? 's' : ''} available today",
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
