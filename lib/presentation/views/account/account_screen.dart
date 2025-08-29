import 'package:flutter/material.dart';
import 'package:smart_med/presentation/components/divider.dart';
import 'package:smart_med/presentation/views/account/payment_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() => _isDarkMode = value);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dark Mode ${_isDarkMode ? 'Enabled' : 'Disabled'}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const ProfileHeader(
            userName: "User Name",
            phoneNumber: "+1 111 111 111",
          ),
          const SizedBox(height: 20),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AccountOptionTile(
                    leadingIcon: Icons.notifications_outlined,
                    title: "Notification",
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Notifications Tapped")),
                      );
                    },
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.payment_outlined,
                    title: "Payment",
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const PaymentScreen()),
                      );
                    },
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.security_outlined,
                    title: "Security",
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Security Tapped")),
                      );
                    },
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.language_outlined,
                    title: "Language",
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("English (US)", style: TextStyle(color: Colors.grey)),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ],
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Language Tapped")),
                      );
                    },
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    trailing: Switch(
                      value: _isDarkMode,
                      onChanged: _toggleDarkMode,
                    ),
                    onTap: null,
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.help_outline,
                    title: "Help Center",
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Help Center Tapped")),
                      );
                    },
                  ),
                  const SmartMedDivider(),

                  AccountOptionTile(
                    leadingIcon: Icons.logout_outlined,
                    title: "Logout",
                    textColor: Colors.red,
                    trailing: const SizedBox(),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Logout Tapped")),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Account",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.blue,
      elevation: 0,
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String phoneNumber;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person, size: 28, color: Colors.blue),
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            phoneNumber,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Edit Profile Tapped")),
              );
            },
            icon: const Icon(Icons.edit, size: 18),
            label: const Text("Edit Profile"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

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
