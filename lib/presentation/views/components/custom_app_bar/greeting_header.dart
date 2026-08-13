import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/user_model.dart';
import 'package:smart_med/infra/mocks/mock_user.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/buttons/notifications_button.dart';
import 'package:smart_med/presentation/views/components/custom_circle_avatar.dart';

enum GreetingHeaderType { main, profile }

class GreetingHeaderInfo extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onNotificationTap;
  final GreetingHeaderType type;

  const GreetingHeaderInfo({
    super.key,
    required this.user,
    this.onNotificationTap,
    this.type = GreetingHeaderType.main,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: type == GreetingHeaderType.main ? _buildHomeHeader() : _buildProfileHeader(),
    );
  }

  Widget _buildHomeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomCircleAvatar(imagePath: userAvatar[user.id]!),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Good Morning,",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textMedium,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 2),
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

  Widget _buildProfileHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.firstName} ${user.lastName}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Text(user.email, style: const TextStyle(fontSize: 14, color: AppColors.textMedium)),
            ],
          ),
        ),
        notificationButton(onTap: onNotificationTap),
        const SizedBox(width: 12),
        CustomCircleAvatar(imagePath: userAvatar[user.id]!),
      ],
    );
  }
}
