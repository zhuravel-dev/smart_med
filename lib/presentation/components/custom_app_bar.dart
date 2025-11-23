import 'package:flutter/material.dart';
import 'buttons/custom_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showBackButton;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.showBackButton = false,
    this.leading,
    this.actions,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(62);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 62,
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            leading ??
                (showBackButton
                    ? customBackButton(onTap: () => Navigator.pop(context))
                    : const SizedBox(width: 12)),
            const SizedBox(width: 12),

            Expanded(
              child:
                  titleWidget ??
                  (title != null
                      ? Text(
                          title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      : const SizedBox()),
            ),

            const SizedBox(width: 12),

            Row(mainAxisSize: MainAxisSize.min, children: actions ?? []),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
