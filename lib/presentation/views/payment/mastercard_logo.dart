import 'package:flutter/material.dart';

class MastercardLogo extends StatelessWidget {
  final double width;
  final double height;
  final double circleSize;
  final Color leftCircleColor;
  final Color rightCircleColor;
  final double opacity;

  const MastercardLogo({
    super.key,
    this.width = 50,
    this.height = 32,
    this.circleSize = 32,
    this.leftCircleColor = Colors.red,
    this.rightCircleColor = Colors.amber,
    this.opacity = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: leftCircleColor.withOpacity(opacity),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: width - circleSize,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: rightCircleColor.withOpacity(opacity),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
