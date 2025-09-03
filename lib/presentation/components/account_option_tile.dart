import 'package:flutter/material.dart';

class AccountOptionTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Widget? trailing;
  final Color? textColor;
  final VoidCallback? onTap;

  const AccountOptionTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: Colors.blue, size: 24),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      dense: true,
    );
  }
}
