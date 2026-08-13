import 'package:flutter/material.dart';

class StressLevelCard extends StatelessWidget {
  final int stressLevel;
  final String status;

  const StressLevelCard({super.key, required this.stressLevel, required this.status});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double cardHeight = screenHeight * 0.10;

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: const Color(0xFFF4F5F7), shape: BoxShape.circle),
            child: const Center(
              child: Icon(Icons.monitor_heart_outlined, size: 34, color: Colors.black87),
            ),
          ),

          const SizedBox(width: 28),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stress level',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8F96A3),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$stressLevel%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F5F7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              status,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6E7480),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
