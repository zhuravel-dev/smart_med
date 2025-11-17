import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/payment/payment_card.dart';
import 'package:smart_med/presentation/views/payment/payment_options_list.dart';
import 'credit_card_divider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = 'credit_card';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Payment Method',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Credit Card',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedPayment == 'credit_card'
                        ? const Color(0xFF5B8DEF)
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedPayment == 'credit_card'
                          ? const Color(0xFF5B8DEF)
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: selectedPayment == 'credit_card'
                      ? const Center(
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 12,
                    ),
                  )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            CreditCardWidget(
              bankName: 'ABC Bank',
              cardNumber: '8563348045723018',
              cardHolderName: 'David Jonising',
              expiryDate: '10/28',
              gradientColors: const [Color(0xFF5B8DEF), Color(0xFF4A7FE8)],
            ),
            const SizedBox(height: 24),

            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Color(0xFF5B8DEF), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Credit Card',
                      style: TextStyle(
                        color: Color(0xFF5B8DEF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            CreditCardDivider(),
            const SizedBox(height: 32),

          ],
        ),
      ),
    );
  }
}
