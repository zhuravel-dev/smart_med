import 'package:flutter/material.dart';

class CreditCardDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;
  final double fontSize;
  final double horizontalPadding;

  const CreditCardDivider({
    super.key,
    this.text = 'or',
    this.lineColor = const Color(0xFFE0E0E0),
    this.textColor = const Color(0xFF9E9E9E),
    this.fontSize = 14,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: lineColor)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
        Expanded(child: Container(height: 1, color: lineColor)),
      ],
    );
  }
}
