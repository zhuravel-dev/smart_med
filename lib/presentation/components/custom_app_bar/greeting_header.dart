import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/user_model.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'package:smart_med/presentation/components/buttons/notifications_button.dart';

class GreetingHeader extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onNotificationTap;

  const GreetingHeader({super.key, required this.user, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 24, backgroundImage: AssetImage(userAvatar[user.id]!)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Good Morning!", style: TextStyle(color: Colors.grey)),
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        notificationButton(onTap: onNotificationTap),
      ],
    );
  }
}
