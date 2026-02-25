import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/top_card_element.dart';

class TopCard extends StatelessWidget {

  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 70),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopCardElement(
                  title: 'Recovered Patients',
                  value: '464',
                  style: StatCardStyle.filled,
                ),
                TopCardElement(title: 'In Care', value: '12', style: StatCardStyle.outlined),
                TopCardElement(title: 'Free', value: '12', style: StatCardStyle.dashed),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
