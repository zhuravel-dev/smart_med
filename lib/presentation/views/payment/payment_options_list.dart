import 'package:flutter/material.dart';
import 'package:smart_med/presentation/core/presentation_strings.dart';
import 'payment_option_tile.dart';

class PaymentOptionsList extends StatelessWidget {
  final String selectedPayment;
  final Function(String) onSelectPayment;

  PaymentOptionsList({
    super.key,
    required this.selectedPayment,
    required this.onSelectPayment,
  });

  final List<Map<String, dynamic>> _options = [
    {
      'id': 'paypal',
      'icon': 'P',
      'iconColor': Color(0xFF003087),
      'title': PresentationStrings.paypalTitle,
    },
    {
      'id': 'stripe',
      'icon': 'S',
      'iconColor': Color(0xFF635BFF),
      'title': PresentationStrings.stripeTitle,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: PaymentOptionTile(
                icon: option['icon'],
                iconColor: option['iconColor'],
                title: option['title'],
                isSelected: selectedPayment == option['id'],
                onTap: () => onSelectPayment(option['id']),
              ),
            ),
          )
          .toList(),
    );
  }
}
