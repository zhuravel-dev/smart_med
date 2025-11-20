import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/buttons/custom_back_button.dart';
import 'package:smart_med/presentation/core/presentation_strings.dart';
import 'package:smart_med/presentation/views/payment/add_credit_card_button.dart';
import 'package:smart_med/presentation/views/payment/payment_card.dart';
import 'package:smart_med/presentation/views/payment/payment_options_list.dart';
import 'credit_card_divider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = PresentationStrings.paymentIdCreditCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leadingWidth: 40,
        leading: customBackButton(onTap: () => Navigator.pop(context)),
        title: const Text(
          PresentationStrings.paymentMethod,
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
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
                  PresentationStrings.creditCard,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedPayment == PresentationStrings.paymentIdCreditCard
                        ? const Color(0xFF5B8DEF)
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedPayment == PresentationStrings.paymentIdCreditCard
                          ? const Color(0xFF5B8DEF)
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: selectedPayment == PresentationStrings.paymentIdCreditCard
                      ? const Center(child: Icon(Icons.circle, color: Colors.white, size: 12))
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            CreditCardWidget(
              bankName: PresentationStrings.defaultBankName,
              cardNumber: PresentationStrings.defaultCardNumber,
              cardHolderName: PresentationStrings.defaultCardHolder,
              expiryDate: PresentationStrings.defaultExpiryDate,
              gradientColors: const [Color(0xFF5B8DEF), Color(0xFF4A7FE8)],
            ),

            const SizedBox(height: 32),

            AddCreditCardButton(
              onTap: () {},
              text: PresentationStrings.creditCard,
            ),

            const SizedBox(height: 32),
            CreditCardDivider(),
            const SizedBox(height: 32),

            PaymentOptionsList(
              selectedPayment: selectedPayment,
              onSelectPayment: (id) {
                setState(() {
                  selectedPayment = id;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
