import 'package:flutter/material.dart';

class HeartRateCard extends StatelessWidget {
  final int heartRate;
  final int selectedIndex;

  const HeartRateCard({super.key, required this.heartRate, this.selectedIndex = 8});

  @override
  Widget build(BuildContext context) {
    final bars = [
      15.6,
      20.8,
      26.0,
      33.8,
      44.2,
      54.6,
      65.0,
      75.4,
      67.6,
      57.2,
      46.8,
      36.4,
      28.6,
      23.4,
      18.2,
    ];

    const double baseHeight = 130.0;

    final double screenHeight = MediaQuery.of(context).size.height;
    final double cardHeight = screenHeight * 0.10;

    final double scale = cardHeight / baseHeight;

    return Container(
      height: cardHeight,
      padding: EdgeInsets.symmetric(horizontal: 22 * scale, vertical: 20 * scale),
      decoration: BoxDecoration(
        color: const Color(0xffF6F7FA),
        borderRadius: BorderRadius.circular(22 * scale),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: SizedBox(
              height: 90 * scale,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  bars.length,
                      (index) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.5 * scale),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: bars[index] * scale,
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? const Color(0xff2354FF)
                              : const Color(0xffE5E7EB),
                          borderRadius: BorderRadius.circular(8 * scale),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 14 * scale),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$heartRate',
                style: TextStyle(
                  fontSize: 32 * scale,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff171717),
                ),
              ),
              SizedBox(height: 12 * scale),
              Text(
                'Heart rate',
                style: TextStyle(
                  fontSize: 22 * scale,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff8D8D8D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
