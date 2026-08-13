import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/top_card_types.dart';
import 'badge_divider.dart';
import 'dashed_circle_painter.dart';

class TopCardBadge extends StatelessWidget {
  final String title;
  final int value;
  final TopCardType type;

  const TopCardBadge({super.key, required this.title, required this.value, required this.type});

  @override
  Widget build(BuildContext context) {
    const badgeHeight = 56.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF7F8C8D),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            BadgeDivider(height: 70),
            const SizedBox(width: 2),
            switch (type) {
              TopCardType.filled => SizedBox(
                height: badgeHeight,
                width: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC2EBF6),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ),
              ),
              TopCardType.outlined => SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade200, width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ),
              ),
              TopCardType.dashed => SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.height * 0.068,
                child: CustomPaint(
                  painter: DashedCirclePainter(color: Colors.grey.shade500),
                  child: Center(
                    child: Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                ),
              ),
            },
          ],
        ),
      ],
    );
  }
}
