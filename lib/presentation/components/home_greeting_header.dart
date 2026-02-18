import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'package:smart_med/presentation/components/custom_app_bar/greeting_header.dart';

class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GreetingHeader(
      user: mockUsers[0],
      onNotificationTap: () => print("Notifications tapped"),
    );
  }
}
