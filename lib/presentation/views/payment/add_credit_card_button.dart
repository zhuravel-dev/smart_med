import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smart_med/presentation/core/presentation_strings.dart';

class AddCreditCardButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;

  const AddCreditCardButton({
    super.key,
    required this.onTap,
    this.text = PresentationStrings.creditCard,
    this.borderColor = const Color(0xFF8EA7D1),
    this.textColor = const Color(0xFF5B8DEF),
    this.iconColor = const Color(0xFF5B8DEF),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(40),
        dashPattern: const [8, 4],
        color: borderColor,
        strokeWidth: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: iconColor, size: 20),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
