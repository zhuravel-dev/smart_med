import 'package:flutter/material.dart';
import 'package:smart_med/infra/constants.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String doctorType;
  final String time;
  final int doctorsAvailable;
  final VoidCallback? onTap;

  const MainCard({
    super.key,
    required this.color,
    required this.doctorType,
    required this.time,
    required this.doctorsAvailable,
    this.onTap,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  doctorType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: padding * 0.9),

          Row(
            children: [
              SizedBox(
                height: avatarRadius * 2,
                width: avatarOffset *
                    (defaultAvatars.length.clamp(1, 4)),
                child: Stack(
                  children: [
                    for (int i = 0;
                    i < defaultAvatars.length && i < 3;
                    i++)
                      Positioned(
                        left: i * avatarOffset,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: avatarRadius,
                            backgroundImage:
                            AssetImage(defaultAvatars[i]),
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                      ),
                    if (defaultAvatars.length > 3)
                      Positioned(
                        left: 3 * avatarOffset,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: avatarRadius,
                            backgroundColor: Colors.white,
                            child: Text(
                              "+${defaultAvatars.length - 3}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: avatarRadius * 0.6,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(width: padding * 0.6),

              Expanded(
                child: Text(
                  "$doctorsAvailable Doctor${doctorsAvailable != 1 ? 's' : ''} available",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: subtitleSize,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: padding),

          /// ─── FOOTER ──────────────────────────────────────────────
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
                    color: Colors.white,
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
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
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
