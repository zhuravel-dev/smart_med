import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class SmartMedTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: false,

    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textLight,
      surface: AppColors.cardLight,
      onSurface: AppColors.textDark,
      background: AppColors.background,
      onBackground: AppColors.textDark,
      outline: AppColors.border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      foregroundColor: AppColors.textDark,
      iconTheme: IconThemeData(color: AppColors.textDark),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textDark),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textDark),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.textMuted),
    ),

    dividerColor: AppColors.dividerLine,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarBackground,
      selectedItemColor: AppColors.navItemActive,
      unselectedItemColor: AppColors.navItemInactive,
      selectedIconTheme: IconThemeData(color: AppColors.navIcon),
      unselectedIconTheme: IconThemeData(color: AppColors.navIcon),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        shape: const StadiumBorder(),
        elevation: 0,
        disabledBackgroundColor: AppColors.border,
        disabledForegroundColor: AppColors.textMuted,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardLight,
      hintStyle: const TextStyle(color: AppColors.textMuted),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.redAccent),
      ),
    ),
  );
}
