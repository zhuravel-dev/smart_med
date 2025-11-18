import 'package:flutter/material.dart';
import 'package:smart_med/presentation/core/presentation_strings.dart';

class CreditCardWidget extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final List<Color> gradientColors;

  const CreditCardWidget({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    this.gradientColors = const [Color(0xFF5B8DEF), Color(0xFF4A7FE8)],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bankName,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),

          Text(
            _formatCardNumber(cardNumber),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder Name',
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cardHolderName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    PresentationStrings.defaultExpiryTitle,
                    style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    expiryDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              _buildMastercardLogo(),
            ],
          ),
        ],
      ),
    );
  }

  String _formatCardNumber(String number) {
    String cleaned = number.replaceAll(' ', '');
    String formatted = '';
    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += cleaned[i];
    }
    return formatted;
  }

  Widget _buildMastercardLogo() {
    return SizedBox(
      width: 50,
      height: 32,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: Colors.red.withOpacity(0.9), shape: BoxShape.circle),
            ),
          ),
          Positioned(
            left: 18,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
