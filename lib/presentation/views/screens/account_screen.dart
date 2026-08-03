import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/greeting_header.dart';
import 'package:smart_med/presentation/views/components/home_greeting_header.dart';
import 'package:smart_med/presentation/views/components/heart_rate_card.dart'; // <- путь под ваш проект

class AccountScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollDirectionChanged;

  const AccountScreen({super.key, this.onScrollDirectionChanged});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final topSpacing = screenHeight * 0.02;
            final headerSpacing = screenHeight * 0.10;

            return Column(
              children: [
                SizedBox(height: topSpacing),

                const GreetingHeader(type: GreetingHeaderType.profile),

                SizedBox(height: headerSpacing),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, cardConstraints) {
                      final availableHeight = cardConstraints.maxHeight;
                      final availableWidth = cardConstraints.maxWidth;

                      final whiteCardHeight = availableHeight * 0.45;
                      final overlap = whiteCardHeight * 0.35;

                      return Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            height: whiteCardHeight,
                            child: Container(
                              width: availableWidth,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(44),
                              ),
                              child: const Align(
                                alignment: Alignment.topCenter,
                                child: HeartRateCard(heartRate: 78),
                              ),
                            ),
                          ),

                          Positioned(
                            top: whiteCardHeight - overlap,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: availableWidth,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
