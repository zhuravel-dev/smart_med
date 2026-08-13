import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  final String cardText;
  final VoidCallback? onTap;

  const AccountCard({super.key, required this.cardText, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;
    final borderRadius = size.width * 0.07;
    final buttonSize = size.width * 0.13;
    final fontSize = size.width * 0.05;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: fontSize, color: Colors.white, fontWeight: FontWeight.bold),
          ),

          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: buttonSize,
                height: buttonSize,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_outward, color: Colors.white, size: buttonSize * 0.45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
