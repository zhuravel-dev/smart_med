import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = "card";

  void _selectMethod(String method) {
    setState(() {
      _selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPaymentOptions(),
            const Spacer(),
            _buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Payment Method"),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        PaymentOptionCard(
          isSelected: _selectedMethod == "card",
          onTap: () => _selectMethod("card"),
          bankName: "ABC Bank",
          cardNumber: "1111 1111 1111 1111",
          cardHolder: "User Name",
          expiryDate: "11/28",
        ),
        const SizedBox(height: 16),
        PaymentOptionTile(
          value: "paypal",
          groupValue: _selectedMethod,
          onSelect: _selectMethod,
          icon: Icons.account_balance_wallet,
          iconColor: Colors.blue,
          title: "PayPal",
        ),
        const SizedBox(height: 12),
        PaymentOptionTile(
          value: "stripe",
          groupValue: _selectedMethod,
          onSelect: _selectMethod,
          icon: Icons.payment,
          iconColor: Colors.purple,
          title: "Another",
        ),
      ],
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected: $_selectedMethod")),
        );
      },
      child: const Text(
        "Continue",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String bankName;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  const PaymentOptionCard({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.bankName,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bankName,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(cardNumber,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Card Holder: $cardHolder",
                    style: const TextStyle(fontSize: 14)),
                Text("Exp: $expiryDate",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onSelect;
  final IconData icon;
  final Color iconColor;
  final String title;

  const PaymentOptionTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onSelect,
    required this.icon,
    required this.iconColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.grey.shade100,
      leading: Icon(icon, color: iconColor),
      title: Text(title),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: (val) => onSelect(val.toString()),
      ),
      onTap: () => onSelect(value),
    );
  }
}
