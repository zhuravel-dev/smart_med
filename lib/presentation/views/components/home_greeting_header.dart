import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'custom_app_bar/greeting_header.dart';

class GreetingHeader extends StatelessWidget {
  final GreetingHeaderType type;
  final VoidCallback? onNotificationTap;

  const GreetingHeader({super.key, required this.type, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return GreetingHeaderInfo(user: mockUsers[0], onNotificationTap: onNotificationTap, type: type);
  }
}
