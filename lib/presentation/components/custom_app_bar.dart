import 'package:flutter/material.dart';
import 'buttons/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.leading,
    this.actions,
    this.backgroundColor = Colors.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        child: Row(
          children: [
            if (leading != null)
              leading!
            else if (showBackButton)
              customBackButton(onTap: () => Navigator.pop(context)),

            if (title != null)
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

            const Spacer(),

            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
}
