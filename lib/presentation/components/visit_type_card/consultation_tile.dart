import 'package:flutter/material.dart';
import 'package:smart_med/infra/helpers/consultation_type.dart';
import 'package:smart_med/presentation/components/visit_type_card/custom_forward_button.dart';

class ConsultationTile extends StatelessWidget {
  final ConsultationType type;
  final String duration;
  final bool isSelected;
  final VoidCallback onTap;

  const ConsultationTile({
    super.key,
    required this.type,
    required this.duration,
    required this.isSelected,
    required this.onTap,
  });

  String get title {
    switch (type) {
      case ConsultationType.urgent:
        return 'Urgent consultation';
      case ConsultationType.scheduled:
        return 'Scheduled check-up';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 158,
        height: 118,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.3)
              : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: Colors.white.withOpacity(0.5), width: 1)
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomForwardButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
