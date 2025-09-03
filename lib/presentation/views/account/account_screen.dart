import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_med/presentation/components/account_option_tile.dart';
import 'package:smart_med/presentation/components/profile_header.dart';
import 'package:smart_med/presentation/cubits/user/user_cubit.dart';
import 'package:smart_med/presentation/cubits/user/user_state.dart';
import 'package:smart_med/presentation/views/account/payment_screen.dart';
import 'package:smart_med/presentation/components/divider.dart';

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
      SnackBar(
        content: Text('Dark Mode ${_isDarkMode ? 'Enabled' : 'Disabled'}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final user = state.user;
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: _buildAppBar(),
          body: Column(
            children: [
              ProfileHeader(
                userName: user?.firstName ?? "",
                phoneNumber: user?.phoneNumber ?? "",
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
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
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ),
                      const SmartMedDivider(),
                      AccountOptionTile(
                        leadingIcon: Icons.payment_outlined,
                        title: "Payment",
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const PaymentScreen(),
                            ),
                          );
                        },
                      ),
                      const SmartMedDivider(),
                      AccountOptionTile(
                        leadingIcon: Icons.security_outlined,
                        title: "Security",
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ),
                      const SmartMedDivider(),
                      AccountOptionTile(
                        leadingIcon: Icons.language_outlined,
                        title: "Language",
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "English (US)",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        onTap: () {},
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
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ),
                      const SmartMedDivider(),
                      AccountOptionTile(
                        leadingIcon: Icons.logout_outlined,
                        title: "Logout",
                        textColor: Colors.red,
                        trailing: const SizedBox(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Account",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
      elevation: 0,
    );
  }
}
