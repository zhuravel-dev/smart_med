import 'package:flutter/cupertino.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class BadgeDivider extends StatelessWidget {
  final double height;

  const BadgeDivider({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(width: 0.5, height: height, color: AppColors.dividerLine);
  }
}
