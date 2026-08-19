import 'package:flutter/material.dart';
import 'package:smart_med/domain/entities/category_summary_model.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'main_card/main_card.dart';

class MainCardsRow extends StatelessWidget {
  final List<CategorySummary> categories;
  final VoidCallback? onOpenAppointment;

  const MainCardsRow({super.key, required this.categories, this.onOpenAppointment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        ...List.generate(
          categories.length,
          (index) => Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 8),
            child: _buildCard(categories[index], index),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(CategorySummary category, int index) {
    final isLight = index.isOdd;

    return MainCard(
      color: isLight ? Colors.white : AppColors.primary,
      isLight: isLight,
      doctorType: category.doctorType,
      time: category.workingHours,
      doctorsAvailable: category.doctorsAvailable,
      categoryImage: category.categoryImage,
      doctorAvatars: category.doctorAvatars,
      additionalCount: category.additionalCount,
      onTap: onOpenAppointment,
    );
  }
}
