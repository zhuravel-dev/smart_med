import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/custom_app_bar.dart';
import 'package:smart_med_strings/smart_med_strings.dart';
import 'package:smart_med/presentation/views/payment/add_credit_card_button.dart';
import 'package:smart_med/presentation/views/payment/payment_card.dart';
import 'package:smart_med/presentation/views/payment/payment_options_list.dart';
import 'package:smart_med/presentation/views/payment/credit_card_divider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPayment = PaymentStrings.paymentIdCreditCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomAppBar(
        title: PaymentStrings.paymentMethod,
        showBackButton: true,
        backgroundColor: AppColors.background,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PaymentStrings.creditCard,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedPayment == PaymentStrings.paymentIdCreditCard
                        ? AppColors.paymentAccent
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedPayment == PaymentStrings.paymentIdCreditCard
                          ? AppColors.paymentAccent
                          : AppColors.paymentBorderInactive,
                      width: 2,
                    ),
                  ),
                  child: selectedPayment == PaymentStrings.paymentIdCreditCard
                      ? const Center(
                    child: Icon(Icons.circle, color: AppColors.textLight, size: 12),
                  )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 24),

            CreditCardWidget(
              bankName: PaymentStrings.defaultBankName,
              cardNumber: PaymentStrings.defaultCardNumber,
              cardHolderName: PaymentStrings.defaultCardHolder,
              expiryDate: PaymentStrings.defaultExpiryDate,
            ),

            const SizedBox(height: 32),

            AddCreditCardButton(
              onTap: () {},
              text: PaymentStrings.addCreditCard,
            ),

            const SizedBox(height: 32),
            const CreditCardDivider(),
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
