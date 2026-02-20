import 'dart:ui';
import 'package:flutter/material.dart';

class OnBoardingGetStartedButton extends StatelessWidget {
  final VoidCallback onTap;

  const OnBoardingGetStartedButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.8),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 28),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: const Icon(Icons.chevron_right, color: Colors.white38, size: 22),
                        ),
                        Transform.translate(
                          offset: const Offset(-8, 0),
                          child: const Icon(Icons.chevron_right, color: Colors.white54, size: 22),
                        ),
                        Transform.translate(
                          offset: const Offset(-16, 0),
                          child: const Icon(Icons.chevron_right, color: Colors.white, size: 22),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Color(0xFF1A6BFF), size: 26),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
