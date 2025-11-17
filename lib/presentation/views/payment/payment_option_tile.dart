import 'package:flutter/material.dart';

class PaymentOptionTile extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  icon,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? iconColor : Colors.grey[400]!, width: 2),
                color: isSelected ? iconColor : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(child: Icon(Icons.circle, color: Colors.white, size: 12))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
