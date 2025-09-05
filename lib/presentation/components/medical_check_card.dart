import 'package:flutter/material.dart';

class MedicalCheckCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onPressed;

  const MedicalCheckCard({
    super.key,
    this.title = "Medical Checks!",
    this.description =
        "Check your health condition regularly to minimize the incidence of diseases.",
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: onPressed,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text("Check Now"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
