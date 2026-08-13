import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/doctor_model.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/top_card_badge.dart';
import 'package:smart_med/presentation/views/components/top_card_types.dart';

class TopCard extends StatelessWidget {
  final Doctor doctor;

  const TopCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            blurRadius: 3,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Claim status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),

            Padding(
              padding: const EdgeInsets.fromLTRB(26, 6, 26, 6),
              child: Row(
                children: [
                  TopCardBadge(
                    title: 'Recovered Patients',
                    value: doctor.recoveredPatients,
                    type: TopCardType.filled,
                  ),
                  const Spacer(),
                  TopCardBadge(title: 'In Care', value: doctor.inCare, type: TopCardType.outlined),
                  const Spacer(),
                  TopCardBadge(title: 'Free', value: doctor.free, type: TopCardType.dashed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildDivider() {
  return Container(
    width: 1,
    color: Colors.grey.shade400,
    margin: const EdgeInsets.symmetric(horizontal: 1),
  );
}
